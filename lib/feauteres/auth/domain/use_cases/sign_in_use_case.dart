import '../entities/entities.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  AuthRepository authRepository;
  SignInUseCase(this.authRepository);
  Future<User> call({required String username, required String password}) {
    return authRepository.signIn(username: username, password: password);
  }
}
