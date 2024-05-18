class MessageModel {
  static const String collectionName = 'Messages';

  String id;
  String content;
  int dateTime;
  String roomId;
  String senderName;
  String senderId;

  MessageModel(
      {this.id = '',
      required this.content,
      required this.dateTime,
      required this.roomId,
      required this.senderName,
      required this.senderId});
  MessageModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          content: json['content'],
          dateTime: json['dateTime'],
          roomId: json['roomId'],
          senderId: json['senderId'],
          senderName: json['senderName'],
        );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'dateTime': dateTime,
      'roomId': roomId,
      'senderId': senderId,
      'senderName': senderName,
    };
  }
}
