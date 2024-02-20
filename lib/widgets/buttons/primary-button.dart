import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({super.key,
    required this.title,
    required this.onPressed,
    this.height = 48,
    this.width = double
        .infinity,
  this.textStyle = const TextStyle(
      fontWeight: FontWeight.w500,fontSize: 15
  )
  });

  final String title;
  final void Function() onPressed;
  final TextStyle textStyle;

  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height,
      width: width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .primary,
            foregroundColor: Theme
                .of(context)
                .colorScheme
                .onPrimary,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(title,style: textStyle)),
    );
  }
}
