import 'package:isar/isar.dart';
import 'package:wilde_buren/models/isar_interaction.dart';

class IsarInteractionService {
  final Isar isar;

  IsarInteractionService(this.isar);

  Future<List<IsarInteraction>> getInteractions() async {
    return isar.isarInteractions.where().findAll();
  }

  Future addInteraction(IsarInteraction interaction) async {
    await isar.writeTxn(() async {
      return isar.isarInteractions.put(interaction);
    });
  }

  Future deleteInteraction(IsarInteraction interaction) async {
    await isar.writeTxn(() async {
      return isar.isarInteractions.delete(interaction.id!);
    });
  }
}
