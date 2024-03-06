import 'package:flutter/material.dart';

class UsersProfileListTile extends StatelessWidget {
  final Widget leadingIcon;
  final String title;
  final Function onTap;

  const UsersProfileListTile({
    Key key,
    @required this.leadingIcon,
    @required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        onTap: onTap,
        title: Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.only(right: 8),
              child: leadingIcon,
            ),
            Text(
              title,
              style: TextStyle(
                color: Color(0xff646464),
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        trailing: Container(
          width: 8,
          height: 16,
          child: Image.asset('assets/icons/arrow_forward.png'),
        ),
      ),
    );
  }
}
