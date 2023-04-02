// ignore_for_file: must_be_immutable, unused_local_variable, unnecessary_statements, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:swift_pay_mobile/core/app_routes.dart';
import 'package:swift_pay_mobile/presentation/widgets/app_card.dart';

import '../../utils/colors.dart';
import 'home_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/dominion.png'),
            Gap(10),
            Text(
              'Dominion .Y.',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'dominion.yusuf@kibo.school',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
