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
            return Stack(
              children: [
                MapWidget(
                  mapController: MapController(),
                  currentLocation: state.locationData,
                  markers: state.markers,
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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
