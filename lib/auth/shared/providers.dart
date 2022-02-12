import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_first_riverpod/auth/application/auth_notifier.dart';
import 'package:my_first_riverpod/auth/application/email_verification_notifier.dart';
import 'package:my_first_riverpod/auth/application/password_reset_notifier.dart';
import 'package:my_first_riverpod/auth/infrastructure/auth_repository.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final googleSighInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn();
});

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(
    ref.watch(firebaseAuthProvider),
    ref.watch(googleSighInProvider),
  );
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});

final passwordResetNotifierProvider  =
    StateNotifierProvider<PasswordResetNotifier, PasswordResetState>((ref) {
  return PasswordResetNotifier(ref.watch(authRepositoryProvider));
});

final emailVerificationNotifierProvider =
    StateNotifierProvider<EmailVerificationNotifier, EmailVerificationState>((ref) {
  return EmailVerificationNotifier(ref.watch(authRepositoryProvider));
});
