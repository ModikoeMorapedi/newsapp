import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/enums/view_state.dart';
import 'package:newsapp/pages/base_page/base_view.dart';
import 'package:newsapp/pages/detailed_page.dart';
import 'package:newsapp/scoped_model/home_scoped_model.dart';
import 'package:newsapp/utils/styles/color_style.dart';
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
              backgroundColor: ColorStyle.lightBlueGrey,
              body: Stack(children: [
                //Body
                SingleChildScrollView(
                  child: Column(
                    children: [
                      model.state == ViewState.Retrieved
                          ? Container(
                              margin: EdgeInsets.only(top: 83),
                              height: 250,
                              child: Image.network(
                                  model.home.articles[0].urlToImage),
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text('Trending',
                                style: TextStyle(
                                  color: ColorStyle.midnightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                      model.state == ViewState.Retrieved
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: model.home.articles.length,
                              itemBuilder: (context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 15),
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft:
                                                    Radius.circular(10)),
                                            child: Image.network(
                                              model.home.articles[index]
                                                  .urlToImage,
                                              width: 70.0,
                                              height: 95,
                                              fit: BoxFit.fill,
                                            ),
                                          )),
                                      Expanded(
                                          flex: 7,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 7),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 45,
                                                          height: 22,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  7),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            'Tech',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            '02:00 PM',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                      child: Text(
                                                    model.home.articles[index]
                                                        .title,
                                                    maxLines: 2,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        color: ColorStyle
                                                            .midnightBlue,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                                ]),
                                          ))
                                    ],
                                  )

                                  // ListTile(
                                  //   onTap: () {
                                  //     Navigator.of(context).push(
                                  //         MaterialPageRoute(
                                  //             builder: (BuildContext context) =>
                                  //                 DetailedPage()));
                                  //   },
                                  //   title: Text(model.home.articles[index].title,
                                  //       style: TextStyle(
                                  //           color: ColorStyle.midnightBlue,
                                  //           fontWeight: FontWeight.bold)),
                                  //   subtitle: Text(
                                  //       model.home.articles[index].description),
                                  // ),
                                  ),
                            )
                          : Container(),
                    ],
                  ),
                ),

                //App Bar
                AppBarHomeWidget(),
              ]),
            ),
          );
        });
  }
}

class AppBarHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 20),
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: ColorStyle.midnightBlue,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.only(bottom: 7),
          child: Text(
            'News APP',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Row(
          children: [
            Container(
              child: Text(
                'All News',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Fashion',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Sport',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Entertainment',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Technology',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            )
          ],
        )
      ]),
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
