import 'package:profile/core/components/exporting_packages.dart';

class MessageService {
  final String _uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future sendMessage(Message message) async {
   try {
     await _fireStore
         .collection('messages')
         .doc(message.id)
         .set(message.toJson());
   } catch(err) {

   }
  }

  Stream<QuerySnapshot> getMessage() => _fireStore
        .collection('messages')
        .where('userId', isEqualTo: _uid)
        .orderBy('sentTime', descending: true).snapshots();

}
