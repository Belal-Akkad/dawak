import 'package:dawak/feature/department/data/dummy_data.dart';
import 'package:dawak/feature/department/models/department_model.dart';
import 'package:dawak/feature/department/presentation/widgets/department_body.dart';
import 'package:dawak/feature/department/presentation/widgets/department_header.dart';
import 'package:flutter/material.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({super.key});

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final TextEditingController searchController = TextEditingController();
  late List<DepartmentModel> filteredCategories;

  @override
  void initState() {
    super.initState();
    filteredCategories = departmentCategories;
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = searchController.text.trim();

    setState(() {
      if (query.isEmpty) {
        filteredCategories = departmentCategories;
      } else {
        filteredCategories = departmentCategories
            .where((category) => category.name.contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          DepartmentHeader(controller: searchController, onChanged: (_) {}),
          DepartmentBody(categories: filteredCategories),
        ],
      ),
    );
  }
}
