import 'package:praticar_1/tdd_intermediario/exercicio_5/local_cache.dart';
import 'package:praticar_1/tdd_intermediario/exercicio_5/remote_api_client.dart';

class DataRepository {
  final LocalCache _localCache;
  final RemoteApiClient _remoteApiClient;

  DataRepository({
    required LocalCache localCache,
    required RemoteApiClient remoteApiClient,
  }) : _localCache = localCache,
       _remoteApiClient = remoteApiClient;

  String getData() {
    if (_localCache.isExpired()) {
      return _remoteApiClient.fetch();
    }
    return _localCache.read();
  }
}
