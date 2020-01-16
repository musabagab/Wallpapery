import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wallpapery/enums/view_states.dart';
import 'package:wallpapery/scoped_models/home_model.dart';
import 'package:wallpapery/ui/base_view.dart';
import 'package:wallpapery/widgets/SearchBar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getData(),
      builder: (context, child, model) => Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SearchBar(),
              SizedBox(
                height: 20,
              ),
              _getBodyUi(model.state, model.images),
            ],
          ),
        ),
      )),
    );
  }

  Widget _getBodyUi(ViewState state, List<String> images) {
    switch (state) {
      case ViewState.Busy:
        return Center(child: CircularProgressIndicator());
      case ViewState.Retrieved:
      default:
        return CarouselSlider(
          height: 430.0,
          enlargeCenterPage: true,
          viewportFraction: .75,
          items: images
              .asMap()
              .entries
              .map((MapEntry map) => _buildImagesList(map.value))
              .toList(),
        );
    }
  }

  Widget _buildImagesList(String imageUrl) {
    return GestureDetector(
      onTap: () {},
      child: Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }
}
