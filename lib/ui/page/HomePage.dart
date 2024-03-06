import 'package:flutter/material.dart';
import 'package:DeCarbon/bloc/HomeBloc.dart';
import 'package:DeCarbon/core/AppProvider.dart';

class HomePage extends StatefulWidget {
  static const String PATH = '/';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _init();

    return Scaffold(
        appBar: AppBar(
          title: Text("DeCarbon"),
        ),
        body: buildBody(),
        floatingActionButton: buildFloatButton());
  }

  Widget buildBody() {
    return StreamBuilder(
      stream: bloc.counter,
      builder: (context, snapshot) {
        int counter = snapshot.data;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildFloatButton() {
    return StreamBuilder(
      stream: bloc.counter,
      builder: (context, snapshot) {
        int counter = snapshot.data;

        return FloatingActionButton(
          onPressed: () => bloc.incrementCounter(++counter),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        );
      },
    );
  }

  void _init() {
    if (null == bloc) {
      bloc = HomeBloc(AppProvider.getApplication(context));
      //   bloc.isShowLoading.listen((bool isLoading){
      //     if(isLoading){
      //       _showLoading();
      //     }
      //     else{
      //       Navigator.pop(context);
      //     }
      //   });
      //   bloc.loadFeedList();
    }
  }

  // void _showLoading() {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       child: Dialog(
  //           child: Container(
  //               padding: EdgeInsets.all(16),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   CircularProgressIndicator(),
  //                   Container(
  //                       margin: EdgeInsets.only(top: 8),
  //                       child: Text(S.of(context).dialogLoading)
  //                   )
  //                 ],
  //               )
  //           )
  //       )
  //   );
  // }
}
