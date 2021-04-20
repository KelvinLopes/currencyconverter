import 'package:currencyconverter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedCurrencyName;
  final TextEditingController controller;
  final void Function(CurrencyModel model) onChanged;

  const CurrencyBox(
      {Key key,
      this.items,
      this.controller,
      this.onChanged,
      this.selectedCurrencyName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              elevation: 0,
              isExpanded: true,
              value: selectedCurrencyName,
              iconEnabledColor: Colors.amber,
              dropdownColor: Color(0XFF333333),
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items
                  .map((currencyName) => DropdownMenuItem(
                      value: currencyName, child: Text(currencyName.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
