import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Pasien_data.dart';

class MyDataPasien extends StatefulWidget {
  const MyDataPasien({Key? key}) : super(key: key);

  @override
  State<MyDataPasien> createState() => _MyDataPasienState();
}

class _MyDataPasienState extends State<MyDataPasien>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _tabs =
      List.generate(26, (index) => String.fromCharCode(65 + index));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length + 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataPasien providerDataPasien = Provider.of<DataPasien>(context);
    List<Map<String, String>> pasien = providerDataPasien.datapasien['pasien'];

    // Menyusun daftar pasien berdasarkan huruf pertama nama
    Map<String, List<Map<String, String>>> pasienByLetter = {};
    for (var data in pasien) {
      String nama = data['Nama'] ?? "";
      String firstLetter = nama.isNotEmpty ? nama[0].toUpperCase() : '';
      pasienByLetter[firstLetter] ??= [];
      pasienByLetter[firstLetter]!.add(data);
    }

    // Mengurutkan pasien berdasarkan huruf pertama secara alfabetis
    List<String> sortedLetters = pasienByLetter.keys.toList();
    sortedLetters.sort();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        title: Text(
          "Data Pasien",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          tabs: [
            Tab(text: 'All'),
            ..._tabs.map((String tab) {
              return Tab(text: tab);
            }).toList(),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: sortedLetters.length,
            itemBuilder: (BuildContext context, int index) {
              String letter = sortedLetters[index];
              List<Map<String, String>> pasienLetter = pasienByLetter[letter]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(letter),
                  ),
                  ...pasienLetter.map((data) {
                    String nama = data['Nama'] ?? "";
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            nama,
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text('100000001'),
                          leading: Icon(Icons.person),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                          ),
                          onTap: () {},
                        ),
                        Divider(), // Pemisah antara setiap item
                      ],
                    );
                  }).toList(),
                ],
              );
            },
          ),
          ..._tabs.map((String tab) {
            if (tab == 'All') {
              return SizedBox.shrink();
            } else {
              List<Map<String, String>> filteredPasien = pasien
                  .where((data) =>
                      data['Nama']!.isNotEmpty &&
                      data['Nama']![0].toUpperCase() == tab)
                  .toList();

              return ListView.builder(
                itemCount: filteredPasien.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return ListTile(
                      title: Text(tab),
                    );
                  } else {
                    String nama = filteredPasien[index - 1]['Nama'] ?? "";
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            nama,
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text('100000001'),
                          leading: Icon(Icons.person),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                          ),
                          onTap: () {},
                        ),
                        Divider(), // Pemisah antara setiap item
                      ],
                    );
                  }
                },
              );
            }
          }).toList(),
        ],
      ),
    );
  }
}
