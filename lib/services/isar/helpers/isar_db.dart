import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wilde_buren/models/isar_interaction.dart';

class IsarDB {
  IsarDB._privateConstructor();
  static final IsarDB _instance = IsarDB._privateConstructor();
  static IsarDB get shared => _instance;

  late Isar instance;

  init() async {
    instance = await Isar.open(
      [IsarInteractionSchema],
      directory: (await getApplicationDocumentsDirectory()).path,
    );
  }
}
