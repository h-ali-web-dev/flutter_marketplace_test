import 'package:flutter/material.dart';
import 'package:flutter_marketplace_test/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_marketplace_test/pocketbase_apis/apis.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';

class ImageUploadTest extends StatelessWidget {
  const ImageUploadTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text("test Post"),
        onPressed: () async {
          final record = await pb.collection('catalog').create(body: {
            'title': "test title",
            "price": 23,
            "sale": 0
          }, files: [
            // http.MultipartFile.fromBytes(field, value)
          ]);
        },
      ),
    );
  }
}

class ImageUploadPage extends StatefulWidget {
  ImageUploadPage() : super();

  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  File? selectedImage;
  var resJson;

  onUploadImage() async {
    final record = await pb.collection('catalog').create(body: {
      'title': "test title",
      "price": 23,
      "sale": 0
    }, files: [
      // http.MultipartFile.fromBytes(field, value)
      http.MultipartFile(
        'image',
        selectedImage!.readAsBytes().asStream(),
        selectedImage!.lengthSync(),
        filename: selectedImage!.path.split('/').last,
      ),
    ]);

    // var request = http.MultipartRequest(
    //   'POST',
    //   Uri.parse("Enter You API Url"),
    // );
    // Map<String, String> headers = {"Content-type": "multipart/form-data"};
    // request.files.add(
    //   http.MultipartFile(
    //     'image',
    //     selectedImage!.readAsBytes().asStream(),
    //     selectedImage!.lengthSync(),
    //     filename: selectedImage!.path.split('/').last,
    //   ),
    // );
    // request.headers.addAll(headers);
    // print("request: " + request.toString());
    // var res = await request.send();
    // http.Response response = await http.Response.fromStream(res);
    // setState(() {
    //   resJson = jsonDecode(response.body);
    // });
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
      appBar: AppBar(
        title: Text('Test Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImage == null
                ? Text(
                    'Please Pick a image to Upload',
                  )
                : Image.file(selectedImage!),
            ElevatedButton(
              onPressed: onUploadImage,
              child: Text(
                "Upload",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text('Empty Text')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Increment',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
