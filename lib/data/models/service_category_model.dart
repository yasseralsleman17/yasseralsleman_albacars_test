import 'dart:developer';

import 'package:yasseralsleman_albacars_fluttertest/domain/entities/service_category.dart';

import 'service_model.dart';

class ServiceCategoryModel extends ServiceCategory {


  ServiceCategoryModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imUrl,
    required super.services,
  });

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    return ServiceCategoryModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      imUrl: json["imUrl"],
      services: List<ServiceModel>.from(
        json["services"].map(
          (servicesJson) => ServiceModel.fromJson(servicesJson),
        ),
      ),
    );
  }
}
