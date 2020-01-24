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
            buildSearchBar(category, model, context),
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

  buildSearchBar(String category, TrendingModel model, BuildContext context) {
    String searchText = "";
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // show dailog to change order by and page count
              showFilterDialog(context, model);
            },
            child: Icon(
              Icons.sort,
              color: Colors.black,
              size: 45,
            ),
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

void showFilterDialog(BuildContext context, TrendingModel model) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
            title: Text(
              'Filter Options',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              FlatButton(
                onPressed: () {
                  model.getCategoryData();
                  Navigator.of(context).pop();
                },
                child: Text('Apply'),
              ),
            ],
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) =>
                  Container(
                width: double.infinity,
                height: 150,
                child: Column(
                  children: <Widget>[
                    Text('How the results should be ordered:'),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ChoiceChip(
                          label: Text('Popular'),
                          selected: (model.apiService.order == 'popular')
                              ? true
                              : false,
                          onSelected: (bool selected) {
                            print('PopularChip ' + selected.toString());
                            String newOption = 'latest';
                            if (selected) {
                              newOption = 'popular';
                            }
                            setState(() => model.apiService.order = newOption);
                          },
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        ChoiceChip(
                          label: Text('Latest'),
                          selected: (model.apiService.order == 'latest')
                              ? true
                              : false,
                          onSelected: (bool selected) {
                            print('LatestChip ' + selected.toString());
                            String newOption = 'popular';
                            if (selected) {
                              newOption = 'latest';
                            }
                            setState(() => model.apiService.order = newOption);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('How many results per search:')),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Accepted values: (3 - 200)",
                      ),
                      onChanged: (value) {
                        print(value);
                        int newSearchCount = int.parse(value);
                        if (newSearchCount >= 3 && newSearchCount <= 200) {
                          model.apiService.pageCount = newSearchCount;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ));
}

buildImageGrid(List<String> images, List<Hit> hitsList, context) {
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
