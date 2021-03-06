import 'package:flutter/material.dart';
import 'package:newsapp/utils/routes.dart';
import 'package:newsapp/utils/size_Config.dart';
import 'package:newsapp/views/home_page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scoped_model/home_scoped_model.dart';
import 'utils/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

HomeScopedModel homeScopedModel = HomeScopedModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeScopedModel>(
        model: homeScopedModel,
        child: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routes.generateRoute,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomePage(),
            );
          });
        }));
  }
}
