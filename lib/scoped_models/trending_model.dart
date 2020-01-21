import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/base_model.dart';
import 'package:wallpapery/services/api_service.dart';

import '../service_locator.dart';

class TrendingModel extends BaseModel {
  ApiService apiService = locator<ApiService>();
  List<String> images = List<String>();
  List<Hit> hitsList;

  Future<bool> getCategoryData() async {
    print('Getting Gategory ${apiService.category} Data');
    setState(ViewState.Busy);
    hitsList = await apiService.getCategoryData(); // for specfic category
    for (var item in hitsList) {
      if (item.largeImageUrl != null) {
        images.add(item.largeImageUrl);
      }
    }
    setState(ViewState.Retrieved);
    return true;
  }
}
