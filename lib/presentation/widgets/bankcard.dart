import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final BankCardModel card;

  const BankCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 252.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _isCardDateValid(card.expiryDate)
                          ? const Text(
                              'Expiry',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal),
                            )
                          : const Text(
                              'Expires soon',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal),
                            ),
                      if (_isCardDateValid(card.expiryDate))
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            card.expiryDate,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    card.cardNumber,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                    card.cardHolderName,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.grey,

                      // : const Color(0xFF253C70),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

bool _isCardDateValid(String myCardDate) {
  final DateTime now = DateTime.now();
  final List<String> date = myCardDate.split(RegExp(r'/'));
  final int month = int.parse(date.first);
  final int year = int.parse('20${date.last}');
  final int lastDayOfMonth = month < 12
      ? DateTime(year, month + 1, 0).day
      : DateTime(year + 1, 1, 0).day;
  final DateTime cardDate =
      DateTime(year, month, lastDayOfMonth, 23, 59, 59, 999);

  if (cardDate.isBefore(now) || month > 12 || month == 0) {
    return false;
  } else {
    return true;
  }
}

class BankCardModel {
  final String cvvCode;

  final String cardHolderName;
  final String expiryDate;
  final String cardNumber;

  BankCardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvvCode,
  });
}
