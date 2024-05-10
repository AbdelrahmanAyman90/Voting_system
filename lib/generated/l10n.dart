// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Vote`
  String get vote {
    return Intl.message(
      'Vote',
      name: 'vote',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get result {
    return Intl.message(
      'Results',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `personal detials`
  String get personal_details {
    return Intl.message(
      'personal detials',
      name: 'personal_details',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Ahmed`
  String get name_personal {
    return Intl.message(
      'Mohamed Ahmed',
      name: 'name_personal',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Ahmed Ali Ismail Mohamed`
  String get full_name_personal {
    return Intl.message(
      'Mohamed Ahmed Ali Ismail Mohamed',
      name: 'full_name_personal',
      desc: '',
      args: [],
    );
  }

  /// `30203211703504`
  String get id {
    return Intl.message(
      '30203211703504',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `1/4/1964`
  String get date {
    return Intl.message(
      '1/4/1964',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `More Details`
  String get more_details {
    return Intl.message(
      'More Details',
      name: 'more_details',
      desc: '',
      args: [],
    );
  }

  /// `Get Help`
  String get get_help {
    return Intl.message(
      'Get Help',
      name: 'get_help',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get log_out {
    return Intl.message(
      'Log Out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get verified {
    return Intl.message(
      'Verified',
      name: 'verified',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message(
      'Results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Total Votes`
  String get total_vote {
    return Intl.message(
      'Total Votes',
      name: 'total_vote',
      desc: '',
      args: [],
    );
  }

  /// `Voting ends in 6 hours`
  String get voting_end {
    return Intl.message(
      'Voting ends in 6 hours',
      name: 'voting_end',
      desc: '',
      args: [],
    );
  }

  /// `votes`
  String get votes_word {
    return Intl.message(
      'votes',
      name: 'votes_word',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Ahmed Ali`
  String get candidate_name {
    return Intl.message(
      'Mohamed Ahmed Ali',
      name: 'candidate_name',
      desc: '',
      args: [],
    );
  }

  /// `13,868,556`
  String get candiadate_number_voter {
    return Intl.message(
      '13,868,556',
      name: 'candiadate_number_voter',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for voting!`
  String get thankes_vote {
    return Intl.message(
      'Thanks for voting!',
      name: 'thankes_vote',
      desc: '',
      args: [],
    );
  }

  /// `Your vote has been registered on the chain.`
  String get sub_title_thankes_vote_1 {
    return Intl.message(
      'Your vote has been registered on the chain.',
      name: 'sub_title_thankes_vote_1',
      desc: '',
      args: [],
    );
  }

  /// `Now wait to see the final results`
  String get sub_title_thankes_vote_2 {
    return Intl.message(
      'Now wait to see the final results',
      name: 'sub_title_thankes_vote_2',
      desc: '',
      args: [],
    );
  }

  /// `View Live Results`
  String get thankes_voting_button {
    return Intl.message(
      'View Live Results',
      name: 'thankes_voting_button',
      desc: '',
      args: [],
    );
  }

  /// `Egyptian lawyer and founder of lorem ipsum lorem ipsum.`
  String get candidate_bio {
    return Intl.message(
      'Egyptian lawyer and founder of lorem ipsum lorem ipsum.',
      name: 'candidate_bio',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enter_password {
    return Intl.message(
      'Enter Password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Please input your Password to confirm your vote`
  String get hint_password {
    return Intl.message(
      'Please input your Password to confirm your vote',
      name: 'hint_password',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Vote`
  String get confirm_voting_button {
    return Intl.message(
      'Confirm Vote',
      name: 'confirm_voting_button',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel_button {
    return Intl.message(
      'Cancel',
      name: 'cancel_button',
      desc: '',
      args: [],
    );
  }

  /// `Elesctions`
  String get elesctions {
    return Intl.message(
      'Elesctions',
      name: 'elesctions',
      desc: '',
      args: [],
    );
  }

  /// `Presidential Elections`
  String get presidential_elections {
    return Intl.message(
      'Presidential Elections',
      name: 'presidential_elections',
      desc: '',
      args: [],
    );
  }

  /// `Select the candidate of your choice and tap to vote.`
  String get hint_to_select_candidate {
    return Intl.message(
      'Select the candidate of your choice and tap to vote.',
      name: 'hint_to_select_candidate',
      desc: '',
      args: [],
    );
  }

  /// `Vote`
  String get voting_button {
    return Intl.message(
      'Vote',
      name: 'voting_button',
      desc: '',
      args: [],
    );
  }

  /// `should enter Password`
  String get passord_error {
    return Intl.message(
      'should enter Password',
      name: 'passord_error',
      desc: '',
      args: [],
    );
  }

  /// `personal information`
  String get personal_information {
    return Intl.message(
      'personal information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get titel_name {
    return Intl.message(
      'Name',
      name: 'titel_name',
      desc: '',
      args: [],
    );
  }

  /// `AGE`
  String get age {
    return Intl.message(
      'AGE',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `EDUCATION`
  String get education {
    return Intl.message(
      'EDUCATION',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `JOP`
  String get job {
    return Intl.message(
      'JOP',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `LOCATION`
  String get location {
    return Intl.message(
      'LOCATION',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio_titel {
    return Intl.message(
      'Bio',
      name: 'bio_titel',
      desc: '',
      args: [],
    );
  }

  /// `Next Candidate`
  String get next_candidate_button {
    return Intl.message(
      'Next Candidate',
      name: 'next_candidate_button',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit .`
  String get bio_desc {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit .',
      name: 'bio_desc',
      desc: '',
      args: [],
    );
  }

  /// `Goals`
  String get goal_titel {
    return Intl.message(
      'Goals',
      name: 'goal_titel',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet consectetur `
  String get goal_desc {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur ',
      name: 'goal_desc',
      desc: '',
      args: [],
    );
  }

  /// `Read more`
  String get read_more {
    return Intl.message(
      'Read more',
      name: 'read_more',
      desc: '',
      args: [],
    );
  }

  /// `Candidates`
  String get candidate_word {
    return Intl.message(
      'Candidates',
      name: 'candidate_word',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get event_word {
    return Intl.message(
      'Events',
      name: 'event_word',
      desc: '',
      args: [],
    );
  }

  /// `Trending news`
  String get trending_news {
    return Intl.message(
      'Trending news',
      name: 'trending_news',
      desc: '',
      args: [],
    );
  }

  /// `Billionaire-backed Koch network endorses Nikki Haley for president`
  String get tittel_news {
    return Intl.message(
      'Billionaire-backed Koch network endorses Nikki Haley for president',
      name: 'tittel_news',
      desc: '',
      args: [],
    );
  }

  /// `30 SEPTEMBER 2023`
  String get data_news {
    return Intl.message(
      '30 SEPTEMBER 2023',
      name: 'data_news',
      desc: '',
      args: [],
    );
  }

  /// `NOMINATING FOR ELECTIONS`
  String get NOMINATING_FOR_ELECTIONS {
    return Intl.message(
      'NOMINATING FOR ELECTIONS',
      name: 'NOMINATING_FOR_ELECTIONS',
      desc: '',
      args: [],
    );
  }

  /// `Nationwide`
  String get Nationwide {
    return Intl.message(
      'Nationwide',
      name: 'Nationwide',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get applay_button {
    return Intl.message(
      'Apply',
      name: 'applay_button',
      desc: '',
      args: [],
    );
  }

  /// `35,853,967`
  String get all_voter_number {
    return Intl.message(
      '35,853,967',
      name: 'all_voter_number',
      desc: '',
      args: [],
    );
  }

  /// `voters`
  String get voter {
    return Intl.message(
      'voters',
      name: 'voter',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
