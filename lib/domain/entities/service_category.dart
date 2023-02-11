
import 'service.dart';

class ServiceCategory  {
  final String id;
  final String title;
  final String description;
  final String imUrl;
  final List<Service> services;

  ServiceCategory (
      {required this.id,
      required this.title,
      required this.description,
      required this.imUrl,
      required this.services});

 }
