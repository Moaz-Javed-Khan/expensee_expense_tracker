import 'dart:convert';
import 'package:expensee/Core/BaseRepository.dart';
import 'package:expensee/Core/CustomError.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class OtpRemoteDatasource extends BaseRepository {
  otpVerify({
    required String otp,
    required String email,
    String? password,
  });
}

class OtpRemoteDatasourceImpl extends OtpRemoteDatasource {
  @override
  otpVerify({
    required String otp,
    required String email,
    String? password,
  }) async {
    try {
      GraphQLClient client = graphqlConfig.clientToQuery(null);
      QueryResult result = await client.mutate(
        MutationOptions(
          document: gql(
            """
            mutation VerifyOTP(\$input: resetPasswordInput) {
              verifyOTP(input: \$input) {
                message
              }
            }
            """,
          ),
          variables: {
            "input": {
              "password": password,
              "otp": otp,
              "email": email,
            }
          },
        ),
      );

      if (result.hasException) {
        throw Exception(Code.fromJson(
          jsonDecode(result.exception!.graphqlErrors.first.message),
        ).message);
      } else {
        // final data = result.data!["createUser"];
        return result.data;
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
