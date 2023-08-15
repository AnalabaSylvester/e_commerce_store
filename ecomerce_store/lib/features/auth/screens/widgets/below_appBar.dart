import 'package:amzone/constants/global_variables.dart';
import 'package:amzone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: BoxDecoration(color: GlobalVariables.secondaryColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 15, bottom: 10),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello,',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: user.name,
                    style: TextStyle(color: Colors.white, fontSize: 22),
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
