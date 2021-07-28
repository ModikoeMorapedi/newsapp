import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/enums/view_state.dart';
import 'package:newsapp/pages/base_page/base_view.dart';
import 'package:newsapp/scoped_model/home_scoped_model.dart';
import 'package:newsapp/utils/styles/color_style.dart';
import 'package:newsapp/widgets/busy_indicator/busy_overlay_widget.dart';

import 'detailed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeScopedModel model = HomeScopedModel();

  bool onClick = false;
  int i = 0;

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
                                  model.home.articles[3].urlToImage),
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
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  model.setArticles(model.home.articles[index]);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DetailedPage()));
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15, bottom: 15),
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10)),
                                                child: model
                                                            .home
                                                            .articles[index]
                                                            .urlToImage !=
                                                        null
                                                    ? CachedNetworkImage(
                                                        imageUrl: model
                                                            .home
                                                            .articles[index]
                                                            .urlToImage,
                                                        width: 70.0,
                                                        height: 95,
                                                        placeholder:
                                                            (context, url) =>
                                                                Center(
                                                          child: Image.network(
                                                              'https://source.unsplash.com/weekly?coding'),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.network(
                                                                'https://source.unsplash.com/weekly?coding'),
                                                      )
                                                    : Image.network(
                                                        'https://source.unsplash.com/weekly?coding',
                                                        width: 70.0,
                                                        height: 95,
                                                        fit: BoxFit.fill,
                                                      ))),
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
                                                              textAlign:
                                                                  TextAlign
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
                                                                  color: Colors
                                                                      .grey,
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
                                    )),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),

                //App Bar
                Container(
                  padding: EdgeInsets.only(top: 40, left: 20),
                  height: 115,
                  width: MediaQuery.of(context).size.width,
                  color: ColorStyle.midnightBlue,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 8, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.list,
                                color: Colors.white,
                                size: 32,
                              ),
                              Text(
                                'UPdates 24',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: model.categoriesList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () async {
                                setState(() {
                                  i = index;
                                });
                                model.setCategory(
                                    model.categoriesList[index].categoryTitle);
                                await model.getNewsScopedModel();
                              },
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  model.categoriesList[index].categoryTitle
                                      .toUpperCase(),
                                  style: i == index
                                      ? TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)
                                      : TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                )
              ]),
            ),
          );
        });
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
