import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './views/movie_cell.dart';
import './Pages/movieDateilPage.dart';


void main() => runApp(new MovieApp());

class MovieApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MovieAppState();
  }
}

class MovieAppState extends State<MovieApp> {
  var _isLoading = true;
  var movies;

  _fetchData() async {
    print("ATtempting to fetch data ");

    final url = "http://showtimes.everyday.in.th/api/v2/movie/";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final moviesJson = map["results"];

    
      setState(() {
        _isLoading = false;
        this.movies = moviesJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: Text("Movie Application"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                print("Reloading....");
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
              },
            )
          ],
        ),
        body: new Center(
          child: _isLoading
              ? new CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: this.movies != null ? this.movies.length : 0,
                  itemBuilder: (context, i) {
                    final movie = this.movies[i];
                    return new FlatButton(
                      padding: new EdgeInsets.all(0.0),
                      child: new MovieCell(movie),
                      onPressed: () {
                        print("movie cell tapped $i");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new MovieDatailPage(movie)));
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }
}

