import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class UsersSuccessDialog extends StatelessWidget {
  final String actionName;
  final Function okOnPressed;

  const UsersSuccessDialog({
    Key key,
    @required this.actionName,
    @required this.okOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 275,
        height: 189,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Material(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Successfully ',
                    style: TextStyle(
                      color: MerchantsStyle.mainGreenColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '$actionName !',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            FlatButton(
                color: MerchantsStyle.mainGreenColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                onPressed: okOnPressed)
          ],
        ),
      ),
    );
  }
}
