import 'package:DeCarbon/ui/page/users/style/UsersStyle.dart';
import 'package:flutter/material.dart';

class UsersFaqPage extends StatelessWidget {
  static const PATH = '/users/faq';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5E7362),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'FAQ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xff5E7362),
        elevation: 0,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: UsersStyle.mainGreenColor,
        ),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                color: UsersStyle.mainGreenColor,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        'About Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 0,
                    child: Container(
                      width: 48,
                      child: Image.asset('assets/icons/plant.png'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 24),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))
              ),
              child: Text(
                'DeCarbon is a sustainable ecosystem that quantifies carbon reduction behaviors and generates green rewards. Our mission is to promote carbon reduction and create a green environment.',
                style: TextStyle(
                  color: UsersStyle.mainGreyColor,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Text(
                  'What is Carbon Points?',
                  style: TextStyle(
                    color: UsersStyle.mainBlackColor,
                    fontSize: 16,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Carbon points are valuable vouchers that reward you for low-carbon behavior, and they can be discounted or exchanged for goods.',
                      style: TextStyle(
                        color: UsersStyle.mainGreyColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Text(
                  'How can I earn Carbon Points?',
                  style: TextStyle(
                    color: UsersStyle.mainBlackColor,
                    fontSize: 16,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'To be implement',
                      style: TextStyle(
                        color: UsersStyle.mainGreyColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Text(
                  'How can I receive Carbon Points?',
                  style: TextStyle(
                    color: UsersStyle.mainBlackColor,
                    fontSize: 16,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'To be implement',
                      style: TextStyle(
                        color: UsersStyle.mainGreyColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Text(
                  'How long after withdrawal?',
                  style: TextStyle(
                    color: UsersStyle.mainBlackColor,
                    fontSize: 16,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'To be implement',
                      style: TextStyle(
                        color: UsersStyle.mainGreyColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Text(
                  'How can I earn Carbon Points?',
                  style: TextStyle(
                    color: UsersStyle.mainBlackColor,
                    fontSize: 16,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'To be implement',
                      style: TextStyle(
                        color: UsersStyle.mainGreyColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Text(
                  'How to exchange goods?',
                  style: TextStyle(
                    color: UsersStyle.mainBlackColor,
                    fontSize: 16,
                  ),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'To be implement',
                      style: TextStyle(
                        color: UsersStyle.mainGreyColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
