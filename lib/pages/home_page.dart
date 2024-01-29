import 'package:flutter/material.dart';
import 'package:footwear_admin/controller/home_controller.dart';
import 'package:footwear_admin/pages/add_product_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No data added yet.'));
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('FootWear Admin'),
          ),
        body: ctrl.products.isEmpty ? content : ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context,index){
              return   ListTile(title:  Text(ctrl.products[index].name ?? ''),
              subtitle:  Text((ctrl.products[index].price ?? 0).toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                   ctrl.deleteProduct(ctrl.products[index].id ?? '');
                  },
                ),
              );
        }),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              // if we are using gets management system then we can simply
              // run Get.to(AddProductPage())
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (ctx) => const AddProduct()
                  )
              );
            },
            child: const Icon(Icons.add),

          ),
        );
      }
    );
  }
}
