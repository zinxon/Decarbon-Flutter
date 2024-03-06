import 'package:flutter/material.dart';

class MerchantsGivePointsTextField extends StatelessWidget {
  final Widget icon;
  final bool readOnly;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const MerchantsGivePointsTextField({
    Key key,
    @required this.icon,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 40),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        decoration: InputDecoration(
            prefixIcon: Container(
              padding: EdgeInsets.all(5),
              child: icon,
            ),
            prefixStyle: TextStyle(fontSize: 20)),
      ),
    );
  }
}
