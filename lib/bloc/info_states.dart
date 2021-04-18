import '../models/information.dart';

abstract class InfoState {
  const InfoState();
}

class InfoInitialize extends InfoState {
  const InfoInitialize();
}

class InfoLoading extends InfoState {
  const InfoLoading();
}

class InfoSucces extends InfoState {
  final Information response;
  const InfoSucces(this.response);
}

class InfoError extends InfoState {
  final String errorMessage;
  const InfoError(this.errorMessage);
}
