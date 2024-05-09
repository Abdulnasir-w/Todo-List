import 'package:flutter/material.dart';
import 'package:to_do_list/Components/custom_detail_appbar.dart';
import 'package:to_do_list/Constants/constats.dart';
import 'package:to_do_list/Model/Todo%20Models/upload_image.dart';

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
  bool isLoading = true;
  String? imageUrl;
  String? error;

  void loadImage() async {
    try {
      if (widget.todo['image'] != null) {
        final imageUrlName = await getImageFromFirebase(widget.todo['image']);
        setState(() {
          imageUrl = imageUrlName;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = "Failed to load image: ${e.toString()}";
        isLoading = false;
      });
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
                height: 20,
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                )
              else if (error != null)
                Text(
                  error!,
                  style: TextStyle(color: Colors.red),
                )
              else if (imageUrl != null)
                Image.network(imageUrl!)
              else
                Text("Image is Not available"),
              // if (todo['image'] != null)
              //   FutureBuilder<String>(
              //     future: getImageFromFirebase(todo['image']),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(
              //           child: CircularProgressIndicator(
              //             valueColor:
              //                 AlwaysStoppedAnimation<Color>(Colors.black),
              //           ),
              //         );
              //       } else if (snapshot.hasError) {
              //         print("Error ${snapshot.hasError}");
              //         return Text("Error ${snapshot.hasError}");
              //       } else if (snapshot.hasData) {
              //         return Image.network(snapshot.data!);
              //       } else {
              //         return const Text("Image is Not available");
              //       }
              //     },
              //   )
              // else
              //   Center(
              //     child: Text(
              //       "Image is Not Uploaded",
              //       style: detaliTitleStyle,
              //     ),
              //   )
            ],
          ),
        ),
      ),
    );
  }
}
