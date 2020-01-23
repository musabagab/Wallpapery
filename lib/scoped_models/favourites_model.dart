import 'package:wallpapery/database/moor_database.dart';
import 'package:wallpapery/scoped_models/base_model.dart';
import 'package:wallpapery/service_locator.dart';

class FavouritesModel extends BaseModel {
  AppDatabase _appDatabase = locator<AppDatabase>();
  List<FavouritesImagesTableData> imagesList;

  Future getMyFavourites() async {
    setState(ViewState.Busy);
    imagesList = await _appDatabase.getAllFavourtiesImages();
    setState(ViewState.Retrieved);
  }
}
