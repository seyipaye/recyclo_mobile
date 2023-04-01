import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_pay_mobile/core/extentions.dart';

import '../../../core/app_routes.dart';
import '../../../data/user/user.dart';
import '../../../domain/providers/local_notification_service.dart';
import '../../../domain/repositories/auth_repo.dart';

class HomeScreenController extends GetxController {
  final _selectedPage = 0.obs;

  final isLoading = true.obs;
  final isNotificationSet = false.obs;
  final notificationList = [].obs;

  final refreshKey = GlobalKey<RefreshIndicatorState>();

  static HomeScreenController get instance => Get.find<HomeScreenController>();

  Rx<User> get user => AuthRepository.instance.user;

  int get selectedPage => _selectedPage.value;

  set selectedPage(page) => _selectedPage.value = page;

  final formKey = GlobalKey<FormState>();

  Future<void> fetchData() async {}
//  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

//adb shell setprop debug.firebase.analytics.app africa.foodelo.hybrid
  @override
  void onInit() async {
    fetchData();
    //_initNotification();
    //startSocket();

    super.onInit();
  }

  void _initNotification() async {
    //FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    // setupToken();
    LocalNotificationService.initialize(Get.context!);

    setupInteractedMessage();

    // await FirebaseMessaging.instance.subscribeToTopic('foodelo-customer');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Foreground Notification for Android

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      log(notification?.toMap().toString() ?? 'No notification');
      // Sentry.captureMessage(
      //     notification?.toMap().toString() ?? 'No notification');

      debugPrint(
          '######### the foreground notification ${message.notification!.title}');

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        if (message.data != {}) {
          AuthRepository.instance.user.value =
              AuthRepository.instance.user.value.copyWith(
                  wallet: Wallet.fromJson(jsonDecode(message.data['wallet'])));
        }

        LocalNotificationService.display(message);
      }
    });
  }

  final loading = false.obs;

  void startSocket() {
    // AppProvider.value.initSocket();
  }

  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  Future<void> setupToken() async {
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();

    debugPrint('#### FCM token $token!');
    // Save the initial token to the database
    await saveTokenToDatabase(token!);

    // Any time the token refreshes, store this in the database too.
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
  }

  Future<void> saveTokenToDatabase(String token) async {
    // Assume user is logged in for this example
    try {
      final response = await AuthRepository.instance.uploadToken(token);

      if (response != null) {
        debugPrint(response);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handleMessage(RemoteMessage message) {
    debugPrint('How messsssshgete he');
    log('Handle notification tap: ${message.toMap().toString()}');

    if (message.data['type'] == 'order') {
      Get.toNamed(Routes.orderSummary, arguments: message.data['orderId']);
    } else if (message.data['type'] == 'transaction') {
      Get.toNamed(Routes.wallet);
    } else if (message.data['type'] == 'chat-conversation') {
      // final convo = Conversations(
      //     riderId: RiderId(
      //         id: '638de3ef31340c5b655bd580',
      //         firstName: message.data['senderName'],
      //         image: message.data['image']),
      //     user: 'Customer',
      //     userId: UserId(iid: AppDrawerController.instance.userId.value));
      // Get.put(CommunicationController());

      // Get.toNamed(Routes.chatBox, arguments: [convo, message.data['phone']]);
    } else {
      return;
      //Get.toNamed(Routes.notifications);
    }
  }

  Future<void> fetchHomeDetailPage() async {
    // try {
    //   AppRepository.instance.fetchHomePageDetails().then((newValue) {
    //     if (newValue.length == 0 || newValue[0].items.length == 0) {
    //       change(null, status: RxStatus.empty());
    //     } else {
    //       change(newValue, status: RxStatus.success());
    //       allHomeData.assignAll(newValue);
    //       homedata([]);
    //       homedata(newValue);
    //       //cartItem.value =

    //     }
    //   }, onError: (err) {
    //     debugPrint(err.toString());
    //     if (err is String)
    //       change(state, status: RxStatus.error(err.toString()));
    //   });
    // } catch (e) {
    //   change(null, status: RxStatus.error());
    // }
  }

  Future<void> onAddressPressed() async {
    final successful = await Get.toNamed(Routes.newAddress);

    if (successful == true) {
      fetchData();
    }

    /* if (AppDrawerController.instance.addressLine.value.isEmpty) {
      Get.toNamed(Routes.newAddress);
    } else {
      Get.toNamed(Routes.savedAddress);
    }*/
  }
}

class HomePageController extends GetxController {
  Rx<User> get user => AuthRepository.instance.user;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void onInit() {
    _fetchBalance();
    super.onInit();
  }

  void refresh() => _fetchBalance();

  void _fetchBalance() {
    AuthRepository.instance.fetchWallet().then((wallet) {
      // Success
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err);
    });
  }

  void recievePayment() => Get.toNamed(Routes.receivePayment);

  void offlinePay() => Get.toNamed(Routes.offlinePay);

  void topUp() => Get.toNamed(Routes.topUp);

  void onFABPressed() => Get.toNamed(Routes.scanCode);
}
