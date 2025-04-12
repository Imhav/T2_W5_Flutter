import 'package:flutter/material.dart';

import '../../model/ride/locations.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/ride_prefs_service.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';
import '../../utils/animations_util.dart';
import 'widgets/ride_pref_bar.dart';
import 'widgets/ride_pref_modal.dart';
import 'widgets/rides_tile.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  late RidePreference currentPreference;

  @override
  void initState() {
    super.initState();
    currentPreference =
        RidePrefService.instance.currentPreference ??
        RidePreference(
          departure: Location(name: "", country: Country.cambodia),
          arrival: Location(name: "", country: Country.cambodia),
          departureDate: DateTime.now(),
          requestedSeats: 1,
        );
  }

  List<Ride> get matchingRides =>
      RidesService.instance.repository.getRides(currentPreference, null);

  void onBackPressed() {
    Navigator.of(context).pop();
  }

  void onPreferencePressed() async {
    RidePreference? newPref = await Navigator.of(context).push<RidePreference>(
      AnimationUtils.createTopSheetRoute(
        RidePrefModal(currentPreference: currentPreference),
      ),
    );

    if (newPref != null) {
      RidePrefService.instance.setCurrentPreference(newPref);
      setState(() {
        currentPreference = newPref;
      });
    }
  }

  void onFilterPressed() {
    // TODO: Implement filter logic (e.g., pet filter) if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: BlaSpacings.m,
            right: BlaSpacings.m,
            top: BlaSpacings.s,
          ),
          child: Column(
            children: [
              RidePrefBar(
                ridePreference: currentPreference,
                onBackPressed: onBackPressed,
                onPreferencePressed: onPreferencePressed,
                onFilterPressed: onFilterPressed,
              ),
              ListView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                shrinkWrap: true, // Fit content within SingleChildScrollView
                itemCount: matchingRides.length,
                itemBuilder:
                    (ctx, index) =>
                        RideTile(ride: matchingRides[index], onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

