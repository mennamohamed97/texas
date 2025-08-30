part of 'menu_items_cubit.dart';
abstract class MenuItemsState extends Equatable {
  const MenuItemsState();

  @override
  List<Object?> get props => [];
}

class MenuInitial extends MenuItemsState {}

class MenuLoading extends MenuItemsState {}

class MenuLoaded extends MenuItemsState {
  final List<Item> items;

  const MenuLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class MenuError extends MenuItemsState {
  final String message;

  const MenuError(this.message);

  @override
  List<Object?> get props => [message];
}
