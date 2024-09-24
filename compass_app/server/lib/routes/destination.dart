import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../config/assets.dart';

class DestinationApi {
  Router get router {
    final router = Router();

    router.get('/', (Request request) {
      return Response.ok(
        json.encode(Assets.destinations),
        headers: {'Content-Type': 'application/json'},
      );
    });

    router.get('/<id>/activity', (Request request, String id) {
      final list = Assets.activities
          .where((activity) => activity.destinationRef == id)
          .toList();
      return Response.ok(
        json.encode(list),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}