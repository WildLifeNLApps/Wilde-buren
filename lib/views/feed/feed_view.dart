import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wilde_buren/config/theme/custom_colors.dart';
import 'package:wilde_buren/utils/key_provider.dart';
import 'package:wilde_buren/widgets/custom_scaffold.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabBarKey = Provider.of<KeyProvider>(context).tabBarKey;
    final tabBarDamageKey = Provider.of<KeyProvider>(context).tabBarDamageKey;
    final tabBarNatureKey = Provider.of<KeyProvider>(context).tabBarNatureKey;
    return DefaultTabController(
        length: 2,
        child: CustomScaffold(
          appBackgroundColor: CustomColors.primary,
          automaticallyImplyLeading: true,
          appBar: AppBar(
            backgroundColor: CustomColors.primary,
            bottom: TabBar(
              key: tabBarKey,
              tabs: [
                Tab(
                  key: tabBarDamageKey,
                  text: "Schade",
                ),
                Tab(
                  key: tabBarNatureKey,
                  text: "Natuur",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Schade Content')),
              Center(child: Text('Natuur Content')),
            ],
          ),
        ));
  }
}
