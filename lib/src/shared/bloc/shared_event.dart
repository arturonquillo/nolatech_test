import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

enum NavigationEnum {
  home,
  reservations,
  favorites
}




class Navigate extends NavigationEvent {
  final page;
  const Navigate(this.page);

  @override
  // TODO: implement props
  List<Object> get props => [page];
}
