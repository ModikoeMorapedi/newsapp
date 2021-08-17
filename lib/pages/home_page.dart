import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/enums/view_state.dart';
import 'package:newsapp/pages/base_page/base_view.dart';
import 'package:newsapp/scoped_model/home_scoped_model.dart';
import 'package:newsapp/utils/styles/color_style.dart';
import 'package:newsapp/widgets/busy_indicator/busy_overlay_widget.dart';
import 'package:newsapp/widgets/cards/home_card_widget.dart';

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
          // String date = model.articles.publishedAt != null
          //     ? model.articles.publishedAt
          //     : '"2002-02-27T14:00:00-0500';
          //String dateTime = date.substring(11, 16);
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
                          ? Stack(children: [
                              Container(
                                margin: EdgeInsets.only(top: 83),
                                height: 250,
                                child: CachedNetworkImage(
                                  imageUrl: model.home.articles[3].urlToImage,
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  placeholder: (context, url) => Center(
                                    child: Image.asset(
                                      'assets/images/placeholderImage.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/images/placeholderImage.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 6,
                                  top: 270.0,
                                  left: 30,
                                  child: Text(
                                    model.home.articles[3].author != null
                                        ? model.home.articles[3].author
                                        : 'Updates24',
                                    maxLines: 3,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Positioned(
                                bottom: 5,
                                top: 290.0,
                                left: 30,
                                width: 360,
                                child: Text(
                                  model.home.articles[3].title,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ])
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 5),
                            child: Text('What\'s happening',
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
                                    FirebaseAnalytics().logEvent(
                                        name: 'Selected article',
                                        parameters: null);
                                    model.setArticles(
                                        model.home.articles[index]);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                DetailedPage()));
                                  },
                                  child: HomeCardWidget(
                                    imageUrl:
                                        model.home.articles[index].urlToImage,
                                    title:
                                        model.home.articles[index].source.name,
                                    subTitle: model.home.articles[index].title,
                                    titleColor: model.home.articles[index]
                                                .source.name ==
                                            'News24'
                                        ? ColorStyle.midnightBlue
                                        : Colors.blueGrey,
                                    time: model.home.articles[index].publishedAt
                                        .substring(11, 16),
                                  )),
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
