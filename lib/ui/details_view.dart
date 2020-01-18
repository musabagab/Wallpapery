import 'package:flutter/material.dart';
import 'package:load_toast/load_toast.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/details_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/ui/base_view.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:http/http.dart' as http;

class DetailsView extends StatelessWidget {
  final Hit selectedHit;
  final LoadToast loadToast = locator<LoadToast>();
  DetailsView(this.selectedHit);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsModel>(
      onModelReady: (model) => model.setDeatilsHit(selectedHit),
      builder: (context, child, model) => SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity, // full screen
              child: Hero(
                tag: model.selectedHit.largeImageUrl,
                child: Image.network(
                  model.selectedHit.largeImageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white54),
                child: GestureDetector(
                  onTap: () {
                    // navigate back
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(.45),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () async {
                          await saveImageToGallery();
                        },
                        child: Icon(
                          Icons.file_download,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      ),
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            loadToast,
          ],
        ),
      ),
    );
  }

  Future saveImageToGallery() async {
    // download image to gallery
    loadToast.show(text: 'Downloading ...');
    var res = await http.get(selectedHit.largeImageUrl);
    // save it
    var path = await ImagePickerSaver.saveFile(fileData: res.bodyBytes);
    if (path != null) {
      loadToast.success();
    } else {
      loadToast.error();
    }
  }
}
