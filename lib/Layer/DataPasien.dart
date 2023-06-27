import 'package:flutter/material.dart';

class MyDataPasien extends StatefulWidget {
  const MyDataPasien({super.key});

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
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black)),
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
          tabs: _tabs.map((String tab) {
            return Tab(
              text: tab,
            );
          }).toList(),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 0, 0),
              child: Text("A"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListTile(
                title: Row(
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.person)),
                    Expanded(flex: 5, child: Text("Asri Azhari")),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )))
                  ],
                ),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
