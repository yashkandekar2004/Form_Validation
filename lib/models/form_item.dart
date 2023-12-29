import 'package:form_validation/utils/exports.dart';

class FormItem {
  const FormItem({
    this.hintText = '',
    this.errorMessage,
    this.formatters=const [],
  });
  final String hintText;
  final String? errorMessage;
  final List<TextInputFormatter> formatters;
}
