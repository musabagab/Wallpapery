import 'package:wallpapery/scoped_models/base_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';

import '../enums/view_states.dart';
import '../scoped_models/base_model.dart';

class HomeModel extends BaseModel {
  ApiService apiService = locator<ApiService>();

  var images;

  Future<bool> getData() async {
    print('Getting Data');
    setState(ViewState.Busy);
    images = await apiService.getData();
    setState(ViewState.Retrieved);
    return true;
  }
}
