import 'package:flutter/material.dart';
import 'package:fl_components/models/models.dart';
import '../screens/screens.dart'; 


class AppRoutes{

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.house),
    MenuOption(route: 'listview1', name: 'ListView tipo 1', screen: const ListView1Screen(), icon: Icons.list),
    MenuOption(route: 'listview2', name: 'ListView tipo 2', screen: const ListView2Screen(), icon: Icons.list),
    MenuOption(route: 'alert', name: 'Alertas', screen: const AlertScreen(), icon: Icons.add_alert),
    MenuOption(route: 'card', name: 'Tarjetas', screen: const CardScreen(), icon: Icons.credit_card),
    MenuOption(route: 'avatar', name: 'Avatars', screen: const AvatarScreen(), icon: Icons.supervised_user_circle_outlined),
    MenuOption(route: 'animation', name: 'Animaciónes', screen: const AnimatedScreen(), icon: Icons.play_circle_fill_outlined),
    MenuOption(route: 'input', name: 'Inputs', screen: const InputsScreen(), icon: Icons.input_outlined),
    MenuOption(route: 'slider', name: 'Slider && check', screen: const SliderScreen(), icon: Icons.sledding_rounded),
    MenuOption(route: 'listviewbuilder', name: 'InfiniteScroll & pull to refresh', screen: const ListViewBuildScreen(), icon: Icons.build_circle_outlined),
  ];


  static Map<String, Widget Function(BuildContext)> getAppRoutes(){

    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (context) => option.screen});
    }

    return appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> rutas = {
  //   'home': (context) => const HomeScreen(),
  //   'listview1': (context) => const ListView1Screen(),
  //   'listview2': (context) => const ListView2Screen(),
  //   'alert': (context) => const AlertScreen(),
  //   'card': (context) => const CardScreen(),
  // };
  
 static Route<dynamic> onGenerateRoute( RouteSettings settings){
        return MaterialPageRoute(
          builder: (context) => const AlertScreen()
        );
      }
}