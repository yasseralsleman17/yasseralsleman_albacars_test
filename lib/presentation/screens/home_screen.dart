import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../../services/services_locator.dart';
import '../controller/service_category_bloc.dart';
import '../controller/service_category_event.dart';
import '../controller/service_category_state.dart';
import '../widgets/srevice_category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<ServiceCategoryBloc>()..add(GetServiceCategoryEvent()),
      child: BlocBuilder<ServiceCategoryBloc, ServiceCategoryState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor:  color,centerTitle: true,automaticallyImplyLeading: false,
              title:  Text(
               title ,
              ),
            ),
            body: ListView.builder(
                itemBuilder: (context, index) => ServiceCategoryItem(
                      serviceCategory: state.serviceCategory[index],
                    ),
                itemCount: state.serviceCategory.length),
          );
        },
      ),
    );
  }
}
