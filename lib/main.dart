import 'package:app_with_team/Auth/bloc/map_bloc_bloc.dart';
import 'package:app_with_team/Auth/view/pages/onboarding_screen.dart';
import 'package:app_with_team/service/map_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Auth/view/pages/notification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mapService = MapService();

    return MultiBlocProvider(
      providers: [
        BlocProvider<MapBloc>(
          create: (context) => MapBloc(mapService: mapService),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
          body:
             NotificationScreen(), 
        ),
      ),
    );
  }
}
