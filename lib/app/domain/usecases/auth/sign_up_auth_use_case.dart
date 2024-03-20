import 'package:budget_buddy/app/domain/entities/registered_user.dart';
import 'package:budget_buddy/app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/use_case/use_case.dart';

class SignUpAuthUseCase implements UseCase<User,RegisteredUser>{

  final AuthRepository authRepository;

  SignUpAuthUseCase(this.authRepository);

  @override
  Future<User> call({required RegisteredUser params}) {
    return authRepository.signUpWithEmail(params);
  }

}