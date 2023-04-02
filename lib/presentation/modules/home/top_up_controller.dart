import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swift_pay_mobile/core/extentions.dart';
import 'package:swift_pay_mobile/data/transaction/sales/sale.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';

class SpotsController extends GetxController {
  final isLoading = true.obs;
  final banks = Rx<List<Sale>?>(null);
  
  Rx<User> get user => AuthRepository.instance.user;
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
      locale: 'en_NG', decimalDigits: 0, symbol: '₦');
  late String wallet_id;

  @override
  void onInit() {
    // _fetchBalance();
    super.onInit();
    // wallet_id = Get.arguments;
  }

  void recievePayment() => Get.toNamed(Routes.receivePayment);
}
