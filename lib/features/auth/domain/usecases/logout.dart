import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/interfaces/usecase.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facede.dart';

@injectable
class LogoutUC implements IUsecase<void, Future<AuthFacedeResult>> {
  final IAuthFacede repository;

  LogoutUC({required this.repository});

  @override
  Future<AuthFacedeResult> execute(void args) async {
    return await repository.logout();
  }
}
