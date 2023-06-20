// Screen for displaying medication information with a top app bar with a button to edit the medication information and a button to close screen. Also display graph of medication history.

import 'package:flutter/material.dart';
import 'package:pillreminder/widgets/medication_chart.dart';

import '../widgets/medication_info_card.dart';

class MedicationInfoScreen extends StatefulWidget {
  const MedicationInfoScreen(
      {super.key,
      required this.name,
      required this.frequency,
      required this.notes});

  final String name;
  final String frequency;
  final String notes;

  @override
  State<MedicationInfoScreen> createState() =>
      _MedicationInfoScreenState(name, frequency, notes);
}

class _MedicationInfoScreenState extends State<MedicationInfoScreen> {
  _MedicationInfoScreenState(String name, String frequency, String notes);
  @override
  Widget build(BuildContext context) {
    // screen using slivers for displaying medication information with a top app bar with a button to edit the medication information and a button to close screen. Also display graph of medication history.

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: Text(widget.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                tooltip: 'Edit Medication',
                onPressed: () {
                  // open edit medication screen
                },
              ),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                // medication image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://picsum.photos/100',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      )),
                ),

                // box for displaying medication description
                Container(
                  margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // info icon
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.info_outline_rounded,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                width: 320,
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl aliquet nisl, eget aliquam ultricies, nisl nisl aliquet nisl',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // box for displaying medication frequency
                Container(
                  margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // info icon
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.access_time_rounded,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                width: 320,
                                child: Text(
                                  'Frequency: ${widget.frequency}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // box for displaying graph of medication history
                Container(
                  margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: MedicationChart(
                    barBackgroundColor: Theme.of(context).colorScheme.surface,
                    barColor: Theme.of(context).colorScheme.primary,
                    touchedBarColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
