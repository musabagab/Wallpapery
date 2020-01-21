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
            SearchBar(),
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
  return Expanded(
    child: Container(
        color: Colors.red,
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Text('Image1'),
          ],
        )),
  );
}
