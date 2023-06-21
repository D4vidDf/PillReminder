import 'package:flutter/material.dart';

class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({super.key});

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  // selectedDate is the date that is currently selected, by default it is today formatted as dd/mm/yyyy
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              selectedDate = dayBeforeSelectedDate();
            });
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            // Show scrollable day selector
            showDatePicker(
              context: context,
              initialDate: DateTime(
                  selectedDate.year, selectedDate.month, selectedDate.day),
              firstDate: DateTime(2021),
              lastDate: DateTime(3000),
            ).then((value) {
              setState(() {
                selectedDate = value?.toLocal() ?? selectedDate;
              });
            });
          },
          child: SizedBox(
            width: 150,
            child: Text(
              showTodayIfTodayElseShowSelectedDay(selectedDate),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              setState(() {
                selectedDate = dayBeforeSelectedDate();
              });
            } else if (details.primaryVelocity! < 0) {
              setState(() {
                selectedDate = dayAfterSelectedDate();
              });
            }
          },
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {
            setState(() {
              selectedDate = dayAfterSelectedDate();
            });
          },
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }

  showTodayIfTodayElseShowSelectedDay(DateTime selectedDate) {
    if (selectedDate.day == DateTime.now().day &&
        selectedDate.month == DateTime.now().month &&
        selectedDate.year == DateTime.now().year) {
      return 'Today';
    } else {
      // Format date as dd/mm/yyyy
      return '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
    }
  }

  DateTime dayBeforeSelectedDate() {
    // Subtract 1 day from selectedDate
    return selectedDate.subtract(const Duration(days: 1));
  }

  DateTime dayAfterSelectedDate() {
    // Add 1 day to selectedDate
    return selectedDate.add(const Duration(days: 1));
  }
}
