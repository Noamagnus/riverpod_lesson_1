import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_first_riverpod/auth/domain/auth_failure.dart';
import 'package:my_first_riverpod/auth/infrastructure/auth_repository.dart';
part 'password_reset_notifier.freezed.dart';

@freezed
class PasswordResetState with _$PasswordResetState {
  const PasswordResetState._();
  const factory PasswordResetState.initial() = _Initial;
  const factory PasswordResetState.submitted() = _Submitted;
  const factory PasswordResetState.error(AuthFailure failure) = _Error;
}

class PasswordResetNotifier extends StateNotifier<PasswordResetState> {
  final AuthRepository _authRepository;

  PasswordResetNotifier(this._authRepository) : super(const PasswordResetState.initial());

  Future<void> sendResetEmail(String email) async {
    final failureOfSucces = await _authRepository.sendPasswordResetEmail(email);
    failureOfSucces.fold((failure) {
      state = PasswordResetState.error(failure);
    }, (success) {
      state = const PasswordResetState.submitted();
    });
  }
}
