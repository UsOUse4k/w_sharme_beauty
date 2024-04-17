import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/auth/data/repositories/firebase_auth_facede.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthFacede _authFacede;
  AuthBloc(this._authFacede) : super(const _Initial()) {
    on<AuthEvent>((event, emit) {
      event.when(
        started: () => emit(const AuthState.initial()),
        register: (email, password) => _handleRegister(email, password, emit),
        login: (email, password) => _handleLogin(email, password, emit),
        logout: () => _handleLogout(emit),
        resetPassword: (email) => _handleResetPassword(email, emit),
        saveData: (data) => _handleSaveData(data, emit),
      );
    });
  }
  void _handleRegister(String email, String password, Emitter<AuthState> emit) {
    emit(const AuthState.loading());
    try {
      var data = _authFacede.registerWithEmail(email, password);
      print('data>>> $data');
    } catch (e) {
      emit(AuthState.error(e.toString()));
      print(e);
    }
  }

  void _handleLogin(String email, String password, Emitter<AuthState> emit) {

  }
  void _handleLogout(Emitter<AuthState> emit) {}
  void _handleResetPassword(String email, Emitter<AuthState> emit) {}
  void _handleSaveData(String data, Emitter<AuthState> emit) {}
}
