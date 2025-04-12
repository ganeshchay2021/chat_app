// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:real_chat_app/data/model/user_model.dart';

enum AuthStatus {
  initialState,
  loadingState,
  authenticatedState,
  anauthenticatedState,
  errorState,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final UserModel? user;
  final String? errorMsg;

  const AuthState({
    this.status = AuthStatus.initialState,
    this.user,
    this.errorMsg,
  });

   AuthState copyWith({
    AuthStatus? status,
    UserModel? user,
    String? errorMsg,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
 

  @override
  List<Object?> get props => [status, user, errorMsg];
}
