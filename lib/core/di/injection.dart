import 'package:texas/core/networking/create_and_setup_dio.dart';
import 'package:texas/features/menu/data/data_source/web_services.dart';
import 'package:texas/features/menu/data/repositories/menu_repo.dart';
import 'package:texas/features/menu/presentation/controller/menu_items_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<MenuItemsCubit>(() => MenuItemsCubit(getIt()));
  getIt.registerLazySingleton<MenuRepo>(() => MenuRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
    () => WebServices(createAndSetupDio()),
  );
}
