import 'package:equatable/equatable.dart';

// الأحداث الممكنة (Events) التي يمكن لـ Bloc التعامل معها
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
