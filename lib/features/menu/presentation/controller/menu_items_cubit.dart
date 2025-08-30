import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texas/core/networking/api_result.dart';
import 'package:texas/core/networking/network_exceptions.dart';
import 'package:texas/features/menu/data/models/item_model.dart';
import 'package:texas/features/menu/data/repositories/menu_repo.dart';

part 'menu_items_state.dart';

class MenuItemsCubit extends Cubit<MenuItemsState> {
  final MenuRepo menuRepo;

  MenuItemsCubit(this.menuRepo) : super(MenuInitial());

  Future<void> fetchAllItems() async {
    emit(MenuLoading());

    final result = await menuRepo.getAllItems();

    result.when(
      success: (items) => emit(MenuLoaded(items)),
      failure: (NetworkExceptions networkExceptions) =>
          emit(MenuError(NetworkExceptions.getErrorMessage(networkExceptions))),
    );
  }
}
