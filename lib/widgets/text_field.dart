import 'package:flutter/material.dart';
import 'package:rti/config/theme.dart';

class MTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final String? Function(String?)? validator;
  final bool isValidate;
  final Function? onSaved;
  final void Function()? onTap;
  final bool obscureText;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showLabel;
  final String? validationMsg;

  const MTextField({
    super.key,
    this.label,
    required this.hintText,
    this.controller,
    this.readOnly = false,
    this.validator,
    this.isValidate = true,
    this.onSaved,
    this.onTap,
    this.obscureText = false,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.showLabel = false,
    this.validationMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLabel)
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 3),
              child: Text(label ?? hintText,
                  style:
                      const TextStyle(fontSize: 12, color: AppColors.darkGray)),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 0.5),
            ),
            child: TextFormField(
              controller: controller,
              readOnly: readOnly,
              style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
              decoration: InputDecoration(
                hintText: hintText,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
                fillColor: Colors.grey[200],
                prefixIcon: prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: prefixIcon)
                    : null,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 10, minHeight: 10),
                suffixIcon: suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: suffixIcon)
                    : null,
                suffixIconConstraints:
                    const BoxConstraints(minWidth: 10, minHeight: 10),
              ),
              obscureText: obscureText,
              validator: (value) {
                if (validator != null) {
                  return validator!(value);
                } else if (value!.isEmpty && isValidate) {
                  return validationMsg ?? 'Please enter $hintText';
                }
                return null;
              },
              onTap: onTap,
              keyboardType: inputType,
            ),
          ),
        ],
      ),
    );
  }
}
