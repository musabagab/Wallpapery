import 'package:flutter/material.dart';
import 'package:wallpapery/enums/view_states.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/details_model.dart';
import 'package:wallpapery/ui/base_view.dart';

class DetailsView extends StatelessWidget {
  final Hit selectedHit;

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
            Center(
              child: model.state == ViewState.Busy
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )
                  : Container(),
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
                          model.saveImage(selectedHit.largeImageUrl);
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
                      GestureDetector(
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                        onTap: () {
                          // Show Image information dialog
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
    );
  }
}
