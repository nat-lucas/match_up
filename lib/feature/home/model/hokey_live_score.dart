class HockeyLiveScore {
  final String? idLiveScore;
  final String? idEvent;
  final String? strSport;
  final String? idLeague;
  final String? strLeague;
  final String? idHomeTeam;
  final String? idAwayTeam;
  final String? strHomeTeam;
  final String? strAwayTeam;
  final String? strHomeTeamBadge;
  final String? strAwayTeamBadge;
  final String? intHomeScore;
  final String? intAwayScore;
  final String? strStatus;
  final String? strProgress;
  final String? strEventTime;
  final String? dateEvent;
  final String? updated;

  HockeyLiveScore({
    this.idLiveScore,
    this.idEvent,
    this.strSport,
    this.idLeague,
    this.strLeague,
    this.idHomeTeam,
    this.idAwayTeam,
    this.strHomeTeam,
    this.strAwayTeam,
    this.strHomeTeamBadge,
    this.strAwayTeamBadge,
    this.intHomeScore,
    this.intAwayScore,
    this.strStatus,
    this.strProgress,
    this.strEventTime,
    this.dateEvent,
    this.updated,
  });

  factory HockeyLiveScore.fromJson(Map<String, dynamic> json) {
    return HockeyLiveScore(
      idLiveScore: json['idLiveScore'] as String?,
      idEvent: json['idEvent'] as String?,
      strSport: json['strSport'] as String?,
      idLeague: json['idLeague'] as String?,
      strLeague: json['strLeague'] as String?,
      idHomeTeam: json['idHomeTeam'] as String?,
      idAwayTeam: json['idAwayTeam'] as String?,
      strHomeTeam: json['strHomeTeam'] as String?,
      strAwayTeam: json['strAwayTeam'] as String?,
      strHomeTeamBadge: json['strHomeTeamBadge'] as String?,
      strAwayTeamBadge: json['strAwayTeamBadge'] as String?,
      intHomeScore: json['intHomeScore'] as String?,
      intAwayScore: json['intAwayScore'] as String?,
      strStatus: json['strStatus'] as String?,
      strProgress: json['strProgress'] as String?,
      strEventTime: json['strEventTime'] as String?,
      dateEvent: json['dateEvent'] as String?,
      updated: json['updated'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idLiveScore': idLiveScore,
      'idEvent': idEvent,
      'strSport': strSport,
      'idLeague': idLeague,
      'strLeague': strLeague,
      'idHomeTeam': idHomeTeam,
      'idAwayTeam': idAwayTeam,
      'strHomeTeam': strHomeTeam,
      'strAwayTeam': strAwayTeam,
      'strHomeTeamBadge': strHomeTeamBadge,
      'strAwayTeamBadge': strAwayTeamBadge,
      'intHomeScore': intHomeScore,
      'intAwayScore': intAwayScore,
      'strStatus': strStatus,
      'strProgress': strProgress,
      'strEventTime': strEventTime,
      'dateEvent': dateEvent,
      'updated': updated,
    };
  }
}
