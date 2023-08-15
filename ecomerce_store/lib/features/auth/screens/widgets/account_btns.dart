import 'package:amzone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const AccountButton({super.key, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
            border:
                Border.all(color: GlobalVariables.secondaryColor, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
          ),
          child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12.withOpacity(0.02),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  )),
              onPressed: onPress,
              child: Text(
                text,
                style: TextStyle(
                    color: GlobalVariables.secondaryColor,
                    fontWeight: FontWeight.normal),
              )),
        ),
      ),
    );
  }
}
