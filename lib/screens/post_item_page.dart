import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PostItemPage extends StatefulWidget {
  PostItemPage({super.key});

  @override
  State<PostItemPage> createState() => _PostItemPageState();
}

class _PostItemPageState extends State<PostItemPage> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final saleController = TextEditingController();
  File? selectedImage;

  onUploadImage() async {
    await pb.collection('catalog').create(
      body: {
        'title': titleController.text,
        "price": priceController.text,
        "sale": saleController.text,
      },
      files: [
        http.MultipartFile(
          'image',
          selectedImage!.readAsBytes().asStream(),
          selectedImage!.lengthSync(),
          filename: selectedImage!.path.split('/').last,
        ),
      ],
    );
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          margin: context.isTablet
              ? EdgeInsets.symmetric(horizontal: 100)
              : EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Enter Item Details", style: TextStyle(fontSize: 24)),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'title',
                  icon: Icon(Icons.short_text_sharp),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                keyboardType: TextInputType.number,
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'price',
                  icon: Icon(Icons.monetization_on),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextField(
                keyboardType: TextInputType.number,
                controller: saleController,
                decoration: InputDecoration(
                  labelText: 'sale',
                  icon: Icon(Icons.attach_money),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ListTile(
                onTap: getImage,
                leading: Icon(Icons.photo_size_select_actual),
                title: Text("Select Picture"),
              ),
              ElevatedButton(
                onPressed: onUploadImage,
                child: Text(
                  "Upload",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
