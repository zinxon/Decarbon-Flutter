import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

class UsersMenuViewTopBar extends StatefulWidget {
  final String selectedView;
  final Function({String selectedView}) menuViewOnChanged;

  const UsersMenuViewTopBar({
    Key key,
    @required this.selectedView,
    this.menuViewOnChanged,
  }) : super(key: key);

  @override
  _UsersMenuViewTopBarState createState() => _UsersMenuViewTopBarState();
}

class _UsersMenuViewTopBarState extends State<UsersMenuViewTopBar> {
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
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 9),
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
          GestureDetector(
            onTap: () {
              setState(() {
                selectedView = 'activity';
                widget.menuViewOnChanged(selectedView: selectedView);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: selectedView == 'activity'
                    ? UsersStyle.mainGreenColor
                    : Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Activity',
                  style: TextStyle(
                    fontSize: 15,
                    color: selectedView == 'activity'
                        ? Colors.white
                        : UsersStyle.mainGreenColor,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedView = 'news';
                widget.menuViewOnChanged(selectedView: selectedView);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: selectedView == 'news'
                    ? UsersStyle.mainGreenColor
                    : Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'News',
                  style: TextStyle(
                    fontSize: 15,
                    color: selectedView == 'news'
                        ? Colors.white
                        : UsersStyle.mainGreenColor,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedView = 'merchants';
                widget.menuViewOnChanged(selectedView: selectedView);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: selectedView == 'merchants'
                    ? UsersStyle.mainGreenColor
                    : Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Merchants',
                  style: TextStyle(
                    fontSize: 15,
                    color: selectedView == 'merchants'
                        ? Colors.white
                        : UsersStyle.mainGreenColor,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedView = 'coupon';
                widget.menuViewOnChanged(selectedView: selectedView);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: selectedView == 'coupon'
                    ? UsersStyle.mainGreenColor
                    : Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Coupon',
                  style: TextStyle(
                    fontSize: 15,
                    color: selectedView == 'coupon'
                        ? Colors.white
                        : UsersStyle.mainGreenColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
