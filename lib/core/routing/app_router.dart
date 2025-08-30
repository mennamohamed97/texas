import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texas/core/di/injection.dart';
import 'package:texas/core/routing/routes.dart';
import 'package:texas/features/cart/presentation/screens/cart_screen.dart';
import 'package:texas/features/home/presentation/screens/home_screen.dart';
import 'package:texas/features/main/presentation/main_screen.dart';
import 'package:texas/features/menu/presentation/controller/menu_items_cubit.dart';
import 'package:texas/features/menu/presentation/screens/menu_screen.dart';
import 'package:texas/features/more/presentation/screens/more_screen.dart';
import 'package:texas/features/profile/presentation/screens/profile_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MenuItemsCubit>()..fetchAllItems(),
            child: const MainScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.menuScreen:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.moreScreen:
        return MaterialPageRoute(builder: (_) => const MoreScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for this route ${settings.name}'),
            ),
          ),
        );
    }
  }
}
