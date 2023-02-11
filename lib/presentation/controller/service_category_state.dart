import 'package:equatable/equatable.dart';

import '../../core/utils/enums.dart';
import '../../domain/entities/service_category.dart';

class ServiceCategoryState extends Equatable {
  final List<ServiceCategory> serviceCategory;
  final RequestState serviceCategoryState;
  final String serviceCategoryMessage;

  const ServiceCategoryState({
    this.serviceCategory = const [],
    this.serviceCategoryState = RequestState.loading,
    this.serviceCategoryMessage = '',
  });

  ServiceCategoryState copyWith({
    List<ServiceCategory>? serviceCategory,
    RequestState? serviceCategoryState,
    String? serviceCategoryMessage,
  }) {
    return ServiceCategoryState(
      serviceCategory: serviceCategory ?? this.serviceCategory,
      serviceCategoryState: serviceCategoryState ?? this.serviceCategoryState,
      serviceCategoryMessage:
          serviceCategoryMessage ?? this.serviceCategoryMessage,
    );
  }

  @override
  List<Object?> get props => [
        serviceCategory,
        serviceCategoryState,
        serviceCategoryMessage,
      ];
}
