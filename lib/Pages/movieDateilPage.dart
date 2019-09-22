import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class MovieDatailPage extends StatelessWidget {
  final movie;
  final f = DateFormat('dd-MM-yyyy');
  MovieDatailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    final movieImages = movie["images"];
    final diplayImage = movieImages[0];
    String dateWitht = movie["release_date"].toString().substring(0,10)  + movie["release_date"].toString().substring(10);
    DateTime date = DateTime.parse(dateWitht);
   


    return new Scaffold(
        appBar: new AppBar(
          title: new Text(movie["title"]),
        ),
        body: new Center(
            child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Container(
                padding: new EdgeInsets.all(0.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      
                      new Image.network(diplayImage["url"],
                          height: 500.0, width: 350.0, fit: BoxFit.fill),
                      new Text(movie["language"] != "-" ? "langage: " + movie["language"]:"langage: unavilabe information" ),
                      new Text("Release Date:" + f.format(date).toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),)
                    ]),)          
          ],
        ),),);
  }
}
