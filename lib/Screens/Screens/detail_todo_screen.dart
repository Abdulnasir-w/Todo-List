import 'package:flutter/material.dart';
import 'package:to_do_list/Components/custom_detail_appbar.dart';
import 'package:to_do_list/Constants/constats.dart';

class DetailsToDoScreen extends StatelessWidget {
  const DetailsToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbg,
      appBar: const DetailsScreenAppbar(),
    );
  }
}
