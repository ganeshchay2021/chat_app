import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.child,
  }) : assert(text != null || child != null,
            'Either text or child must be provided');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child ??
            Text(
              text!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
      ),
    );
  }
}
