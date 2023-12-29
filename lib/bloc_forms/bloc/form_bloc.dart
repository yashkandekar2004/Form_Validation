import 'package:form_validation/utils/exports.dart';

class FormBloc extends Bloc<FormScreenEvent, FormScreenState> {
  FormBloc() : super(const FormScreenState()) {
    on<InitEvent>(_initFormState);
    on<NameChangeevent>(_onNameChange);
    on<EmailChangeEvent>(_onEmailChange);
    on<PhoneChangeEvent>(_onPhoneChange);
    on<FormSubmitEvent>(_onFormSubmitted);
    on<FormResetEvent>(_onFormReset);
  }
  final _formKey = GlobalKey<FormState>();
  Future<void> _initFormState(
      InitEvent event, Emitter<FormScreenState> emit) async {
    emit(state.copywith(formKey: _formKey));
  }

  Future<void> _onNameChange(
    NameChangeevent event,
    Emitter<FormScreenState> emit,
  ) async {
    emit(state.copywith(
        formKey: _formKey,
        name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isValidName ? null : 'Enter Name')));
  }

  Future<void> _onEmailChange(
    EmailChangeEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    emit(state.copywith(
        formKey: _formKey,
        email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isValidEmail ? null : 'Enter Email')));
  }

  Future<void> _onPhoneChange(
    PhoneChangeEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    emit(state.copywith(
        formKey: _formKey,
        email: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isValidPhone ? null : 'Enter Phone')));
  }

  Future<void> _onFormSubmitted(
    FormSubmitEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    if (state.formKey!.currentState!.validate()) {
      return goHome();
    }
  }

  Future<void> _onFormReset(
    FormResetEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    state.formKey?.currentState!.reset();
  }
}
