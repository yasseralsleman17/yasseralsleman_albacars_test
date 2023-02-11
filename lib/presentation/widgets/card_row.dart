import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/dummy.dart';
import '../controller/cubits/card_cubit.dart';
import '../controller/cubits/card_state.dart';
import 'bankcard.dart';

class CardRow extends StatefulWidget {
  const CardRow({Key? key}) : super(key: key);

  @override
  State<CardRow> createState() => _CardRowState();
}

class _CardRowState extends State<CardRow> {
  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardCubit, CardState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.cards.length,
            itemBuilder: (BuildContext context, int index) {
              return _getBankCard(state.cards[index],  index);
            },
          ),
        );
      },
    );
  }

  Widget _getBankCard(BankCardModel card,int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = index;
        });
      },
      child: Stack(children: [
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 0,
              top: 8.0,
              right: 16,
            ),
            child: BankCard(card: card),
          ),
        ),
        if (selectedCard == index)
          Positioned(
              right: 6,
              top: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.red,
                  size: 25,
                ),
              )),
      ]),
    );
  }
}

