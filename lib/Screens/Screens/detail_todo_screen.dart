import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/Components/custom_detail_appbar.dart';
import 'package:to_do_list/Constants/constats.dart';

import '../../Model/Todo Models/upload_image.dart';

class DetailsToDoScreen extends StatefulWidget {
  final int taskId;
  final Map<String, dynamic> todo;
  const DetailsToDoScreen({
    super.key,
    required this.taskId,
    required this.todo,
  });

  @override
  State<DetailsToDoScreen> createState() => _DetailsToDoScreenState();
}

class _DetailsToDoScreenState extends State<DetailsToDoScreen> {
  String? imageUrl;
  // to save image is cache
  Future<void> saveImageLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imageUrl = prefs.getString(widget.todo['image']);
    });
    if (imageUrl == null) {
      fetchImageFromFirebase();
    }
  }

  Future<void> fetchImageFromFirebase() async {
    try {
      String url = await getImageFromFirebase(widget.todo['image']);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(widget.todo['image'], url);

      setState(() {
        imageUrl = url;
      });
    } catch (e) {
      print('Error fetching image URL: $e');
    }
  }

  Future<String?> getImageUrl(String imagePath) async {
    try {
      return await getImageFromFirebase(imagePath);
    } catch (e) {
      print("Error fetching image URL: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      appBar: DetailsScreenAppbar(
        taskId: widget.taskId,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.todo["title"],
                style: detaliTitleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.todo['description'],
                style: primaryStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              if (widget.todo['image'] != null)
                FutureBuilder<String?>(
                  future: getImageUrl(widget.todo['image']),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      );
                    } else if (snapshot.hasError || snapshot.data == null) {
                      return Center(
                        child: Text(
                          "${snapshot.error ?? 'Image not found'}",
                          style: detaliTitleStyle,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Image.network(
                            snapshot.data!,
                            fit: BoxFit.fill,
                          ));
                    } else {
                      return const Text("Image is not available");
                    }
                  },
                )
              else
                Center(
                  child: Text(
                    "Image is Not Uploaded",
                    style: detaliTitleStyle,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
