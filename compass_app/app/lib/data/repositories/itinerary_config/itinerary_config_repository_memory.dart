import 'dart:async';

import '../../../domain/models/itinerary_config/itinerary_config.dart';
import '../../../utils/result.dart';
import 'itinerary_config_repository.dart';

/// In-memory implementation of [ItineraryConfigRepository].
class ItineraryConfigRepositoryMemory implements ItineraryConfigRepository {
  ItineraryConfig? _itineraryConfig;

  @override
  Future<Result<ItineraryConfig>> getItineraryConfig() async {
    return Result.ok(_itineraryConfig ?? const ItineraryConfig());
  }

  @override
  Future<Result<bool>> setItineraryConfig(
    ItineraryConfig itineraryConfig,
  ) async {
    _itineraryConfig = itineraryConfig;
    return Result.ok(true);
  }
}