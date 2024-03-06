import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';

class MerchantsDeleteConfirmDialog extends StatelessWidget {
  final String actionTarget;
  final Function yesOnPressed;

  const MerchantsDeleteConfirmDialog({
    Key key,
    @required this.actionTarget,
    @required this.yesOnPressed,
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
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Confirm ',
                style: TextStyle(
                  color: MerchantsStyle.mainBlackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'This $actionTarget will be permanently removed. Are you sure to delete?',
                style: TextStyle(
                    color: MerchantsStyle.mainDarkGreyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                        color: Color(0xffF3F3F3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: MerchantsStyle.mainGreenColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    FlatButton(
                        color: MerchantsStyle.mainGreenColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        onPressed: yesOnPressed)
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
