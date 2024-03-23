import 'package:profitei_flutter/core/error/failures.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant/strings.dart';
import '../../models/summary/summary_model.dart';

abstract class RaffleRemoteDataSource {
  Future<List<RaffleSummaryModel>> getRaffleSummaries();
}

class RaffleRemoteDataSourceSourceImpl implements RaffleRemoteDataSource {
  final http.Client client;
  RaffleRemoteDataSourceSourceImpl({required this.client});

  @override
  Future<List<RaffleSummaryModel>> getRaffleSummaries() async {
    final response = await client.get(
      Uri.parse('$baseUrl/orders'),
      headers: {
        'Content-Type': 'application/json',
        'api-key': '402c2470-cf86-46ad-bb95-ab4025e0fba2',
      },
    );
    if (response.statusCode == 200) {
      return summaryModelListFromRemoteJson(response.body);
    } else {
      throw ServerFailure();
    }
  }
}
