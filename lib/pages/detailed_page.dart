import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/pages/base_page/base_view.dart';
import 'package:newsapp/scoped_model/home_scoped_model.dart';
import 'package:newsapp/utils/styles/color_style.dart';
import 'package:newsapp/widgets/busy_indicator/busy_overlay_widget.dart';
import 'package:newsapp/widgets/cards/home_card_widget.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key key}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScopedModel>(
      builder: (context, child, model) => BusyOverlayWidget(
        child: Scaffold(
            backgroundColor: ColorStyle.midnightBlue,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          imageUrl: HomeScopedModel.image,
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
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
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
                            HomeScopedModel.title,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 10, left: 30, right: 30, bottom: 20),
                      child: RichText(
                        text: TextSpan(
                          text: HomeScopedModel.description,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          children: const <TextSpan>[
                            TextSpan(
                                //recognizer: ,
                                text: ' see more',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )),
                  Container(
                    child: Text('Sport Updates',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: model.articlesList.length,
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
                        child: HomeCardWidget(
                          imageUrl: model.articlesList[index].urlToImage,
                          title: model.articlesList[index].source.name,
                          subTitle: model.articlesList[index].title,
                          titleColor:
                              model.articlesList[index].source.name == 'News24'
                                  ? ColorStyle.midnightBlue
                                  : Colors.blueGrey,
                          time: model.articlesList[index].publishedAt
                              .substring(11, 16),
                        )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
