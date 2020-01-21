import 'package:flutter/material.dart';
import 'package:wallpapery/enums/view_states.dart';
import 'package:wallpapery/scoped_models/trending_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';
import 'package:wallpapery/ui/base_view.dart';
import 'package:wallpapery/widgets/SearchBar.dart';

class TrendingView extends StatelessWidget {
  final String category = locator<ApiService>().category;
  @override
  Widget build(BuildContext context) {
    return BaseView<TrendingModel>(
      onModelReady: (model) => model.getCategoryData(),
      builder: (context, child, model) => Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            SearchBar(),
            SizedBox(
              height: 16,
            ),
            model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : buildImageGrid(model.images)
          ],
        ),
      ),
    );
  }
}

buildImageGrid(List<String> images) {
  print(images.toString());
  return Expanded(
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: .6,
          children: images.map((value) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  value,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList()));
}
