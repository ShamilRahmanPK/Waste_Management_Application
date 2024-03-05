import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hksena/features/admin/model/userrmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;




  Future<bool>? signInWithEmailAndPassword(
      UserModel userdata) async {
    try {
      // Sign in with email and password
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: userdata.email.toString(), password: userdata.pass.toString());

      // Create a new user document in Firestore
      User? user = result.user;
      var token = await result.user!.getIdToken();
      await _createUserInFirestore(userdata,result);
      //await _saveUserDataToPrefs(userdata, token,result);
return true;

    } catch (error) {
      print("Error signing in: $error");
      return false;
    }
  }

  Future<void> _createUserInFirestore(UserModel user,UserCredential result) async {

    await FirebaseFirestore.instance.collection('login').doc(result.user!.uid).set({
      'uid':result.user!.uid,
      'type':user.type,
    });

    if(user.type=="house"){
      try {
        await _firestore.collection('houses').doc(result.user!.uid).set({
          'name': user.name,
          'email': user.email,
          'uid': result.user!.uid,
          'createdAt': DateTime.now(),
          'status': 1,
          'address': user.address,
          'wardNo': user.wardNo,
          'phone': user.phone,
          'location': user.address,
          'type':"user"
        });
      } catch (error) {
        print("Error creating user in Firestore: $error");
      }
    }
  }

  Future<void> _saveUserDataToPrefs(UserModel user, String ?token,UserCredential result) async {
    final SharedPreferences _prefs =await SharedPreferences.getInstance();
     try {
       _prefs.setString('uid', result.user!.uid);
       _prefs.setString('name', user.name.toString());
       _prefs.setString('email', user.email.toString());
       _prefs.setString('address', user.address.toString());
       _prefs.setString('wardNo', user.wardNo.toString());
       _prefs.setString('phone', user.phone.toString());
       _prefs.setString('location', user.location.toString());
       _prefs.setString('token', token.toString());
       _prefs.setString('type', user.type.toString());
       // You can save additional data to SharedPreferences if needed
     } catch (error) {
       print("Error saving user data to SharedPreferences: $error");
     }

  }



  // login user

  Future<bool>? loginUser(UserModel user) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: user.email.toString(), password: user.pass.toString());

      if (userCredential != null) {
        var token = await userCredential.user!.getIdToken();
        // Save user data and token to SharedPreferences


        var snap = await FirebaseFirestore.instance.collection('login').doc(userCredential.user!.uid).get();

        if (snap['type'] == "user") {
          var userData = await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).get();
          UserModel _userData = UserModel.fromMap(userData.data()!);
          await _saveUserDataToPrefs(_userData, token,userCredential);
        }
      }
      return true;
    } catch (error) {
      print("Error logging in: $error");
      throw error;
    }
  }


  //check login status

Future<bool>?checkLoginStatus()async{

    SharedPreferences _pref=await SharedPreferences.getInstance();
    var token=await _pref.getString('token');
    if(token!=null){
      return true;
    }
    else{
      return false;
    }

}

}
