import 'package:equatable/equatable.dart';

abstract class MapEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLocationEvent extends MapEvent {}

class SearchLocationEvent extends MapEvent {
  final String query;

  SearchLocationEvent(this.query);

  @override
  List<Object?> get props => [query];
}
