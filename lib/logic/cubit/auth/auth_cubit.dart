// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_chat_app/data/repository/auth_repository.dart';
import 'package:real_chat_app/data/services/database_method.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<User?>? authStateSubscription;

  AuthCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState()) {
    _init();
  }

  //init method
  _init() {
    emit(const AuthState(status: AuthStatus.initialState));
    authStateSubscription =
        _authRepository.authStateChange.listen((user) async {
      if (user != null) {
        try {
          final userData = await DatabaseMethod().getUserData(user.uid);
          emit(
            state.copyWith(
              status: AuthStatus.authenticatedState,
              user: userData,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
                status: AuthStatus.errorState, errorMsg: e.toString()),
          );
        }
      } else {
        state.copyWith(status: AuthStatus.anauthenticatedState);
      }
    });
  }

  //sign in Method
  Future<void> login({required String email, required String password}) async {
    try {
      emit(state.copyWith(status: AuthStatus.loadingState));
      final user =
          await _authRepository.signIn(email: email, password: password);
      emit(state.copyWith(status: AuthStatus.authenticatedState, user: user));
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.errorState,
          errorMsg: e.toString(),
        ),
      );
    }
  }

  //sign up
  Future<void> signUp(
      {required String fullName,
      required String email,
      required String userName,
      required String phoneNumber,
      required String password}) async {
    try {
      emit(state.copyWith(status: AuthStatus.loadingState));

      final user = await _authRepository.signUp(
          fullName: fullName,
          userName: userName,
          email: email,
          phoneNumber: phoneNumber,
          password: password);

      emit(
        state.copyWith(status: AuthStatus.authenticatedState, user: user),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.errorState,
          errorMsg: e.toString(),
        ),
      );
    }
  }

  //signout
  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      emit(
        state.copyWith(status: AuthStatus.authenticatedState),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.errorState,
          errorMsg: e.toString(),
        ),
      );
    }
  }
}
