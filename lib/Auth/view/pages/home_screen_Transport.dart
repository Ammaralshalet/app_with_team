import 'package:app_with_team/Auth/bloc/map_bloc_bloc.dart';
import 'package:app_with_team/Auth/bloc/map_bloc_event.dart';
import 'package:app_with_team/Auth/bloc/map_bloc_state.dart';
import 'package:app_with_team/Auth/view/widget/Buttons.dart';
import 'package:app_with_team/Auth/view/widget/Card.dart';
import 'package:app_with_team/Auth/view/widget/Drawer.dart';
import 'package:app_with_team/Auth/view/widget/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomeScreenTransport extends StatefulWidget {
  const HomeScreenTransport({super.key});

  @override
  State<HomeScreenTransport> createState() => _HomeScreenTransportState();
}

class _HomeScreenTransportState extends State<HomeScreenTransport> {
  final TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Container(
              width: 34,
              height: 34,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(138, 212, 181, 1),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Icon(
                Icons.menu,
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications_none_sharp,
                    ))),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapInitial) {
            context.read<MapBloc>().add(GetLocationEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is MapLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MapLoaded) {
            final List<Marker> parkingMarkers = [
              const Marker(
                point: LatLng(33.5128, 36.2765),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const Marker(
                point: LatLng(33.5102, 36.2919),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const Marker(
                point: LatLng(33.5226, 36.2941),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const Marker(
                point: LatLng(33.4962, 36.2415),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ];

            return Stack(
              children: [
                MapWidget(
                  mapController: MapController(),
                  currentLocation: state.locationData,
                  markers: [...state.markers, ...parkingMarkers],
                ),
                Positioned(
                  bottom: 170.0,
                  right: 25.0,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      context.read<MapBloc>().add(GetLocationEvent());
                    },
                    child: const Icon(Icons.my_location),
                  ),
                ),
                Positioned(
                  bottom: 170.0,
                  left: 25.0,
                  right: 300.0,
                  child: MainButton(
                    textTheButton: "Rental",
                    onTap: () {},
                  ),
                ),
                const Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: MyCustomWidget(),
                ),
              ],
            );
          } else if (state is MapError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? Icons.favorite : Icons.favorite_border,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2
                  ? Icons.account_balance_wallet
                  : Icons.account_balance_wallet_outlined,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3
                  ? Icons.local_offer
                  : Icons.local_offer_outlined,
            ),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 4 ? Icons.person : Icons.person_outline,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(0, 137, 85, 1),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
      ),
    );
  }
}
