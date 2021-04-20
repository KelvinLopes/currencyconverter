class CurrencyModel {
  final String name;
  final double real;
  final double dollar;
  final double euro;
  final double bitcoin;

  CurrencyModel({this.name, this.real, this.dollar, this.euro, this.bitcoin});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
        name: 'Real',
        real: 1.0,
        dollar: 0.18,
        euro: 0.15,
        bitcoin: 0.000016,
      ),
      CurrencyModel(
        name: 'Dollar',
        real: 5.65,
        dollar: 1.0,
        euro: 0.85,
        bitcoin: 0.000008,
      ),
      CurrencyModel(
        name: 'Euro',
        real: 6.62,
        dollar: 1.17,
        euro: 1.0,
        bitcoin: 0.000010,
      ),
      CurrencyModel(
        name: 'Bitcoin',
        real: 64116.51,
        dollar: 11351.30,
        euro: 9689.54,
        bitcoin: 1,
      ),
    ];
  }
}
