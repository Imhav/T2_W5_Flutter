// screen/statistics_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/color_counters.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<ColorCounters>(
        builder:
            (context, colorCounters, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Red Taps: ${colorCounters.redCount}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  'Blue Taps: ${colorCounters.blueCount}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
      ),
    );
  }
}
