import 'package:isar/isar.dart';

part 'isar_interaction.g.dart';

@collection
class IsarInteraction {
  final Id? id;
  final String description;
  final int latitude;
  final int longitude;
  final String speciesId;
  final int typeId;

  IsarInteraction({
    this.id,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.speciesId,
    required this.typeId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'speciesId': speciesId,
      'typeId': typeId,
    };
  }
}
