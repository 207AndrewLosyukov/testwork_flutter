import 'package:flutter/material.dart';
import 'package:testwork/cell.dart';
import 'package:testwork/constants.dart';
import 'package:testwork/network.dart';

class CellsScreen extends StatefulWidget {
  const CellsScreen({super.key});

  @override
  State<CellsScreen> createState() => _CellsScreenState();
}

class _CellsScreenState extends State<CellsScreen> {
  var networkService = NetworkService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(Constants.backgroundCode),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 60.0),
          child: Center(
            child: Text(
              "Список сделок",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(Constants.whiteCode),
                fontSize: 18,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 41.0, left: 16, right: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Список первых 12 сделок",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(Constants.greyCode),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          indent: 16,
          endIndent: 16,
          color: Color(
            Constants.greyCode,
          ),
        ),
        FutureBuilder(
            future: networkService.getHttpWithLimit(12),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Cell(
                            initials: snapshot.data[index].initials ?? "",
                            id: snapshot.data[index].id.toString(),
                            type: snapshot.data[index].type ?? "null",
                            status: snapshot.data[index].status ?? "",
                            amount: snapshot.data[index].amount ?? "",
                          ),
                          const Divider(
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                            color: Color(
                              Constants.greyCode,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            }),
      ]),
    );
  }
}
