
import '../../widgets/bankcard.dart';

class CardState {
  List<BankCardModel> cards;


  CardState({required this.cards });

  CardState copyWith({
    required BankCardModel newCard
  }) {
    cards.add(newCard);
    return CardState(
       cards: cards
    );
  }
}
