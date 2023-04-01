/* import 'package:flutter/material.dart';
import '../presentation/modules/auth/otp/otp_controller.dart';
import '../presentation/utils/constants.dart';
import '../presentation/utils/values.dart';
import '../presentation/widgets/column_pro.dart';
import '../presentation/widgets/pin_input.dart';
import 'package:get/get.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({Key? key}) : super(key: key);

  final bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FlexibleScrollViewColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: const EdgeInsets.fromLTRB(
              AppPadding.p24, 0, AppPadding.p24, AppPadding.p24),
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                //'Check your SMS messages a code has been sent to ... ',
                'Check your mail, a code has been sent to ${controller.email} ',
                style: Get.textTheme.labelMedium!.copyWith(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: AppSize.s70,
            ),

            // ? Add Timer
            // Text(
            //   'Expires in 10 mins',
            //   style: Get.textTheme.labelSmall!.copyWith(color: Colors.red),
            // ),
            spacer(),
            PinInput(
              onCompleted: controller.onCompleted,
              textEditingController: controller.otpController,
            ),
            SizedBox(height: AppSize.s48),
            Text(
              'Didn’t recieve a code?',
              style: Get.textTheme.titleSmall,
            ),
            TextButton(
              child: Text('Resend code'),
              style: TextButton.styleFrom(
                textStyle: Get.textTheme.titleSmall!.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                //Get.offAllNamed(Routes.profilePrompt);
                controller.onResendPressed();
              },
            )
          ],
        ),
      ),
    );
  }
}
 */