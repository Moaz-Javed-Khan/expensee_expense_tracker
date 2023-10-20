import 'package:expensee/Core/failures.dart';
import 'package:expensee/features/auth/signupVerification/data/datasources/OtpRemoteDatasource.dart';
import 'package:expensee/features/auth/signupVerification/domain/repositories/OtpRepository.dart';

class OtpRepositoryImple extends OtpRepository {
  final OtpRemoteDatasource remotedatasources;

  OtpRepositoryImple({required this.remotedatasources});

  @override
  otpVerify({
    required String otp,
    required String email,
    String? password,
  }) async {
    try {
      final remoteData = await remotedatasources.otpVerify(
        email: email,
        otp: otp,
      );

      print("Repo Result: $remoteData");

      return remoteData;
    } catch (error) {
      throw ServerFailure(message: error.toString());
    }
  }
}
