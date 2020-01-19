import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallpapery/enums/view_states.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/home_model.dart';
import 'package:wallpapery/ui/base_view.dart';
import 'package:wallpapery/ui/details_view.dart';
import 'package:wallpapery/widgets/SearchBar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getImagesData(),
      builder: (context, child, model) => Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            children: <Widget>[
              SearchBar(),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 400.0,
                  child: _getBodyUi(
                      model.state, model.images, context, model.hitsList)),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Booster'),
                  ),
                ),
              ),
              _buildCategoriesList(model.categories, model.scrollController,
                  model.allCategories.length, model.allCategoriesImages),
            ],
          ),
        ),
      )),
    );
  }

  _buildCategoriesList(
    List<String> categories,
    scrollController,
    int fullLength,
    allCategoriesImages,
  ) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(left: 10),
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if ((index == categories.length)) {
            if (index == fullLength) {
              // end of the list
              return Container();
            }
            return Center(child: CircularProgressIndicator());
          }
          return buidlCategoryItem(allCategoriesImages, index, categories);
        },
      ),
    );
  }

  GestureDetector buidlCategoryItem(
      allCategoriesImages, int index, List<String> categories) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(2),
        width: 100,
        child: Container(
          child: CircleAvatar(
            backgroundImage: AssetImage(allCategoriesImages[index]),
            child: Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xCC000000).withOpacity(.0),
                    const Color(0xCC000000).withOpacity(.4),
                    const Color(0xCC000000).withOpacity(.0),
                  ],
                ),
              ),
              child: Center(
                child: Text(categories[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Booster')),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBodyUi(ViewState state, List<String> images, BuildContext context,
      List<Hit> hitsList) {
    switch (state) {
      case ViewState.Busy:
        return Align(
            alignment: Alignment.center, child: CircularProgressIndicator());
      case ViewState.Retrieved:
      default:
        return CarouselSlider(
          height: 420.0,
          enlargeCenterPage: true,
          viewportFraction: .75,
          items: images
              .asMap()
              .entries
              .map((MapEntry map) =>
                  _buildImagesList(map.value, context, hitsList))
              .toList(),
        );
    }
  }

  Widget _buildImagesList(
      String imageUrl, BuildContext context, List<Hit> hitsList) {
    return GestureDetector(
      onTap: () {
        // find the selected hit object
        Hit selectedHit = hitsList.singleWhere((test) {
          return test.largeImageUrl == imageUrl;
        });
        // navigate to deatils screen
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsView(selectedHit)));
      },
      child: Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Hero(
                tag: imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
