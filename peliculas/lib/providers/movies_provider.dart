
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/models/models.dart';


class MoviesProvider extends ChangeNotifier {

  String _apiKey = '2a6f22e341df559eeff7b4ca87def8f0';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovie = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Movie>> _suggestionStreamController = new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => this._suggestionStreamController.stream;

  MoviesProvider() {
    print('MoviesProvider inicializando...');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async{
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key'  : _apiKey,
      'language' : _language,
      'page'     : '$page'
    });

    final response = await http.get(url);
    return response.body;
  }
 
  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovie = nowPlayingResponse.results;

    // Le dice a todos los widgets que esten escuchando ese cambio: sucedio algo en la data redibujate
    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage ++;

    final jsonData = await this._getJsonData('3/movie/popular', 1);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [ ... popularMovies, ... popularResponse.results ];

    // Le dice a todos los widgets que esten escuchando ese cambio: sucedio algo en la data redibujate
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    // TODO: Revisar el mapa
    if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    
    print('pidiendo info del servidor-Cast');
    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key'  : _apiKey,
      'language' : _language,
      'query'    : query,
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionsByQquery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await this.searchMovies(value);
      this._suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) { 
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}