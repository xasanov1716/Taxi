import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/data/models/user/user_model.dart';
import 'package:taxi_app/data/repositories/user_repository.dart';

part 'get_client_info_state.dart';

class GetClientInfoCubit extends Cubit<GetClientInfoState> {
  UserRepo userRepo;

  GetClientInfoCubit(this.userRepo) : super(GetClientInfoLoading());

  fetchClientData(String userId) async {
    print(userId);
    emit(GetClientInfoLoading());
    final response = await userRepo.getUserByUserId(userId);
    response.isSuccess
        ? emit(GetClientInfoSuccess(response.data))
        : emit(GetClientInfoError(response.errorMessage!));
  }
}
