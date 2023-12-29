
import 'package:form_validation/utils/exports.dart';
import 'package:flutter/services.dart';

class CustomeFormField extends StatelessWidget {
  const CustomeFormField({
    super.key,
    required this.hintText,
    required this.inputFormatters,
    required this.onChange,
    required this.validator
  });

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(hintText: hintText),
        onChanged: onChange,
      ),
    );
  }
}
