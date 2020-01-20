import 'package:flutter/material.dart';
import 'package:wallpapery/models/PhotosModel.dart';
import 'package:wallpapery/scoped_models/base_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';

import '../enums/view_states.dart';
import '../scoped_models/base_model.dart';

class HomeModel extends BaseModel {
  ApiService apiService = locator<ApiService>();
  List<String> images = List<String>();
  List<Hit> hitsList;
  final allCategories = [
    'fashion',
    'nature',
    'art',
    'science',
    'education',
    'people',
    'health',
    'places',
    'animals',
    'industry',
    'food',
    'computer',
    'sports',
    'travel',
    'buildings',
    'music'
  ];

  final allCategoriesImages = [
    'assets/images/1.png',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
    'assets/images/14.jpg',
    'assets/images/15.jpg',
    'assets/images/16.jpg',
  ];
  ScrollController scrollController = ScrollController();

  List<String> categories = List<String>(); // currently displayed
  int currentStartIndex = 0;

  Future<bool> getImagesData() async {
    categories =
        allCategories.sublist(currentStartIndex, 4); // get the first four

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // get more data onscroll
        currentStartIndex += 4;
        if (currentStartIndex >= allCategories.length) {
          return;
        }
        for (int i = currentStartIndex; i < currentStartIndex + 4; i++) {
          categories.add(allCategories[i]);
        }
        notifyListeners();
      }
    });

    print('Getting Images Data');
    setState(ViewState.Busy);
    hitsList = await apiService.getData();
    for (var item in hitsList) {
      if (item.largeImageUrl != null) {
        images.add(item.largeImageUrl);
      }
    }
    setState(ViewState.Retrieved);
    return true;
  }
}
