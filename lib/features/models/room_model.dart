class RoomModel {
  static const String collectionName = 'Rooms';
  String id;
  String roomName;
  String roomDescription;
  String catId;

  RoomModel(
      {this.id = '',
      required this.roomName,
      required this.roomDescription,
      required this.catId});
  RoomModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          roomName: json['roomName'],
          roomDescription: json['roomDescription'],
          catId: json['catId'],
        );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomName': roomName,
      'roomDescription': roomDescription,
      'catId': catId,
    };
  }
}
