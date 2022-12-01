import 'package:movie/Movies/data/models/geners_model.dart';
import 'package:movie/Movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  MovieDetailsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage});
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath: json["backdrop_path"],
          genres: List<GenersModel>.from(
            json["genres"].map((x) => GenersModel.fromJson(x)),
          ),
          id: json["id"],
          overview: json["overview"],
          releaseDate: json["release_date"],
          runtime: json["runtime"],
          title: json["title"],
          voteAverage: json["vote_average"].toDouble());
}
