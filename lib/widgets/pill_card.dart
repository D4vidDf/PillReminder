import 'package:flutter/material.dart';

class PillCard extends StatefulWidget {
  PillCard(
      {super.key,
      required this.name,
      required this.time,
      required this.frequency,
      required this.notes,
      this.onPressed});

  final String name;
  final String time;
  final String frequency;
  final String notes;
  Function? onPressed;

  @override
  State<PillCard> createState() => _PillCardState(name, time, frequency, notes);
}

class _PillCardState extends State<PillCard> {
  _PillCardState(String name, String time, String frequency, String notes);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed as void Function()?,
      child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          width: double.infinity,
          height: 110,
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
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://picsum.photos/100',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, bottom: 16, left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          widget.frequency,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          widget.notes,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.time.substring(0, 5),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        widget.time.substring(5),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
