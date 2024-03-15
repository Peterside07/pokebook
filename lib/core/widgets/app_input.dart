import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInput extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final String? suffixText;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final int? maxLength;
  final bool hideText;
  final List<TextInputFormatter>? inputFormatters;
  final bool isTextArea;
  final String? helperText;
  final String? errorText;

  const AppInput({
    super.key,
    this.controller,
    this.enabled = true,
    this.placeholder = '',
    this.textCapitalization = TextCapitalization.words,
    this.keyboardType = TextInputType.text,
    this.suffixText,
    this.suffixIcon,
    this.onChanged,
    this.maxLength,
    this.hideText = false,
    this.prefixIcon,
    this.prefix,
    this.inputFormatters,
    this.isTextArea = false,
    this.helperText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTextArea ? null : 64,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? const Color(0xffDE527F)
              : const Color(0xff39BADF),
          width: 5,
        ),
      ),
      child: TextField(
        enabled: enabled,
        textCapitalization: textCapitalization,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        maxLength: maxLength,
        obscureText: hideText,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: '$placeholder',
          counterText: '',
          helperText: helperText,
          //  labelText: placeholder,
          errorText: errorText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          hintStyle: const TextStyle(
            color: Color(0xff8D99AE),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          // filled: true,
          // fillColor: AppColors.INPUT_BG_COLOR,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
          suffixText: suffixText,
          suffixStyle: const TextStyle(color: Colors.red),
          suffixIcon: suffixIcon,

          prefixIcon: prefixIcon,
          prefix: prefix,
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          //     Get.isDarkMode ? AppColors.INPUT_BG_COLOR : AppColors.DARK_COLOR,
          fontWeight: FontWeight.w600,
        ),
        //  cursorColor: AppColors.PRIMARY_COLOR,
      ),
    );
  }
}
