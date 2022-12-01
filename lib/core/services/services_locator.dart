import 'package:get_it/get_it.dart';
import 'package:movie/Movies/data/datasource/movies_remote_datasourse.dart';
import 'package:movie/Movies/data/repository/movie_repository.dart';
import 'package:movie/Movies/domain/repository/base_movies_repository.dart';
import 'package:movie/Movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie/Movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie/Movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie/Movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movie/Movies/domain/usecases/get_top_tated_movies_usecase.dart';
import 'package:movie/Movies/presentation/controller/movie_detail_bloc.dart';
import 'package:movie/Movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(), sl()));
    //UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    //repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
    //datasource
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
  }
}
