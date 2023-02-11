import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/usecase/base_usecase.dart';
import '../../core/utils/enums.dart';
import '../../domain/use_cases/get_service_category.dart';
import 'service_category_event.dart';
import 'service_category_state.dart';


class ServiceCategoryBloc extends Bloc<ServiceCategoryEvent, ServiceCategoryState> {
  final GetServiceCategoryUseCase getServiceCategoryUseCase;

  ServiceCategoryBloc(
    this.getServiceCategoryUseCase,

  ) : super(const ServiceCategoryState()) {
    on<GetServiceCategoryEvent>(_getServiceCategory);


  }

  FutureOr<void> _getServiceCategory(
      GetServiceCategoryEvent event, Emitter<ServiceCategoryState> emit) async {
    final result = await getServiceCategoryUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        serviceCategoryState: RequestState.error,
        serviceCategoryMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          serviceCategory: r,
          serviceCategoryState: RequestState.loaded,
        ),
      ),
    );
  }


}
