import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:swift_pay_mobile/core/extentions.dart';
import '../../utils/colors.dart';
import 'top_up_controller.dart';

class SpotsScreen extends GetView<SpotsController> {
  SpotsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            Expanded(
              child: ListView(
                children: [
                  SpotCard(
                    title: 'Green Bin',
                    address: '123 Main Street',
                    distance: '10km',
                  ),
                  SpotCard(
                    title: 'Blue Bin',
                    address: '456 Elm Street',
                    distance: '12km',
                  ),
                  SpotCard(
                    title: 'Yellow Bin',
                    address: '789 Oak Street',
                    distance: '15km',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Back to Home'),
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
              ).center,
            )
          ],
        ),
      ),
    );
  }
}

class SpotCard extends StatelessWidget {
  const SpotCard({
    super.key,
    required this.title,
    required this.address,
    required this.distance,
  });

  final String title;
  final String address;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color(0xFF004919).withOpacity(0.8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Gap(30),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  distance,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'away',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
