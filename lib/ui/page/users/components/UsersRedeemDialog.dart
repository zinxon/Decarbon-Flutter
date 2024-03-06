import 'package:DeCarbon/api/users/UsersCouponRepository.dart';
import 'package:DeCarbon/api/users/UsersInstance.dart';
import 'package:DeCarbon/models/User.dart';
import 'package:DeCarbon/ui/page/users/components/UsersCommonLoadingDialog.dart';
import 'package:DeCarbon/ui/page/users/components/UsersRedeemSuccessDialog.dart';
import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

import 'UsersRedeemUnsuccessDialog.dart';

class UsersRedeemDialog extends StatelessWidget{
  final Map<String, dynamic> couponData;

  const UsersRedeemDialog({Key key, @required this.couponData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final User user = UsersInstance.instance.user;
    return Center(
      child: Container(
        width: 320,
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 14,
                    color: UsersStyle.mainBlackColor,
                  ),
                ),
                Text(
                  '${couponData['require_coins']} carbon points will be spent, are you sure to redeem?',
                  style: TextStyle(
                    fontSize: 14,
                    color: UsersStyle.mainGreyColor,
                  ),
                  textAlign: TextAlign.center,
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
                          color: UsersStyle.mainGreenColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      color: UsersStyle.mainGreenColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context){

                            UsersCouponRepository.redeemCoupon(userId: user.userId, loginId: user.loginId, couponId: couponData['coupon_id']).then(
                              (value){
                                // Navigator.pop(context);
                                if(value.data['success']){
                                  showDialog(
                                    context: context,
                                    builder: (context){
                                      return UsersRedeemSuccessDialog();
                                    }
                                  );
                                }else{
                                  showDialog(
                                    context: context,
                                    builder: (context){
                                      return UsersRedeemUnsuccessDialog();
                                    }
                                  );
                                }
                              },
                            );

                            return UsersCommonLoadingDialog();
                          } 
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}