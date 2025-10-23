import 'package:food_app/models/base_model.dart';

class Food extends BaseModel {
  final dynamic id;
  final String image;
  final String description;
  final double scores;

   Food({
    required this.image,
    required this.description,
    required this.scores,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      ...getJsonRelation('id', id),
      'image': image,
      'description': description,
      'scores': scores,
    };
  }

}
