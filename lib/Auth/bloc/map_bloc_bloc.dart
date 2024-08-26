import 'dart:io';
import 'package:app_with_team/Auth/bloc/map_bloc_event.dart' as auth_event;
import 'package:app_with_team/Auth/bloc/map_bloc_state.dart';
import 'package:app_with_team/service/map_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';

class MapBloc extends Bloc<auth_event.MapEvent, MapState> {
  final MapService mapService;

  MapBloc({required this.mapService}) : super(MapInitial()) {
    on<auth_event.GetLocationEvent>(_getLocation);
    on<auth_event.SearchLocationEvent>(_searchLocation);
  }

  Future<void> _getLocation(
      auth_event.GetLocationEvent event, Emitter<MapState> emit) async {
    emit(MapLoading());
    try {
      LocationData currentLocation;

      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        currentLocation = LocationData.fromMap({
          'latitude': 33.5094859,
          'longitude': 36.2939331,
        });
        List<Marker> markers = [
          mapService.createMarker(currentLocation.latitude!,
              currentLocation.longitude!, 'Default Location')
        ];
        emit(MapLoaded(currentLocation, markers));
      } else {
        var userLocation = await mapService.getCurrentLocation();
        List<Marker> markers = [
          mapService.createMarker(
              userLocation.latitude!, userLocation.longitude!, 'My Location')
        ];
        emit(MapLoaded(userLocation, markers));
      }
    } catch (e) {
      emit(MapError('Error getting location: $e'));
    }
  }

  Future<void> _searchLocation(
      auth_event.SearchLocationEvent event, Emitter<MapState> emit) async {
    if (event.query.isEmpty) return;

    emit(MapLoading());

    try {
      // مسح أو إعادة تعيين قائمة الـ Markers قبل البحث الجديد
      List<Marker> markers = [];

      // البحث عن المواقع الجديدة وإضافتها إلى القائمة
      markers = await mapService.searchLocation(event.query);

      emit(MapLoaded(
          LocationData.fromMap({
            'latitude': markers[0].point.latitude,
            'longitude': markers[0].point.longitude
          }),
          markers));
    } catch (e) {
      emit(MapError('Error searching places: $e'));
    }
  }
}
