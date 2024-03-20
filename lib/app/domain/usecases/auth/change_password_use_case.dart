import 'package:budget_buddy/app/domain/repositories/auth_repository.dart';

import '../../../core/use_case/use_case.dart';
import '../../entities/registered_user.dart';

class ChangePasswordAuthUseCase implements UseCase<void,RegisteredUser>{
  final AuthRepository authRepository;

  ChangePasswordAuthUseCase(this.authRepository);

  @override
  Future<void> call({required RegisteredUser params}) {
    return authRepository.changePassword(params);
  }
}