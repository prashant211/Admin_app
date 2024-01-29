import 'package:flutter/material.dart';
import 'package:footwear_admin/controller/home_controller.dart';
import 'package:footwear_admin/pages/home_page.dart';
import 'package:footwear_admin/widget/drop_down.dart';
import 'package:get/get.dart';
class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Product'),
          ),
          body:   SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Add Product',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: ctrl.productNameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      label: const Text('Product Name'),
                      hintText: 'Enter your Product Name'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: ctrl.productDescriptionCtrl,
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Description'),
                        hintText: 'Enter your Product Description'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: ctrl.productImgCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Image Url'),
                        hintText: 'Enter your Image Url'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: ctrl.productPriceCtrl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        label: const Text('Price'),
                        hintText: 'Enter your Product Price'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(child: DropDownBtn(
                        items: const ['Boots','Shoe','Beach Shoe','High heels'],
                         onSelected: (selectedValue) {
                          ctrl.category = selectedValue ?? 'general';
                          ctrl.update();
                      },
                          selected: ctrl.category
                      ),
                      ),
                      Flexible(
                        child: DropDownBtn(
                          items: const ['Puma','Nike','Adidas','sparx'],
                          onSelected: (selectedValue) {
                            //using ?? to remove null error
                            ctrl.brand = selectedValue ?? 'unbranded';
                            ctrl.update();
                          },
                          selected: ctrl.brand,
                      ),
                      ),
                    ],
                  ),
                 const  SizedBox(height: 10,),
                  const Text('Offer Product ?'),
                  DropDownBtn(items: const ['True','False'],
                    onSelected: (selectedValue) {
                      ctrl.offer = selectedValue == 'True';
                      ctrl.update();
                      },
                         selected:ctrl.offer.toString(),
                      ),
                  const  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () {
                        ctrl.addProduct();
                        Get.off(const HomePage());
                      },style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white),
                      child:const Text('Add Product'),),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
