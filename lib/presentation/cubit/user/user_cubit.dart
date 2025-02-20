
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/data/repositories/user_repo.dart';
import 'package:zybo/data/sources/user_api/response/user_profile.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo userRepo;
  UserCubit({required this.userRepo}) : super(UserInitial());

   Future<void> getuser() async {
    emit(UserLoading());
    try {
      final profile = await userRepo.getuser();
      emit(UserSuccess(profile.data));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
