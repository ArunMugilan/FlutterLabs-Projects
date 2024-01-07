import 'package:flutter/material.dart';
import 'http_helper.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String? result;
  HttpHelper? helper;
  int? moviesCount;
  late List<dynamic> movies;
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
  Icon visibleIcon = const Icon(Icons.search);
  Widget searchBar = const Text('Movies');

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;
    return Scaffold(
        appBar: AppBar(
            title: searchBar,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: visibleIcon,
                onPressed: () {
                  setState(() {
                    if (visibleIcon.icon == Icons.search) {
                      visibleIcon = Icon(Icons.cancel);
                      searchBar = TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (String text) {
                          search(text);
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      );
                    } else {
                      setState(() {
                        visibleIcon = Icon(Icons.search);
                        searchBar = Text('Movies');
                      });
                    }
                  });
                },
              ),
            ]),
        body: ListView.builder(
            itemCount: (moviesCount == null) ? 0 : moviesCount,
            itemBuilder: (BuildContext context, int position) {
              if (movies[position].posterPath != null) {
                image = NetworkImage(iconBase + movies[position].posterPath);
              } else {
                image = NetworkImage(defaultImage);
              }
              return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    onTap: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (_) => MovieDetail(movies[position]));
                      Navigator.push(context, route);
                    },
                    leading: CircleAvatar(backgroundImage: image),
                    title: Text(movies[position].title),
                    subtitle: Text('Released: ' +
                        movies[position].releaseDate +
                        ' - Vote: ' +
                        movies[position].voteAverage.toString()),
                  ));
            }));
  }

  Future search(text) async {
    movies = (await helper!.findMovies(text))!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  Future initialize() async {
    movies = List<dynamic>.empty();

    movies = (await helper!.getUpcoming())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
    print('#Debug movie_list.dart => moviesCount = $moviesCount');
  }
}
