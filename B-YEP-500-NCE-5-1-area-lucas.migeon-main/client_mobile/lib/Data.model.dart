class SubData {
  final int id;
  final String title;
  final String description;

  const SubData({
    required this.id,
    required this.title,
    required this.description,
  });

  factory SubData.fromJson(Map<String, dynamic> json) => SubData(
      id: json['id'], title: json['title'], description: json['description']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}

class Data {
  final String title;
  final String actionService;
  final SubData action;
  final String reactionService;
  final SubData reaction;

  const Data({
    required this.title,
    required this.actionService,
    required this.action,
    required this.reactionService,
    required this.reaction,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json['title'],
        actionService: json['actionService'],
        action: SubData.fromJson(json['action']),
        reactionService: json['reactionService'],
        reaction: SubData.fromJson(json['reaction']),
      );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'actionService': actionService,
      'action': action.toJson(),
      'reactionService': reactionService,
      'reaction': reaction.toJson(),
    };
  }
}
