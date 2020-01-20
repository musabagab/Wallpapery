import 'package:flutter/material.dart';
import 'package:wallpapery/scoped_models/trending_model.dart';
import 'package:wallpapery/ui/base_view.dart';

class TrendingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
