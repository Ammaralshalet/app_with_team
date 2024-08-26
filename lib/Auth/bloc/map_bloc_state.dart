import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';

// حالات (States) التي يمكن أن يكون Bloc عليها
abstract class MapState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final LocationData locationData;
  final List<Marker> markers;

  MapLoaded(this.locationData, this.markers);

  @override
  List<Object?> get props => [locationData, markers];
}

class MapError extends MapState {
  final String message;

  MapError(this.message);

  @override
  List<Object?> get props => [message];
}
