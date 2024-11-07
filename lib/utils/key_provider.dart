import 'package:flutter/material.dart';

class KeyProvider with ChangeNotifier {
  final GlobalKey tabBarKey = GlobalKey();
  final GlobalKey bottomNavBarHomepageKey = GlobalKey();
  final GlobalKey bottomNavBarMapKey = GlobalKey();
  final GlobalKey bottomNavBarInteractionsKey = GlobalKey();
  final GlobalKey bottomNavBarSpeciesKey = GlobalKey();
  final GlobalKey bottomNavBarProfileKey = GlobalKey();
  final GlobalKey tabBarDamageKey = GlobalKey();
  final GlobalKey tabBarNatureKey = GlobalKey();
}
