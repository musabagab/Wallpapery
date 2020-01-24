import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:wallpapery/enums/view_states.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/details_model.dart';
import 'package:wallpapery/ui/base_view.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailsView extends StatelessWidget {
  final Hit selectedHit;
  DetailsView(this.selectedHit);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsModel>(
      onModelReady: (model) => model.setDeatilsHit(selectedHit),
      builder: (context, child, model) => SafeArea(
        child: WillPopScope(
          onWillPop: () {
            _onBackPressed(context, model);
            return;
          },
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
              Center(
                child: model.state == ViewState.Busy
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    : Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // navigate back and return if the image is removed or not
                    _onBackPressed(context, model);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.white54),
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
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            // check for storage permission first
                            PermissionStatus permission =
                                await PermissionHandler().checkPermissionStatus(
                                    PermissionGroup.storage);
                            if (permission == PermissionStatus.granted) {
                              // permission is granted
                              model.saveImage(
                                  selectedHit.largeImageUrl, context);
                            } else {
                              // request permission
                              await PermissionHandler().requestPermissions(
                                  [PermissionGroup.storage]);
                              // check status after requresting
                              PermissionStatus storagePermission =
                                  await PermissionHandler()
                                      .checkPermissionStatus(
                                          PermissionGroup.storage);
                              if (storagePermission ==
                                  PermissionStatus.granted) {
                                model.saveImage(
                                    selectedHit.largeImageUrl, context);
                              } else {
                                // show a taost
                                Toast.show(
                                    "Permission is required to save image",
                                    context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.CENTER,
                                    backgroundColor: Colors.blueAccent);
                              }
                            }
                          },
                          child: Icon(
                            Icons.file_download,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        GestureDetector(
                            onTap: () async {
                              if (model.isFavourites) {
                                // remove from fav
                                await model.removeFavourites();
                                Toast.show(
                                    "Image Removed from favourites", context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.CENTER,
                                    backgroundColor: Colors.blueAccent);
                              } else {
                                await model.saveToFavourites();
                                Toast.show("Image Added to favourites", context,
                                    duration: Toast.LENGTH_LONG,
                                    gravity: Toast.CENTER,
                                    backgroundColor: Colors.blueAccent);
                              }
                            },
                            child: model.isFavourites
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                        GestureDetector(
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            // Show Image information dialog
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => AlertDialog(
                                      title: Text('About Image'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        )
                                      ],
                                      content: buildDialogContents(),
                                    ));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBackPressed(BuildContext context, DetailsModel model) {
    // navigate back and return if the image is removed or not
    Navigator.of(context).pop(!model.isFavourites);
  }

  Widget buildDialogContents() {
    return Container(
      width: 200,
      height: 200,
      child: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(selectedHit.userImageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('User Image'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Downloads: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(selectedHit.downloads.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Likes: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(selectedHit.likes.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Comments: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(selectedHit.comments.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Views: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(selectedHit.views.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Image Size: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(selectedHit.imageSize.toString() + ' KB'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
