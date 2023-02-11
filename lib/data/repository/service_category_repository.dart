


import 'package:dartz/dartz.dart';
import 'package:yasseralsleman_albacars_fluttertest/domain/entities/service_category.dart';

import '../../core/error/failure.dart';
import '../../domain/repository/base_service_category_repository.dart';
import '../datasource/remote_datasource.dart';

class ServiceCategoryRepository implements BaseServiceCategoryRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  ServiceCategoryRepository(this.baseRemoteDataSource, );

  @override
  Future<Either<Failure, List<ServiceCategory>>> getServiceCategoryModel() async {
      return (await baseRemoteDataSource.getServiceCategoryModelList( ));

  }



}
