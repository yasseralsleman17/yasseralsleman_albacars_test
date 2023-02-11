import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:yasseralsleman_albacars_fluttertest/domain/entities/service.dart';

import '../../domain/entities/service_category.dart';

class ServiceCategoryItem extends StatefulWidget {
  const ServiceCategoryItem({Key? key, required this.serviceCategory})
      : super(key: key);

  final ServiceCategory serviceCategory;

  @override
  State<ServiceCategoryItem> createState() => _ServiceCategoryItemState();
}

class _ServiceCategoryItemState extends State<ServiceCategoryItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              widget.serviceCategory.imUrl,
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            title: Text(widget.serviceCategory.title),
            subtitle: _expanded
                ? null
                : Text(
                    widget.serviceCategory.description,
                  ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height:
                  min(widget.serviceCategory.services.length * 50 + 10, 500),
              child: ListView(
                children: widget.serviceCategory.services
                    .map(
                      (service) => ServiceItem(service: service),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key, required this.service}) : super(key: key);
  final Service service;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/second');


      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(children: [
          Positioned(top: 5,
            child: Container(
              width: 40,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(5)),
              child: Text(
                service.id,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Container( height: 40,width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: Colors.black12),borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  service.title,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
