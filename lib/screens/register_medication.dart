// BottomSheet for adding a new medication

import 'package:flutter/material.dart';
import 'package:pillreminder/widgets/pill_card.dart';

Future<dynamic> showAddMedicationBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      enableDrag: true,
      showDragHandle: true,
      builder: (context) {
        return SizedBox(
          // height of the bottom sheet is height of screen minus 140
          height: MediaQuery.of(context).size.height - 140,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                // image from resource folder
                Image.asset(
                  'resources/medicina.png',
                  width: 150,
                  height: 150,
                ),
                // sized box for spacing
                const SizedBox(height: 36),
                Text(
                  'Add Medication',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 48),
                // search bar for medication name
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Search for medication',
                      hintText: 'Enter medication name',
                      prefixIcon: const Icon(Icons.search_rounded),
                    ),
                  ),
                ),
                // row bottom column with button to close modal and button to search. design of button with border radius of 12 and background color of primary color
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(150, 50)),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(150, 50)),
                      child: const Text('Search'),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
              ]),
            ),
          ),
        );
      });
}
