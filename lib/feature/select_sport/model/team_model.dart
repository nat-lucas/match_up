class Team2 {
  final String idTeam;
  final String? idESPN;
  final String? idAPIfootball;
  final String? intLoved;
  final String strTeam;
  final String? strTeamAlternate;
  final String? strTeamShort;
  final String? intFormedYear;
  final String? strSport;
  final String? strLeague;
  final String? idLeague;
  final String? strLeague2;
  final String? idLeague2;
  final String? strLeague3;
  final String? idLeague3;
  final String? strLeague4;
  final String? idLeague4;
  final String? strDivision;
  final String? idVenue;
  final String? strStadium;
  final String? strLocation;
  final String? intStadiumCapacity;
  final String? strWebsite;
  final String? strFacebook;
  final String? strTwitter;
  final String? strInstagram;
  final String? strDescriptionEN;
  final String? strColour1;
  final String? strColour2;
  final String? strGender;
  final String? strCountry;
  final String? strBadge;
  final String? strLogo;
  final String? strFanart1;
  final String? strFanart2;
  final String? strFanart3;
  final String? strFanart4;
  final String? strBanner;
  final String? strEquipment;
  final String? strYoutube;

  Team2({
    required this.idTeam,
    this.idESPN,
    this.idAPIfootball,
    this.intLoved,
    required this.strTeam,
    this.strTeamAlternate,
    this.strTeamShort,
    this.intFormedYear,
    this.strSport,
    this.strLeague,
    this.idLeague,
    this.strLeague2,
    this.idLeague2,
    this.strLeague3,
    this.idLeague3,
    this.strLeague4,
    this.idLeague4,
    this.strDivision,
    this.idVenue,
    this.strStadium,
    this.strLocation,
    this.intStadiumCapacity,
    this.strWebsite,
    this.strFacebook,
    this.strTwitter,
    this.strInstagram,
    this.strDescriptionEN,
    this.strColour1,
    this.strColour2,
    this.strGender,
    this.strCountry,
    this.strBadge,
    this.strLogo,
    this.strFanart1,
    this.strFanart2,
    this.strFanart3,
    this.strFanart4,
    this.strBanner,
    this.strEquipment,
    this.strYoutube,
  });

  factory Team2.fromJson(Map<String, dynamic> json) {
    return Team2(
      idTeam: json['idTeam'] ?? '',
      idESPN: json['idESPN'],
      idAPIfootball: json['idAPIfootball'],
      intLoved: json['intLoved'],
      strTeam: json['strTeam'] ?? '',
      strTeamAlternate: json['strTeamAlternate'],
      strTeamShort: json['strTeamShort'],
      intFormedYear: json['intFormedYear'],
      strSport: json['strSport'],
      strLeague: json['strLeague'],
      idLeague: json['idLeague'],
      strLeague2: json['strLeague2'],
      idLeague2: json['idLeague2'],
      strLeague3: json['strLeague3'],
      idLeague3: json['idLeague3'],
      strLeague4: json['strLeague4'],
      idLeague4: json['idLeague4'],
      strDivision: json['strDivision'],
      idVenue: json['idVenue'],
      strStadium: json['strStadium'],
      strLocation: json['strLocation'],
      intStadiumCapacity: json['intStadiumCapacity'],
      strWebsite: json['strWebsite'],
      strFacebook: json['strFacebook'],
      strTwitter: json['strTwitter'],
      strInstagram: json['strInstagram'],
      strDescriptionEN: json['strDescriptionEN'],
      strColour1: json['strColour1'],
      strColour2: json['strColour2'],
      strGender: json['strGender'],
      strCountry: json['strCountry'],
      strBadge: json['strBadge'],
      strLogo: json['strLogo'],
      strFanart1: json['strFanart1'],
      strFanart2: json['strFanart2'],
      strFanart3: json['strFanart3'],
      strFanart4: json['strFanart4'],
      strBanner: json['strBanner'],
      strEquipment: json['strEquipment'],
      strYoutube: json['strYoutube'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idTeam': idTeam,
      'idESPN': idESPN,
      'idAPIfootball': idAPIfootball,
      'intLoved': intLoved,
      'strTeam': strTeam,
      'strTeamAlternate': strTeamAlternate,
      'strTeamShort': strTeamShort,
      'intFormedYear': intFormedYear,
      'strSport': strSport,
      'strLeague': strLeague,
      'idLeague': idLeague,
      'strLeague2': strLeague2,
      'idLeague2': idLeague2,
      'strLeague3': strLeague3,
      'idLeague3': idLeague3,
      'strLeague4': strLeague4,
      'idLeague4': idLeague4,
      'strDivision': strDivision,
      'idVenue': idVenue,
      'strStadium': strStadium,
      'strLocation': strLocation,
      'intStadiumCapacity': intStadiumCapacity,
      'strWebsite': strWebsite,
      'strFacebook': strFacebook,
      'strTwitter': strTwitter,
      'strInstagram': strInstagram,
      'strDescriptionEN': strDescriptionEN,
      'strColour1': strColour1,
      'strColour2': strColour2,
      'strGender': strGender,
      'strCountry': strCountry,
      'strBadge': strBadge,
      'strLogo': strLogo,
      'strFanart1': strFanart1,
      'strFanart2': strFanart2,
      'strFanart3': strFanart3,
      'strFanart4': strFanart4,
      'strBanner': strBanner,
      'strEquipment': strEquipment,
      'strYoutube': strYoutube,
    };
  }
}
