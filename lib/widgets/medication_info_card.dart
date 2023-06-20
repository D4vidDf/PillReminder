// Statefull widget that displays the medication information in a card.

import 'package:flutter/material.dart';

class MedicationInfoCard extends StatefulWidget {
  MedicationInfoCard(
      {super.key,
      required this.name,
      required this.frequency,
      required this.notes,
      this.onPressed});

  final String name;
  final String frequency;
  final String notes;
  Function? onPressed;

  @override
  State<MedicationInfoCard> createState() =>
      _MedicationInfoCardState(name, frequency, notes);
}

class _MedicationInfoCardState extends State<MedicationInfoCard> {
  _MedicationInfoCardState(String name, String frequency, String notes);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed as void Function()?,
      child: Container(
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://picsum.photos/100',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                    Text(
                      widget.frequency,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      widget.notes,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
