// ignore_for_file: must_be_immutable, unused_local_variable, unnecessary_statements, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:swift_pay_mobile/core/app_routes.dart';
import 'package:swift_pay_mobile/presentation/widgets/app_card.dart';

import '../../utils/colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(10),
                Text(
                  'Find Recyclo Spots Nearby',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                  ),
                ),
                Gap(5),
                Image.asset('assets/images/location.png')
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 5),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/man_route.png',
                    width: 230,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Let’s lead \nyou to the \nnearest \nrecyclo spot ',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(20),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.spots);
                          },
                          child: Text(
                            'Find Now',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(114, 32),
                            backgroundColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppMaterial(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 12),
              color: AppColors.primary,
              child: Column(
                children: [
                  Text(
                    'Earn convertible points \nby recycling your \nwaste materials',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // navigateToPage(currentIndex + 1);
                        },
                        child: Text(
                          'Recycle Now',
                          style: TextStyle(color: AppColors.primary),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(114, 32),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Image.asset('assets/images/plant.png')
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
