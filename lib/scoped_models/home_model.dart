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
    'backgrounds',
    'science',
    'education',
    'people',
    'feelings',
    'religion',
    'health',
    'places',
    'animals',
    'industry',
    'food',
    'computer',
    'sports',
    'transportation',
    'travel',
    'buildings',
    'business',
    'music'
  ];
  ScrollController scrollController = ScrollController();

  List<String> categories = List<String>(); // currently displayed
  int currentStartIndex;

  getMoreCategories(currentIndex) {
    return allCategories.sublist(currentIndex, currentIndex + 4);
  }

  Future<bool> getImagesData() async {
    currentStartIndex = 0;
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
