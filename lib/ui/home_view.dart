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
              _buildCategoriesList(model.categories, model),
            ],
          ),
        ),
      )),
    );
  }

  _buildCategoriesList(List<String> categories, model) {
    return Container(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        controller: model.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(2),
              width: 110,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(categories[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Booster')),
              ),
            ),
          );
        },
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
