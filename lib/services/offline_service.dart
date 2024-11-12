import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:wilde_buren/config/app_config.dart';
import 'package:wilde_buren/models/isar_interaction.dart';
import 'package:wilde_buren/services/isar/helpers/isar_db.dart';
import 'package:wilde_buren/services/isar/isar_interaction_service.dart';
import 'package:wildlife_api_connection/interaction_api.dart';
import 'package:wildlife_api_connection/models/location.dart';

class OfflineService {
  Future writeInteractionToApi() async {
    StreamSubscription? connectivitySubscription;
    connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> connectivityResult) async {
        if (connectivityResult.contains(ConnectivityResult.mobile) ||
            connectivityResult.contains(ConnectivityResult.wifi)) {
          // Mobile network available or Wi-fi is available.
          List<IsarInteraction> interactions =
              await IsarInteractionService(IsarDB.shared.instance)
                  .getInteractions(); // Get all interactions from Isar

          for (IsarInteraction interaction in interactions) {
            // Write interaction to API
            await InteractionApi(AppConfig.shared.apiClient).create(
                interaction.description,
                Location(
                    latitude: interaction.latitude,
                    longitude: interaction.longitude),
                interaction.speciesId,
                interaction.typeId);

            // Delete interaction from Isar
            await IsarInteractionService(IsarDB.shared.instance)
                .deleteInteraction(interaction);
          }

          debugPrint('Interactions written to API');
          //cancel the subscription
          await connectivitySubscription?.cancel();
          debugPrint('Cancel subscription');
        }
      },
      onError: (Object error) async {
        await connectivitySubscription?.cancel();
        debugPrint('Error: $error');
      },
      onDone: () async {
        await connectivitySubscription?.cancel();
        debugPrint('Done');
      },
    );
  }
}
