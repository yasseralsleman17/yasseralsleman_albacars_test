import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/bankcard.dart';
import 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit()
      : super(
          CardState(
            cards: [
              BankCardModel(
                  cardHolderName: 'Wafaa Safieh',
                  cardNumber: '4221 5168 7464 2283',
                  expiryDate: '08/20',
                  cvvCode: "123"),
            ],
          ),
        );

  void addNew(BankCardModel newCard) {
    emit(state.copyWith(newCard: newCard));
  }
}
