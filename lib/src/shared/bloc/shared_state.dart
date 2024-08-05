import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  const NavigationState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NavigationCurrent extends NavigationState {
  final int page;
  const NavigationCurrent(this.page);

  @override
  List<Object?> get props => [page];
}
