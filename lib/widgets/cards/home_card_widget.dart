import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/utils/styles/color_style.dart';

// ignore: must_be_immutable
class HomeCardWidget extends StatelessWidget {
  String title;
  String subTitle;
  Icon icon;
  String imageUrl;
  Color titleColor;
  String time;

  HomeCardWidget(
      {Key key,
      this.icon,
      this.imageUrl,
      this.subTitle,
      this.title,
      this.titleColor,
      this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(flex: 3, child: imageWidget()),
            Expanded(flex: 7, child: detailsWidget())
          ],
        ));
  }

  Widget imageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      child: Container(
        height: 90,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 70.0,
          fit: BoxFit.fill,
          placeholder: (context, url) => Center(
            child: Image.network('https://source.unsplash.com/weekly?coding'),
          ),
          errorWidget: (context, url, error) =>
              Image.network('https://source.unsplash.com/weekly?coding'),
        ),
      ),
    );
  }

  Widget titleContainerWidget() {
    return Flexible(
        child: Container(
            padding: EdgeInsets.only(left: 4, right: 4, top: 4),
            margin: EdgeInsets.only(right: 3),
            height: 22,
            decoration: BoxDecoration(
              color: titleColor ?? Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )));
  }

  Widget timeContainerWidget() {
    return Container(
      child: Text(
        time ?? '02:00 PM',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget subtitleContainerWidget() {
    return Container(
        child: Text(
      subTitle,
      maxLines: 2,
      softWrap: true,
      style: TextStyle(
          color: ColorStyle.midnightBlue, fontWeight: FontWeight.bold),
    ));
  }

  Widget detailsWidget() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(bottom: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleContainerWidget(),
              timeContainerWidget(),
            ],
          ),
        ),
        subtitleContainerWidget()
      ]),
    );
  }
}
