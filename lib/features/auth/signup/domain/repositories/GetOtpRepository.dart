import 'package:expensee/Core/BaseRepository.dart';

abstract class GetOtpRepository extends BaseRepository {
  getOtp(String email);
}
