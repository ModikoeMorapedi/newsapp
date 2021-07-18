import 'package:newsapp/enums/view_state.dart';
import 'package:newsapp/models/base/base_model.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/models/home_model.dart';
import 'package:newsapp/services/home_service.dart';
import 'package:newsapp/utils/locator.dart';

class HomeScopedModel extends BaseModel {
  final HomeService homeService = locator<HomeService>();

  Home _home;

  List<Categoty> _categoryList;

  List<Categoty> get categoryList => _categoryList;

  Home get home => _home;

  static String selectedCategory;

  void setCategory(String category) {
    selectedCategory = category;
  }

  List<Categoty> categoriesList = [
    Categoty(categoryTitle: 'general'),
    Categoty(categoryTitle: 'business'),
    Categoty(categoryTitle: 'entertainment'),
    Categoty(categoryTitle: 'sport'),
    Categoty(categoryTitle: 'technology'),
    Categoty(categoryTitle: 'science'),
    Categoty(categoryTitle: 'health')
  ];

  Future getNewsScopedModel() async {
    try {
      setState(ViewState.Busy);
      final response = await homeService.getNewsService(selectedCategory);

      response.status == 'ok' ? _home = response : null;
      setState(ViewState.Retrieved);
    } catch (e) {
      setState(ViewState.Error);
    }
  }

  Future getSelectedNewsScopedModel(String selectedCategory) async {
    try {
      setState(ViewState.Busy);
      final response = await homeService.getNewsService(selectedCategory);

      response.status == 'ok' ? _home = response : null;
      setState(ViewState.Retrieved);
    } catch (e) {
      setState(ViewState.Error);
    }
  }
}
