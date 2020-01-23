import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:toast/toast.dart';
import 'package:wallpapery/database/moor_database.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/base_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';
import 'package:http/http.dart' as http;
import '../scoped_models/base_model.dart';

class DetailsModel extends BaseModel {
  ApiService apiService = locator<ApiService>();
  AppDatabase _appDatabase = locator<AppDatabase>();
  Hit selectedHit;
  bool isFavourites = false;
  FavouritesImagesTableData favouritesImagesObject;

  void setDeatilsHit(Hit selectedHit) {
    this.selectedHit = selectedHit;
    isImageFavourites(selectedHit);
  }

  void saveImage(String imageUrl, context) async {
    setState(ViewState.Busy);
    var res = await http.get(imageUrl);
    // save it
    await ImagePickerSaver.saveFile(fileData: res.bodyBytes);
    Toast.show("Image saved to gallery", context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER,
        backgroundColor: Colors.blueAccent);
    setState(ViewState.Retrieved);
  }

  saveToFavourites() async {
    var result;
    try {
      result = await _appDatabase.insertImage(FavouritesImagesTableData(
        largeImageUrl: selectedHit.largeImageUrl,
        views: selectedHit.views,
        userImageUrl: selectedHit.userImageUrl,
        likes: selectedHit.likes,
        downloads: selectedHit.downloads,
        imagesize: selectedHit.imageSize,
        comments: selectedHit.comments,
      ));
      isImageFavourites(selectedHit);
    } catch (e) {
      print('Error ' + e.toString());
      isFavourites = false;
    }
    print('Results ' + result.toString());
    notifyListeners();
  }

  isImageFavourites(selectedHit) async {
    List<FavouritesImagesTableData> allFavourites =
        await _appDatabase.getAllFavourtiesImages();
    for (int i = 0; i < allFavourites.length; i++) {
      if (allFavourites[i].largeImageUrl == selectedHit.largeImageUrl) {
        print('its favroutires');
        isFavourites = true;
        favouritesImagesObject = allFavourites[i];
        print('Object Saved ' + favouritesImagesObject.toString());
        break;
      }
    }
    notifyListeners();
  }

  void removeFavourites() async {
    if (favouritesImagesObject == null) {
      print('FavImageData is null');
      return;
    }
    await _appDatabase.deleteImage(favouritesImagesObject);
    isFavourites = false;
    favouritesImagesObject = null;
    notifyListeners();
  }
}
