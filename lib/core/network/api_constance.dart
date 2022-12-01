class AppConstance {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "0cfe254cf3a18fb5a315d65eccd0b068";
  static const nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static String movieDetailPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String recommendationPath(int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
  static const String baseImageUrl ="https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path){
    return "$baseImageUrl$path";
  }
}
