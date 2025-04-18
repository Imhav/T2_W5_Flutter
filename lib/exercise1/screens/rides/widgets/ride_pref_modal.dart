import 'package:flutter/material.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../service/ride_prefs_service.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/bla_icon_button.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';

class RidePrefModal extends StatefulWidget {
  RidePreference? currentPreference; // Make optional to handle null
  RidePrefModal({super.key, required this.currentPreference});

  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  void onBackSelected() {
    Navigator.of(context).pop(); // Close modal without changes
  }

  void onSubmit(RidePreference newPreference) {
    // TODO 9: Pop the modal with the new current preference
    Navigator.of(context).pop(newPreference); // Return the new preference
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back icon
            BlaIconButton(onPressed: onBackSelected, icon: Icons.close),
            SizedBox(height: BlaSpacings.m),

            // Title
            Text(
              "Edit your search",
              style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal),
            ),

            // Form
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RidePrefForm(
                  initialPreference:
                      RidePrefService
                          .instance
                          .currentPreference, 
                  onSubmit: onSubmit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

