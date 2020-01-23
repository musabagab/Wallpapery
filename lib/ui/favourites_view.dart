import 'package:flutter/material.dart';
import 'package:wallpapery/database/moor_database.dart';
import 'package:wallpapery/enums/view_states.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/favourites_model.dart';
import 'package:wallpapery/ui/base_view.dart';
import 'package:wallpapery/ui/details_view.dart';

class FavourtiresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FavouritesModel>(
      onModelReady: (model) => model.getMyFavourites(),
      builder: (context, child, model) => Scaffold(
          body: (model.state == ViewState.Busy)
              ? Center(child: CircularProgressIndicator())
              : buildImageGrid(model.list, context, model)),
    );
  }

  buildImageGrid(List<FavouritesImagesTableData> images, context, model) {
    print(images.toString());
    if (images.length == 0) {
      return Center(child: Text('No Favourites added'));
    }
    return Container(
      width: double.infinity,
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: .6,
          children: images.map((image) {
            return GestureDetector(
              onTap: () {
                // set the selcted hit
                Hit selectedHit = Hit(
                    largeImageUrl: image.largeImageUrl,
                    id: image.id,
                    userImageUrl: image.userImageUrl,
                    likes: image.likes,
                    views: image.views,
                    comments: image.comments,
                    downloads: image.downloads,
                    imageSize: image.imagesize);
                // navigate to deatils screen
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsView(selectedHit)))
                    .then((isRemoved) {
                  if (isRemoved) {
                    // rebuilt if an image was removed
                    model.getMyFavourites();
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: image.largeImageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image.largeImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
