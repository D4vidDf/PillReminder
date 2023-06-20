// Screen for displaying the list of medications on medication infor card

import 'package:flutter/material.dart';

import 'package:pillreminder/widgets/medication_info_card.dart';

import 'medication_info_screen.dart';

class MedicationListScreen extends StatefulWidget {
  const MedicationListScreen({super.key});

  @override
  State<MedicationListScreen> createState() => _MedicationListScreenState();
}

class _MedicationListScreenState extends State<MedicationListScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 6,
                      padding: const EdgeInsets.only(bottom: 60, top: 50),
                      itemBuilder: ((context, index) {
                        return MedicationInfoCard(
                            name: 'Medication $index',
                            frequency: 'Daily',
                            notes: 'Take with food',
                            onPressed: () => {
                                  // open medication info screen
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MedicationInfoScreen(
                                                name: 'Medication $index',
                                                frequency: 'Daily',
                                                notes: 'Take with food',
                                              )))
                                });
                      })),
                ),
              ],
            ),
          ),
        ]);
  }
}
