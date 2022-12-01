import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/Movies/domain/entities/movie_detail.dart';
import 'package:movie/Movies/domain/entities/recommendation.dart';
import 'package:movie/Movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie/Movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movie/core/Utils/enums.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMovieDetail(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getMovieDetailUseCase(MovieDetailParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailState: RequestState.error,
          movieDetailMessage: l.message,
        ),
      ),
      (r) => emit(state.copyWith(
        movieDetail: r,
        movieDetailState: RequestState.loaded,
      ),),
    );
  }

  FutureOr<void> _getRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
              recommendationState: RequestState.error,
              recommendationMessage: l.message,
            ),),
        (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: RequestState.loaded,
            )));
  }
}
