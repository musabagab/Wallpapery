import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/base_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';

import '../scoped_models/base_model.dart';

class DetailsModel extends BaseModel {
  ApiService apiService = locator<ApiService>();
  Hit selectedHit;

  void setDeatilsHit(Hit selectedHit) {
    this.selectedHit = selectedHit;
  }
}
