class SportsSchedule {
  final List<Schedule> schedule;

  SportsSchedule({required this.schedule});

  factory SportsSchedule.fromJson(Map<String, dynamic> json) {
    return SportsSchedule(
      schedule: (json['schedule'] as List<dynamic>?)
              ?.map((e) => Schedule.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class Schedule {
  final String idEvent;
  final String idAPIfootball;
  final String strEvent;
  final String strEventAlternate;
  final String strFilename;
  final String strSport;
  final String idLeague;
  final String strLeague;
  final String strLeagueBadge;
  final String strSeason;
  final String strDescriptionEN;
  final String strHomeTeam;
  final String strAwayTeam;
  final int? intHomeScore;
  final int? intAwayScore;
  final String strTimestamp;
  final String dateEvent;
  final String? dateEventLocal;
  final String strTime;
  final String? strTimeLocal;
  final String idHomeTeam;
  final String strHomeTeamBadge;
  final String idAwayTeam;
  final String strAwayTeamBadge;
  final String strVenue;
  final String strCountry;
  final String strPoster;
  final String strThumb;
  final String strBanner;
  final String strStatus;
  final String strPostponed;

  Schedule({
    required this.idEvent,
    required this.idAPIfootball,
    required this.strEvent,
    required this.strEventAlternate,
    required this.strFilename,
    required this.strSport,
    required this.idLeague,
    required this.strLeague,
    required this.strLeagueBadge,
    required this.strSeason,
    required this.strDescriptionEN,
    required this.strHomeTeam,
    required this.strAwayTeam,
    this.intHomeScore,
    this.intAwayScore,
    required this.strTimestamp,
    required this.dateEvent,
    this.dateEventLocal,
    required this.strTime,
    this.strTimeLocal,
    required this.idHomeTeam,
    required this.strHomeTeamBadge,
    required this.idAwayTeam,
    required this.strAwayTeamBadge,
    required this.strVenue,
    required this.strCountry,
    required this.strPoster,
    required this.strThumb,
    required this.strBanner,
    required this.strStatus,
    required this.strPostponed,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      idEvent: json['idEvent'] ?? '', 
      idAPIfootball: json['idAPIfootball'] ?? '',
      strEvent: json['strEvent'] ?? '',
      strEventAlternate: json['strEventAlternate'] ?? '',
      strFilename: json['strFilename'] ?? '',
      strSport: json['strSport'] ?? '',
      idLeague: json['idLeague'] ?? '',
      strLeague: json['strLeague'] ?? '',
      strLeagueBadge: json['strLeagueBadge'] ?? '',
      strSeason: json['strSeason'] ?? '',
      strDescriptionEN: json['strDescriptionEN'] ?? '',
      strHomeTeam: json['strHomeTeam'] ?? '',
      strAwayTeam: json['strAwayTeam'] ?? '',
      intHomeScore: json['intHomeScore'] != null
          ? int.tryParse(json['intHomeScore'].toString())
          : null,
      intAwayScore: json['intAwayScore'] != null
          ? int.tryParse(json['intAwayScore'].toString())
          : null,
      strTimestamp: json['strTimestamp'] ?? '',
      dateEvent: json['dateEvent'] ?? '',
      dateEventLocal: json['dateEventLocal'],
      strTime: json['strTime'] ?? '',
      strTimeLocal: json['strTimeLocal'],
      idHomeTeam: json['idHomeTeam'] ?? '',
      strHomeTeamBadge: json['strHomeTeamBadge'] ?? '',
      idAwayTeam: json['idAwayTeam'] ?? '',
      strAwayTeamBadge: json['strAwayTeamBadge'] ?? '',
      strVenue: json['strVenue'] ?? '',
      strCountry: json['strCountry'] ?? '',
      strPoster: json['strPoster'] ?? '',
      strThumb: json['strThumb'] ?? '',
      strBanner: json['strBanner'] ?? '',
      strStatus: json['strStatus'] ?? '',
      strPostponed: json['strPostponed'] ?? '',
    );
  }
}
