import 'package:movie/Movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({ super.backdropPath, required super.id});
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json["backdrop_path"]?? "assets/sad-pictures-1.jpg",
        id: json["id"],
      );
}
