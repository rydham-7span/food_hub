import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_client/food_client.dart';

abstract class IFirebaseClient {
  TaskEither<Failure, dynamic> request({
    required String document,
    required String collection,
    FBRequestType requestType = FBRequestType.put,
    Object? body,
  });
}

class FirebaseService extends IFirebaseClient {
  final db = FirebaseFirestore.instance;

  @override
  TaskEither<Failure, dynamic> request({
    required String document,
    required String collection,
    FBRequestType requestType = FBRequestType.put,
    Object? body,
  }) =>
      TaskEither.tryCatch(
        () async {
          switch (requestType) {
            case FBRequestType.get:
              return db.collection(collection).doc(document).collection(collection).get();
            case FBRequestType.put:
              return null;
            case FBRequestType.delete:
              return null;
          }
        },
        (error, stackTrace) => APIFailure(
          error: error,
          stackTrace: stackTrace,
        ),
      );
}
