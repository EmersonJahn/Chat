import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage(this.data, this.isMine);

  final Map<String, dynamic> data;

  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          !isMine ?
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl']),
            ),
          ) : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                data['imgUrl'] != null ? 
                Image.network(
                  data['imgUrl'],
                  width: 250,
                ) : 
                Text(
                  data['text'],
                  textAlign: isMine ? TextAlign.end : TextAlign.start,
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                Text(
                  data['senderName'],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            )
          ),
          isMine ?
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl']),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}