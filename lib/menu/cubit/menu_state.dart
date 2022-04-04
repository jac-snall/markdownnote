part of 'menu_cubit.dart';

enum MenuTab {
  projects,
  todos,
  search,
  settings,
}

class MenuState extends Equatable {
  const MenuState({this.tab = MenuTab.projects});

  final MenuTab tab;

  @override
  List<Object> get props => [tab];
}
