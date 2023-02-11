import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/service_category.dart';

abstract class BaseServiceCategoryRepository {
  Future<Either<Failure, List<ServiceCategory>>> getServiceCategoryModel();
}
