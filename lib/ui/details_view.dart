import 'package:flutter/material.dart';
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
                    size: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.file_download,
                      color: Colors.white,
                      size: 35,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 35,
                    ),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 35,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
