part of 'form_phone_bloc.dart';

sealed class FormPhoneState extends Equatable {
  const FormPhoneState();
}

class FormPhoneMessageState extends FormPhoneState {
  final String? message;
  final String? phoneValue;

  FormPhoneMessageState({required this.message,  required this.phoneValue});
  
  @override
  // TODO: implement props
  List<Object?> get props => [message, phoneValue];
}

final class PhoneValidatorInitial extends FormPhoneState {
  final String? phoneValue;
  const PhoneValidatorInitial({required this.phoneValue});
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

