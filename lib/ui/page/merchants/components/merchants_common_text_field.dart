import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsCommonTextField extends StatefulWidget {
  final String placeholderText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String value) onChanged;

  const MerchantsCommonTextField({
    Key key,
    this.placeholderText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  _MerchantsCommonTextFieldState createState() =>
      _MerchantsCommonTextFieldState();
}

class _MerchantsCommonTextFieldState extends State<MerchantsCommonTextField> {
  TextEditingController controller;
  TextInputType keyboardType;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    keyboardType = widget.keyboardType;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        onChanged: widget.onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: MerchantsStyle.mainFieldBorderColor,
            ),
          ),
          hintText: widget.placeholderText,
        ),
        style: TextStyle(
          fontSize: 15,
          color: MerchantsStyle.mainDarkGreyColor,
        ),
        cursorColor: MerchantsStyle.mainGreenColor,
      ),
    );
  }
}
