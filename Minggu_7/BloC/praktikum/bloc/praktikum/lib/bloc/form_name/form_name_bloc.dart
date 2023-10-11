import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_name_event.dart';
part 'form_name_state.dart';

class FormNameBloc extends Bloc<FormNameEvent, FormNameMessageState> {
  FormNameBloc() : super(FormNameMessageState(nameValue: '', message: '')) {
    on<FormInputNameEvent>((event, emit) {
      String? messageErrorname;
      String nameValue = event.value ?? "";
      if (event.value?.isEmpty == true) {
        messageErrorname = "Nama Tidak boleh kosong";
      } else if ((event.value?.length ?? 0) <= 2) {
        messageErrorname = "Nama harus lebih dari 2 kata";
      } else if (event.value?.isNotEmpty == true &&
          event.value?[0] != event.value?[0].toUpperCase()) {
        messageErrorname = "Nama harus diawali huruf kapital";
      } else if (!_isValidName(nameValue)) {
        messageErrorname =
            "Nama tidak boleh mengandung angka atau karakter khusus";
      } else {
        messageErrorname = null;
      }
      emit(
        FormNameMessageState(message: messageErrorname, nameValue: nameValue),
      );
    });

     on<ResetNameValue>((event, emit) {
      emit(FormNameMessageState(message: 'nama harus diisi', nameValue: ''));
    });

    on<UpdateNameValue>((event, emit) {
      emit(FormNameMessageState(nameValue: event.selectedName, message: ''));
    });
  }
}
  bool _isValidName(String name) {
    // Use a regular expression to check if the name contains only letters, spaces, and is not empty
    final RegExp nameRegExp = RegExp(r"^[A-Za-z\s]+$");
    return nameRegExp.hasMatch(name);
  }
