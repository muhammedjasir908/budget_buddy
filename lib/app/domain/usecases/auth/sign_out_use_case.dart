import 'package:budget_buddy/app/domain/repositories/auth_repository.dart';

import '../../../core/use_case/use_case.dart';

class SignOutAuthUseCase implements UseCase<void,String>{
  final AuthRepository authRepository;

  SignOutAuthUseCase(this.authRepository);

  @override
  Future<void> call({required String params}) {
    return authRepository.logout(userId: params);
  }
}