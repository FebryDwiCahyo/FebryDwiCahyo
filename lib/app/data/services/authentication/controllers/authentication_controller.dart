import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/profile_model.dart';

class AuthenticationController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  final obscurePassword = true.obs;
  final Rx<User?> user = Rx<User?>(null);
  
  @override
  void onInit() {
    super.onInit();
    // Listen to auth state changes
    user.bindStream(_auth.authStateChanges());
    ever(user, _initialScreen);
  }

  // Handle initial screen routing based on auth state
  _initialScreen(User? user) {
    if (user != null) {
      // User is logged in, navigate to home
      Get.offAllNamed('/home');
    }
  }
  
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

Future<void> signUp() async {
  try {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    if (!_validateInputs()) {
      Get.back();
      Get.snackbar(
        'Error',
        'Please fill all fields correctly',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    // Create user in Firebase Auth
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    // Create user profile in Firestore
    await createUserProfile(userCredential.user!);

    Get.back(); // Close loading dialog
    _clearControllers();
    
    Get.snackbar(
      'Success',
      'Account created successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );
    
  } catch (e) {
    Get.back();
    Get.snackbar(
      'Error',
      'Failed to create account: ${e.toString()}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.1),
      colorText: Colors.red,
    );
  }
}

  void _clearControllers() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
  }

  bool _validateInputs() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    
    // Basic email validation
    if (!GetUtils.isEmail(emailController.text.trim())) {
      return false;
    }
    
    // Basic phone number validation
    if (!GetUtils.isPhoneNumber(phoneController.text.trim())) {
      return false;
    }
    
    // Basic password strength validation
    if (passwordController.text.length < 6) {
      return false;
    }
    
    return true;
  }

  @override
  void onClose() {
    // nameController.dispose();
    // emailController.dispose();
    // phoneController.dispose();
    // passwordController.dispose();
    // super.onClose();
  }

  Future<void> logout() async {
  try {
    // Show loading indicator
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );

    // Sign out from Firebase
    await _auth.signOut();
    
    // Close loading dialog
    Get.back();

    // Show success message
    Get.snackbar(
      'Success',
      'Logged out successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );

    // Navigate to sign in view
    Get.offAllNamed('/login'); // atau '/login' sesuai dengan route name Anda
    
  } catch (e) {
    // Close loading dialog
    Get.back();
    
    Get.snackbar(
      'Error',
      'An error occurred while logging out',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.1),
      colorText: Colors.red,
    );
  }
}
Future<void> createUserProfile(User user) async {
  try {
    final profile = Profile(
      id: user.uid,
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
    );

    await _firestore.collection('users').doc(user.uid).set(profile.toJson());
  } catch (e) {
    throw 'Failed to create user profile: $e';
  }
}
}