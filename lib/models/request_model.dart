class RequestModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userAddress;
  String? wardNo;
  String? agentId;
  List<BinItem> selectedBins;

  RequestModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userAddress,
    required this.wardNo,
    required this.agentId,
    required this.selectedBins,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'userAddress': userAddress,
      'wardNo': wardNo,
      'agentId': agentId,
      'selectedBins': selectedBins.map((bin) => bin.toMap()).toList(),
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      throw ArgumentError('Map cannot be null');
    }
    return RequestModel(
      userId: map['userId'] as String?,
      userName: map['userName'] as String?,
      userEmail: map['userEmail'] as String?,
      userPhone: map['userPhone'] as String?,
      userAddress: map['userAddress'] as String?,
      wardNo: map['wardNo'] as String?,
      agentId: map['agentId'] as String?,
      selectedBins: (map['selectedBins'] as List<dynamic>)
          .map((bin) => BinItem.fromMap(bin as Map<String, dynamic>))
          .toList(),
    );
  }
}


// Define the BinItem class
class BinItem {

  String img;
  String type;
  int price;

  BinItem({

    required this.img,
    required this.type,
    required this.price,
  });

  // Convert the bin item object to a Map for easy storage and retrieval
  Map<String, dynamic> toMap() {
    return {

      'img': img,
      'type': type,
      'price': price,
    };
  }

  // Create a factory method to create a bin item object from a map
  factory BinItem.fromMap(Map<String, dynamic> map) {
    return BinItem(

      img: map['img'],
      type: map['type'],
      price: map['price'],
    );
  }
}
