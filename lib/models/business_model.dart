import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class BusinessModel {
  String businessId;
  String name;
  String imageUrl;
  String description;
  String category;
  String phoneNumber;
  String address;
  String email;
  String website;
  GeoFirePoint location;
  GeoPoint position;

  BusinessModel({
    this.businessId,
    this.name,
    this.imageUrl,
    this.description,
    this.category,
    this.phoneNumber,
    this.address,
    this.email,
    this.website,
    this.location,
    this.position,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'businessId': businessId,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'phoneNumber': phoneNumber,
      'address': address,
      'email': email,
      'website': website,
      'location': location.data,
    };
  }

  factory BusinessModel.fromFirestore(DocumentSnapshot ds) {
    return BusinessModel(
        businessId: ds.id,
        name: ds.data()['name'],
        imageUrl: ds.data()['imageUrl'],
        description: ds.data()['description'],
        category: ds.data()['category'],
        phoneNumber: ds.data()['phoneNumber'],
        address: ds.data()['address'],
        email: ds.data()['email'],
        website: ds.data()['website'],
        position:
            ds.data().containsKey('location') && ds.data()['location'] != null
                ? ds.data()['location']['geopoint']
                : null
        // location:
        //     ds.data().containsKey('location') && ds.data()['location'] != null
        //         ? GeoFirePoint(ds.data()['location']['geopoint'].latitude,
        //             ds.data()['location']['geopoint'].longitude)
        //         : null,
        );
  }
}
