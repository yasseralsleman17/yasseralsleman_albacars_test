import 'package:equatable/equatable.dart';

abstract class ServiceCategoryEvent extends Equatable {
  const ServiceCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetServiceCategoryEvent extends ServiceCategoryEvent {}


