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
  });

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      strEvent: json['strEvent'],
      dateEvent: json['dateEvent'],
      strTime: json['strTime'],
      strSport: json['strSport'],
      strCountry: json['strCountry'],
      idHomeTeam: json['idHomeTeam'],
      idAwayTeam: json['idAwayTeam'],
      strHomeTeamBadge: json['strHomeTeamBadge'],
      strAwayTeamBadge: json['strAwayTeamBadge'],
      strHomeTeam: json['strHomeTeam'],
      strAwayTeam: json['strAwayTeam'],
      intHomeScore: json['intHomeScore'],
      intAwayScore: json['intAwayScore'],
      strLeagueBadge: json['strLeagueBadge'],
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
