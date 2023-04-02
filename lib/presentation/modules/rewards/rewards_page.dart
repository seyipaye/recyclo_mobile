import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RewardsPage extends StatelessWidget {
  RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
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
                    "Reward Points",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text('Convert your recyclo points to rewards'),
                  Gap(10),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My Recyclo Points   - '),
                          Text(
                            '108',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(double.maxFinite, 70)),
                  ),
                  Expanded(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                      children: <Widget>[
                        _buildCard(
                          asset: 'assets/images/amazon_logo.png',
                          text: '\$10 GiftCard - 100RP',
                        ),
                        _buildCard(
                          asset: 'assets/images/starbucks_logo.png',
                          text: '\$10 StarBucks - 100RP',
                        ),
                        _buildCard(
                          asset: 'assets/images/paypal_logo.png',
                          text: '\$25 PayPal - 275RP',
                        ),
                        _buildCard(
                          asset: 'assets/images/netflix_logo.png',
                          text: 'One Month Sub - 75RP',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildCard({
    required String asset,
    required String text,
  }) {
    return Container(
      child: Column(
        children: [
          Image.asset(asset),
          Gap(5),
          Text(
            text,
            style: TextStyle(fontSize: 12),
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
