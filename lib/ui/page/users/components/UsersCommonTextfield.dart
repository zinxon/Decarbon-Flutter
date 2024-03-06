import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

class UsersCommonTextfield extends StatefulWidget {
  final String placeholderText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String value) onChanged;

  const UsersCommonTextfield({
    Key key,
    this.placeholderText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  _UsersCommonTextfieldState createState() =>
      _UsersCommonTextfieldState();
}

class _UsersCommonTextfieldState extends State<UsersCommonTextfield> {
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
              color: UsersStyle.mainFieldBorderColor,
            ),
          ),
          hintText: widget.placeholderText,
        ),
        style: TextStyle(
          fontSize: 15,
          color: UsersStyle.mainDarkGreyColor,
        ),
        cursorColor: UsersStyle.mainGreenColor,
      ),
    );
  }
}
