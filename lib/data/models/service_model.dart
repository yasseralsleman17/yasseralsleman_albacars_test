import '../../domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({required super.id, required super.title});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(id: json["id"], title: json["title"]);
  }


}
