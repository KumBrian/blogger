import 'dart:async';
import 'package:bloc/bloc.dart';
part 'login_events.dart';
part 'login_states.dart';

// BLoC class to handle login and sign-up form logic
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // Register event handlers
    on<TabSwitched>(_onTabSwitched);
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<SignUpNameChanged>(_onSignUpNameChanged);
    on<SignUpEmailChanged>(_onSignUpEmailChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  // Handle switching between login and sign-up tabs
  void _onTabSwitched(TabSwitched event, Emitter<LoginState> emit) {
    emit(state.copyWith(isLoginSelected: event.isLoginSelected));
  }

  // Handle email input change in login form
  void _onLoginEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(loginEmail: event.email));
  }

  // Handle password input change in login form
  void _onLoginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(loginPassword: event.password));
  }

  // Handle name input change in sign-up form
  void _onSignUpNameChanged(SignUpNameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(signUpName: event.name));
  }

  // Handle email input change in sign-up form
  void _onSignUpEmailChanged(
    SignUpEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(signUpEmail: event.email));
  }

  // Handle password input change in sign-up form
  void _onSignUpPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(signUpPassword: event.password));
  }

  // Handle login form submission
  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    // Set submission status to submitting
    emit(state.copyWith(submissionStatus: FormSubmissionStatus.submitting));

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Set submission status to success
    emit(state.copyWith(submissionStatus: FormSubmissionStatus.success));

    // Brief delay before setting status back to idle
    await Future.delayed(Duration(milliseconds: 300));

    emit(state.copyWith(submissionStatus: FormSubmissionStatus.idle));
  }

  // Handle sign-up form submission
  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    // Set submission status to submitting
    emit(state.copyWith(submissionStatus: FormSubmissionStatus.submitting));

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Set submission status to success
    emit(state.copyWith(submissionStatus: FormSubmissionStatus.success));
  }
}
