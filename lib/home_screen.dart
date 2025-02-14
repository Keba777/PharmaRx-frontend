import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharmarx/core/routes/app_router.gr.dart';
import 'package:pharmarx/core/theme/colors.dart';
import 'package:pharmarx/core/utils/images.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomePage(),
        SearchPage(),
        CartPage(),
        ProfilePage(),
      ],
      transitionBuilder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu, color: AppColors.darkGray),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppAssets.logo, height: 30),
                const SizedBox(width: 8),
                const Text("PharmaRx", style: TextStyle(color: AppColors.darkGray)),
              ],
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: const Icon(Icons.notifications, color: AppColors.darkGray),
              ),
            ],
          ),
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primaryRed,
            unselectedItemColor: AppColors.darkGray,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
