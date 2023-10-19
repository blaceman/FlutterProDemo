part of models;

class DownloadModel {
  DownloadModel({
    this.id,
    this.name,
    this.category,
    this.cover,
  });

  String? id;
  String? name;
  String? category;
  String? cover;

  DownloadModel.fromJson(dynamic json) {
    id = json['id']?.toString();
    name = json['name'];
    category = json['categoryName'];
    cover = json['coverPicFullName'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['categoryName'] = category;
    map['coverPicFullName'] = cover;
    return map;
  }
}

class TrainContent {
  TrainContent({
    this.id,
    this.name,
    this.isFinish,
  });

  TrainContent.fromJson(dynamic json) {
    id = json['id'].toString();
    name = json['name'];
    isFinish = json['isFinish'];
  }

  String? id;
  String? name;
  bool? isFinish;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['isFinish'] = isFinish;
    return map;
  }
}

// /train/stats/training-study-data
class TrainingStudyData {
  TrainingStudyData({
    this.hours,
    this.minutes,
    this.seconds,
    this.studyCourseCount,
    this.completeCourseCount,
    this.courseCompleteRate,
  });

  TrainingStudyData.fromJson(dynamic json) {
    hours = json['hours'].toString();
    minutes = json['minutes'].toString();
    seconds = json['seconds'].toString();
    studyCourseCount = json['studyCourseCount'].toString();
    completeCourseCount = json['completeCourseCount'].toString();
    courseCompleteRate = json['courseCompleteRate'].toString();
  }

  String? hours;
  String? minutes;
  String? seconds;

  String? studyCourseCount;
  String? completeCourseCount;
  String? courseCompleteRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hours'] = hours;
    map['minutes'] = minutes;
    map['seconds'] = seconds;

    map['studyCourseCount'] = studyCourseCount;
    map['completeCourseCount'] = completeCourseCount;
    map['courseCompleteRate'] = courseCompleteRate;
    return map;
  }
}

class TrainingExamData {
  TrainingExamData({
    this.takeExamTimes,
    this.passExamTimes,
    this.examPassRate,
  });

  TrainingExamData.fromJson(dynamic json) {
    takeExamTimes = json['takeExamTimes'].toString();
    passExamTimes = json['passExamTimes'].toString();
    examPassRate = json['examPassRate'].toString();
  }

  String? takeExamTimes;
  String? passExamTimes;
  String? examPassRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['takeExamTimes'] = takeExamTimes;
    map['passExamTimes'] = passExamTimes;
    map['examPassRate'] = examPassRate;
    return map;
  }
}

///train/stats/interactive-active-data
class TrainingInteractiveActiveData {
  TrainingInteractiveActiveData({
    this.commentCourseCount,
    this.favoriteCourseCount,
  });

  TrainingInteractiveActiveData.fromJson(dynamic json) {
    commentCourseCount = json['commentCourseCount'].toString();
    favoriteCourseCount = json['favoriteCourseCount'].toString();
  }

  String? commentCourseCount;
  String? favoriteCourseCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['commentCourseCount'] = commentCourseCount;
    map['favoriteCourseCount'] = favoriteCourseCount;
    return map;
  }
}
