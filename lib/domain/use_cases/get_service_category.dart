
import 'package:dartz/dartz.dart';

import 'package:yasseralsleman_albacars_fluttertest/core/error/failure.dart';

import '../../core/usecase/base_usecase.dart';
import '../entities/service_category.dart';
import '../repository/base_service_category_repository.dart';

class GetServiceCategoryUseCase   extends BaseUseCase<List<ServiceCategory>, NoParameters>{
  final BaseServiceCategoryRepository repository;

  GetServiceCategoryUseCase(this.repository);



  @override
  Future<Either<Failure, List<ServiceCategory>>> call(NoParameters parameters) async {
    return await repository.getServiceCategoryModel() ;

  }
}
