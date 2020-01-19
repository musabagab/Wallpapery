import 'package:flutter/material.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:toast/toast.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/base_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';
import 'package:http/http.dart' as http;
import '../scoped_models/base_model.dart';

class DetailsModel extends BaseModel {
  ApiService apiService = locator<ApiService>();
  Hit selectedHit;

  void setDeatilsHit(Hit selectedHit) {
    this.selectedHit = selectedHit;
  }

  void saveImage(String imageUrl, context) async {
    setState(ViewState.Busy);
    var res = await http.get(imageUrl);
    // save it
    await ImagePickerSaver.saveFile(fileData: res.bodyBytes);
    Toast.show("Image saved to gallery", context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM,
        backgroundColor: Colors.blueAccent);
    setState(ViewState.Retrieved);
  }
}
