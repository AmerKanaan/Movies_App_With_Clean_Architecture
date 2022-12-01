import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Movies/domain/entities/movie_detail.dart';
import 'package:movie/Movies/domain/repository/base_movies_repository.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_usecase.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, MovieDetailParameters> {
  BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameters parameters) async {
    return await baseMoviesRepository.getMovieDetail(parameters);
  }

}

class MovieDetailParameters extends Equatable {
  final int movieId;

 const MovieDetailParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}