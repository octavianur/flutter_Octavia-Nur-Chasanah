part of 'form_name_bloc.dart';

sealed class FormNameState extends Equatable{
  const FormNameState();
}

class FormNameMessageState extends FormNameState {
  final String? message;
  final String? nameValue;

  FormNameMessageState({required this.message, required this.nameValue});


  @override
  // TODO: implement props
  List<Object?> get props => [message, nameValue];
}

final class FormNameInitial extends FormNameState {
  final String? nameValue;
  const FormNameInitial({required this.nameValue});
  
  @override
  // TODO: implement props
  List<Object?> get props => [nameValue];
}
