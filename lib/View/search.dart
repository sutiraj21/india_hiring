import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;
  List<String> items = [
    "Nike Shoes",
    "Adidas Sneakers",
    "Puma Classic",
    "Reebok Runner",
    "New Balance 550",
    "Air Jordan 1",
    "Vans Old Skool",
    "Converse Chuck Taylor"
  ];
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    _searchController.addListener(_filterList);
  }

  void _filterList() {
    setState(() {
      filteredItems = items
          .where((item) =>
          item.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        _searchController.clear();
        filteredItems = items;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        )
            : const Text("Search Products"),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[900],
            child: ListTile(
              title: Text(filteredItems[index],
                  style: const TextStyle(color: Colors.white)),
              leading: const Icon(Icons.shopping_bag, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
