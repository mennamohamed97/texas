import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texas/core/di/injection.dart';
import 'package:texas/core/helpers/bloc_observer.dart';
import 'package:texas/core/routing/app_router.dart';
import 'package:texas/texas_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  initGetIt();
  runApp(TexasApp(appRouter: AppRouter()));
}
