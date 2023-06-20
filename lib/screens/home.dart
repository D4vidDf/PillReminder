import 'package:flutter/material.dart';
import 'package:pillreminder/screens/confirmation_medication.dart';
import 'package:pillreminder/screens/medication_list_screen.dart';
import 'package:pillreminder/screens/register_medication.dart';
import 'package:pillreminder/widgets/date_selector.dart';
import 'package:pillreminder/widgets/pill_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // state variable for navigation bar
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(title: const DateSelectorWidget())
          : null,
      body: _selectedIndex == 0
          ? CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: 10,
                              padding: const EdgeInsets.only(bottom: 60),
                              itemBuilder: ((context, index) {
                                return PillCard(
                                    name: 'Paracetamol $index gm',
                                    time: '8:00 AM',
                                    frequency: 'Daily',
                                    notes: 'Take with food',
                                    onPressed: () =>
                                        showConfirmMedicationBottomSheet(
                                            context));
                              })),
                        ),
                      ],
                    ),
                  ),
                ])
          : MedicationListScreen(),
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
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
