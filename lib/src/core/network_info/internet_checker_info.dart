import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetCheckerInfo {
  Future<bool> get isConnected;
}

class InternetCheckerInfoImpl implements InternetCheckerInfo {
  final InternetConnectionChecker connectionChecker;

  InternetCheckerInfoImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
