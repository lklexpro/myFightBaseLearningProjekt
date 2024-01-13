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
    'b5fmf3d2': {
      'de': 'Aktuelle Version: 12-01-24, HIER KLICKEN',
      'en': 'Tap here for Changelog Information.',
    },
    'atsfyhzf': {
      'de': 'Willkommen, ',
      'en': 'Welcome',
    },
    '3fn11tbb': {
      'de': '!',
      'en': '!',
    },
    'tg8k08x7': {
      'de': '',
      'en': '',
    },
    'j6dr9x4w': {
      'de': ' Neuigkeiten!',
      'en': 'News',
    },
    'tb4swdan': {
      'de': 'Deinen Verein verwalten',
      'en': 'Manage your Organization',
    },
    'fwrkmvc2': {
      'de': 'Zu deinem Vereins-Kanal',
      'en': 'Open Organization Channel',
    },
    'ogaqp9w2': {
      'de': 'Deine Mitgliedschaften',
      'en': 'Your Memberships',
    },
    'i39g0hmq': {
      'de': 'Anstehende Veranstaltungen',
      'en': 'Upcoming Events',
    },
    'o5xyebry': {
      'de': ',  ',
      'en': ',',
    },
    'ugwu3oks': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // PageAuthentication
  {
    '2y7k81q5': {
      'de': 'Login zu myFightBase',
      'en': 'Log In in myFightBase',
    },
    'ih5vso5b': {
      'de': 'Email',
      'en': 'Email',
    },
    '41g8e69u': {
      'de': 'Passwort',
      'en': 'Password',
    },
    '2s53kky1': {
      'de': 'Einloggen',
      'en': 'Log In',
    },
    'nqzqja26': {
      'de': 'NOCH KEINEN ACCOUNT? ',
      'en': 'NO ACCOUNT YET?',
    },
    'r3wkeo2o': {
      'de': 'Dann registriere dich jetzt',
      'en': 'Register Now',
    },
    'ym3jdrvn': {
      'de': 'ZUR REGISTRIERUNG',
      'en': 'SIGN UP',
    },
  },
  // PageRegisterAccount
  {
    'sueyz0z0': {
      'de': 'Melde dich jetzt an! ',
      'en': '',
    },
    'k9i250hl': {
      'de': 'und werde Teil der FightBase-Community!',
      'en': '',
    },
    'jtwxhwfz': {
      'de': 'Du möchtest deinen Verein organisieren? Dann hier entlang!',
      'en': '',
    },
    'nhhbf1jk': {
      'de': 'Email',
      'en': '',
    },
    'lug22ypr': {
      'de': 'E-Mail Adresse',
      'en': '',
    },
    'lvq57dnj': {
      'de': 'Passwort',
      'en': '',
    },
    'dn82j7x5': {
      'de': '---',
      'en': '',
    },
    'dycvurmg': {
      'de': 'Passwort bestätigen',
      'en': '',
    },
    'ihip1pek': {
      'de': '---',
      'en': '',
    },
    '2l61zo9v': {
      'de': 'Vorname',
      'en': '',
    },
    '5smzvb3x': {
      'de': 'Dein Vorname',
      'en': '',
    },
    'gqs9nn07': {
      'de': 'Nachname',
      'en': '',
    },
    'gtulqedh': {
      'de': 'Dein Nachname',
      'en': '',
    },
    'l32ph9ui': {
      'de': 'Wähle deine Sportart',
      'en': '',
    },
    '1kp3runk': {
      'de': 'Gewichtsklasse suchen',
      'en': '',
    },
    'y8hqp5kg': {
      'de': 'Zustimmung AGB',
      'en': '',
    },
    '38r11bq2': {
      'de':
          'Ich akzeptiere die allgemein geltenden Geschäftsbedingungen sowie Datenschutzvereinbarung.',
      'en': '',
    },
    'sqztushv': {
      'de': 'Zustimmung Datenschutzvereinbarung',
      'en': '',
    },
    '9fsc06v2': {
      'de':
          'Ich akzeptiere die allgemein geltenden Geschäftsbedingungen sowie Datenschutzvereinbarung.',
      'en': '',
    },
    'eooap5w9': {
      'de': 'Registrierung abschließen',
      'en': '',
    },
    'k9x6uh1w': {
      'de': 'Bitte eine gültige E-Mail Adresse angeben.',
      'en': '',
    },
    'glsml2nr': {
      'de': 'E-Mail ungültig',
      'en': '',
    },
    'gwyyuolb': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ct53351h': {
      'de': 'Passwort benötigt.',
      'en': '',
    },
    'km03csz7': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2j1r9fvg': {
      'de': 'Bitte Passwort wiederholen.',
      'en': '',
    },
    'rq0sasmz': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vkt3emd0': {
      'de': 'Bitte Vornamen eintragen.',
      'en': '',
    },
    'g6ravrql': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'am05gf4i': {
      'de': 'Bitte Nachnamen eintragen.',
      'en': '',
    },
    'a5mdtgva': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'e2787mbc': {
      'de': 'Du hast bereits einen Account? ',
      'en': '',
    },
    'emkvimkh': {
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
      'de': 'Alle aktuellen Nutzer',
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
    'dwfabmir': {
      'de': 'Dies ist dein eigenes Profil. Klicken um zu bearbeiten.',
      'en': '',
    },
    'r23eejbj': {
      'de': 'Einladung beantworten.',
      'en': '',
    },
    'nr1gpkvk': {
      'de': 'Dieser Nutzer hat dich blockiert.',
      'en': '',
    },
    '52an3yge': {
      'de': 'Aktives Mitglied bei:',
      'en': '',
    },
    'hohytcot': {
      'de': 'Folgt',
      'en': '',
    },
    'xs7iy3ye': {
      'de': 'Gefolgt',
      'en': '',
    },
    'aa5jrcyt': {
      'de': 'Mitglieder',
      'en': '',
    },
    '0kznqip2': {
      'de': 'Kampfstatistiken',
      'en': '',
    },
    'n6wm9hqb': {
      'de': 'Kämpfe Ingesamt',
      'en': '',
    },
    'a6f9g37c': {
      'de': 'Gewonnen',
      'en': '',
    },
    '8mnvh5lq': {
      'de': 'Verloren',
      'en': '',
    },
    '775aesnx': {
      'de': 'Unentschieden',
      'en': '',
    },
    'vowz4f3l': {
      'de': 'Über Mich',
      'en': '',
    },
    'jryciqwa': {
      'de': 'Kontakt:',
      'en': '',
    },
    'zrzibrcv': {
      'de': 'Galerie',
      'en': '',
    },
    's88lwp62': {
      'de': 'Diesen Nutzer blockieren',
      'en': '',
    },
    'fh28zluv': {
      'de': 'Nutzer nicht mehr blocken',
      'en': '',
    },
    'vbyl35mj': {
      'de': 'Verein verlassen',
      'en': '',
    },
    '5szywwj7': {
      'de': 'Vereinseinladung zurückziehen',
      'en': '',
    },
    'n019e907': {
      'de': 'Zum Verein einladen',
      'en': '',
    },
    's7pihf16': {
      'de': 'Aus dem Verein entfernen',
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
    'cuqu4fi6': {
      'de': '...',
      'en': '',
    },
    'dvdg4n5m': {
      'de': 'Deine E-Mail ändern:',
      'en': '',
    },
    '3sxygxjl': {
      'de': '...',
      'en': '',
    },
    '6rpvk01y': {
      'de': 'Deine Beschreibung ändern (\"Über Mich\"):',
      'en': '',
    },
    '533lo5t5': {
      'de': '...',
      'en': '',
    },
    '5m2ydljc': {
      'de': 'Adresse ändern:',
      'en': '',
    },
    '683zkmms': {
      'de': '...',
      'en': '',
    },
    'ciobnlpt': {
      'de': 'Postleitzahl',
      'en': '',
    },
    'hrap08g8': {
      'de': '...',
      'en': '',
    },
    'l8u2ypu4': {
      'de': 'Stadt',
      'en': '',
    },
    'zsth0ocp': {
      'de': '...',
      'en': '',
    },
    '7om89zup': {
      'de': 'Telefonnummer: ',
      'en': '',
    },
    'zuqvwp10': {
      'de': '...',
      'en': '',
    },
    'qjrc64rq': {
      'de': 'Öffentliche Kontakt E-Mail: ',
      'en': '',
    },
    't8jnyknf': {
      'de': '...',
      'en': '',
    },
    'hjmm127f': {
      'de': 'Deinen Vornamen ändern:',
      'en': '',
    },
    '2z5x8s4q': {
      'de': '...',
      'en': '',
    },
    '3fg1f6kf': {
      'de': 'Deinen Nachnamen ändern:',
      'en': '',
    },
    'swgm2o2x': {
      'de': '...',
      'en': '',
    },
    'a466nvvp': {
      'de': 'Sportart auswählen',
      'en': '',
    },
    'i8z7bdgb': {
      'de': 'Search for an item...',
      'en': '',
    },
    '1n8dgbco': {
      'de': 'Gewichtsklasse auswählen',
      'en': '',
    },
    'uxnr12zf': {
      'de': 'Gewichtsklasse suchen',
      'en': '',
    },
    'gzmbpvzg': {
      'de': 'Größe (cm)',
      'en': '',
    },
    'oylqr5me': {
      'de': '...',
      'en': '',
    },
    'gvr41k9u': {
      'de': 'Gewicht (kg)',
      'en': '',
    },
    's25pel25': {
      'de': '...',
      'en': '',
    },
    '9b138qlw': {
      'de': ' Speichern',
      'en': '',
    },
    'dxhvpogn': {
      'de': 'Profil bearbeiten',
      'en': '',
    },
    '0ch06llk': {
      'de': 'My Profile',
      'en': '',
    },
  },
  // PageEventDetailPage
  {
    'fgkwp3o6': {
      'de': 'Veranstaltet von:',
      'en': '',
    },
    'o64ahjf4': {
      'de': '(',
      'en': '',
    },
    'y9b0409i': {
      'de': ')',
      'en': '',
    },
    'jcx0q7ga': {
      'de': ', ',
      'en': '',
    },
    'bmzm934r': {
      'de': 'Beschreibung:',
      'en': '',
    },
    '42mponhw': {
      'de': 'Details:',
      'en': '',
    },
    'a6v2dbjz': {
      'de': ' Öffentliche Veranstaltung',
      'en': '',
    },
    'p8zxx06c': {
      'de': ' Teilenahmgebühr / Eintrittspreis: ',
      'en': '',
    },
    'b4hdo1ql': {
      'de': '€',
      'en': '',
    },
    'g98gpw9j': {
      'de': ' Registrierung / Anmeldung erforderlich',
      'en': '',
    },
    'elgvn4kz': {
      'de': 'Verfügbare Plätze: ',
      'en': '',
    },
    'xdnuy7hr': {
      'de': ' von ',
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
    'nf1hr2ax': {
      'de': ' | Bearbeitet am: ',
      'en': '',
    },
    'uhylh40z': {
      'de': 'Zusagen: ',
      'en': '',
    },
    'bhup542z': {
      'de': 'Bisher noch keine Zusagen. Sei der Erste!',
      'en': '',
    },
    'buqtvf0o': {
      'de': 'Veranstaltung',
      'en': '',
    },
    's6e7bdg4': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageSocialPostDetailPage
  {
    'svthut2y': {
      'de': 'vor ',
      'en': '',
    },
    '4acxwgmu': {
      'de': ' • ',
      'en': '',
    },
    'inv33tce': {
      'de': 'Sandra Smith',
      'en': '',
    },
    'msr5vmzk': {
      'de':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'en': '',
    },
    'yskvvi4j': {
      'de': 'a min ago',
      'en': '',
    },
    'fdc1cfmm': {
      'de': 'Kommentieren',
      'en': '',
    },
    'bq1kl0ey': {
      'de': 'Post',
      'en': '',
    },
    '60v0uccx': {
      'de': 'Kanal',
      'en': '',
    },
  },
  // PageRegisterAccountOrganization
  {
    'bkmzldgr': {
      'de': 'Melde dich jetzt an! ',
      'en': '',
    },
    '3blfhish': {
      'de': 'und werde Teil der FightBase-Community!',
      'en': '',
    },
    '6dm4w6ek': {
      'de': 'Email',
      'en': '',
    },
    '3nzvfdmt': {
      'de': 'E-Mail Adresse',
      'en': '',
    },
    '4i9h8zfw': {
      'de': 'Passwort',
      'en': '',
    },
    'oq2t8anx': {
      'de': '---',
      'en': '',
    },
    'vhufggrl': {
      'de': 'Passwort bestätigen',
      'en': '',
    },
    '2oljql9r': {
      'de': '---',
      'en': '',
    },
    'of7244cq': {
      'de': 'Name',
      'en': '',
    },
    'bi79la7h': {
      'de': 'Name deiner Organisation',
      'en': '',
    },
    'f3bqa5j4': {
      'de': 'Fitnesstudio',
      'en': '',
    },
    '0trtz1n4': {
      'de': 'Sportclub',
      'en': '',
    },
    'f32m517a': {
      'de': 'Verein',
      'en': '',
    },
    'jo8e0zsh': {
      'de': 'Non-Profit',
      'en': '',
    },
    'a68mf3id': {
      'de': 'Bitte auswählen',
      'en': '',
    },
    '8a3if2ts': {
      'de': 'Search for an item...',
      'en': '',
    },
    'uhxqmryn': {
      'de': 'Zustimmung AGB',
      'en': '',
    },
    'x280eisz': {
      'de':
          'Ich akzeptiere die allgemein geltenden Geschäftsbedingungen sowie Datenschutzvereinbarung.',
      'en': '',
    },
    'y5gpbzon': {
      'de': 'Zustimmung Datenschutzvereinbarung',
      'en': '',
    },
    'pbrrq00o': {
      'de':
          'Ich akzeptiere die allgemein geltenden Geschäftsbedingungen sowie Datenschutzvereinbarung.',
      'en': '',
    },
    'kw3rb2yb': {
      'de': 'Registrierung abschließen',
      'en': '',
    },
    '6e6w7tbr': {
      'de': 'Bitte E-Mail Adresse eintragen.',
      'en': '',
    },
    '3vb4zkz3': {
      'de': 'E-Mail Adresse ist ungültig.',
      'en': '',
    },
    '6jrl4eq0': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'uyf594mu': {
      'de': 'Bitte Passwort eintragen.',
      'en': '',
    },
    'zuzzmvn6': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ju5p4k7w': {
      'de': 'Bitte Passwort wiederholen.',
      'en': '',
    },
    '23uujn9z': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'oqlltbxq': {
      'de': 'Bitte Namen eintragen.',
      'en': '',
    },
    '8pqwhl3p': {
      'de': 'Ungültiger Name.',
      'en': '',
    },
    'kyawmeeb': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'lrumyp87': {
      'de': 'Du hast bereits einen Account? ',
      'en': '',
    },
    'q3wxym9n': {
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
    '2tyfnox8': {
      'de': 'Folgt',
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
  // PageAddUsersToChat
  {
    'bhe8hpzf': {
      'de': 'Nutzer hinzufügen',
      'en': '',
    },
    'qccsjtes': {
      'de': 'Wähle Nutzer für den Gruppenchat aus',
      'en': '',
    },
    'lor00mb8': {
      'de': 'Nutzer einladen',
      'en': '',
    },
  },
  // PageChatOverview
  {
    'du8jc3pj': {
      'de': 'Nachrichten',
      'en': '',
    },
  },
  // PageUsersFollowers
  {
    'wqgxw1iy': {
      'de': 'Follower',
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
    '0pk504bs': {
      'de': 'Bitte einen Gruppennamen vergeben.',
      'en': '',
    },
    'cgp4r85d': {
      'de': 'Gruppenchat erstellen',
      'en': '',
    },
  },
  // PageUsersMember
  {
    '3bti2i3x': {
      'de': 'Vereinsmitglieder',
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
    'lcpavpb4': {
      'de': 'Mitglieder verwalten',
      'en': '',
    },
    'yol2hgui': {
      'de': 'Halte den Eintrag gedrückt um das Mitglied zu bearbeiten',
      'en': '',
    },
    'h6vqavjz': {
      'de': 'Mitglieder in deinem Verein: ',
      'en': '',
    },
    'p4vip3xa': {
      'de': 'Ausstehende Einladung',
      'en': '',
    },
    'u59nv8kh': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageNotifications
  {
    'p9dwnpan': {
      'de': 'Benachrichtigungen',
      'en': '',
    },
    'xuqz01zf': {
      'de': 'Benachrichtigungsverlauf',
      'en': '',
    },
    '9mnmz135': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageSocialPostsFeed
  {
    'bagmsrhi': {
      'de': 'Feed',
      'en': '',
    },
  },
  // PageEventList
  {
    '3v0n6jke': {
      'de': 'Eigene Veranstaltungen verwalten',
      'en': '',
    },
    '3g6ayvin': {
      'de': 'Anstehend',
      'en': '',
    },
    '4nkesi6u': {
      'de': 'Eingeladen',
      'en': '',
    },
    '1asl6y88': {
      'de': 'Öffentliche',
      'en': '',
    },
    'yejdcai9': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageEventOrganizationList
  {
    'x1xi3gsb': {
      'de': 'Anstehend',
      'en': '',
    },
    'ttjrxzjg': {
      'de': 'Alle',
      'en': '',
    },
    'tmaiqsn9': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageEventEdit
  {
    'dounmyrb': {
      'de': 'Foto hinzufügen',
      'en': '',
    },
    'd6xdny2y': {
      'de': 'Füge deiner Veranstaltung ein Foto hinzu',
      'en': '',
    },
    '7jqlgj46': {
      'de': 'Weiteres Foto',
      'en': '',
    },
    '3e6czv90': {
      'de': 'Weiteres Foto',
      'en': '',
    },
    'blgxs1zl': {
      'de': 'Veranstaltungsname',
      'en': '',
    },
    'um0h8chh': {
      'de': 'Name deiner Veranstaltung',
      'en': '',
    },
    '05yj444d': {
      'de': 'Beschreibung',
      'en': '',
    },
    'z0z0rlxd': {
      'de': 'Beschreibung und Veranstaltungsdetails ',
      'en': '',
    },
    's2j879xt': {
      'de': 'Datum',
      'en': '',
    },
    '6vo74g4d': {
      'de': 'Veranstaltungsort',
      'en': '',
    },
    'vpnqylf1': {
      'de': 'z.B.  \"Fightbase Gym\" oder \"Trainingshalle\"',
      'en': '',
    },
    'jso7jbp5': {
      'de': 'Adresse des Veranstaltungsorts',
      'en': '',
    },
    'du6oggps': {
      'de': 'z.B. Freies Training, Boxkampf, Tag der offenen Tür',
      'en': '',
    },
    '9bdqlnjg': {
      'de': 'Postleitzahl',
      'en': '',
    },
    'kon65b23': {
      'de': 'Postleitzahl',
      'en': '',
    },
    'zedj1lkx': {
      'de': 'Stadt',
      'en': '',
    },
    'm6ajjsia': {
      'de': 'Stadt',
      'en': '',
    },
    'n9ryapj7': {
      'de': 'Maximale Teilnehmer',
      'en': '',
    },
    '7bzmc423': {
      'de': 'Personen',
      'en': '',
    },
    'upu0t4ke': {
      'de': 'Trage hier die maximal erlaubte Anzahl an Teilnehmern ein. ',
      'en': '',
    },
    'unskwgdm': {
      'de': 'Teilnahmegebühr / Eintrittspreis',
      'en': '',
    },
    'eebh98ip': {
      'de': 'Eintrittspreis',
      'en': '',
    },
    'lq28gvxi': {
      'de':
          'Teilnahmegebühr. Trage 0,00€ ein, wenn die Teilnahme kostenlos ist.',
      'en': '',
    },
    'dd7ciseo': {
      'de': '€',
      'en': '',
    },
    'fvp88idw': {
      'de': 'Anmeldung Notwendig',
      'en': '',
    },
    'kje1sypu': {
      'de': 'Öffentliche Veranstaltung',
      'en': '',
    },
    'dmh0qnke': {
      'de': 'Speichern',
      'en': '',
    },
    'oj61uule': {
      'de': 'Field is required',
      'en': '',
    },
    'pjvncgvn': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '7bqk3cq3': {
      'de': 'Field is required',
      'en': '',
    },
    'j3lkld2m': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '7nvf5q33': {
      'de': 'Field is required',
      'en': '',
    },
    'gmpnakhz': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'q6rmn5q4': {
      'de': 'Field is required',
      'en': '',
    },
    'vyqaznv5': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'nn823y2b': {
      'de': 'Field is required',
      'en': '',
    },
    '1spab3kb': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wp830oub': {
      'de': 'Field is required',
      'en': '',
    },
    'qw1pvsiv': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qasyck32': {
      'de': 'Field is required',
      'en': '',
    },
    'm2b3qqmk': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'hg9fnhfq': {
      'de': 'Field is required',
      'en': '',
    },
    'sy6df5h0': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dkh2zlvl': {
      'de': 'Veranstaltung bearbeiten',
      'en': '',
    },
    '3jgf918q': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageBroadcastDetailPage
  {
    'i4wdfvqg': {
      'de': 'Broadcast von:',
      'en': '',
    },
    '8fytdtea': {
      'de': 'Übermittelt an:',
      'en': '',
    },
    'alxkshdj': {
      'de': 'Nachricht als gelesen markiert.',
      'en': '',
    },
    'c7dhksm9': {
      'de': 'Broadcast',
      'en': '',
    },
    'xhf7gdf4': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageBroadcastOverview
  {
    'vy9jhp2y': {
      'de': 'Dein Broadcast-Verlauf',
      'en': '',
    },
    'qe981u3g': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageUserSearch
  {
    'hgkr4tbz': {
      'de': 'Alle',
      'en': '',
    },
    'b52u355u': {
      'de': 'Suchergebnisse:',
      'en': '',
    },
    '7gj0kf85': {
      'de': 'Personen',
      'en': '',
    },
    's1jwb05n': {
      'de': 'Suchergebnisse:',
      'en': '',
    },
    'hgcpq8y4': {
      'de': 'Vereine',
      'en': '',
    },
    '3ao9lrww': {
      'de': 'Suchergebnisse:',
      'en': '',
    },
    'n19smbpw': {
      'de': 'Zuletzt angesehen:',
      'en': '',
    },
    '9ycfjhl5': {
      'de': '   ',
      'en': '',
    },
    'eydqje41': {
      'de': 'Home',
      'en': '',
    },
  },
  // PageRegisterFlow
  {
    'hkpwx6u4': {
      'de': 'Melde dich jetzt an! ',
      'en': '',
    },
    'w2j8jz87': {
      'de': 'und werde Teil der FightBase-Community!',
      'en': '',
    },
    'n6r29si1': {
      'de': 'Teile deine Erfolge mit Freunden',
      'en': '',
    },
    'vcxwoctu': {
      'de': 'Verwalte Veranstaltungen',
      'en': '',
    },
    '7wpp4v8v': {
      'de': 'Verwalte und organsiere\ndeine Vereins-Mitglieder',
      'en': '',
    },
    'fl3vxmdm': {
      'de': 'Verwalte und organsiere\ndeine Vereins-Mitglieder',
      'en': '',
    },
    'fulzvoua': {
      'de': 'Verwalte und organsiere\ndeine Vereins-Mitglieder',
      'en': '',
    },
    'h6ls4lc4': {
      'de': 'Du hast bereits einen Account? ',
      'en': '',
    },
    'l7eh4y0s': {
      'de': 'EINLOGGEN',
      'en': '',
    },
    '9n7ocggh': {
      'de': 'register',
      'en': '',
    },
  },
  // PageOrganizationCommunity
  {
    'tx0bh5ed': {
      'de': 'Vereins-Kanal',
      'en': '',
    },
    'vdn5hc3r': {
      'de': 'Aktuelle Hinweise & Informationen:',
      'en': '',
    },
    'hihw68ec': {
      'de': 'Gruppeninhalte',
      'en': '',
    },
    'k7lgp6nv': {
      'de': 'Veranstaltungen',
      'en': '',
    },
    'hs68ours': {
      'de': 'My Profile',
      'en': '',
    },
  },
  // PageUserProfileCopy
  {
    'vtt17xnu': {
      'de': 'Dies ist dein eigenes Profil. Klicken um zu bearbeiten.',
      'en': '',
    },
    'vbv46f5x': {
      'de': 'Einladung beantworten.',
      'en': '',
    },
    '7mrllvv8': {
      'de': 'Dieser Nutzer hat dich blockiert.',
      'en': '',
    },
    '4hqiegxc': {
      'de': 'Aktives Mitglied bei:',
      'en': '',
    },
    '4az7cvzd': {
      'de': 'Folgt',
      'en': '',
    },
    '0gyar2qq': {
      'de': 'Gefolgt',
      'en': '',
    },
    'my1pzcz9': {
      'de': 'Mitglieder',
      'en': '',
    },
    'i84p41p7': {
      'de': 'Kampfstatistiken',
      'en': '',
    },
    '7lyev5ey': {
      'de': 'Kämpfe Ingesamt',
      'en': '',
    },
    'v5c0a6im': {
      'de': 'Gewonnen',
      'en': '',
    },
    'hyt5w6o1': {
      'de': 'Verloren',
      'en': '',
    },
    'vblt7rlk': {
      'de': 'Unentschieden',
      'en': '',
    },
    '9esy2yhk': {
      'de': 'Über Mich',
      'en': '',
    },
    'klyrudlm': {
      'de': 'Kontakt:',
      'en': '',
    },
    'ps18ghb4': {
      'de': 'Galerie',
      'en': '',
    },
    '7gpxegcg': {
      'de': 'My Profile',
      'en': '',
    },
  },
  // ChatNew
  {
    'k36u0irv': {
      'de': '',
      'en': '',
    },
    'acbvp8a7': {
      'de': 'Nachricht ',
      'en': '',
    },
    'i7o5tduf': {
      'de': 'Home',
      'en': '',
    },
  },
  // CompPostList
  {
    'uakcut7o': {
      'de': ' • ',
      'en': '',
    },
    'f7s3z8jp': {
      'de': 'Gepostet in ',
      'en': '',
    },
  },
  // CompPostActionSheet
  {
    'd0jcojiq': {
      'de': 'Bearbeiten',
      'en': '',
    },
    '9vs8cvih': {
      'de': 'Löschen',
      'en': '',
    },
    '8jlzi8or': {
      'de': 'Abbrechen',
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
    '8pmkiv9f': {
      'de': 'Weiteres Foto',
      'en': '',
    },
    'ew6t7ubl': {
      'de': 'Weiteres Foto',
      'en': '',
    },
    'tonegfww': {
      'de': 'Veranstaltungsname',
      'en': '',
    },
    'sq4zt045': {
      'de': 'Name deiner Veranstaltung',
      'en': '',
    },
    'tgvkqbbg': {
      'de': 'Beschreibung',
      'en': '',
    },
    'd3i3tt0n': {
      'de': 'z.B. Freies Training, Boxkampf, Tag der offenen Tür',
      'en': '',
    },
    '7nv00kea': {
      'de': 'Datum',
      'en': '',
    },
    'b5covozj': {
      'de': 'Veranstaltungsort',
      'en': '',
    },
    '51myac7d': {
      'de': 'Name / Bezeichnung (z.B. \"Fightbase Gym\")',
      'en': '',
    },
    '7nnp4kmb': {
      'de': 'Adresse des Veranstaltungsortes',
      'en': '',
    },
    'soclw971': {
      'de': 'Straße & Hausnummer',
      'en': '',
    },
    '8pcjobkm': {
      'de': 'Postleitzahl',
      'en': '',
    },
    'i5ev5mz0': {
      'de': '123456',
      'en': '',
    },
    'mlqrkqni': {
      'de': 'Stadt',
      'en': '',
    },
    'fhkcdgeo': {
      'de': 'Eventstadt',
      'en': '',
    },
    'x2olaaze': {
      'de': 'Maximale Teilnehmer',
      'en': '',
    },
    'e6ng0jh6': {
      'de': 'Personen',
      'en': '',
    },
    '3ah0nspn': {
      'de': 'Trage hier die maximal erlaubte Anzahl an Teilnehmern ein. ',
      'en': '',
    },
    'oqm6685y': {
      'de': 'Teilnahmegebühr / Eintrittspreis',
      'en': '',
    },
    'hbm4dscr': {
      'de': 'Eintrittspreis',
      'en': '',
    },
    'j81zrej3': {
      'de':
          'Teilnahmegebühr. Trage 0,00€ ein, wenn die Teilnahme kostenlos ist.',
      'en': '',
    },
    'dnq4mus7': {
      'de': '0,00',
      'en': '',
    },
    '5hmz9avm': {
      'de': '€',
      'en': '',
    },
    'by340nqf': {
      'de': 'Anmeldung Notwendig',
      'en': '',
    },
    '996bi0xf': {
      'de': 'Öffentliche Veranstaltung',
      'en': '',
    },
    '7uyu3dny': {
      'de':
          'Nur eingeladene Personen können dieses Event sehen oder daran teilnehmen.',
      'en': '',
    },
    'zg75dc76': {
      'de': 'Einladen',
      'en': '',
    },
    '3l0otvtf': {
      'de': 'Mitglieder: ',
      'en': '',
    },
    'kyl765vs': {
      'de': 'Follower: ',
      'en': '',
    },
    'jnf4p9e8': {
      'de': 'Event Erstellen',
      'en': 'Save Event',
    },
    't4od4xyq': {
      'de': 'Bitte Namen eintragen',
      'en': '',
    },
    'gk9v5cc3': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'bm44155m': {
      'de': 'Bitte Beschreibung eintragen',
      'en': '',
    },
    'tt4loaqx': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8aq3mmmq': {
      'de': 'Field is required',
      'en': '',
    },
    'aoo8o0lv': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'rcqjbx15': {
      'de': 'Field is required',
      'en': '',
    },
    'rlkal2fy': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'vs99d8us': {
      'de': 'Field is required',
      'en': '',
    },
    '5fx6ehm8': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'iwxc4pvz': {
      'de': 'Field is required',
      'en': '',
    },
    '20vyegal': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wpb5rf8g': {
      'de': 'Field is required',
      'en': '',
    },
    '3iirpa8t': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CompCreatePost
  {
    '1l38nd29': {
      'de': 'Einen Post erstellen',
      'en': '',
    },
    'pizt320e': {
      'de': 'Was möchtest du Teilen?',
      'en': '',
    },
    '67te2ra8': {
      'de': '....',
      'en': '',
    },
    '690pjs79': {
      'de': 'Öffentlich',
      'en': '',
    },
    'suejr4yx': {
      'de': 'Nur Mitglieder',
      'en': '',
    },
    'brhad5nu': {
      'de': 'Wer darf diesen Inhalt sehen?',
      'en': '',
    },
    'xddoxg1r': {
      'de': 'Search for an item...',
      'en': '',
    },
    'rux22ma0': {
      'de': 'Veröffentlichen',
      'en': '',
    },
  },
  // CompEvent
  {
    'qvyw0vbp': {
      'de': 'Details:',
      'en': '',
    },
    '470ayu5p': {
      'de': ' Öffentliche Veranstaltung',
      'en': '',
    },
    'h6kz0r36': {
      'de': ' Teilenahmgebühr / Eintrittspreis: ',
      'en': '',
    },
    '4qubwoux': {
      'de': '€',
      'en': '',
    },
    'fdyza2qq': {
      'de': ' Registrierung / Anmeldung erforderlich',
      'en': '',
    },
    'shst00h5': {
      'de': 'Verfügbare Plätze: ',
      'en': '',
    },
    'tb16estd': {
      'de': ' von ',
      'en': '',
    },
    'a1y5ajle': {
      'de': ',  ',
      'en': '',
    },
    'y6nat9rz': {
      'de': '0',
      'en': '',
    },
    '5zen9zgs': {
      'de': '0',
      'en': '',
    },
  },
  // CompCreateComment
  {
    '1orohbx1': {
      'de': 'Kommentar verfassen',
      'en': '',
    },
    'ocsmzfqs': {
      'de': 'Verfasse einen Kommentar.',
      'en': '',
    },
    'trm0k1r7': {
      'de': '...',
      'en': '',
    },
    'w4m94kza': {
      'de': 'Veröffentlichen',
      'en': '',
    },
  },
  // CompUserListUserDocument
  {
    '24x0gez2': {
      'de': ' ',
      'en': '',
    },
  },
  // CompCreateNewChat
  {
    't5skpqxf': {
      'de': 'Einen Chat starten',
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
  // CompEmptyPage
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
  // CompUserListRelationData
  {
    '0gw1a4d2': {
      'de': 'Mitglied seit ',
      'en': '',
    },
  },
  // CompAccountDropdown
  {
    'apxqg4ao': {
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
    'umdqw9ux': {
      'de': 'QR Code scannen',
      'en': '',
    },
    '48hh5xud': {
      'de': 'Abbruch',
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
  // CompMemberManagementMenu
  {
    '8lo0522a': {
      'de': 'Mitglied bearbeiten',
      'en': '',
    },
    '6tqoel3n': {
      'de': 'Nachricht senden',
      'en': '',
    },
    '9gv4biil': {
      'de': 'Benachrichtigung senden',
      'en': '',
    },
    'pvpq1zja': {
      'de': 'Zu Veranstaltung einladen',
      'en': '',
    },
    'l8xtmp9q': {
      'de': 'Mitglied Kennzeichnen',
      'en': '',
    },
    'qutbj343': {
      'de': 'Inhaber',
      'en': '',
    },
    'gpz9ygod': {
      'de': 'Vorstandsmitglied',
      'en': '',
    },
    'x0a8rxd8': {
      'de': 'Vertreter',
      'en': '',
    },
    'buq51ju8': {
      'de': 'Trainer',
      'en': '',
    },
    'bes568bf': {
      'de': 'Mitglied entfernen',
      'en': '',
    },
  },
  // CompCreateBroadcast
  {
    '1uk2x8kc': {
      'de': 'Broadcast versenden',
      'en': '',
    },
    'wtauou1s': {
      'de': 'Betreff',
      'en': '',
    },
    'z5s3z6g9': {
      'de': 'Betreff',
      'en': '',
    },
    'deqlugce': {
      'de': 'Beschreibung',
      'en': '',
    },
    '1knht36v': {
      'de': 'Deine Nachricht...',
      'en': '',
    },
    '2kckd96s': {
      'de': 'Mitglieder auswählen: ',
      'en': '',
    },
    'kioczvht': {
      'de': 'Bestätigen',
      'en': '',
    },
    'nmyyc0t9': {
      'de': 'Field is required',
      'en': '',
    },
    '6ftngsli': {
      'de': 'Please enter a real name',
      'en': '',
    },
    'avyyn06i': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'f8ultyqw': {
      'de': 'Please enter a short desription',
      'en': '',
    },
    'eilh9xi1': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'uglurkdb': {
      'de': 'We have to have a URL for the project.',
      'en': '',
    },
    'xz3s2pst': {
      'de': 'Please enter a valid URL...',
      'en': '',
    },
    'iuw77yne': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wacahgr5': {
      'de': 'Field is required',
      'en': '',
    },
    'fm3csm69': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CompNoMember
  {
    '3idzmvdb': {
      'de': 'Leider niemand hier...',
      'en': '',
    },
    'f0r2i2pm': {
      'de': 'Sieht so aus als hätte dein Verein noch keine MItglieder.',
      'en': '',
    },
  },
  // CompNotificationCard
  {
    'wyc30xtv': {
      'de': 'Du wurdest eingeladen einem Verein beizutreten!',
      'en': '',
    },
    'mw5p196s': {
      'de': 'Du wurdest zu einer Veranstaltung eingeladen!',
      'en': '',
    },
    'gairfzq6': {
      'de': 'Du hast einen Broadcast erhalten!',
      'en': '',
    },
  },
  // CompUserListDynamicChildrenCheckboxCopy
  {
    't4stoiu2': {
      'de': ' ',
      'en': '',
    },
    'lzwq7mxe': {
      'de': ' ',
      'en': '',
    },
  },
  // CompUserListInvitationData
  {
    '5j1yb50g': {
      'de': 'Eingeladen am: ',
      'en': '',
    },
  },
  // CompFilterFacetSearch
  {
    'yxdd53pw': {
      'de': 'Suche einschränken',
      'en': '',
    },
    'zdevcom8': {
      'de': 'Option 1',
      'en': '',
    },
    'u42r5qku': {
      'de': 'Sportart wählen',
      'en': '',
    },
    'yt7jh9d2': {
      'de': 'Search for an item...',
      'en': '',
    },
    'su4cx2cg': {
      'de': 'Option 1',
      'en': '',
    },
    'rekbovao': {
      'de': 'Gewichtklasse wählen',
      'en': '',
    },
    'ydey1jk0': {
      'de': 'Search for an item...',
      'en': '',
    },
    'c79d0l7d': {
      'de': 'Ort (Postleitzahl)',
      'en': '',
    },
    'gjfhspbe': {
      'de': 'Bestätigen',
      'en': '',
    },
    'lyva01z8': {
      'de': 'Field is required',
      'en': '',
    },
    '4shd7gcs': {
      'de': 'Please enter a real name',
      'en': '',
    },
    'v7zed35a': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    '6cingofn': {
      'de': 'Please enter a short desription',
      'en': '',
    },
    'qtf9hewk': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fvj186nh': {
      'de': 'We have to have a URL for the project.',
      'en': '',
    },
    'yphscaat': {
      'de': 'Please enter a valid URL...',
      'en': '',
    },
    'cvhcajny': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'z5s5h76z': {
      'de': 'Field is required',
      'en': '',
    },
    'qegyfogt': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CompSentEventResponse
  {
    '88ikv97m': {
      'de': 'Unsicher',
      'en': '',
    },
    'ik8a2vp8': {
      'de': 'Abbrechen',
      'en': '',
    },
  },
  // CompSelectUserList
  {
    '9xxyhs2s': {
      'de': 'Personen auswählen',
      'en': '',
    },
    'ip2udd9s': {
      'de': 'Mitglieder',
      'en': '',
    },
    'eud0251e': {
      'de': 'Alle Mitglieder auswählen',
      'en': '',
    },
    'l8d2vwah': {
      'de': ' ',
      'en': '',
    },
    'u5xhir9m': {
      'de': ' ',
      'en': '',
    },
    '8uumpu6p': {
      'de': 'Follower',
      'en': '',
    },
    'iymh9ci9': {
      'de': 'Alle Follower auswählen',
      'en': '',
    },
    'lb8hgbuk': {
      'de': ' ',
      'en': '',
    },
    'zqljgtlj': {
      'de': ' ',
      'en': '',
    },
    'flteqd4t': {
      'de': 'Alle Mitglieder auswählen',
      'en': '',
    },
    'spx18rsv': {
      'de': ' ',
      'en': '',
    },
    'l3y60xjb': {
      'de': ' ',
      'en': '',
    },
    'ji8l5nvq': {
      'de': 'Bestätigen',
      'en': '',
    },
    'tm4uibkh': {
      'de': 'Field is required',
      'en': '',
    },
    'cepkoaum': {
      'de': 'Please enter a real name',
      'en': '',
    },
    'ika24ze1': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'njv220j8': {
      'de': 'Please enter a short desription',
      'en': '',
    },
    'nfagtbd0': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'i05xt0x3': {
      'de': 'We have to have a URL for the project.',
      'en': '',
    },
    'oaenbm6j': {
      'de': 'Please enter a valid URL...',
      'en': '',
    },
    '01sfs8ic': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ryi69yyr': {
      'de': 'Field is required',
      'en': '',
    },
    'q944fkal': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CompFilterFacetManageMember
  {
    '9wr376mx': {
      'de': 'Suche einschränken',
      'en': '',
    },
    '5z6yl6qm': {
      'de': 'Option 1',
      'en': '',
    },
    'x319asn5': {
      'de': 'Mit Kennzeichnung wählen',
      'en': '',
    },
    'v3cvnhsn': {
      'de': 'Search for an item...',
      'en': '',
    },
    'trrjm1rg': {
      'de': 'Option 1',
      'en': '',
    },
    'lrh7grzn': {
      'de': 'Gewichtklasse wählen',
      'en': '',
    },
    'jm6qubo7': {
      'de': 'Search for an item...',
      'en': '',
    },
    '5gesjvny': {
      'de': 'Option 1',
      'en': '',
    },
    'bfr8gk86': {
      'de': 'Sportart wählen',
      'en': '',
    },
    '0u33bzsf': {
      'de': 'Search for an item...',
      'en': '',
    },
    'zujtenc8': {
      'de': 'Ort (Postleitzahl)',
      'en': '',
    },
    'f3bl1utg': {
      'de': 'Bestätigen',
      'en': '',
    },
    'ejzel1hw': {
      'de': 'Field is required',
      'en': '',
    },
    'tqsnn7qw': {
      'de': 'Please enter a real name',
      'en': '',
    },
    'x6u28gy8': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ovmc8kg3': {
      'de': 'Please enter a short desription',
      'en': '',
    },
    'mtsp056n': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'py7x5z0a': {
      'de': 'We have to have a URL for the project.',
      'en': '',
    },
    'ssakfs07': {
      'de': 'Please enter a valid URL...',
      'en': '',
    },
    '2qa1ocnr': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'cqipvfci': {
      'de': 'Field is required',
      'en': '',
    },
    'vt7vfpff': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CompMemberInvitationResponse
  {
    'x6dkfbz0': {
      'de': 'Akzeptieren',
      'en': '',
    },
    'aicruuch': {
      'de': 'Ablehnen',
      'en': '',
    },
    'dpa8lyz3': {
      'de': 'Abbrechen',
      'en': '',
    },
  },
  // CompEventActionSheet
  {
    'idxicswk': {
      'de': 'Antworten ansehen',
      'en': '',
    },
    'vwbpjxo9': {
      'de': 'Personen Einladen',
      'en': '',
    },
    '740m7npl': {
      'de': 'Veranstaltung bearbeiten',
      'en': '',
    },
    'm8f4nu3x': {
      'de': 'Veranstaltung absagen & löschen',
      'en': '',
    },
    'sp2vv6ne': {
      'de': 'Abbrechen',
      'en': '',
    },
    'xs29p4cl': {
      'de': 'Einladung senden',
      'en': '',
    },
    'gpba3jy3': {
      'de': 'Mitglieder: ',
      'en': '',
    },
    '0xlg6ad4': {
      'de': 'Follower: ',
      'en': '',
    },
  },
  // CompEventResponseOverview
  {
    'fhhdgozy': {
      'de': 'Personen auswählen',
      'en': '',
    },
    '5qk69dk9': {
      'de': 'Ja',
      'en': '',
    },
    'yumzvwhm': {
      'de': 'Nein',
      'en': '',
    },
    'dprfoqn2': {
      'de': 'Unsicher',
      'en': '',
    },
    'gu3s8ajl': {
      'de': 'Offen',
      'en': '',
    },
  },
  // CompNoResult
  {
    'kgcnu194': {
      'de': 'Leider keine Treffer',
      'en': '',
    },
    'rpv80tzo': {
      'de':
          'Leider konnten wir zu deiner Suchanfrage kein passendes Ergebnis finden.',
      'en': '',
    },
  },
  // CompBetaResponse
  {
    'kvscc6bv': {
      'de': 'Fehler melden / Feedback',
      'en': '',
    },
    've2zy3dp': {
      'de': 'Was möchtest du uns mitteilen?',
      'en': '',
    },
    '44k0f7wp': {
      'de': 'z.B. Freies Training, Boxkampf, Tag der offenen Tür',
      'en': '',
    },
    '9f65z1mz': {
      'de': 'Feedback senden',
      'en': '',
    },
  },
  // searchBar
  {
    '5hq4zu2a': {
      'de': 'Namen eingeben',
      'en': '',
    },
  },
  // CompNoMemberships
  {
    's8y3c54y': {
      'de': 'Du hast keine aktiven Vereinsmitgliedschaften.',
      'en': '',
    },
  },
  // CompCreateOrgStatus
  {
    'kih01kp1': {
      'de': 'Vereins-Status posten',
      'en': '',
    },
    'yf125fqa': {
      'de': 'Status ändern',
      'en': '',
    },
    '0wt5ya1p': {
      'de': 'Teile hier Neuigkeiten mit deinen Vereinsmitgliedern.',
      'en': '',
    },
    'n6il1y3k': {
      'de': 'Bestätigen',
      'en': '',
    },
    '2pyl6x43': {
      'de': 'Field is required',
      'en': '',
    },
    'i0ajn7qn': {
      'de': 'Please enter a real name',
      'en': '',
    },
    'koks7d6v': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'axw3gbab': {
      'de': 'Please enter a short desription',
      'en': '',
    },
    'fpg4luis': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'j5awc0rj': {
      'de': 'We have to have a URL for the project.',
      'en': '',
    },
    '9oxga9w3': {
      'de': 'Please enter a valid URL...',
      'en': '',
    },
    'e2los7m6': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
    'lnpetdt6': {
      'de': 'Field is required',
      'en': '',
    },
    'akgmmpuc': {
      'de': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // CompNoEventsFound
  {
    '5xwhf9np': {
      'de': 'Aktuell keine Veranstaltungen verfügbar.',
      'en': '',
    },
  },
  // CompProfileQRCode
  {
    'adaqeuq3': {
      'de': 'Scanne diesen QR-Code um direkt zu deinem Profil zu gelangen',
      'en': '',
    },
  },
  // changelog
  {
    'kz1ah530': {
      'de': 'Changelog',
      'en': '',
    },
    'rfromm6v': {
      'de':
          '12.01.2024\n\n- Neues Chat-Interface ist nun Standard  (Aktuell funktoniern nur 1:1 Chats)\n\n- Neues Aktionsmenü auf der Startseite für Vereine\n\n- Neu: Vereine können nun einen Status erstellen, der auf dem Vereins-Kanal zu sehen ist\n\n- Neues Datenbankmodell für Chats, sollten damit schneller laden\n\n- Bei der Personensuche können nun Filter angewendet werden\n',
      'en': '',
    },
    '5hfqhfmm': {
      'de':
          '09.01.2024\n\n- Neues Chat-Interface. Long-Press auf das Chat-Symbol, um den neuen Chat zu öffnen  (Aktuell funktoniern nur 1:1 Chats)\n\n- Fehler Behoben bei dem in der Chat-Übersicht ein leeres Feld zu sehen war, wenn es einen Chat ohne Nachrichtigen gab\n\n- Neues Werbebanner-Format im Stack auf der Homepage, basierend auf den AdMob Formaten\n\n- Fehler Behoben bei dem der Text \"Verein verlassen\" immer als Option im erweiterten Nutzer-Menü zu sehen war\n\n- Performance-Verbesserung durch verlegen von Backend-Queries von Columsn auf listViews\n\n- Neuer Reiter \"Lokale Events\" in der Eventübersicht zeigt öffentliche Events in der gleichen Postleitzahl des Nutzers an\n\n- Auf Events mit beschränkter Teilnehmer-Zahl werden nun die verfügbaren Plätze angezeigt \n\n',
      'en': '',
    },
    'xnyd5xgx': {
      'de':
          '05.01.2024\n\n- QR-Code-Scanner, welcher dazu benutzt werden kann die QR-Codes anderer user zu scannen und so direkt auf ihr Profil zu gelangen. (Button im \"Mein Account\" Popup)\nACHTUNG: Diese Funktion steht in der aktuellen Browser-Version der App nicht zur Verfügung.\n\n- QR-Code des eigenen Profils kann über das \"Mein Account\" Popup aufgerufen werden\n\n',
      'en': '',
    },
    'ii420t53': {
      'de': 'Schließen',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'tuu73nqe': {
      'de': 'Bestätigen',
      'en': '',
    },
    'igai1kys': {
      'de': 'Speichern',
      'en': '',
    },
    '8cuxsm56': {
      'de': 'Löschen',
      'en': '',
    },
    'hnbcpbqv': {
      'de': 'Button',
      'en': '',
    },
    'qyympxtf': {
      'de': 'Abbrechen',
      'en': '',
    },
    'bkirmuz9': {
      'de': 'Senden',
      'en': '',
    },
    '8escgwu7': {
      'de': 'Was möchtest du uns mitteilen?',
      'en': '',
    },
    'dlyo35az': {
      'de': 'Beschreibung',
      'en': '',
    },
    '5z51m3fv': {
      'de': 'z.B. Freies Training, Boxkampf, Tag der offenen Tür',
      'en': '',
    },
    'ol4z1hor': {
      'de': 'Beschreibung',
      'en': '',
    },
    'm2z4nrrb': {
      'de': '...',
      'en': '',
    },
    'q17h4rct': {
      'de': '',
      'en': '',
    },
    'mqttin0v': {
      'de': 'Search for an item...',
      'en': '',
    },
    'nbhpr1eu': {
      'de': '',
      'en': '',
    },
    'gzcnq125': {
      'de': '',
      'en': '',
    },
    'knfgn39d': {
      'de':
          'In order to send you notifications to your device, this app requires permissions for notifications.',
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
    'bpd354cp': {
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
