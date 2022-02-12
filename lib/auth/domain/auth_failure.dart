import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failure.freezed.dart';
@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();
  const factory AuthFailure.unexpectedError() = _UnexpectedError;
  const factory AuthFailure.noNetworkConnection() = _NoNetworkConnection; 
  const factory AuthFailure.toManyRequest() = _ToManyRequest; 
  const factory AuthFailure.userDisabled() = _UserDisabled; 
  const factory AuthFailure.emailDoesNotExist() = _EmailDoesNotExist; 
  const factory AuthFailure.cancelledByUser() = _CancelledByUser; 
  const factory AuthFailure.invalidEmailAndPasswordCombination() = _InvalidEmailAndPasswordCombination; 
  const factory AuthFailure.emailInUse() = _EmailInUse;
}