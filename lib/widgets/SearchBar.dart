import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.sort,
          color: Colors.black,
          size: 45,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 45,
                  ),
                )),
          ),
        )
      ],
    );
  }
}
