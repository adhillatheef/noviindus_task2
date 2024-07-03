import 'package:flutter/material.dart';
import 'package:noviindus_task2/common/themes/app_palatte.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.5),
            border: Border.all(
              color: AppPalette.whiteColor,
            )),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Continue',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: AppPalette.red,
                child: Icon(Icons.arrow_forward_ios,size: 18,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
