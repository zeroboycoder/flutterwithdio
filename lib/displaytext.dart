import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String? label;
  final String? text;
  final TextStyle? textSty;
  const DisplayText({Key? key, this.label, this.text, this.textSty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        '$text',
        style: textSty,
      ),
    );
  }
}
