import 'package:t2_w5/exercise1/dummy_data/dummy_data.dart';
import 'package:t2_w5/exercise1/listener/ride_preferences_listener.dart';
import 'package:t2_w5/exercise1/model/ride_pref/ride_pref.dart';
import 'package:t2_w5/exercise1/repository/mock/mock_ride_preferences_repository.dart';
import 'package:t2_w5/exercise1/service/ride_prefs_service.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference newPreference) {
    print(" Preference changed to: $newPreference");
  }
}

void main() {
  // Initialize service
  RidePrefService.initialize(MockRidePreferencesRepository());
  var service = RidePrefService.instance;

  // Create logger
  var logger = ConsoleLogger();

  // Register logger
  service.addListener(logger);


  print(" Setting first preference...");
  service.setCurrentPreference(fakeRidePrefs[0]);
  print(" Setting second preference...");
  service.setCurrentPreference(fakeRidePrefs[1]);
}