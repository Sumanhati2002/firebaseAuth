import 'package:cloud_firestore/cloud_firestore.dart';

//create data
create(String colName, docName, name, animal, int age) async {
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .set({'name': name, 'animal': animal, 'age': age});
  print('data created');
}

//read data
readData(String colName, docName) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).get();
  print('value get');
}

//update data
updateData(String colName, docName, fieldName, var newFieldValue) async {
  await FirebaseFirestore.instance
      .collection(colName)
      .doc(docName)
      .update({fieldName: newFieldValue});
  print("value updated!!!");
}

//delete data
deleteData(String colName, docName) async {
  await FirebaseFirestore.instance.collection(colName).doc(docName).delete();
  print('data deleted');
}
