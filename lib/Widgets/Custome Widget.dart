import 'package:flutter/material.dart';

class CutomTextWidget extends StatelessWidget {
   CutomTextWidget({super.key , required this.textData});

  String textData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("$textData"),
    );
  }
}
