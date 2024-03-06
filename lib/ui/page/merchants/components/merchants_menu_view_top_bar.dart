import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsMenuViewTopBar extends StatefulWidget {
  final String selectedView;
  final Function({String selectedView}) menuViewOnChanged;

  const MerchantsMenuViewTopBar({
    Key key,
    @required this.selectedView,
    this.menuViewOnChanged,
  }) : super(key: key);

  @override
  _MerchantsMenuViewTopBarState createState() =>
      _MerchantsMenuViewTopBarState();
}

class _MerchantsMenuViewTopBarState extends State<MerchantsMenuViewTopBar> {
  String selectedView;

  @override
  void initState() {
    super.initState();
    selectedView = widget.selectedView;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[350],
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                selectedView = 'activity';
                widget.menuViewOnChanged(selectedView: selectedView);
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: selectedView == 'activity'
                ? MerchantsStyle.mainGreenColor
                : Colors.white,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'Activity',
                style: TextStyle(
                  fontSize: 17,
                  color: selectedView == 'activity'
                      ? Colors.white
                      : MerchantsStyle.mainGreenColor,
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              selectedView = 'coupon';
              widget.menuViewOnChanged(selectedView: selectedView);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: selectedView == 'coupon'
                ? MerchantsStyle.mainGreenColor
                : Colors.white,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'Coupon',
                style: TextStyle(
                  fontSize: 17,
                  color: selectedView == 'coupon'
                      ? Colors.white
                      : MerchantsStyle.mainGreenColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
