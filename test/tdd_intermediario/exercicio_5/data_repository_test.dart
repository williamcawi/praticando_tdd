import 'package:mocktail/mocktail.dart';
import 'package:praticar_1/tdd_intermediario/exercicio_5/data_repository.dart';
import 'package:praticar_1/tdd_intermediario/exercicio_5/local_cache.dart';
import 'package:praticar_1/tdd_intermediario/exercicio_5/remote_api_client.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

class MockLocalCache extends Mock implements LocalCache {}

class MockRemoteApiClient extends Mock implements RemoteApiClient {}

void main() {
  late DataRepository dataRepository;
  late MockLocalCache mockLocalCache;
  late MockRemoteApiClient mockRemoteApiClient;

  setUp(() {
    mockLocalCache = MockLocalCache();
    mockRemoteApiClient = MockRemoteApiClient();

    // Injetamos as duas dependências no nosso repositório principal
    dataRepository = DataRepository(
      localCache: mockLocalCache,
      remoteApiClient: mockRemoteApiClient,
    );
  });

  group('DataRepository - Estratégia de Cache', () {
    test(
      'Deve buscar dados do RemoteApiClient quando o cache estiver EXPIRADO',
      () {
        // Arrange
        when(() => mockLocalCache.isExpired()).thenReturn(true);
        when(() => mockRemoteApiClient.fetch()).thenReturn('Dados da Internet');

        // Act
        final result = dataRepository.getData();

        // Assert
        expect(result, equals('Dados da Internet'));
        // Garantia de Não-Regressão: O remote Deve ser chamado e o cache Não deve ser lido
        verify(() => mockRemoteApiClient.fetch()).called(1);
        verifyNever(() => mockLocalCache.read());
      },
    );

    test(
      'Deve buscar dados do LocalCache quando o cache NÃO estiver expirado',
      () {
        // Arrange
        when(() => mockLocalCache.isExpired()).thenReturn(false);
        when(() => mockLocalCache.read()).thenReturn('Dados do Cache');

        //Act
        final result = dataRepository.getData();

        //Assert
        expect(result, equals('Dados do Cache'));
        // Garantia de Não-Regressão: O cache DEVE ser lido e o cotrole remoto NÃO deve ser chamado
        verify(() => mockLocalCache.read()).called(1);
        verifyNever(() => mockRemoteApiClient.fetch());
      },
    );
  });
}
