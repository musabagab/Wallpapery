import 'package:flutter/material.dart';
import 'package:wallpapery/enums/view_states.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/trending_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';
import 'package:wallpapery/ui/base_view.dart';
import 'package:wallpapery/ui/details_view.dart';

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
            buildSearchBar(category, model),
            SizedBox(
              height: 16,
            ),
            model.state == ViewState.Busy
                ? Container(
                    height: 200,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : buildImageGrid(model.images, model.hitsList, context)
          ],
        ),
      ),
    );
  }

  buildSearchBar(String category, TrendingModel model) {
    String searchText = "";
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.sort,
            color: Colors.black,
            size: 45,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 5, bottom: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search $category ...",
                        ),
                        onSubmitted: (String value) {
                          model.getCategoryData(searchQuery: value);
                        },
                        onChanged: (String searchQuery) {
                          model.getCategoryData(searchQuery: searchQuery);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        model.getCategoryData(searchQuery: searchText);
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

buildImageGrid(List<String> images, List<Hit> hitsList, context) {
  print(images.toString());
  return Expanded(
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: .6,
          children: images.map((imageUrl) {
            return GestureDetector(
              onTap: () {
                // find the selected hit object
                Hit selectedHit = hitsList.singleWhere((test) {
                  return test.largeImageUrl == imageUrl;
                });
                // navigate to deatils screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsView(selectedHit)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }).toList()));
}
