import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/enums/view_state.dart';
import 'package:newsapp/pages/base_page/base_view.dart';
import 'package:newsapp/scoped_model/home_scoped_model.dart';
import 'package:newsapp/widgets/busy_indicator/busy_overlay_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeScopedModel model = HomeScopedModel();

  bool onClick = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScopedModel>(
        onModelReady: (homeScopedModel) => homeScopedModel.getNewsScopedModel(),
        builder: (context, child, model) {
          return BusyOverlayWidget(
              show: model.state == ViewState.Busy,
              child: Scaffold(
                  body:
                      //Body
                      SingleChildScrollView(
                          child: Column(children: [
                AppBarHomeWidget(),
                model.state == ViewState.Retrieved
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: model.home.articles.length,
                        itemBuilder: (context, index) => ListTile(
                              title: index % 2 == 0
                                  ? Text(model.home.articles[index].title,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold))
                                  : Text(model.home.articles[index].title,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                              subtitle:
                                  Text(model.home.articles[index].description),
                            ))
                    : Container()
              ])
                          //BottomNavigation
                          )));
        });
  }
}

class AppBarHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.yellow,
    );
  }
}

class BodyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.red,
    ));
  }
}

class BottomNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      color: Colors.green,
    );
  }
}
