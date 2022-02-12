import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_first_riverpod/auth/domain/auth_failure.dart';
import 'package:my_first_riverpod/auth/infrastructure/auth_repository.dart';
part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unAuthenticated() = _UnAuthenticated;
  const factory AuthState.error(AuthFailure failure) = _Error;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  late StreamSubscription<User?>
      _authStateChangesSubscription; // We'll initialize it later  in constructor
  AuthNotifier(this._authRepository) : super(const AuthState.initial()) {
    _authStateChangesSubscription = _authRepository.authStateChanges().listen((user) {
      if (user != null) {
        state = const AuthState.authenticated();
      } else {
        state = const AuthState.unAuthenticated();
      }
    });
  }

  Future<void> registerWithEmailAndPassword(String email, String password) async {
    final failureOrSuccess = await _authRepository.registerWithEmailAndPassword(email, password);
    failureOrSuccess.fold((failure) {
      state = AuthState.error(failure);
    }, (success) {//Interestingly we don't need to do anything here because if we're authenicated we'll get update state from a StreamSubscription
     });
  }

  Future<void> sighInWithEmailAndPassword(String email, String password) async {
    final failureOrSuccess = await _authRepository.signInWithEmailAndPassword(email, password);
    failureOrSuccess.fold((failure) {
      state = AuthState.error(failure);
    }, (success) {//Interestingly we don't need to do anything here because if we're authenicated we'll get update state from a StreamSubscription
     });
  }

  Future<void> sighInWithGoogle() async {
    final failureOrSuccess = await _authRepository.signInWithGoogle();
    failureOrSuccess.fold((failure) {
      state = AuthState.error(failure);
    }, (success) {//Interestingly we don't need to do anything here because if we're authenicated we'll get update state from a StreamSubscription
     });
  }
  Future<void> sighOut() async {
    await _authRepository.signOut();
  }

  @override
  void dispose() {
    super.dispose();
    _authStateChangesSubscription.cancel();
  }
}
