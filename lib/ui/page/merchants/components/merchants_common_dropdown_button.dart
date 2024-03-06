import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsCommonDropdownButton extends StatefulWidget {
  final String dropdownPlaceholder;
  final List<String> dropdownItems;
  final Function({String newValue}) onDropdownValueChanged;

  const MerchantsCommonDropdownButton({
    Key key,
    this.dropdownPlaceholder,
    @required this.dropdownItems,
    @required this.onDropdownValueChanged,
  }) : super(key: key);

  @override
  _MerchantsCommonDropdownButtonState createState() =>
      _MerchantsCommonDropdownButtonState();
}

class _MerchantsCommonDropdownButtonState
    extends State<MerchantsCommonDropdownButton> {
  String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.dropdownItems.contains(widget.dropdownPlaceholder)
        ? widget.dropdownPlaceholder
        : widget.dropdownItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MerchantsStyle.mainFieldBorderColor,
          )),
      child: DropdownButton(
        underline: Container(),
        icon: Container(),
        style: TextStyle(
          color: Color(0xff999999),
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        value: dropdownValue ?? null,
        items: widget.dropdownItems.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        onChanged: (value) {
          setState(() {
            dropdownValue = value;
          });
          widget.onDropdownValueChanged(newValue: value);
        },
      ),
    );
  }
}
