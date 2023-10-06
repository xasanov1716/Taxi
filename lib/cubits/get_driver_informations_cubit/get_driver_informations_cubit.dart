import 'package:taxi_app/data/models/driver/driver_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/data/repositories/driver_repos.dart';
part 'get_driver_informations_state.dart';

class GetDriverInformationsCubit extends Cubit<GetDriverInformationsState> {
  DriverRepo driverRepo;

  GetDriverInformationsCubit(this.driverRepo) : super(GetDriverInfoLoading());

  fetchDriverData(String userId) async {
    emit(GetDriverInfoLoading());
    final response = await driverRepo.getDriverByDriverId(userId);
    response.isSuccess
        ? emit(GetDriverInfoSuccess(response.data))
        : emit(GetDriverInfoError(response.errorMessage!));
  }
}
