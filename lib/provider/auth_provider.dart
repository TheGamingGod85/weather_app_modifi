import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  bool _isLoading = false;
  String _errorMessage = '';

  User? get user => _user;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen(_authStateChanged);
  }

  void _authStateChanged(User? user) {
    _user = user;
    notifyListeners();
  }

  // sign up method

  Future<bool> signUp(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Login Method
  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout Method
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
