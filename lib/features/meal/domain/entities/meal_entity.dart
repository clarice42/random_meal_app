import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final String name;
  final String description;
  final String imageUrl;

  MealEntity({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        imageUrl,
      ];
}
