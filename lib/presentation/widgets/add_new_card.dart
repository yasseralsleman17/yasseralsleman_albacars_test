import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:yasseralsleman_albacars_fluttertest/presentation/widgets/bankcard.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/dummy.dart';
import '../controller/cubits/card_cubit.dart';
import 'card_row.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;

  OutlineInputBorder? border;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 10),
          child: Text("your cards:",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        const CardRow(),
        CreditCardWidget(
          glassmorphismConfig:
              useGlassMorphism ? Glassmorphism.defaultConfig() : null,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          frontCardBorder:
              !useGlassMorphism ? Border.all(color: Colors.grey) : null,
          backCardBorder:
              !useGlassMorphism ? Border.all(color: Colors.grey) : null,
          showBackView: isCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          cardBgColor: AppColors.cardBgColor,
          backgroundImage:
              useBackgroundImage ? 'assets/images/card_bg.png' : null,
          isSwipeGestureEnabled: true,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
          customCardTypeIcons: <CustomCardTypeIcon>[
            CustomCardTypeIcon(
              cardType: CardType.mastercard,
              cardImage: Image.asset(
                'assets/images/mastercard.png',
                height: 48,
                width: 48,
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CreditCardForm(
                  formKey: formKey,
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumber: cardNumber,
                  cvvCode: cvvCode,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  cardHolderName: cardHolderName,
                  expiryDate: expiryDate,
                  themeColor: Colors.blue,
                  textColor: Colors.grey,
                  cardNumberDecoration: InputDecoration(
                    labelText: 'Card number ',
                    hintText: 'XXXX XXXX XXXX XXXX',
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  expiryDateDecoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: border,
                    enabledBorder: border,
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: border,
                    enabledBorder: border,
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.grey),
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: border,
                    enabledBorder: border,
                    labelText: 'Cardholder’s name ',
                  ),
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: _onValidate,
                    child: const Text("Add Card",
                        style: TextStyle(fontSize: 17, color: Colors.white))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<CardCubit>(context).   addNew(
        BankCardModel(
            cardHolderName: cardHolderName,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cvvCode: cvvCode),
      );
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
