import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_phone_event.dart';
part 'form_phone_state.dart';

class FormPhoneBloc extends Bloc<FormPhoneEvent, FormPhoneMessageState> {
  FormPhoneBloc()
      : super(FormPhoneMessageState(message: null, phoneValue: null)) {
    on<FormInputPhoneEvent>((event, emit) {
      String? messageErrorphone;
      String phoneValue = event.value ?? "";
      if (event.value?.isEmpty == true) {
        messageErrorphone = "Phone Tidak boleh kosong";
      } else if (!_isValidPhoneNumber(phoneValue)) {
        messageErrorphone = "Phone harus berisi hanya angka";
      } else if ((event.value?.length ?? 0) <= 8 ||
          (event.value?.length ?? 0) > 15) {
        messageErrorphone =
            "Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit";
      } else if (event.value?[0] != '0') {
        messageErrorphone = "Nomor telepon harus dimulai dengan angka 0";
      } else {
        messageErrorphone = null;
      }
      emit(
        FormPhoneMessageState(
            message: messageErrorphone, phoneValue: phoneValue),
      );
    });
    on<ResetPhoneValue>((event, emit) {
      emit(FormPhoneMessageState(
          phoneValue: '', message: 'No Telp harus diisi'));
    });
      on<UpdatePhoneValue>((event, emit) {
      emit(FormPhoneMessageState(phoneValue: event.selectedPhone, message: ''));
    });
  }
  bool _isValidPhoneNumber(String phoneNumber) {
    // Use a regular expression to check if the phoneNumber contains only digits
    final RegExp phoneRegExp = RegExp(r"^[0-9]+$");
    return phoneRegExp.hasMatch(phoneNumber);
  }
}
