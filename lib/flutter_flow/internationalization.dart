import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['de', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? deText = '',
    String? enText = '',
  }) =>
      [deText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'atsfyhzf': {
      'de': 'Willkommen, ',
      'en': '',
    },
    '3fn11tbb': {
      'de': '!',
      'en': '',
    },
    'uoorzfj9': {
      'de': '',
      'en': '',
    },
    'un8eurt0': {
      'de': ' Neuigkeiten!',
      'en': '',
    },
    '49bc9bk5': {
      'de': 'Verein verwalten ',
      'en': '',
    },
    'qf7doq2j': {
      'de': '',
      'en': '',
    },
    'xxbasmid': {
      'de': '',
      'en': '',
    },
    'm1kq5his': {
      'de': 'Mitglieder-Übersicht',
      'en': '',
    },
    'kkkzvvtd': {
      'de': 'Event erstellen',
      'en': '',
    },
    's2kt2poc': {
      'de': 'Ankündigung erstellen',
      'en': '',
    },
    'ineiigi9': {
      'de': 'Deine anstehenden Termine',
      'en': '',
    },
    'ugwu3oks': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageAuthentication
  {
    '2y7k81q5': {
      'de': 'Login zu myFightBase',
      'en': '',
    },
    'ih5vso5b': {
      'de': 'Email Address',
      'en': '',
    },
    '41g8e69u': {
      'de': 'Password',
      'en': '',
    },
    '2s53kky1': {
      'de': 'LOGIN',
      'en': '',
    },
    'nqzqja26': {
      'de': 'NOCH KEIN ACCOUNT? KLICKE HIER',
      'en': '',
    },
  },
  // PageRegisterAccount
  {
    'jqx97v76': {
      'de': 'Melde dich jetzt an! ',
      'en': '',
    },
    'o0fe1nzu': {
      'de': 'Werde Teil der FightBase-Community!',
      'en': '',
    },
    '5jw2zb1d': {
      'de': 'Du möchtest deinen Verein Registrieren?',
      'en': '',
    },
    '29kel4oz': {
      'de': 'Dann klicke ',
      'en': '',
    },
    'pubgbvwg': {
      'de': 'HIER',
      'en': '',
    },
    'yw8in50h': {
      'de': 'Email',
      'en': '',
    },
    '4y9wlru1': {
      'de': 'Vorname',
      'en': '',
    },
    'f8aj090t': {
      'de': 'Nachname',
      'en': '',
    },
    '4wkqhyjm': {
      'de': 'Passwort',
      'en': '',
    },
    '7ranwert': {
      'de': 'Passwort bestätigen',
      'en': '',
    },
    'is9z9nov': {
      'de': 'Jetzt registrieren',
      'en': '',
    },
    'i3lkoebe': {
      'de': 'Du hast bereits einen Account? ',
      'en': '',
    },
    '8m5ky68r': {
      'de': 'EINLOGGEN',
      'en': '',
    },
    'o6a5hv6k': {
      'de': 'register',
      'en': '',
    },
  },
  // PageAllUsers
  {
    'v9z674th': {
      'de': 'Mitglieder finden',
      'en': '',
    },
    'jjuwwrv3': {
      'de': 'Aktuelle Nutzer',
      'en': '',
    },
    'xsorwxab': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageUserProfile
  {
    'ai6p6msj': {
      'de': 'Folgt',
      'en': '',
    },
    '3wnfho77': {
      'de': 'Gefolgt',
      'en': '',
    },
    '7bca8gqa': {
      'de': 'Mitglieder',
      'en': '',
    },
    'bmf3szcp': {
      'de': 'Gewicht',
      'en': '',
    },
    'im0tx9r6': {
      'de': '100 kg',
      'en': '',
    },
    '0bkcizu3': {
      'de': 'Größe',
      'en': '',
    },
    'g57oejja': {
      'de': '190 cm',
      'en': '',
    },
    'e5s6f6fy': {
      'de': 'Klasse.',
      'en': '',
    },
    '8mxjull5': {
      'de': 'Kl. 2',
      'en': '',
    },
    'ujoru28d': {
      'de': 'Über Mich',
      'en': '',
    },
    'n73r47xu': {
      'de': 'Logged in as Organization:',
      'en': '',
    },
    'kcu96cm9': {
      'de': 'user is member:',
      'en': '',
    },
    'n5qlnzta': {
      'de': 'user is followed:',
      'en': '',
    },
    'otnbma66': {
      'de': 'user is blocked:',
      'en': '',
    },
    'e21ngn2i': {
      'de': 'My Profile',
      'en': '',
    },
  },
  // PageUserProfileEdit
  {
    '2vc2yw13': {
      'de': 'Anzeigenamen ändern:',
      'en': '',
    },
    'dvdg4n5m': {
      'de': 'Deine E-Mail ändern:',
      'en': '',
    },
    '6rpvk01y': {
      'de': 'Deine Beschreibung ändern (\"Über Mich\"):',
      'en': '',
    },
    'hjmm127f': {
      'de': 'Deinen Vornamen ändern:',
      'en': '',
    },
    '3fg1f6kf': {
      'de': 'Deinen Nachnamen ändern:',
      'en': '',
    },
    'gzmbpvzg': {
      'de': 'Größe (cm)',
      'en': '',
    },
    'gvr41k9u': {
      'de': 'Gewicht (kg)',
      'en': '',
    },
    '9b138qlw': {
      'de': 'Änderungen Speichern',
      'en': '',
    },
    '0ch06llk': {
      'de': 'My Profile',
      'en': '',
    },
  },
  // PageEventDetails
  {
    'bmzm934r': {
      'de': 'Veranstaltet von:',
      'en': '',
    },
    'qovv0udx': {
      'de': 'Event Location',
      'en': '',
    },
    'pxo09dai': {
      'de': '💵 Teilnahmegebühr: ',
      'en': '',
    },
    'grlzt8kt': {
      'de': '🎫 Registrierung: ',
      'en': '',
    },
    '2aipa885': {
      'de': 'Parking',
      'en': '',
    },
    '5waxe6z9': {
      'de': '249 spots remaining',
      'en': '',
    },
    'hl5ydqli': {
      'de': 'Erstellt am:',
      'en': '',
    },
    'h0zq2bbv': {
      'de': ' ',
      'en': '',
    },
    'uhylh40z': {
      'de': 'Friends attending',
      'en': '',
    },
    'a6dm8g6w': {
      'de': 'Teilenehmen',
      'en': '',
    },
    's6e7bdg4': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageSocialPostDetails
  {
    'wtg5dien': {
      'de': '3',
      'en': '',
    },
    'ekndmvr6': {
      'de': 'likes',
      'en': '',
    },
    'u9bt5l36': {
      'de': 'Kommentare',
      'en': '',
    },
    '2skgwlex': {
      'de': 'Sandra Smith',
      'en': '',
    },
    'tzz0x5jt': {
      'de':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'en': '',
    },
    'aon5zijn': {
      'de': 'a min ago',
      'en': '',
    },
    'ht6z7ka7': {
      'de': 'Kommentieren',
      'en': '',
    },
    '60v0uccx': {
      'de': 'Kanal',
      'en': '',
    },
  },
  // PageSocialPosts
  {
    '6m2edmgg': {
      'de': 'Feed',
      'en': '',
    },
  },
  // PageRegisterAccountOrganization
  {
    'alp47ds7': {
      'de': 'Verein registrieren',
      'en': '',
    },
    '3g2knetn': {
      'de': 'Registriere deinen Verein bei FightBase!',
      'en': '',
    },
    'xggj0iil': {
      'de': 'Email',
      'en': '',
    },
    'sngaxk08': {
      'de': 'Vereinsname',
      'en': '',
    },
    '26wz9qnl': {
      'de': 'Sportverein',
      'en': '',
    },
    'l2cyz1kd': {
      'de': 'Fitnessstudio',
      'en': '',
    },
    'aguos8jn': {
      'de': 'Gemeinnütziger Verein',
      'en': '',
    },
    'q17h4rct': {
      'de': 'Art des Vereins',
      'en': '',
    },
    'mqttin0v': {
      'de': 'Search for an item...',
      'en': '',
    },
    'zootyrqr': {
      'de': 'Password',
      'en': '',
    },
    'fr1vxkf2': {
      'de': 'Confirm Password',
      'en': '',
    },
    'ksm3qwav': {
      'de': 'Jetzt registrieren',
      'en': '',
    },
    '1btiv7p1': {
      'de': 'Du hast bereits einen Account? ',
      'en': '',
    },
    'zaggneow': {
      'de': 'EINLOGGEN',
      'en': '',
    },
    'dy9edlnr': {
      'de': 'register',
      'en': '',
    },
  },
  // PageUsersFollows
  {
    '201bx54c': {
      'de': 'Search members...',
      'en': '',
    },
    'q432j8df': {
      'de': 'Folgt folgenden Nutzern: ',
      'en': '',
    },
    's6ofzc24': {
      'de': 'Kontakte',
      'en': '',
    },
  },
  // PageEvents
  {
    'a76wo9p2': {
      'de': 'Feed',
      'en': '',
    },
  },
  // PageUserSearch
  {
    '9f4n17av': {
      'de': 'Namen eingeben',
      'en': '',
    },
    'b8uzh1kg': {
      'de': 'Suchergebnisse:',
      'en': '',
    },
    'gfsoiwv9': {
      'de': 'Meine Vereinsmitglieder',
      'en': '',
    },
    'fhq0sv09': {
      'de': 'DEBUG: Show ALL Users',
      'en': '',
    },
    's6usgov0': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageAddUsersToChat
  {
    'bhe8hpzf': {
      'de': 'Gruppenchat erstellen',
      'en': '',
    },
    'qccsjtes': {
      'de': 'Wähle Nutzer für einen Gruppenchat aus',
      'en': '',
    },
    'lor00mb8': {
      'de': 'Nutzer einladen',
      'en': '',
    },
  },
  // PageAllChats
  {
    'du8jc3pj': {
      'de': 'Nachrichten',
      'en': '',
    },
  },
  // PageUsersFollowers
  {
    'pva86e55': {
      'de': 'Search members...',
      'en': '',
    },
    'tftx0doy': {
      'de': 'Folgende Nutzer folgen diesem Profil: ',
      'en': '',
    },
    'j6l9lhot': {
      'de': 'Kontakte',
      'en': '',
    },
  },
  // PageCreateGroupChat
  {
    '7ojdabi7': {
      'de': 'Gruppenchat erstellen',
      'en': '',
    },
    'kl0um4yz': {
      'de': 'Wähle Nutzer für einen Gruppenchat aus',
      'en': '',
    },
    'tv4f2a54': {
      'de': 'Bitte einen Gruppennamen vergeben...',
      'en': '',
    },
    'cgp4r85d': {
      'de': 'Gruppenchat erstellen',
      'en': '',
    },
  },
  // PageNotifications
  {
    '5d6xj1yz': {
      'de': 'Annehmen',
      'en': '',
    },
    '4kt4veyk': {
      'de': 'Ablehnen',
      'en': '',
    },
    'rsoaivy0': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageUsersMember
  {
    '3bti2i3x': {
      'de': 'Vereinsmitglieder',
      'en': '',
    },
    'axu2x6c2': {
      'de': 'Search members...',
      'en': '',
    },
    '6fnajd9b': {
      'de': 'Mitglieder in diesem Verein: ',
      'en': '',
    },
    'alxmfyyy': {
      'de': 'Kontakte',
      'en': '',
    },
  },
  // PageManageMembers
  {
    'f3zuzhfd': {
      'de': 'Vereinsmitglieder',
      'en': '',
    },
    '3jxfzl70': {
      'de': 'Sticky Header Three',
      'en': '',
    },
    'yd7plfib': {
      'de': 'A',
      'en': '',
    },
    'zjw3dsmo': {
      'de': 'List Item',
      'en': '',
    },
    'lh2fano3': {
      'de': 'A',
      'en': '',
    },
    'az2ze2c9': {
      'de': 'List Item',
      'en': '',
    },
    'nrxvm0ft': {
      'de': 'A',
      'en': '',
    },
    'nitdynd9': {
      'de': 'List Item',
      'en': '',
    },
    'pcki6q8a': {
      'de': 'A',
      'en': '',
    },
    'xyqri7xo': {
      'de': 'List Item',
      'en': '',
    },
    'vxfs7kbg': {
      'de': 'A',
      'en': '',
    },
    '7t8jp1et': {
      'de': 'List Item',
      'en': '',
    },
    'x1q9hckh': {
      'de': 'Sticky Header Four',
      'en': '',
    },
    'bszx3fwy': {
      'de': 'A',
      'en': '',
    },
    '7xtt2c4a': {
      'de': 'List Item',
      'en': '',
    },
    'cdl8eimb': {
      'de': 'A',
      'en': '',
    },
    'gibvuz2x': {
      'de': 'List Item',
      'en': '',
    },
    'suhid20l': {
      'de': 'A',
      'en': '',
    },
    '1snrf3ik': {
      'de': 'List Item',
      'en': '',
    },
    'jooqbuto': {
      'de': 'A',
      'en': '',
    },
    'oar3vq0a': {
      'de': 'List Item',
      'en': '',
    },
    '2j4mcws2': {
      'de': 'A',
      'en': '',
    },
    'xpavq7if': {
      'de': 'List Item',
      'en': '',
    },
    '5t9ls71y': {
      'de': 'A',
      'en': '',
    },
    'lj6zzcd2': {
      'de': 'List Item',
      'en': '',
    },
    'lcpavpb4': {
      'de': 'Mitglieder',
      'en': '',
    },
    'u59nv8kh': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageOrgProfileEdit
  {
    'neg9izhi': {
      'de': 'Anzeigenamen ändern:',
      'en': '',
    },
    'ubwu8z3k': {
      'de': 'Deine E-Mail ändern:',
      'en': '',
    },
    'q5g98ge4': {
      'de': 'Deine Beschreibung ändern (\"Über Mich\"):',
      'en': '',
    },
    't04xfidk': {
      'de': 'Adresse ändern:',
      'en': '',
    },
    'gtxmhwgr': {
      'de': 'Telefonnummer: ',
      'en': '',
    },
    'f3cqgnub': {
      'de': 'Änderungen Speichern',
      'en': '',
    },
    'li1hbkdj': {
      'de': 'My Profile',
      'en': '',
    },
  },
  // managemebr
  {
    'sujl1ie5': {
      'de': 'Search members...',
      'en': '',
    },
    'zochhouq': {
      'de': 'Club Management',
      'en': '',
    },
    'i5qbit8l': {
      'de': 'Membership Plans',
      'en': '',
    },
    'wv6inkj1': {
      'de': 'Manage membership plans',
      'en': '',
    },
    'wxk1nlr1': {
      'de': 'Create, edit, and delete membership plans',
      'en': '',
    },
    'rk8u5qy7': {
      'de': 'Member List',
      'en': '',
    },
    'y56vosvu': {
      'de': 'Manage club members',
      'en': '',
    },
    'mvd4mojg': {
      'de': 'View, add, and remove club members',
      'en': '',
    },
    'hkflukr5': {
      'de': 'Events',
      'en': '',
    },
    'xdn12840': {
      'de': 'Manage club events',
      'en': '',
    },
    't79wzeqb': {
      'de': 'Create, edit, and delete club events',
      'en': '',
    },
    '7216x9kn': {
      'de': 'Facilities',
      'en': '',
    },
    'zf5fb809': {
      'de': 'Manage club facilities',
      'en': '',
    },
    '949yd4hy': {
      'de': 'Add, edit, and remove club facilities',
      'en': '',
    },
    'vf7bdagn': {
      'de': 'Sports Club',
      'en': '',
    },
  },
  // PageSocialPostsRecentPosts
  {
    '92ouykzr': {
      'de': 'Feed',
      'en': '',
    },
  },
  // CompSocialPost
  {
    'ligfxwgt': {
      'de': ' • ',
      'en': '',
    },
    'u0pz4dfy': {
      'de': '4',
      'en': '',
    },
  },
  // CompPostActionSheet
  {
    'd0jcojiq': {
      'de': 'Edit Post',
      'en': '',
    },
    'tadcijd8': {
      'de': 'Delete Story',
      'en': '',
    },
    '8jlzi8or': {
      'de': 'Cancel',
      'en': '',
    },
  },
  // CompCreateEvent
  {
    'ul9km5ym': {
      'de': 'Veranstaltung erstellen',
      'en': '',
    },
    'njeza4vd': {
      'de': 'Foto hinzufügen',
      'en': '',
    },
    'ggzamwca': {
      'de': 'Füge deiner Veranstaltung ein Foto hinzu',
      'en': '',
    },
    'sq4zt045': {
      'de': 'Name deiner Veranstaltung',
      'en': '',
    },
    '5z51m3fv': {
      'de': 'Beschreibung',
      'en': '',
    },
    '7nv00kea': {
      'de': 'Datum',
      'en': '',
    },
    'b5covozj': {
      'de': 'Ort',
      'en': '',
    },
    'h8wfyg6b': {
      'de': 'Private Veranstaltung',
      'en': '',
    },
    '55f1ef1d': {
      'de': 'refresh page',
      'en': '',
    },
    'uiu32qqz': {
      'de': 'Vereinsmitglieder einladen: ',
      'en': '',
    },
    '5gs11a5a': {
      'de': 'Weitere Personen einladen: ',
      'en': '',
    },
    'oqm6685y': {
      'de': 'Anmeldung Notwendig',
      'en': '',
    },
    'hbm4dscr': {
      'de': 'Teilnahmegebühr',
      'en': '',
    },
    'wvzz3o5c': {
      'de': 'Speichern',
      'en': '',
    },
    '3zn2idg1': {
      'de': 'Field is required',
      'en': '',
    },
    '9o3rk3oc': {
      'de': 'Please enter a real name',
      'en': '',
    },
    'kcwz5cub': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8i028kxc': {
      'de': 'Please enter a short desription',
      'en': '',
    },
    'rwep7fb2': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'jzxajmi7': {
      'de': 'We have to have a URL for the project.',
      'en': '',
    },
    'v0gyktri': {
      'de': 'Please enter a valid URL...',
      'en': '',
    },
    'ohkhpt55': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'auq2mgp4': {
      'de': 'Field is required',
      'en': '',
    },
    'gv7jycoe': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CompCreatePost
  {
    'qmul6lyo': {
      'de': 'Teile deine News!',
      'en': '',
    },
    's1nloga5': {
      'de': 'Öffentlich',
      'en': '',
    },
    '5k38ynlp': {
      'de': 'Freunde & Vereinsmitglieder',
      'en': '',
    },
    'ja06t8vr': {
      'de': 'Nur Vereinsmitglieder',
      'en': '',
    },
    'zcrkkvqw': {
      'de': 'Nur Freunde',
      'en': '',
    },
    'tkdzaxwo': {
      'de': 'Was möchtest du teilen?',
      'en': '',
    },
    'rux22ma0': {
      'de': 'Veröffentlichen',
      'en': '',
    },
  },
  // CompEvent
  {
    'v5d1nlby': {
      'de': '',
      'en': '',
    },
    'vz0p8a4m': {
      'de': ' ',
      'en': '',
    },
    'zfo4jtvx': {
      'de': '💵',
      'en': '',
    },
    '2jd37ktq': {
      'de': '🎫',
      'en': '',
    },
    'a1y5ajle': {
      'de': ',  ',
      'en': '',
    },
    'y6nat9rz': {
      'de': '4',
      'en': '',
    },
    '5zen9zgs': {
      'de': '4',
      'en': '',
    },
  },
  // CompCreateComment
  {
    'c4a4nr8s': {
      'de': 'Kommentieren',
      'en': '',
    },
    'zqps4gy6': {
      'de': 'Was möchtest du teilen?',
      'en': '',
    },
    'w4m94kza': {
      'de': 'Veröffentlichen',
      'en': '',
    },
  },
  // CompCreateNewChat
  {
    '52m4prkp': {
      'de': 'Neuen Chat erstellen',
      'en': '',
    },
    'bj78kdmm': {
      'de': 'Nutzer auswählen',
      'en': '',
    },
    'nftob0x0': {
      'de': 'Gruppenchat erstellen',
      'en': '',
    },
  },
  // CompGroupChatAssignName
  {
    '011r8rt7': {
      'de': 'Gruppen-Namen',
      'en': '',
    },
    'jgwslah5': {
      'de': 'Gib deinem Gruppen-Chat einen Namen',
      'en': '',
    },
    'ckhvm89d': {
      'de': 'z.B. \"Super-Tolle-Sportgruppe\"',
      'en': '',
    },
    '8ue11m9l': {
      'de': 'Gruppenchat erstellen',
      'en': '',
    },
  },
  // CompEmptyList
  {
    'jsul59q4': {
      'de': 'Hier gibt\'s nichts zu sehen!',
      'en': '',
    },
    'bx9jlf2h': {
      'de':
          'Hier gibt es wohl nichts für dich. Schau doch später nochomal vorbei!',
      'en': '',
    },
  },
  // CompAccountDropdown
  {
    '42y7r7g0': {
      'de': 'Dein Account',
      'en': '',
    },
    'ab8i8skb': {
      'de': 'Mein Profil ansehen',
      'en': '',
    },
    'kmv37fyz': {
      'de': 'Mein Profil bearbeiten',
      'en': '',
    },
    'ltpbwzeh': {
      'de': 'Ausloggen',
      'en': '',
    },
  },
  // CompNoEvents
  {
    '6xo9l5ih': {
      'de': 'Du hast keine anstehenden Veranstaltungen.',
      'en': '',
    },
  },
  // CompUserSelection
  {
    'vrszbvhd': {
      'de': 'Mitglieder einladen',
      'en': '',
    },
    '4tg759nl': {
      'de': 'Namen eingeben',
      'en': '',
    },
    'gg3pzfeq': {
      'de': 'Suchergebnisse:',
      'en': '',
    },
    'ohpwpa5s': {
      'de': 'Alle Follower',
      'en': '',
    },
    'okd4b65y': {
      'de': 'selected all followers app state:',
      'en': '',
    },
    '972zlz0m': {
      'de': 'Bestätigen',
      'en': '',
    },
    'q4uzm1z0': {
      'de': 'Field is required',
      'en': '',
    },
    '14bpkbfv': {
      'de': 'Please enter a real name',
      'en': '',
    },
    '55bkq4mu': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ht2lqge3': {
      'de': 'Please enter a short desription',
      'en': '',
    },
    'xmpo3te4': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5lzvwaxx': {
      'de': 'We have to have a URL for the project.',
      'en': '',
    },
    '7834b43h': {
      'de': 'Please enter a valid URL...',
      'en': '',
    },
    '5z6zmoku': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wkgo0f4h': {
      'de': 'Field is required',
      'en': '',
    },
    '92fb16wr': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CompUserSelectionMembers
  {
    'rnhveqbl': {
      'de': 'Mitglieder einladen',
      'en': '',
    },
    'vdie92cq': {
      'de': 'Alle Vereinsmitglieder',
      'en': '',
    },
    'k5j85851': {
      'de': 'selected all members app state:',
      'en': '',
    },
    '2olde1cg': {
      'de': 'Bestätigen',
      'en': '',
    },
    'dgf6c0l9': {
      'de': 'Field is required',
      'en': '',
    },
    '339tvsmw': {
      'de': 'Please enter a real name',
      'en': '',
    },
    'dlnkpy0b': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'n48zycmq': {
      'de': 'Please enter a short desription',
      'en': '',
    },
    'cidj1cqz': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ya23povt': {
      'de': 'We have to have a URL for the project.',
      'en': '',
    },
    'gvz4uj5c': {
      'de': 'Please enter a valid URL...',
      'en': '',
    },
    '6xk68s5t': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dwbebsj2': {
      'de': 'Field is required',
      'en': '',
    },
    '5v0eb6g3': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'nbhpr1eu': {
      'de': '',
      'en': '',
    },
    'gzcnq125': {
      'de': '',
      'en': '',
    },
    'm6ovsdm8': {
      'de': '',
      'en': '',
    },
    '2gt8l6cj': {
      'de': '',
      'en': '',
    },
    '8bxm5i54': {
      'de': '',
      'en': '',
    },
    'sb4fi0pj': {
      'de': '',
      'en': '',
    },
    'kerykkp0': {
      'de': '',
      'en': '',
    },
    'cz2mwyor': {
      'de': '',
      'en': '',
    },
    'olraj5hi': {
      'de': '',
      'en': '',
    },
    'avmivfra': {
      'de': '',
      'en': '',
    },
    'g9pp3s9d': {
      'de': '',
      'en': '',
    },
    '0mgcewwb': {
      'de': '',
      'en': '',
    },
    'mhiscdqt': {
      'de': '',
      'en': '',
    },
    '22tfqa16': {
      'de': '',
      'en': '',
    },
    'j9n4kduv': {
      'de': '',
      'en': '',
    },
    'aqm0aljm': {
      'de': '',
      'en': '',
    },
    'kt63fk3k': {
      'de': '',
      'en': '',
    },
    '6tp7uc1h': {
      'de': '',
      'en': '',
    },
    'aivuawps': {
      'de': '',
      'en': '',
    },
    'kfask1wm': {
      'de': '',
      'en': '',
    },
    'e7cnbqtl': {
      'de': '',
      'en': '',
    },
    '94v6sz9x': {
      'de': '',
      'en': '',
    },
    'cfrjdmd7': {
      'de': '',
      'en': '',
    },
    '76cutx8p': {
      'de': '',
      'en': '',
    },
    'b071qp3j': {
      'de': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
