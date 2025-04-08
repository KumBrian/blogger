import 'package:blogs_app/components/custom_text_field.dart';
import 'package:blogs_app/components/image_button.dart';
import 'package:blogs_app/components/stretched_button.dart';
import 'package:blogs_app/pages/blocs/login_bloc/login_bloc.dart';
import 'package:blogs_app/utils/app_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Add other necessary imports

/// The LoginScreen handles both login and signup UI.
/// It uses BLoC to switch between tabs and manage form states.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      // Provide the LoginBloc to handle user interactions
      create: (context) => LoginBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            children: [
              // App logo at the top
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: size.width * 0.25,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(30),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.03),
                    child: Column(
                      children: [
                        // Tab bar to toggle between login and signup
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Login tab
                                TextButton(
                                  onPressed:
                                      state.submissionStatus ==
                                              FormSubmissionStatus.submitting
                                          ? null
                                          : () => context.read<LoginBloc>().add(
                                            TabSwitched(!state.isLoginSelected),
                                          ),
                                  child: Text(
                                    'LOGIN',
                                    style: AppFont.heavy.copyWith(
                                      color:
                                          state.isLoginSelected
                                              ? Colors.white
                                              : Colors.white.withAlpha(75),
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                // Signup tab
                                TextButton(
                                  onPressed:
                                      state.submissionStatus ==
                                              FormSubmissionStatus.submitting
                                          ? null
                                          : () => context.read<LoginBloc>().add(
                                            TabSwitched(!state.isLoginSelected),
                                          ),
                                  child: Text(
                                    'SIGN UP',
                                    style: AppFont.heavy.copyWith(
                                      color:
                                          !state.isLoginSelected
                                              ? Colors.white
                                              : Colors.white.withAlpha(75),
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: size.height * 0.03),
                        // Render the correct form based on selected tab
                        Expanded(
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withAlpha(30),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, -3),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: size.height * 0.05,
                                    right: size.height * 0.05,
                                  ),
                                  child: ListView(
                                    children:
                                        state.isLoginSelected
                                            ? _buildLoginForm(context, state)
                                            : _buildSignupForm(context, state),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the login form with email/password fields and social login buttons
  List<Widget> _buildLoginForm(BuildContext context, LoginState state) {
    final size = MediaQuery.of(context).size;
    return [
      Text(
        'Welcome Back!',
        style: AppFont.heavy.copyWith(fontSize: 32, color: AppColors.darkBlue),
      ),
      SizedBox(height: size.height * 0.02),
      Text(
        'Sign in to your account',
        style: AppFont.book.copyWith(
          fontSize: 18,
          color: AppColors.darkBlueText,
        ),
      ),
      SizedBox(height: size.height * 0.04),
      // Email input
      CustomTextField(
        label: 'Email',
        hint: 'Enter your email',
        value: state.loginEmail,
        onChanged:
            (value) => context.read<LoginBloc>().add(LoginEmailChanged(value)),
      ),
      SizedBox(height: size.height * 0.03),
      // Password input
      CustomTextField(
        label: 'Password',
        hint: 'Enter your password',
        isPassword: true,
        value: state.loginPassword,
        onChanged:
            (value) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(value)),
      ),
      SizedBox(height: size.height * 0.03),
      // Login button with loading state
      BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return StretchedButton(
            label: 'LOGIN',
            onPressed:
                state.submissionStatus == FormSubmissionStatus.submitting
                    ? null
                    : () => context.read<LoginBloc>().add(LoginSubmitted()),
            isLoading:
                state.submissionStatus == FormSubmissionStatus.submitting,
          );
        },
      ),
      SizedBox(height: size.height * 0.02),
      // Forgot password link
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Forgot your password? ',
              style: AppFont.book.copyWith(
                fontSize: 18,
                color: AppColors.darkBlueText,
              ),
            ),
            TextSpan(
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      // Handle password reset action
                    },
              text: 'Reset Here',
              style: AppFont.book.copyWith(fontSize: 18, color: AppColors.blue),
            ),
          ],
        ),
      ),
      SizedBox(height: size.height * 0.02),
      // Social login text
      Text(
        'OR SIGN IN WITH',
        textAlign: TextAlign.center,
        style: AppFont.book.copyWith(
          fontSize: 24,
          color: AppColors.darkBlueText.withAlpha(200),
        ),
      ),
      SizedBox(height: size.height * 0.02),
      // Social login buttons
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageButton(image: 'google', onTap: () {}),
          SizedBox(width: size.height * 0.03),
          ImageButton(image: 'facebook', onTap: () {}),
          SizedBox(width: size.height * 0.03),
          ImageButton(image: 'twitter', onTap: () {}),
        ],
      ),
    ];
  }

  /// Builds the signup form with name, email, and password fields
  List<Widget> _buildSignupForm(BuildContext context, LoginState state) {
    final size = MediaQuery.of(context).size;
    return [
      Text(
        'Create an Account',
        style: AppFont.heavy.copyWith(fontSize: 32, color: AppColors.darkBlue),
      ),
      SizedBox(height: size.height * 0.02),
      Text(
        'Sign up to get started',
        style: AppFont.book.copyWith(
          fontSize: 18,
          color: AppColors.darkBlueText,
        ),
      ),
      SizedBox(height: size.height * 0.03),
      // Name input
      CustomTextField(
        label: 'Full Name',
        hint: 'Enter your name',
        value: state.signUpName,
        onChanged:
            (value) => context.read<LoginBloc>().add(SignUpNameChanged(value)),
      ),
      SizedBox(height: size.height * 0.02),
      // Email input
      CustomTextField(
        label: 'Email',
        hint: 'Enter your email',
        value: state.signUpEmail,
        onChanged:
            (value) => context.read<LoginBloc>().add(SignUpEmailChanged(value)),
      ),
      SizedBox(height: size.height * 0.02),
      // Password input
      CustomTextField(
        label: 'Password',
        hint: 'Enter your password',
        isPassword: true,
        value: state.signUpPassword,
        onChanged:
            (value) =>
                context.read<LoginBloc>().add(SignUpPasswordChanged(value)),
      ),
      SizedBox(height: size.height * 0.02),
      // Signup button with loading state
      BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return StretchedButton(
            label: 'SIGN UP',
            onPressed:
                state.submissionStatus == FormSubmissionStatus.submitting
                    ? null
                    : () => context.read<LoginBloc>().add(SignUpSubmitted()),
            isLoading:
                state.submissionStatus == FormSubmissionStatus.submitting,
          );
        },
      ),
      SizedBox(height: size.height * 0.02),
      // Social signup text
      Text(
        'OR SIGN UP WITH',
        textAlign: TextAlign.center,
        style: AppFont.book.copyWith(
          fontSize: 24,
          color: AppColors.darkBlueText.withAlpha(200),
        ),
      ),
      SizedBox(height: size.height * 0.02),
      // Social signup buttons
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageButton(image: 'google', onTap: () {}),
          SizedBox(width: size.height * 0.03),
          ImageButton(image: 'facebook', onTap: () {}),
          SizedBox(width: size.height * 0.03),
          ImageButton(image: 'twitter', onTap: () {}),
        ],
      ),
    ];
  }
}
