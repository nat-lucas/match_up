class LiveScore {
  final String idLiveScore;
  final String idEvent;
  final String strSport;
  final String idLeague;
  final String strLeague;
  final String idHomeTeam;
  final String idAwayTeam;
  final String strHomeTeam;
  final String strAwayTeam;
  final String? strHomeTeamBadge;
  final String? strAwayTeamBadge;
  final int? intHomeScore;
  final int? intAwayScore;
  final String? intEventScore;
  final String? intEventScoreTotal;
  final String? strStatus;
  final String? strProgress;
  final String? strEventTime;
  final String? dateEvent;
  final String? updated;

  LiveScore({
    required this.idLiveScore,
    required this.idEvent,
    required this.strSport,
    required this.idLeague,
    required this.strLeague,
    required this.idHomeTeam,
    required this.idAwayTeam,
    required this.strHomeTeam,
    required this.strAwayTeam,
    this.strHomeTeamBadge,
    this.strAwayTeamBadge,
    this.intHomeScore,
    this.intAwayScore,
    this.intEventScore,
    this.intEventScoreTotal,
    this.strStatus,
    this.strProgress,
    this.strEventTime,
    this.dateEvent,
    this.updated,
  });

  factory LiveScore.fromJson(Map<String, dynamic> json) {
    return LiveScore(
      idLiveScore: json['idLiveScore'] as String,
      idEvent: json['idEvent'] as String,
      strSport: json['strSport'] as String,
      idLeague: json['idLeague'] as String,
      strLeague: json['strLeague'] as String,
      idHomeTeam: json['idHomeTeam'] as String,
      idAwayTeam: json['idAwayTeam'] as String,
      strHomeTeam: json['strHomeTeam'] as String,
      strAwayTeam: json['strAwayTeam'] as String,
      strHomeTeamBadge: json['strHomeTeamBadge'] as String?,
      strAwayTeamBadge: json['strAwayTeamBadge'] as String?,
      intHomeScore: json['intHomeScore'] != null
          ? int.tryParse(json['intHomeScore'].toString())
          : 0,
      intAwayScore: json['intAwayScore'] != null
          ? int.tryParse(json['intAwayScore'].toString())
          : 0,
      intEventScore: json['intEventScore'] as String?,
      intEventScoreTotal: json['intEventScoreTotal'] as String?,
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
      'intEventScore': intEventScore,
      'intEventScoreTotal': intEventScoreTotal,
      'strStatus': strStatus,
      'strProgress': strProgress,
      'strEventTime': strEventTime,
      'dateEvent': dateEvent,
      'updated': updated,
    };
  }
}
