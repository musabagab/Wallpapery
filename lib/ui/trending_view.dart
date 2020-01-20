import 'package:flutter/material.dart';
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
      builder: (context, child, model) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            children: <Widget>[
              SearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}
