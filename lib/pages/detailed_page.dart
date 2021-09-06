import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/models/home_model.dart';
import 'package:newsapp/utils/app_strings.dart';
import 'package:newsapp/utils/styles/color_style.dart';

class DetailedPage extends StatefulWidget {
  final Map data;
  const DetailedPage({this.data, Key key}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  Articles articles;
  Home home;
  //final HomeScopedModel model = locator<HomeScopedModel>();

  @override
  void initState() {
    super.initState();

    if (widget.data != null) {
      articles = widget.data['articles'];
      home = widget.data['home'];
    } else {
      articles = null;
      home = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorStyle.midnightBlue,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    child: CachedNetworkImage(
                      imageUrl: articles.urlToImage,
                      height: 295,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                        child: Image.network(
                            'https://source.unsplash.com/weekly?coding'),
                      ),
                      errorWidget: (context, url, error) => Image.network(
                          'https://source.unsplash.com/weekly?coding'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: 0,
                    left: 0,
                    //height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: new LinearGradient(
                          colors: [
                            ColorStyle.midnightBlue,
                            ColorStyle.midnightBlue.withOpacity(0.2)
                          ],
                          begin: Alignment(0, 0.57),
                          end: Alignment(0, 0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      top: 230.0,
                      left: 30,
                      width: 350,
                      child: Text(
                        articles.title,
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 10),
                  child: RichText(
                    text: TextSpan(
                      text: articles.description,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      children: const <TextSpan>[
                        TextSpan(
                            //recognizer: ,
                            text: ' ' + AppStrings.seeMore,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                alignment: Alignment.bottomLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        height: 2,
                        width: 350,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, right: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Related',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Icon(
                                FontAwesomeIcons.arrowCircleDown,
                                color: Colors.white,
                                size: 23,
                              ),
                            ]),
                      )
                    ]),
              ),
              Container(
                height: 210,
                padding: EdgeInsets.only(left: 30, top: 15),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: home.articles.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            // FirebaseAnalytics().logEvent(
                            //     name: 'Selected article',
                            //     parameters: null);
                            // model.setArticles(
                            //     model.home.articles[index]);
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             DetailedPage()));
                          },
                          child: Container(
                              padding: EdgeInsets.only(right: 17),
                              height: 178,
                              width: 270,
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              home.articles[index].urlToImage,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fill,
                                          height: 160,
                                          placeholder: (context, url) => Center(
                                            child: Image.network(
                                                'https://source.unsplash.com/weekly?coding'),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Image.network(
                                                  'https://source.unsplash.com/weekly?coding'),
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                            home.articles[index].title,
                                            maxLines: 2,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                    ],
                                  )
                                ],
                              )),
                        )),
              ),
            ],
          ),
        ));
  }
}
