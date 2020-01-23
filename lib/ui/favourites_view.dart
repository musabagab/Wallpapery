import 'package:flutter/material.dart';
import 'package:wallpapery/scoped_models/favourites_model.dart';
import 'package:wallpapery/ui/base_view.dart';

class FavourtiresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FavouritesModel>(
      builder: (context, child, model) => Scaffold(
        body: Center(child: Text(this.runtimeType.toString())),
      ),
    );
  }
}
