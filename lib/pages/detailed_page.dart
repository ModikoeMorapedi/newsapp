import 'package:flutter/cupertino.dart';
import 'package:newsapp/pages/base_page/base_view.dart';
import 'package:newsapp/scoped_model/home_scoped_model.dart';
import 'package:newsapp/widgets/busy_indicator/busy_overlay_widget.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key key}) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScopedModel>(
      builder: (context, child, model) => BusyOverlayWidget(),
    );
  }
}
