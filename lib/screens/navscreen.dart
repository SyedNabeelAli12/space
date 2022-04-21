import 'package:flooter/screens/coinSearch.dart';
import 'package:flooter/screens/community.dart';
import 'package:flooter/screens/list.dart';
import 'package:flooter/screens/notification.dart';
import 'package:flooter/screens/profilescreen.dart';
import 'package:flooter/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeCommunity(),
    ListCoin(),
    ProfileScreen(),
    CoinSearch(),
    NotificationsList(),
    Scaffold()
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.currency_bitcoin,
    MdiIcons.accountCircleOutline,
    MdiIcons.searchWeb,
    MdiIcons.bellOutline,
    Icons.menu
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        body:
            // TabBarView(
            //   physics: NeverScrollableScrollPhysics(),
            //   children: _screens,
            // ),
            IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
      length: _icons.length,
    );
  }
}
