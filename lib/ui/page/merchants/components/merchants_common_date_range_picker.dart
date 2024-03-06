import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MerchantsCommonDateRangePicker extends StatefulWidget {
  final String dateRangePlaceholder;
  final Function({String startDate, String endDate}) onDateRangeChanged;

  const MerchantsCommonDateRangePicker({
    Key key,
    this.dateRangePlaceholder = '',
    @required this.onDateRangeChanged,
  }) : super(key: key);

  @override
  _MerchantsCommonDateRangePickerState createState() =>
      _MerchantsCommonDateRangePickerState();
}

class _MerchantsCommonDateRangePickerState
    extends State<MerchantsCommonDateRangePicker> {
  String dateRange;

  @override
  void initState() {
    super.initState();
    dateRange = widget.dateRangePlaceholder;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        DateRagePicker.showDatePicker(
          context: context,
          initialFirstDate: DateTime.now(),
          initialLastDate: DateTime.now().add(Duration(days: 1)),
          firstDate: DateTime.now().subtract(Duration(days: 1)),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ).then((value) {
          setState(() {
            if (value == null) {
              dateRange = '';
            } else {
              widget.onDateRangeChanged(
                  startDate: value[0].toString(), endDate: value[1].toString());
              String startDate = DateFormat('yyyy/MM/dd').format(value[0]);
              String endDate = DateFormat('yyyy/MM/dd').format(value[1]);
              dateRange = '$startDate - $endDate';
            }
          });
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: MerchantsStyle.mainFieldBorderColor,
            )),
        child: Text(
          dateRange,
          style: TextStyle(
            color: Color(0xff999999),
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
