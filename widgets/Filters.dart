import 'package:flutter/material.dart';
import "package:intl/intl.dart";

final formatter = DateFormat.yMd();

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends State<Filters> {
  // all final filters values are below :
  final _searchController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedState;

  //dropDown items list:
  List<String> _dropDownItems = [
    'Tous',
    'Disponibles',
    'Occupées',
    'Maintenance'
  ];

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            maxLength: 30,
            decoration: const InputDecoration(
              label: Text('Recherches par nom'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      label: Text('Budget'), prefixText: "TND "),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select a date"
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton<String>(
                hint: Text('Etat'),
                value: _selectedState,
                onChanged: (String? value) {
                  if (value == null) {
                    return;
                  }
                  setState(
                    () {
                      _selectedState = value;
                    },
                  );
                },
                items: _dropDownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_searchController.text);
                    print(_amountController.text);
                    print(_selectedState);
                    print(_selectedDate);
                    Navigator.pop(context);
                  },
                  child: Text('search'))
            ],
          )
        ],
      ),
    );
  }
}
