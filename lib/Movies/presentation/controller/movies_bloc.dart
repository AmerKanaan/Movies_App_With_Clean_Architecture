import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:movie/Movies/data/datasource/movies_remote_datasourse.dart';
import 'package:movie/Movies/data/repository/movie_repository.dart';
import 'package:movie/Movies/domain/entities/movie.dart';
import 'package:movie/Movies/domain/repository/base_movies_repository.dart';
import 'package:movie/Movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie/Movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie/Movies/domain/usecases/get_top_tated_movies_usecase.dart';
import 'package:movie/core/Utils/enums.dart';
import 'package:movie/core/usecase/base_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getPopularMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await getNowPlayingMoviesUseCase(NoParameters());

        result.fold(
          (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          )),
          (r) => emit(
            state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded,
            ),
          ),
        );
      },
    );

    on<GetPopularMoviesEvent>(
      (event, emit) async {
        final result = await getPopularMoviesUseCase(NoParameters());

        result.fold(
          (l) => emit(state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          )),
          (r) => emit(
            state.copyWith(
              popularMovies: r,
              popularState: RequestState.loaded,
            ),
          ),
        );
      },
    );
    on<GetTopRatedMoviesEvent>(
      (event, emit) async {
        final result = await getTopRatedMoviesUseCase(NoParameters());

        result.fold(
          (l) => emit(state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          )),
          (r) => emit(
            state.copyWith(
              topRatedMovies: r,
              topRatedState: RequestState.loaded,
            ),
          ),
        );
      },
    );
  }
}
