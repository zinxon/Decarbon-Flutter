import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Colors.green, Colors.blue],
          ),
        ),
        // color: Colors.lightGreenAccent,
        child: Column(
          children: [
            new Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 4,
              ),
              height: 115.0,
              width: 115.0,
              child: Image(
                image: new AssetImage('assets/images/decarbon-remove-bg2.png'),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 2.4,
              ),
            ),
            // new Container(
            //   // height: 150.0,
            //   // width: 200.0,
            //   child: Image(
            //     image: new AssetImage('assets/images/decarbon.png'),
            //     fit: BoxFit.fill,
            //     width: MediaQuery.of(context).size.width / 2.4,
            //   ),
            // ),
            Container(
                margin: EdgeInsets.only(
                  top: 200,
                ),
                child: SpinKitChasingDots(color: Colors.green[400], size: 50)),
          ],
        ));
  }
}
// body: Container(
//   decoration: BoxDecoration(
//     gradient: LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       stops: [0.3, 1],
//       colors: [Colors.green, Colors.blue])
//   ),
//   child: Center(
//     child: Text('Gradients are cool!',
//       style: TextStyle(
//         fontSize: 35,
//         color: Colors.white,
//       ),
//     ),
//   ),
// ),
