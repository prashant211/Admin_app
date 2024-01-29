import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footwear_admin/models/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  // instance to head to database
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  //reference to collection in firebase
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();


  String category = 'general';
  String brand = 'unbranded';
  bool offer = false ;

  List<Product> products =[];




  @override
  void onInit() async {
    //we can use productCollection to add,delete,update in firebase
      productCollection = fireStore.collection('products');
      await fetchProducts();
       super.onInit();
  }

   addProduct(){

    try {
      //reference to document
      DocumentReference doc = productCollection.doc();
      //product instance
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text ,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      fetchProducts();
      Get.snackbar(
          'Success', 'Product added successfully',colorText: Colors.green);
      setValuesDefault();
    }catch(e){
      Get.snackbar(
          'Error', e.toString(),colorText: Colors.red);
    }
  }

   fetchProducts() async{
  try {
    QuerySnapshot productSnapshot = await productCollection.get();
    final List<Product> retrieveProducts =
    productSnapshot.docs.map(
            (doc) =>
            Product.fromJson(
                doc.data() as Map<String, dynamic>)
    ).toList();

    products.clear();
    products.assignAll(retrieveProducts);
  }catch(e){
    Get.snackbar('Error', e.toString(),colorText: Colors.red);

  }finally {
    update();
  }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      Get.snackbar('Deleted', 'Product Deleted ',colorText: Colors.red);
      fetchProducts();
    }catch(e){
      Get.snackbar('Error', e.toString(),colorText: Colors.red);
    }
  }



   setValuesDefault(){
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productImgCtrl.clear();
    productPriceCtrl.clear();

    String category = 'general';
    String brand = 'unbranded';
    bool offer = false ;

    update();
  }
  }