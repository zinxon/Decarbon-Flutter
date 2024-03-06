import 'package:DeCarbon/ui/page/users/UsersHomePage.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

class UsersRedeemSuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(50),
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
                      color: UsersStyle.mainGreenColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'redeemed !',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            FlatButton(
              color: UsersStyle.mainGreenColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName(UsersHomePage.PATH));
              },
            )
          ],
        ),
      ),
    );
  }
}
