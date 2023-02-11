import 'package:dartz/dartz.dart';
import 'package:yasseralsleman_albacars_fluttertest/domain/entities/service.dart';

import '../../core/error/failure.dart';
import '../../core/utils/dummy.dart';
import '../../domain/entities/service_category.dart';
import '../models/service_category_model.dart';

abstract class BaseRemoteDataSource {
  Future<Either<Failure, List<ServiceCategory>>> getServiceCategoryModelList();
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<Either<Failure, List<ServiceCategory>>> getServiceCategoryModelList() async {
    int x = 6;
    List<ServiceCategoryModel> serviceCategoryModel =
    servicesCategory['results']!.map((json) => getServiceCategoryModel(json)).toList() ;

    if(x>5) {
      return Right(serviceCategoryModel);
    } else {
      return const Left(ServerFailure(message: "error server side"));
    }

  }

  ServiceCategoryModel getServiceCategoryModel(Map<String, dynamic> servicesCategory) {

      return ServiceCategoryModel.fromJson(servicesCategory);

  }
}
