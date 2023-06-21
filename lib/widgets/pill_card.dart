import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
  State<PillCard> createState() => _PillCardState();
}

class _PillCardState extends State<PillCard> {
  _PillCardState();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed as void Function()?,
      child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.onPrimary,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 6),
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
                        width: 80,
                        height: 80,
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
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                          maxLines: 3,
                        ),
                        Text(widget.frequency,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                )),
                        Text(widget.notes,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.time.substring(0, 5),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  )),
                      Text(widget.time.substring(5),
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
