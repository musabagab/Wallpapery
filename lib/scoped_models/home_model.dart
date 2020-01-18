import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/base_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';

import '../enums/view_states.dart';
import '../scoped_models/base_model.dart';

class HomeModel extends BaseModel {
  ApiService apiService = locator<ApiService>();
  List<String> images = List<String>();
  List<Hit> hitsList;
  final categories = [
    'fashion',
    'nature',
    'backgrounds',
    'science',
    'education',
    'people',
    'feelings',
    'religion',
    'health',
    'places',
    'animals',
    'industry',
    'food',
    'computer',
    'sports',
    'transportation',
    'travel',
    'buildings',
    'business',
    'music'
  ];

  Future<bool> getImagesData() async {
    print('Getting Data');
    setState(ViewState.Busy);
    hitsList = await apiService.getData();
    for (var item in hitsList) {
      if (item.largeImageUrl != null) {
        images.add(item.largeImageUrl);
      }
    }
    setState(ViewState.Retrieved);
    return true;
  }
}
