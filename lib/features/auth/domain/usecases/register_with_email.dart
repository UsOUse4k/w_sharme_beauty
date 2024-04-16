import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/interfaces/usecase.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';

class RegisterWithEmailUCArgs {
  final String email;
  final String password;
  const RegisterWithEmailUCArgs({required this.email, required this.password});
}

@injectable
class RegisterWithEmailUC
    implements IUsecase<RegisterWithEmailUCArgs, Future<AuthFacedeResult>> {
  final IAuthFacede repository;

  RegisterWithEmailUC({required this.repository});

  @override
  Future<AuthFacedeResult> execute(RegisterWithEmailUCArgs args) async {
    return await repository.registerWithEmail(
      args.email,
      args.password,
    );
  }
}
