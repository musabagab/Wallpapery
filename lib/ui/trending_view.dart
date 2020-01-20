import 'package:flutter/material.dart';
import 'package:wallpapery/scoped_models/trending_model.dart';
import 'package:wallpapery/service_locator.dart';
import 'package:wallpapery/services/api_service.dart';
import 'package:wallpapery/ui/base_view.dart';

class TrendingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(locator<ApiService>().category);
    return BaseView<TrendingModel>(
      builder: (context, child, model) => Scaffold(
        body: Center(
          child: Text(
            this.runtimeType.toString(),
          ),
        ),
      ),
    );
  }
}
