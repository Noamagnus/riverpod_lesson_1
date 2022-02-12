import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_first_riverpod/auth/domain/auth_failure.dart';

class AuthRepository {
  //This repository will have two dependencies
  //It'll dependt on FirebaseAuth and GoogleSignIn
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(this._firebaseAuth, this._googleSignIn);
  // We need to check if user is Authenticated or not
  // If the User is authenticated we'll send User down a stream and it not
  // then result will be null
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  //Some methods in this repository will need acces to the current  user info
  //FirebaseAuth has a getter for this and we'll access it here
  User? get _currentUser => _firebaseAuth.currentUser;

  // This method creates a new account (register a new user )
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password); // we'll use this object to send verification email
      // To send verification email we need to acces User object from credential object
      await credential.user?.sendEmailVerification();
      // If everything went well well return Unit (null);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code; // getting error code
      if (error == 'email-already-in-use') {
        return left(const AuthFailure.emailInUse());
      } else if (error == 'network-request-failed') {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == 'too-many-requests') {
        return left(const AuthFailure.toManyRequest());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  //This method is for signing in
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == 'network-request-failed') {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == 'too-many-requests') {
        return left(const AuthFailure.toManyRequest());
      } else if (error == 'user-disabled') {
        return left(const AuthFailure.userDisabled());
      } else if (error == 'user-not-found' || error == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  //This method is for signing with Google
  //We need to use both GoogleSignIn and FirebaseAuth packages for this
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    // this will start signin process and will show user the page where they can sign to their google account
    // If user cancel during proces signIn() returns null
    try {
      final signInAccount = await _googleSignIn.signIn();
      if (signInAccount != null) {
        final authentication = await signInAccount.authentication;
        // now we can use authenication object to obtain oAuth credential
        final credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken,
        );
        await _firebaseAuth.signInWithCredential(credential);
        return right(unit);
      }
      return left(const AuthFailure.cancelledByUser()); // if user cancell
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == 'network-request-failed') {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == 'user-disabled') {
        return left(const AuthFailure.userDisabled());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    }
  }

  //This one is for signing out
  //She decided not to handle errors while signing out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  //We have email verification
  //This method checks if user email is verified
  Future<Either<AuthFailure, bool>> isUserEmailVerified() async {
    // Before checking if the email is verified we need to reload current user data
    // If the user signs in and verify its email and we don't reload the user
    // then we'll keep getting false back
    try {
      await _currentUser!
          .reload(); // we can use ! because when we call this user we'll alreday have _currentUser
      return right(_currentUser!.emailVerified);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == 'network-request-failed') {
        return left(const AuthFailure.noNetworkConnection());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  //Method to resend verification email if user didn't get it
  Future<Either<AuthFailure, Unit>> resendVerificationEmail() async {
    try {
      await _currentUser!.sendEmailVerification();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == 'network-request-failed') {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == 'too-many-requests') {
        return left(const AuthFailure.toManyRequest());
      } else {
        return left(const AuthFailure.unexpectedError());
      }
    } on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }

  //This method is sending passwork-reset email
  // This one is used in case user forgot his password
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      final error = e.code;
      if (error == 'network-request-failed') {
        return left(const AuthFailure.noNetworkConnection());
      } else if (error == 'too-many-requests') {
        return left(const AuthFailure.toManyRequest());
      }
       else if (error == 'user-not-found') {
        return left(const AuthFailure.emailDoesNotExist());
      }else {
        return left(const AuthFailure.unexpectedError());
      } 
    }on PlatformException {
      return left(const AuthFailure.unexpectedError());
    }
  }
}
