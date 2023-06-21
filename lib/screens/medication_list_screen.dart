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
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            title: Text('Medication List',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ),
          SliverList.builder(
              itemCount: 10,
              itemBuilder: ((context, index) {
                return index < 9
                    ? MedicationInfoCard(
                        name: 'Medication $index',
                        frequency: 'Daily',
                        notes: 'Take with food',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MedicationInfoScreen(
                                      name: 'Medication $index',
                                      frequency: 'Daily',
                                      notes: 'Take with food')));
                        })
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: MedicationInfoCard(
                            name: 'Medication $index',
                            frequency: 'Daily',
                            notes: 'Take with food',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MedicationInfoScreen(
                                              name: 'Medication $index',
                                              frequency: 'Daily',
                                              notes: 'Take with food')));
                            }));
              }))
        ]);
  }
}
