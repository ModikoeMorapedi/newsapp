import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/enums/view_state.dart';
import 'package:newsapp/pages/base_page/base_view.dart';
import 'package:newsapp/pages/detailed_page.dart';
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
                  body: SingleChildScrollView(
                      child: Column(children: [
                //App Bar
                AppBarHomeWidget(),
                //Body
                model.state == ViewState.Retrieved
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: model.home.articles.length,
                        itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DetailedPage()));
                              },
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
                    : Container(),
              ]))));
        });
  }
}

class AppBarHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.yellow,
      child: Text(
        'News APP',
        textAlign: TextAlign.center,
      ),
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
