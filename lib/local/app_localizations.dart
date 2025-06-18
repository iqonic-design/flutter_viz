import 'package:flutter_viz/local/language_ar.dart';
import 'package:flutter_viz/local/language_en.dart';
import 'package:flutter_viz/local/language_es.dart';
import 'package:flutter_viz/local/language_fr.dart';
import 'package:flutter_viz/local/language_vi.dart';
import 'package:flutter_viz/local/languages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'language_af.dart';
import 'language_de.dart';
import 'language_gu.dart';
import 'language_hi.dart';
import 'language_id.dart';
import 'language_nl.dart';
import 'language_pt.dart';
import 'language_tr.dart';

class AppLocalizations extends LocalizationsDelegate<BaseLanguage> {
  const AppLocalizations();

  @override
  Future<BaseLanguage> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'hi':
        return LanguageHi();
      case 'ar':
        return LanguageAr();
      case 'fr':
        return LanguageFr();
      case 'es':
        return LanguageEs();
      case 'af':
        return LanguageAf();
      case 'de':
        return LanguageDe();
      case 'id':
        return LanguageId();
      case 'tr':
        return LanguageTr();
      case 'vi':
        return LanguageVi();
      case 'ni':
        return LanguageNl();
      case 'gu':
        return LanguageGu();
      case 'pt':
        return LanguagePt();
      default:
        return LanguageEn();
    }
  }

  @override
  bool isSupported(Locale locale) => LanguageDataModel.languages().contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<BaseLanguage> old) => false;
}
