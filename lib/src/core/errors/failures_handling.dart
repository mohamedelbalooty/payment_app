import '../../utils/constants/messages.dart';
import 'failures.dart';

class FailuresHandling {
  String onHandlingFailures({required Failure failure}) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverErrorMessage;
      case OfflineFailure:
        return offlineErrorMessage;
      default:
        return defaultErrorMessage;
    }
  }
}
