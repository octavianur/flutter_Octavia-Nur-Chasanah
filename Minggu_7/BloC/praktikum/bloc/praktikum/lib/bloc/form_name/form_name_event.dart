part of 'form_name_bloc.dart';

sealed class FormNameEvent extends Equatable {
  const FormNameEvent();
}

class FormInputNameEvent extends FormNameEvent {
  final String? value;

  const FormInputNameEvent({
    required this.value,
  });

  @override
  List<Object> get props => [value ?? ""];
}

class ResetNameValue extends FormNameEvent {
  @override
  List<Object> get props => [];
}

class UpdateNameValue extends FormNameEvent {
  final String selectedName;

  const UpdateNameValue({required this.selectedName});

  @override
  List<Object> get props => [selectedName];
}