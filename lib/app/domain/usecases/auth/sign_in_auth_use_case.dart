import 'package:budget_buddy/app/domain/entities/registered_user.dart';
import 'package:budget_buddy/app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInAuthUseCase{
  final AuthRepository authRepository;

  SignInAuthUseCase(this.authRepository);

  Future<User> call({required RegisteredUser params}) async {
    return authRepository.singInWithEmail(params);
  }
}