class CellModel {
  String? initials;
  int? id;
  String? type;
  String? status;
  String? amount;

  CellModel(
      {required this.initials,
      required this.id,
      required this.type,
      required this.status,
      required this.amount});

  factory CellModel.fromJson(Map<String, dynamic> parsedJson) {
    return CellModel(
      initials: parsedJson["CONTACT_TITLE"],
      id: parsedJson["OFFER_ID"],
      type: parsedJson["OFFERS_TYPE_NAME"],
      status: parsedJson["STATUS_NAME"],
      amount: parsedJson["OFFER_SUM"],
    );
  }
}
