import 'package:flutter/material.dart';
import 'package:testwork/constants.dart';

class Cell extends StatelessWidget {
  final String initials;
  final String id;
  final String type;
  final String status;
  final String amount;

  const Cell({
    super.key, 
    required this.initials,
    required this.id,
    required this.type,
    required this.status,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 125,
      color: const Color(Constants.backgroundCode),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  initials,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(Constants.whiteCode),
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "id: $id",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(Constants.greyCode),
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "type: $type",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(Constants.greyCode),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "status: $status",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(Constants.greyCode),
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "amount: $amount",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(Constants.greyCode),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
