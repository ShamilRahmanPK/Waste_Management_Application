import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/request_model.dart';



class RequestService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'requests';

  // Add a request to the database
  Future<void> addRequest(RequestModel request) async {
    try {
      await _firestore.collection(_collectionName).add(request.toMap());
    } catch (error) {
      print("Error adding request: $error");
      throw error;
    }
  }

  // Get all requests from the database
  Future<List<RequestModel>> getAllRequests() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection(_collectionName).get();
      return snapshot.docs.map((doc) => RequestModel.fromMap(doc.data() as Map<String, dynamic>?)).toList();
    } catch (error) {
      print("Error getting requests: $error");
      throw error;
    }
  }

  // Get requests by user ID from the database
  Future<List<RequestModel>> getRequestsByUserId(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(_collectionName)
          .where('userId', isEqualTo: userId)
          .get();
      return snapshot.docs.map((doc) => RequestModel.fromMap(doc.data() as Map<String, dynamic>?)).toList();
    } catch (error) {
      print("Error getting requests by user ID: $error");
      throw error;
    }
  }

  // Get requests by agent ID from the database
  Future<List<RequestModel>> getRequestsByAgentId(String agentId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection(_collectionName)
          .where('agentId', isEqualTo: agentId)
          .get();
      return snapshot.docs.map((doc) => RequestModel.fromMap(doc.data() as Map<String, dynamic>?)).toList();
    } catch (error) {
      print("Error getting requests by agent ID: $error");
      throw error;
    }
  }
}
