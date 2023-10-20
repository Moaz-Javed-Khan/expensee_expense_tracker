import 'dart:convert';

import 'package:expensee/Core/BaseRepository.dart';
import 'package:expensee/Core/CustomError.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class GetOtpRemoteDatasource extends BaseRepository {
  getOtp({required String email});
}

class GetOtpRemoteDatasourceImpl extends GetOtpRemoteDatasource {
  @override
  getOtp({required String email}) async {
    try {
      GraphQLClient client = graphqlConfig.clientToQuery(null);
      QueryResult result = await client.mutate(
        MutationOptions(
          document: gql(
            """
            mutation RequestReset(\$email: String!) {
            requestReset(email: \$email) {
            message  
            }
            }
              """,
          ),
          variables: {
            "email": email,
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
