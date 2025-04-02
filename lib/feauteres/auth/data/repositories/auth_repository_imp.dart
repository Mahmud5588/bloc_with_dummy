import '../../domain/entities/entities.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> signIn({required String username, required String password}) {
    return remoteDataSource.signIn(username: username, password: password);
  }
}
