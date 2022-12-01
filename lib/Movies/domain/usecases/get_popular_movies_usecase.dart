import 'package:dartz/dartz.dart';
import 'package:movie/Movies/domain/entities/movie.dart';
import 'package:movie/Movies/domain/repository/base_movies_repository.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_usecase.dart';

class GetPopularMoviesUseCase  extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }


}
