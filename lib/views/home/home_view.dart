import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:wilde_buren/config/theme/asset_icons.dart';
import 'package:wilde_buren/config/theme/custom_colors.dart';
import 'package:wilde_buren/config/theme/custom_theme.dart';
import 'package:wilde_buren/config/theme/size_setter.dart';
import 'package:wilde_buren/utils/key_provider.dart';
import 'package:wilde_buren/views/feed/feed_view.dart';
import 'package:wilde_buren/views/home/widgets/bottom_navigation_bar_indicator.dart';
import 'package:wilde_buren/views/interaction/interaction_view.dart';
import 'package:wilde_buren/views/map/map_view.dart';
import 'package:wilde_buren/views/profile/profile_view.dart';
import 'package:wilde_buren/views/species/species_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: selectedIndex,
            children: const [
              FeedView(),
              MapView(),
              InteractionView(),
              SpeciesView(),
              ProfileView(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
            ),
            child: SizedBox(
              height: SizeSetter.getBottomNavigationBarHeight(),
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    key: Provider.of<KeyProvider>(context)
                        .bottomNavBarHomepageKey,
                    icon: Container(
                      padding: const EdgeInsets.only(bottom: 2, top: 5),
                      width: 27,
                      height: 24,
                      child: SvgPicture.asset(AssetIcons.house,
                          colorFilter: const ColorFilter.mode(
                            CustomColors.light200,
                            BlendMode.srcIn,
                          )),
                    ),
                    label: 'homepage',
                  ),
                  BottomNavigationBarItem(
                    key: Provider.of<KeyProvider>(context).bottomNavBarMapKey,
                    icon: Container(
                      padding: const EdgeInsets.only(bottom: 2, top: 5),
                      width: 27,
                      height: 24,
                      child: SvgPicture.asset(AssetIcons.location,
                          colorFilter: const ColorFilter.mode(
                            CustomColors.light200,
                            BlendMode.srcIn,
                          )),
                    ),
                    label: 'Map',
                  ),
                  BottomNavigationBarItem(
                    key: Provider.of<KeyProvider>(context)
                        .bottomNavBarInteractionsKey,
                    icon: Container(
                      padding: const EdgeInsets.only(bottom: 2, top: 5),
                      width: 27,
                      height: 24,
                      child: SvgPicture.asset(AssetIcons.plus,
                          colorFilter: const ColorFilter.mode(
                            CustomColors.light200,
                            BlendMode.srcIn,
                          )),
                    ),
                    label: 'Interacties',
                  ),
                  BottomNavigationBarItem(
                    key: Provider.of<KeyProvider>(context)
                        .bottomNavBarSpeciesKey,
                    icon: Container(
                      padding: const EdgeInsets.only(bottom: 2, top: 5),
                      width: 27,
                      height: 24,
                      child: SvgPicture.asset(AssetIcons.circleInfo,
                          colorFilter: const ColorFilter.mode(
                            CustomColors.light200,
                            BlendMode.srcIn,
                          )),
                    ),
                    label: 'Dieren',
                  ),
                  BottomNavigationBarItem(
                    key: Provider.of<KeyProvider>(context)
                        .bottomNavBarProfileKey,
                    icon: Container(
                      padding: const EdgeInsets.only(bottom: 2, top: 5),
                      width: 27,
                      height: 24,
                      child: SvgPicture.asset(AssetIcons.user,
                          colorFilter: const ColorFilter.mode(
                            CustomColors.light200,
                            BlendMode.srcIn,
                          )),
                    ),
                    label: 'Profiel',
                  ),
                ],
                type: BottomNavigationBarType.fixed,
                selectedItemColor: CustomColors.light100,
                unselectedItemColor: CustomColors.light,
                backgroundColor: CustomColors.primary,
                unselectedLabelStyle:
                    CustomTheme(context).themeData.textTheme.bodySmall,
                selectedLabelStyle:
                    CustomTheme(context).themeData.textTheme.bodySmall,
                selectedFontSize: SizeSetter.getBodySmallSize(),
                unselectedFontSize: SizeSetter.getBodySmallSize(),
                currentIndex: selectedIndex,
                onTap: onItemTapped,
              ),
            ),
          ),
          BottomNavigationBarIndicator(
            selectedIndex: selectedIndex,
            indicatorWidth: 55,
          ),
        ],
      ),
    );
  }
}
