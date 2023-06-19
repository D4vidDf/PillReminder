import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pillreminder/screens/confirmation_medication.dart';
import 'package:pillreminder/screens/register_medication.dart';
import 'package:pillreminder/widgets/date_selector.dart';
import 'package:pillreminder/widgets/pill_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: DateSelectorWidget()),
      body:
          CustomScrollView(physics: BouncingScrollPhysics(), slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: true,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.only(bottom: 60),
                    itemBuilder: ((context, index) {
                      return PillCard(
                          name: 'Paracetamol $index gm',
                          time: '8:00 AM',
                          frequency: 'Daily',
                          notes: 'Take with food',
                          onPressed: () =>
                              showConfirmMedicationBottomSheet(context));
                    })),
              ),
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            showAddMedicationBottomSheet(context);
          },
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(38))),
          child: const Icon(Icons.add_rounded)),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {},
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.medication_rounded),
            label: 'Medication',
          ),
        ],
      ),
    );
  }
}
