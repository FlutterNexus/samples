import '../../../domain/models/continent/continent.dart';
import '../../../utils/result.dart';
import '../../services/api/api_client.dart';
import 'continent_repository.dart';

/// Remote data source for [Continent].
/// Implements basic local caching.
/// See: https://docs.flutter.dev/get-started/fwe/local-caching
class ContinentRepositoryRemote implements ContinentRepository {
  ContinentRepositoryRemote({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  List<Continent>? _cachedData;

  @override
  Future<Result<List<Continent>>> getContinents() async {
    if (_cachedData == null) {
      // No cached data, request continents
      final result = await _apiClient.getContinents();
      if (result is Ok) {
        // Store value if result Ok
        _cachedData = result.asOk.value;
      }
      return result;
    } else {
      // Return cached data if available
      return Result.ok(_cachedData!);
    }
  }
}
