import 'package:blogger/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// Custom text field widget with optional password visibility
class CustomTextField extends StatefulWidget {
  final String label; // Label for the field
  final String hint; // Hint text inside the field
  final bool isPassword; // Determines if this is a password field
  final String value; // Current value of the field
  final ValueChanged<String> onChanged; // Callback when text changes

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText; // Controls password visibility
  late TextEditingController _controller; // Controller for managing text

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword; // Initially obscure if it's a password
    _controller = TextEditingController(text: widget.value); // Set initial text
    _controller.addListener(_handleTextChanged); // Listen for changes
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If external value changes, update the controller
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  // Notify parent about text changes
  void _handleTextChanged() {
    widget.onChanged(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText:
          widget.isPassword ? _obscureText : false, // Obscure if password
      keyboardType:
          widget.label == 'Email'
              ? TextInputType.emailAddress
              : TextInputType.text, // Choose keyboard type based on label
      style: AppFont.medium.copyWith(color: AppColors.darkBlue, fontSize: 20),
      onTapOutside:
          (event) => FocusScope.of(context).unfocus(), // Unfocus on tap outside
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 2),
        hintText: widget.hint,
        label: Text(widget.label),
        // Toggle icon for password visibility
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? HugeIcons.strokeRoundedEye
                        : Icons.visibility_off,
                    color: AppColors.darkBlue,
                  ),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                )
                : null,
        labelStyle: AppFont.medium.copyWith(color: AppColors.darkBlue),
        floatingLabelStyle: AppFont.medium.copyWith(
          color: AppColors.blue,
          fontSize: 20,
        ),
        hintStyle: AppFont.medium.copyWith(
          color: AppColors.darkBlueText.withAlpha(150),
        ),
        // Border styles for different states
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkBlueText,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blue,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkBlueText,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
    );
  }
}
