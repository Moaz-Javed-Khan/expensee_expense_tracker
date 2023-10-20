import 'package:expensee/Core/BaseRepository.dart';

abstract class OtpRepository extends BaseRepository {
  otpVerify({
    required String otp,
    required String email,
    String? password,
  });
}
