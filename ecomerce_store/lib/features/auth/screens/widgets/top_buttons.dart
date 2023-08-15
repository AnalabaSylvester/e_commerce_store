import 'package:amzone/features/auth/screens/widgets/account_btns.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: "Your Orders",
              onPress: () {},
            ),
            AccountButton(
              text: "Turn Seller",
              onPress: () {},
            )
          ],
        ),
        Row(
          children: [
            AccountButton(
              text: "Log Out",
              onPress: () {},
            ),
            AccountButton(
              text: "Your Wish List",
              onPress: () {},
            )
          ],
        ),
      ],
    );
  }
}
