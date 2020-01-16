import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final String imageUrl;
  DetailsView(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
