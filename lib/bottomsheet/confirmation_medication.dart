import 'package:flutter/material.dart';

Future<dynamic> showConfirmMedicationBottomSheet(BuildContext context) {
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // fecha medicamento
                    Text(
                      'Monday 12, 2021',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    // sized box for spacing
                    const SizedBox(height: 24),
                    // time to take
                    Text(
                      '8:00 AM',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                    ),
                    // sized box for spacing
                    const SizedBox(height: 120),
                    // image from resource folder
                    Image.asset(
                      'resources/medicina.png',
                      width: 120,
                      height: 120,
                    ),
                    // sized box for spacing
                    const SizedBox(height: 36),
                    Text(
                      'Paracetamol',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    // medication dosis
                    const SizedBox(height: 12),
                    Text(
                      '500mg',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    // row of buttons at the bottom of the modal with a button to cancel and a button to confirm the button is bigger and has a border radius of 12 and the background color is the primary color
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        FilledButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Taken'),
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
