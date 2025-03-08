class SportsSchedule {
  final List<Schedule>? schedule;

  SportsSchedule({this.schedule});

  factory SportsSchedule.fromJson(Map<String, dynamic> json) {
    return SportsSchedule(
      schedule: json['schedule'] != null
          ? (json['schedule'] as List).map((e) => Schedule.fromJson(e)).toList()
          : null,
    );
  }
}

class Schedule {
  final String? idEvent;
  final String? idAPIfootball;
  final String? strEvent;
  final String? strEventAlternate;
  final String? strFilename;
  final String? strSport;
  final String? idLeague;
  final String? strLeague;
  final String? strLeagueBadge;
  final String? strSeason;
  final String? strDescriptionEN;
  final String? strHomeTeam;
  final String? strAwayTeam;
  final int? intHomeScore;
  final int? intAwayScore;
  final String? strTimestamp;
  final String? dateEvent;
  final String? dateEventLocal;
  final String? strTime;
  final String? strTimeLocal;
  final String? idHomeTeam;
  final String? strHomeTeamBadge;
  final String? idAwayTeam;
  final String? strAwayTeamBadge;
  final String? strVenue;
  final String? strCountry;
  final String? strPoster;
  final String? strThumb;
  final String? strBanner;
  final String? strStatus;
  final String? strPostponed;

  Schedule({
    this.idEvent,
    this.idAPIfootball,
    this.strEvent,
    this.strEventAlternate,
    this.strFilename,
    this.strSport,
    this.idLeague,
    this.strLeague,
    this.strLeagueBadge,
    this.strSeason,
    this.strDescriptionEN,
    this.strHomeTeam,
    this.strAwayTeam,
    this.intHomeScore,
    this.intAwayScore,
    this.strTimestamp,
    this.dateEvent,
    this.dateEventLocal,
    this.strTime,
    this.strTimeLocal,
    this.idHomeTeam,
    this.strHomeTeamBadge,
    this.idAwayTeam,
    this.strAwayTeamBadge,
    this.strVenue,
    this.strCountry,
    this.strPoster,
    this.strThumb,
    this.strBanner,
    this.strStatus,
    this.strPostponed,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      idEvent: json['idEvent'],
      idAPIfootball: json['idAPIfootball'],
      strEvent: json['strEvent'],
      strEventAlternate: json['strEventAlternate'],
      strFilename: json['strFilename'],
      strSport: json['strSport'],
      idLeague: json['idLeague'],
      strLeague: json['strLeague'],
      strLeagueBadge: json['strLeagueBadge'],
      strSeason: json['strSeason'],
      strDescriptionEN: json['strDescriptionEN'],
      strHomeTeam: json['strHomeTeam'],
      strAwayTeam: json['strAwayTeam'],
      intHomeScore: json['intHomeScore'],
      intAwayScore: json['intAwayScore'],
      strTimestamp: json['strTimestamp'],
      dateEvent: json['dateEvent'],
      dateEventLocal: json['dateEventLocal'],
      strTime: json['strTime'],
      strTimeLocal: json['strTimeLocal'],
      idHomeTeam: json['idHomeTeam'],
      strHomeTeamBadge: json['strHomeTeamBadge'],
      idAwayTeam: json['idAwayTeam'],
      strAwayTeamBadge: json['strAwayTeamBadge'],
      strVenue: json['strVenue'],
      strCountry: json['strCountry'],
      strPoster: json['strPoster'],
      strThumb: json['strThumb'],
      strBanner: json['strBanner'],
      strStatus: json['strStatus'],
      strPostponed: json['strPostponed'],
    );
  }
}
