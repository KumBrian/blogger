part of 'login_bloc.dart';

// Base class for all login events
abstract class LoginEvent {}

// Triggered when the user switches between login and sign-up tabs
class TabSwitched extends LoginEvent {
  final bool isLoginSelected;
  TabSwitched(this.isLoginSelected);
}

// Triggered when the login email input changes
class LoginEmailChanged extends LoginEvent {
  final String email;
  LoginEmailChanged(this.email);
}

// Triggered when the login password input changes
class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged(this.password);
}

// Triggered when the sign-up name input changes
class SignUpNameChanged extends LoginEvent {
  final String name;
  SignUpNameChanged(this.name);
}

// Triggered when the sign-up email input changes
class SignUpEmailChanged extends LoginEvent {
  final String email;
  SignUpEmailChanged(this.email);
}

// Triggered when the sign-up password input changes
class SignUpPasswordChanged extends LoginEvent {
  final String password;
  SignUpPasswordChanged(this.password);
}

// Triggered when the login form is submitted
class LoginSubmitted extends LoginEvent {}

// Triggered when the sign-up form is submitted
class SignUpSubmitted extends LoginEvent {}
