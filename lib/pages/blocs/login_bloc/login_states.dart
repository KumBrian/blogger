part of 'login_bloc.dart';

// Enum representing the status of a form submission
enum FormSubmissionStatus { idle, submitting, success, error }

// State class for the login and sign-up forms
class LoginState {
  // Indicates whether the login tab is selected (true) or the sign-up tab (false)
  final bool isLoginSelected;

  // Login form fields
  final String loginEmail;
  final String loginPassword;

  // Sign-up form fields
  final String signUpName;
  final String signUpEmail;
  final String signUpPassword;

  // Current status of the form submission
  final FormSubmissionStatus submissionStatus;

  // Constructor with default values
  LoginState({
    this.isLoginSelected = true,
    this.loginEmail = '',
    this.loginPassword = '',
    this.signUpName = '',
    this.signUpEmail = '',
    this.signUpPassword = '',
    this.submissionStatus = FormSubmissionStatus.idle,
  });

  // Creates a copy of the current state with updated values
  LoginState copyWith({
    bool? isLoginSelected,
    String? loginEmail,
    String? loginPassword,
    String? signUpName,
    String? signUpEmail,
    String? signUpPassword,
    FormSubmissionStatus? submissionStatus,
  }) {
    return LoginState(
      isLoginSelected: isLoginSelected ?? this.isLoginSelected,
      loginEmail: loginEmail ?? this.loginEmail,
      loginPassword: loginPassword ?? this.loginPassword,
      signUpName: signUpName ?? this.signUpName,
      signUpEmail: signUpEmail ?? this.signUpEmail,
      signUpPassword: signUpPassword ?? this.signUpPassword,
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }
}
