
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/data/repositories/login_repo.dart';
import 'package:zybo/data/sources/login_api/request/Regreq.dart';
import 'package:zybo/data/sources/login_api/request/loginreq.dart';
import 'package:zybo/data/sources/login_api/response/Regres.dart';
import 'package:zybo/data/sources/login_api/response/loginres.dart';

part 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final LoginRepo loginRepo;
  

  AuthCubit( {required this.loginRepo,}) : super(AuthInitial());

  Future<void> verifyUser(String phoneNumber) async {
    emit(AuthLoading());
    try {
      final authEntity = await loginRepo.login(Loginreq(phoneNumber: phoneNumber));
      if (authEntity.data.user == true ) {
        emit(AuthSuccess(authEntity.data));
      } else {
        emit(AuthRegisterRequired(authEntity.data));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
 

  Future<void> loginRegister(String firstName, String phoneNumber) async {
    emit(AuthLoading());
    try {
      final authEntity = await loginRepo.register(Regreq(firstName: firstName, phoneNumber: phoneNumber));
      emit(AuthSuccesss(authEntity.data));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
