import 'package:expensee/features/auth/signup/domain/repositories/GetOtpRepository.dart';

class GetOtpUsecase {
  final GetOtpRepository repository;

  GetOtpUsecase({required this.repository});
  execute(String email) async {
    return repository.getOtp(email);
  }
}
