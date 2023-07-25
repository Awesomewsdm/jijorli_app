import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}
