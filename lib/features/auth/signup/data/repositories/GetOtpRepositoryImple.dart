import 'package:expensee/Core/failures.dart';
import 'package:expensee/features/auth/signup/data/datasources/get_otp_remote_datasource.dart';
import 'package:expensee/features/auth/signup/domain/repositories/GetOtpRepository.dart';

class GetOtpRepositoryImple extends GetOtpRepository {
  final GetOtpRemoteDatasource remotedatasources;

  GetOtpRepositoryImple({required this.remotedatasources});

  @override
  getOtp(String email) async {
    try {
      final remoteData = await remotedatasources.getOtp(email: email);

      return remoteData;
    } catch (error) {
      throw ServerFailure(message: error.toString());
    }
  }
}
