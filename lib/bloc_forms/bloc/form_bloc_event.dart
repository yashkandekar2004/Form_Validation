import 'package:equatable/equatable.dart';
import 'package:form_validation/bloc_forms/models/bloc_form_item.dart';

abstract class FormScreenEvent extends Equatable {
  const FormScreenEvent();
  @override
  List<Object?> get props => [];
}

class InitEvent extends FormScreenEvent {
  const InitEvent();
}

class NameChangeevent extends FormScreenEvent {
  const NameChangeevent({required this.name});
  final BlocFormItem name;
  

  @override
  List<Object?> get props => [name];
}

class EmailChangeEvent extends FormScreenEvent {
  const EmailChangeEvent({required this.email});
  final BlocFormItem email;
  @override
  List<Object?> get props => [email];
}

class PhoneChangeEvent extends FormScreenEvent {
  const PhoneChangeEvent({required this.phone});
  final BlocFormItem phone;
  List<Object?> get props => [phone];
}

class FormSubmitEvent extends FormScreenEvent {
  const FormSubmitEvent();
}

class FormResetEvent extends FormScreenEvent {
  const FormResetEvent();
}
