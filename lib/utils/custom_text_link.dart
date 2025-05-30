import 'package:flutter/cupertino.dart';
import '../../constants/constant_color.dart';



class CustomTextLink extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final TextStyle? linkTextStyle;


  final String? linkText;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final Function()? onTap;

  const CustomTextLink({super.key,
    this.text,
    this.linkText,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.onTap,
    this.textStyle,
    this.linkTextStyle,
  });


  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment:crossAxisAlignment?? CrossAxisAlignment.center,
      mainAxisAlignment:mainAxisAlignment?? MainAxisAlignment.center,
      children: [

        Text( text ?? "Don't have an account ",style:textStyle,),

        SizedBox(width: 5,),

        GestureDetector(
            onTap: onTap,
            child: Text( linkText?? "Signup",style:linkTextStyle,)
        ),
      ],
    );
  }
}
