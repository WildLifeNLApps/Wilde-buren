import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wilde_buren/config/theme/asset_icons.dart';
import 'package:wilde_buren/config/theme/custom_colors.dart';
import 'package:wilde_buren/config/theme/custom_theme.dart';
import 'package:wilde_buren/config/theme/size_setter.dart';
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
              InteractionView(),
              MapView(),
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
                    key: const Key('home_page_button'),
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
                    key: const Key('map_view_button'),
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
                    key: const Key('species_button'),
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
                    key: const Key('profile_button'),
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
                selectedItemColor: CustomColors.secondary,
                unselectedItemColor: CustomColors.light,
                backgroundColor: CustomColors.dark,
                selectedFontSize: SizeSetter.getBodySmallSize(),
                unselectedFontSize: SizeSetter.getBodySmallSize(),
                currentIndex: selectedIndex,
                unselectedLabelStyle:
                    CustomTheme(context).themeData.textTheme.bodySmall,
                selectedLabelStyle:
                    CustomTheme(context).themeData.textTheme.bodySmall,
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
