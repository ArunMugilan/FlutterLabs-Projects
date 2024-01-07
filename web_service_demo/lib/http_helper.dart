import 'dart:io'; //Provides access to input/output operations, including reading from and writing to files.
import 'package:http/http.dart' as http; //Allows making HTTP requests.
import 'dart:convert'; //Provides encoding and decoding functions, especially for working with JSON.
import './movie.dart';


class HttpHelper {
  final String urlKey = 'api_key=4530c3ce6e76baf01825a6998db0b7a5';//TMDb API key for authentication.
  final String urlBase = 'https://api.themoviedb.org/3/movie';//The base URL for making requests to the TMDb API.
  final String urlUpcoming = '/upcoming?';//The endpoint for fetching upcoming movies.
  final String urlLanguage = '&language=en-US';//The language parameter for the API (English, in this case).
  final String urlSearchBase = //The base URL for searching movies.
      'https://api.themoviedb.org/3/search/movie?api_key=4530c3ce6e76baf01825a6998db0b7a5&query=';

  Future<List?> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    var url = Uri.parse(upcoming);
    http.Response result = await http.get(url); //Makes an HTTP GET request to the constructed URL.

    if(result.statusCode == HttpStatus.ok){ //hhtpstatus.ok = 200
      print('#Debug http_helper.dart => statusCode OK ');
      final jsonResponse = json.decode(result.body);
      print('#Debug http_helper.dart => jsonResponse = $jsonResponse ');

      final movieMap = jsonResponse['results'];
      List movies = movieMap.map((i)=> Movie.fromJson(i)).toList();
      return movies;

    }else{
      return null;
    }
  }

  Future<List?> findMovies (String title) async{
    final String query = urlSearchBase +title;
    var urlQuery = Uri.parse(query);

    http.Response result = await http.get(urlQuery);

    if(result.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];

      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();

      return movies;

    }else{
      return null;
    }
  }
}
