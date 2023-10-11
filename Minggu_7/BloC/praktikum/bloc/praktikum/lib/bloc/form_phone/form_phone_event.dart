part of 'form_phone_bloc.dart';

sealed class FormPhoneEvent extends Equatable {
  const FormPhoneEvent();
}

class FormInputPhoneEvent extends FormPhoneEvent {
  final String? value;

  FormInputPhoneEvent({required this.value});

  @override
  // TODO: implement props
  List<Object?> get props =>[value ?? ""];
}

class ResetPhoneValue extends FormPhoneEvent {
  @override
  List<Object> get props => [];
}

class UpdatePhoneValue extends FormPhoneEvent {
  final String selectedPhone;

  const UpdatePhoneValue({required this.selectedPhone});

  @override
  List<Object> get props => [selectedPhone];
}
