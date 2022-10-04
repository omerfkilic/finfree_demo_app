import 'package:finfree_demo_app/core/models/price_model.dart';
import 'package:finfree_demo_app/core/services/finfree_api/finfree_api.dart';
import 'package:finfree_demo_app/pages/home_page/view_mode/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageViewModel viewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = HomePageViewModel.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akbank'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          viewModel.getData();
        },
      ),
    );
  }
}
