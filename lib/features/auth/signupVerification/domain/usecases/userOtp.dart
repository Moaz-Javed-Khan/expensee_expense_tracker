import 'package:expensee/features/auth/signupVerification/domain/repositories/OtpRepository.dart';

class userOtpUsecase {
  final OtpRepository repository;

  userOtpUsecase({required this.repository});
  execute({
    required String otp,
    required String email,
    String? password,
  }) async {
    return repository.otpVerify(
      email: email,
      otp: otp,
    );
  }
}
