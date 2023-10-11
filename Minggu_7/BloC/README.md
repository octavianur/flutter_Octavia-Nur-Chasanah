# Flutter State Management (BLoC)

BLoC (Business Logic Component) yaitu state management yang memisahkan antara business logic dengan UI. Kenapa menggunakan BLoC? karena simple, Powerfull dan Testable. 

2 jenis state :
ephermeral State -> tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widget nya. Ex :
PageView, BottomNavigationBar, Switch

app state -> aplikasi membutuhkan akses ke data state widget. Logicnya

Pendekatan State Management

1. SetState lebih cocok pada ephemeral state
2. Provider -> rekomendasi flutter karena mudah dipelajari

state -> kondisi hasil dari bloc
events -> interaksi atau input atau perintahnya
bloc -> logic nya menghasilkan state sebagai output
stream -> actor utama di dalam BLoC
sink-> berguna sebagai input/interaksi 
Stream -> aliran datanya
Outputnya keluaran data yang berhasilkan source
emit -> untuk menyimpan logic


# CARA MEMANGGIL BLOC :
 context.read<tipeBloc>().add(namaeventnya spt Increment());

state.value.toString -- mengambil value



1. Menambahkan Event
Ex: 
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

2. Menambahkan State
Ex :
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

3. Menambahkan Logika
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
        }
    }
