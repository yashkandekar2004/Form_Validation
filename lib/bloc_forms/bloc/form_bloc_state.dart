import 'package:form_validation/bloc_forms/models/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:form_validation/utils/exports.dart';

class FormScreenState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem email;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;

  const FormScreenState(
      {this.name = const BlocFormItem(error: 'Enter Name'),
      this.email = const BlocFormItem(error: 'Enter Email'),
      this.phone = const BlocFormItem(error: 'Enter Phone'),
      this.formKey});

  FormScreenState copywith({
    BlocFormItem? name,
    BlocFormItem? email,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }) {
    return FormScreenState(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        formKey: formKey);
  }

  @override
  List<Object?> get props => [name, email, phone,formKey];
}
