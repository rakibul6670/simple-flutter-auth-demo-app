
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? buttonName;
  final double? textSize;
  final Function()? onPressed;
  final Color? foreignColor;
  final Color? backgroundColor;
  final Size? minimumSize;
  final RoundedRectangleBorder? shape;
  final TextStyle? textStyle;

  const CustomButton({super.key,
    this.buttonName,
    this.textSize,
    this.onPressed,
    this.foreignColor,
    this.backgroundColor,
    this.minimumSize,
    this.shape,
    this.textStyle});

  @override
  Widget build(BuildContext context) {
    //---------screen size-----------
    double screenHeight =MediaQuery.sizeOf(context).height;
    double screenWidth =MediaQuery.sizeOf(context).width;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor:foreignColor?? Colors.black,
            backgroundColor:  Color(0xFF1606FD),
            minimumSize: minimumSize?? Size(screenWidth, screenHeight * 0.06),
            shape: shape?? RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18))
            ),
            textStyle: textStyle?? TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight >550 ? 23:17
            )
        ),
        child: Text(buttonName?? "Log in")
    );
  }
}
