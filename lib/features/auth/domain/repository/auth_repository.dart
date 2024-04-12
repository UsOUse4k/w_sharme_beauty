
import 'package:w_sharme_beauty/features/auth/data/model/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String name, String id);
}
