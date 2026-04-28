import 'dart:async';
import 'package:izpi_exchange/core/rest/rest.functions.dart';
import 'package:izpi_exchange/core/storage/storage.constants.dart';
import 'package:izpi_exchange/main.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum AuthState { authenticated, failed }

class GatewayService {
  GatewayService._internal();

  factory GatewayService() => _instance;

  final _authController = StreamController<AuthState>.broadcast();
  static final GatewayService _instance = GatewayService._internal();

  late Socket _socket;

  bool _initialized = false;
  bool _connected = false;

  Stream<AuthState> get authFailedStream => _authController.stream;

  void dispose() {
    if (_initialized) {
      _socket.clearListeners();
      _socket.dispose();
    }

    _initialized = false;
    _connected = false;
  }

  void emit(String event, dynamic data) {
    if (!_connected) {
      return;
    }

    _socket.emit(event, data);
  }

  Future<void> init() async {
    if (_initialized) {
      return;
    }

    final accessToken = await secureStorage.read(key: secureStorageAccessTokenKey);

    final socketUrl = createRequestUri('gateway').toString();
    final socketOptions = OptionBuilder().setTransports(['websocket']).setAuth({
      'accessToken': accessToken,
    }).build();

    _socket = io(socketUrl, socketOptions);

    _socket.onConnect((_) {
      logger.i('Conectado al Gateway...');
      _connected = true;
    });

    _socket.onDisconnect((_) {
      logger.e('Desconectado del Gateway...');
      _connected = false;
    });

    _socket.on('AUTHENTICATION_FAILED', (_) {
      logger.w('La autenticación falló...');

      _authController.add(AuthState.failed);
      _socket.disconnect();
      _connected = false;
    });

    _initialized = true;
  }

  void off(String event) {
    if (!_initialized) {
      throw Exception('El servicio de Gateway no está inicializado');
    }

    _socket.off(event);
  }

  void on(String event, Function(dynamic) handler) {
    if (!_initialized) {
      throw Exception('El servicio de Gateway no está inicializado');
    }

    _socket.on(event, handler);
  }

  Future<void> reconnect() async {
    dispose();

    _initialized = false;
    _connected = false;

    await init();
  }
}
