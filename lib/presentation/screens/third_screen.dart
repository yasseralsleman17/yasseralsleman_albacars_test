import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yasseralsleman_albacars_fluttertest/presentation/controller/cubits/card_cubit.dart';

import '../../core/utils/dummy.dart';
import '../widgets/add_new_card.dart';
import '../widgets/bankcard.dart';
import '../widgets/card_row.dart';

class ThirdScreen extends StatelessWidget {
  ThirdScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(title),
      ),
      body: BlocProvider<CardCubit>(
        create: (context) => CardCubit(),
        child: const AddNewCard(),
      ),
    );
  }
}
