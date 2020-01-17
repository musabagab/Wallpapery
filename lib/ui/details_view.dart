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
        child: Hero(
          tag: model.selectedHit.largeImageUrl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              model.selectedHit.largeImageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
