import 'package:currencyconverter/app/components/currency_box.dart';
import 'package:currencyconverter/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  Homecontroller homecontroller;

  @override
  void initState() {
    super.initState();
    homecontroller = Homecontroller(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 100, bottom: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(height: 50),
                  CurrencyBox(
                    selectedCurrencyName: homecontroller.toCurrency,
                    controller: toText,
                    items: homecontroller.currencies,
                    onChanged: (model) {
                      setState(() {
                        homecontroller.toCurrency = model;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  CurrencyBox(
                    selectedCurrencyName: homecontroller.fromCurrency,
                    controller: fromText,
                    items: homecontroller.currencies,
                    onChanged: (model) {
                      setState(() {
                        homecontroller.fromCurrency = model;
                      });
                    },
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      homecontroller.converter();
                    },
                    child: Text('CONVERTER'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
