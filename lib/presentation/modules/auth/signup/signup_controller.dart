import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_pay_mobile/core/extentions.dart';
import 'package:swift_pay_mobile/domain/repositories/auth_repo.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/app_repo.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final agreedToTerms = false.obs;

  final hidePassword = true.obs;
  void hidePasswordPressed() => hidePassword.value = !hidePassword.value;

  late String name;
  late String email;
  late String phone;
  // late String referrerCode;
  late String password;
  String? userName;
  late String referrerCode;

  void onCheckboxChanged(bool? value) {
    agreedToTerms.value = value!;
  }

  Future<void> onContinuePressed() async {
    // AuthRepository.instance.userType = UserType.guest;
    // final successful = await Get.toNamed(Routes.newAddress);

    // if (successful) Get.toNamed(Routes.home);
  }

  void createAccount() {
    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      if (agreedToTerms.isFalse) {
        showError('Please read and accept the terms & condition');
        return;
      }

      // showLoadingState;

      Get.offAndToNamed(Routes.home);
      return;

      AuthRepository.instance
          .signup(
        email: email,
        password: password,
        username: name,
      )
          .then((msg) {
        // Success
        Get.back();
        showMessage(msg);
        Get.toNamed(Routes.home);
      }).catchError((err, stackTrace) {
        if (err is! String) {
          err = err.toString();
        }
        // Error
        showError(err, clear: true);
      });
    }
  }
}
