class Highlight {
  final String? strEvent;
  final String? dateEvent;
  final String? strTime;
  final String? strSport;
  final String? strCountry;
  final String? idHomeTeam;
  final String? idAwayTeam;
  final String? strHomeTeamBadge;
  final String? strAwayTeamBadge;
  final String? strHomeTeam;
  final String? strAwayTeam;
  final String? intHomeScore;
  final String? intAwayScore;
  final String? strLeagueBadge;
  final String? strVideo;

  Highlight({
    this.strEvent,
    this.dateEvent,
    this.strTime,
    this.strSport,
    this.strCountry,
    this.idHomeTeam,
    this.idAwayTeam,
    this.strHomeTeamBadge,
    this.strAwayTeamBadge,
    this.strHomeTeam,
    this.strAwayTeam,
    this.intHomeScore,
    this.intAwayScore,
    this.strLeagueBadge,
    this.strVideo,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      strEvent: json['strEvent'] as String?,
      dateEvent: json['dateEvent'] as String?,
      strTime: json['strTime'] as String?,
      strSport: json['strSport'] as String?,
      strCountry: json['strCountry'] as String?,
      idHomeTeam: json['idHomeTeam'] as String?,
      idAwayTeam: json['idAwayTeam'] as String?,
      strHomeTeamBadge: json['strHomeTeamBadge'] as String?,
      strAwayTeamBadge: json['strAwayTeamBadge'] as String?,
      strHomeTeam: json['strHomeTeam'] as String?,
      strAwayTeam: json['strAwayTeam'] as String?,
      intHomeScore: json['intHomeScore'] as String?,
      intAwayScore: json['intAwayScore'] as String?,
      strLeagueBadge: json['strLeagueBadge'] as String?,
      strVideo: json['strVideo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strEvent': strEvent,
      'dateEvent': dateEvent,
      'strTime': strTime,
      'strSport': strSport,
      'strCountry': strCountry,
      'idHomeTeam': idHomeTeam,
      'idAwayTeam': idAwayTeam,
      'strHomeTeamBadge': strHomeTeamBadge,
      'strAwayTeamBadge': strAwayTeamBadge,
      'strHomeTeam': strHomeTeam,
      'strAwayTeam': strAwayTeam,
      'intHomeScore': intHomeScore,
      'intAwayScore': intAwayScore,
      'strLeagueBadge': strLeagueBadge,
      'strVideo': strVideo,
    };
  }
}

class MatchResponse {
  final List<Highlight>? result;

  MatchResponse({this.result});

  factory MatchResponse.fromJson(Map<String, dynamic> json) {
    return MatchResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result?.map((e) => e.toJson()).toList(),
    };
  }
}
