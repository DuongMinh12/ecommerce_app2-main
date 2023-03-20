import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/catagory_model.dart';
import 'package:ecommerce_app/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {

  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository ({FirebaseFirestore? firebaseFirestore}) :
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore.collection('categories').snapshots()
        .map((snapshots) {
      return snapshots.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}