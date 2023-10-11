import 'package:equatable/equatable.dart';

sealed class FormSubmitEvent extends Equatable {
  const FormSubmitEvent();
}

class CreateContact extends FormSubmitEvent {
  final String name;
  final String phone;


  const CreateContact(
      {required this.name,
      required this.phone,
   });

  @override
  List<Object> get props => [name, phone];
}

class UpdateContact extends FormSubmitEvent {
  final String name;
  final String phone;
  final int index;

  const UpdateContact({
    required this.name,
    required this.phone,
    required this.index,
  });

  @override
  List<Object> get props => [name, phone, index];
}

class DeleteContact extends FormSubmitEvent {
  final int id;

  const DeleteContact({required this.id});

  @override
  List<Object> get props => [id];
}