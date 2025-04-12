// screen/color_tap_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/color_counters.dart';

class TapsScreen extends StatelessWidget {
  const TapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 30,
              ),
              textStyle: const TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed:
                () =>
                    Provider.of<ColorCounters>(
                      context,
                      listen: false,
                    ).incrementRed(),
            child: Consumer<ColorCounters>(
              builder:
                  (context, colorCounters, child) =>
                      Text('Taps: ${colorCounters.redCount}'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 30,
              ),
              textStyle: const TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed:
                () =>
                    Provider.of<ColorCounters>(
                      context,
                      listen: false,
                    ).incrementBlue(),
            child: Consumer<ColorCounters>(
              builder:
                  (context, colorCounters, child) =>
                      Text('Taps: ${colorCounters.blueCount}'),
            ),
          ),
        ],
      ),
    );
  }
}
