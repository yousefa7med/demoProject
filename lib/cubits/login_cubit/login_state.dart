part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccessed extends LoginState {}
final class LoginFailure extends LoginState {
  final String errMsg;

  LoginFailure({required this.errMsg});
}
