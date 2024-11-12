import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wilde_buren/app.dart';
import 'package:wilde_buren/config/app_config.dart';
import 'package:wilde_buren/services/isar/helpers/isar_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  PackageInfo info = await PackageInfo.fromPlatform();
  AppConfig.create(flavor: getFlavorByPackageName(info.packageName));

  await IsarDB.shared.init();
  runApp(const App());
}
