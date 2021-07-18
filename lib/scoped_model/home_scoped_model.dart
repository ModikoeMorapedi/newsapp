import 'package:newsapp/enums/view_state.dart';
import 'package:newsapp/models/base/base_model.dart';
import 'package:newsapp/models/home_model.dart';
import 'package:newsapp/services/home_service.dart';
import 'package:newsapp/utils/locator.dart';

class HomeScopedModel extends BaseModel {
  final HomeService homeService = locator<HomeService>();

  Home _home;
  Home get home => _home;

  Future getNewsScopedModel() async {
    try {
      setState(ViewState.Busy);
      final response = await homeService.getNewsService();

      response.status == 'ok' ? _home = response : null;
      setState(ViewState.Retrieved);
    } catch (e) {
      setState(ViewState.Error);
    }
  }
}
