import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'top_up_controller.dart';

class RecyclePage extends StatelessWidget {
  RecyclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  "Let’s Recyclo",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text('Please select a waste category'),
                Gap(10),
              ],
            ),
          ),
          Column(
            children: [
              _buildButton(
                text: 'Organic Waste',
                onPressed: () {},
              ),
              Gap(35),
              _buildButton(
                text: 'Plastic Waste',
                onPressed: () {},
              ),
              Gap(35),
              _buildButton(
                text: 'Paper Waste',
                onPressed: () {},
              ),
              Gap(35),
              _buildButton(
                text: 'Glass Waste',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildButton({VoidCallback? onPressed, text}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(text), Icon(Icons.arrow_forward)],
        ),
      ),
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(), minimumSize: Size(double.maxFinite, 70)),
    );
  }
}
