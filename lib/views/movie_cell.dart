import 'package:flutter/material.dart';

class MovieCell extends StatelessWidget {
  final movie;

  MovieCell(this.movie);
  @override
  Widget build(BuildContext context) {
    final images = movie["images"];
    final img = images[0];

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
            padding: new EdgeInsets.all(16.0),
            child: new Column(
              children: <Widget>[
                new Image.network(img["url"],
                height: 300,
                width: 300, 
                fit: BoxFit.fill ),
                new Container(height: 8.0),
                new Text(
                  movie["title"],
                  style: new TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            )),
        new Divider()
      ],
    );
  }
}
