import 'dart:developer';

import 'package:budget_buddy/app/data/exceptions/app_exception.dart';
import 'package:budget_buddy/app/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl extends UserRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<void> addUserDetails(Map<String,dynamic> userData) async {
    try{
      User? user = _auth.currentUser;
      if(user != null){
        await _db.collection('userDetails').doc(user.uid).set(userData);
      }
    }catch (e){
      throw AppException('error', 'Error adding user data');
    }
  }

  @override
  Future<void> deleteUSer() async {
    try{
      User? user = _auth.currentUser;
      if(user != null){
        await _db.collection('userDetails').doc(user.uid).delete();
      }
    }catch (e){
      throw AppException('error', 'Error adding user data');
    }
  }

  @override
  Future<void> getUserDetails() async {
    try{
      User? user = _auth.currentUser;
      if(user != null){
        var data = await _db.collection('userDetails').doc(user.uid).get();
        log('user data - ${data.data()}');
      }
    }catch (e){
      throw AppException('error', 'Error adding user data');
    }
  }

}