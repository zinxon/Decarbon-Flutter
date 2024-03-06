import 'package:fluro/fluro.dart';
import 'package:DeCarbon/utility/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:DeCarbon/bloc/AppBloc.dart';
import 'package:DeCarbon/core/AppProvider.dart';
import 'package:DeCarbon/ui/page/LoginPage.dart';

final List walkthrough = [
  {
    "image": AssetImage('assets/images/wt1.png'),
    "text": "Multiple ways to",
    "text2": "reduce carbon"
  },
  {
    "image": AssetImage('assets/images/wt2.png'),
    "text": "Earn green points and",
    "text2": "get rewards"
  },
  {
    "image": AssetImage('assets/images/wt3.png'),
    "text": "Help the environment",
    "text2": "while you earn"
  }
];

class WalkthroughPage extends StatefulWidget {
  static const String PATH = '/walkthrough';

  WalkthroughPage({Key key}) : super(key: key);

  @override
  _WalkthroughPageState createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage> {
  final CarouselController _controller = CarouselController();
  int currentCarousel = 0;
  AppBloc bloc;

  void _init() {
    if (null == bloc) {
      bloc = AppBloc(AppProvider.getApplication(context));
    }
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  void carouselOnPress(String type, AppBloc bloc) {
    if (type == 'next') {
      if (currentCarousel < 2) {
        _controller.nextPage();
      } else {
        bloc.changeInitialRoute(LoginPage.PATH);
        Navigator.pushReplacementNamed(context, LoginPage.PATH);
      }
    } else if (type == 'skip') {
      bloc.changeInitialRoute(LoginPage.PATH);
      Navigator.pushReplacementNamed(context, LoginPage.PATH);
    }
  }

  // --------------------------------- Widget ---------------------------------
  @override
  Widget build(BuildContext context) {
    _init();

    return Scaffold(body: buildBody(), backgroundColor: Colors.white);
  }

  Widget buildBody() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            children: <Widget>[
              buildTopFlex(),
              buildMiddleFlex(),
              buildBottomFlex()
            ],
          )
        ],
      ),
    );
  }

  Widget buildTopFlex() {
    return Expanded(
      flex: 1,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to the ',
                  style: TextStyle(
                      fontSize: kTitleFontSize, color: Color(0xFF333333)),
                ),
                SizedBox(height: 5),
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: kTitleFontSize, color: Color(0xFF333333)),
                        children: <TextSpan>[
                      TextSpan(text: 'De'),
                      TextSpan(
                        text: 'Carbon!',
                        style: TextStyle(color: Color(0xFF51B055)),
                      )
                    ]))
              ])),
    );
  }

  Widget buildMiddleFlex() {
    return Expanded(
      flex: 2,
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                  flex: 9,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentCarousel = index;
                          });
                        }),
                    carouselController: _controller,
                    items: walkthrough.map((element) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                image: element['image'],
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                              ),
                              SizedBox(height: 30),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      element['text'],
                                      style: TextStyle(
                                          fontSize: kSubTitleFontSize,
                                          color: Color(0xFF333333)),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      element['text2'],
                                      style: TextStyle(
                                          fontSize: kSubTitleFontSize,
                                          color: Color(0xFF333333)),
                                    ),
                                  ])
                            ],
                          );
                        },
                      );
                    }).toList(),
                  )),
              Expanded(
                  flex: 1,
                  child: DotsIndicator(
                      dotsCount: walkthrough.length,
                      position: currentCarousel.toDouble(),
                      decorator: DotsDecorator(activeColor: Colors.black87)))
            ],
          )),
    );
  }

  Widget buildBottomFlex() {
    return StreamBuilder(
        stream: bloc.initialRoute,
        builder: (context, snapshot) {
          return Expanded(
            flex: 1,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        padding: const EdgeInsets.only(
                            left: 70.0, right: 70, top: 12, bottom: 12),
                        onPressed: () => carouselOnPress('next', bloc),
                        color: Color(0xFF51B055),
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text('NEXT →',
                            style: TextStyle(
                                color: Colors.white, fontSize: kTextFontSize)),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        padding: const EdgeInsets.only(
                            left: 70.0, right: 70, top: 12, bottom: 12),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () => carouselOnPress('skip', bloc),
                        color: Colors.white,
                        child: Text('Skip',
                            style: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: kTextFontSize)),
                      )
                    ])),
          );
        });
  }
  // --------------------------------- Widget ---------------------------------
}
