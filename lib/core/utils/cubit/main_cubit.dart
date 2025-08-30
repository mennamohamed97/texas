import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texas/core/utils/cubit/main_states.dart';
import 'package:texas/features/cart/presentation/screens/cart_screen.dart';
import 'package:texas/features/home/presentation/screens/home_screen.dart';
import 'package:texas/features/more/presentation/screens/more_screen.dart';
import 'package:texas/features/menu/presentation/screens/menu_screen.dart';
import 'package:texas/features/profile/presentation/screens/profile_screen.dart';
import 'package:texas/main.dart';

MainCubit mainCubit = MainCubit.get(navigatorKey.currentContext!);

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());
  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> pages = [
    const HomeScreen(),
    const MenuScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const MoreScreen(),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
