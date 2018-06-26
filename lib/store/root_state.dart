import "package:meta/meta.dart";
import "./model/topic.dart";


@immutable
class RootState {
  final bool isLoading;
  final List<Topic> topics;
  final Map topicsOfCategory;
  final Topic topic;

  RootState({
    this.isLoading = false,
    this.topics = const [],
    this.topicsOfCategory = const {
      "": {
        "label": "全部",
        "currentPage": 1,
        "list": []
      },
      "good": {
        "label": "精华",
        "currentPage": 1,
        "list": []
      },
      "share": {
        "label": "分享",
        "currentPage": 1,
        "list": []
      },
      "job": {
        "label": "招聘",
        "currentPage": 1,
        "list": []
      }
    },
    this.topic = const Topic()
  });

  static RootState fromJson(dynamic json) {
    return RootState(
      isLoading: json['isLoading'],
      // topicsOfCategory: json['topicsOfCategory']
    );
  }

  dynamic toJson() {
    return {
      'isLoading': isLoading,
      // topicsOfCategory: topicsOfCategory
    };
  }
}