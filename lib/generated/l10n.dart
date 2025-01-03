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

  /// `NAME :`
  String get titel_name {
    return Intl.message(
      'NAME :',
      name: 'titel_name',
      desc: '',
      args: [],
    );
  }

  /// `AGE :`
  String get age_title {
    return Intl.message(
      'AGE :',
      name: 'age_title',
      desc: '',
      args: [],
    );
  }

  /// `50`
  String get age_desc {
    return Intl.message(
      '50',
      name: 'age_desc',
      desc: '',
      args: [],
    );
  }

  /// `EDUCATION :`
  String get education_title {
    return Intl.message(
      'EDUCATION :',
      name: 'education_title',
      desc: '',
      args: [],
    );
  }

  /// `MSC`
  String get education_desc {
    return Intl.message(
      'MSC',
      name: 'education_desc',
      desc: '',
      args: [],
    );
  }

  /// `JOP :`
  String get job_title {
    return Intl.message(
      'JOP :',
      name: 'job_title',
      desc: '',
      args: [],
    );
  }

  /// `Engineer`
  String get job_desc {
    return Intl.message(
      'Engineer',
      name: 'job_desc',
      desc: '',
      args: [],
    );
  }

  /// `LOCATION :`
  String get location_title {
    return Intl.message(
      'LOCATION :',
      name: 'location_title',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get location_desc {
    return Intl.message(
      'Egypt',
      name: 'location_desc',
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

  /// `Lorem ipsum dolor sit amet consectetur. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit . `
  String get goal_desc {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit . ',
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

  /// `Nonating For Election`
  String get NOMINATING_FOR_ELECTIONS {
    return Intl.message(
      'Nonating For Election',
      name: 'NOMINATING_FOR_ELECTIONS',
      desc: '',
      args: [],
    );
  }

  /// `Add The Election Campaign`
  String get add_Campign_Candidates {
    return Intl.message(
      'Add The Election Campaign',
      name: 'add_Campign_Candidates',
      desc: '',
      args: [],
    );
  }

  /// `Selection Of Candidates`
  String get choose_Candidate {
    return Intl.message(
      'Selection Of Candidates',
      name: 'choose_Candidate',
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

  /// `Hello Mohamed`
  String get hello_Name {
    return Intl.message(
      'Hello Mohamed',
      name: 'hello_Name',
      desc: '',
      args: [],
    );
  }

  /// `No Ongoing Eletions!`
  String get no_election {
    return Intl.message(
      'No Ongoing Eletions!',
      name: 'no_election',
      desc: '',
      args: [],
    );
  }

  /// `The elections are starting in 30 days.You will be notified when the election starts.`
  String get election_start {
    return Intl.message(
      'The elections are starting in 30 days.You will be notified when the election starts.',
      name: 'election_start',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get Apply {
    return Intl.message(
      'Apply',
      name: 'Apply',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.`
  String get news_content {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.',
      name: 'news_content',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get Form {
    return Intl.message(
      'Form',
      name: 'Form',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Are your parents egyptian ? `
  String get ques1 {
    return Intl.message(
      'Are your parents egyptian ? ',
      name: 'ques1',
      desc: '',
      args: [],
    );
  }

  /// `please upload your Family registration.`
  String get upload_ques1 {
    return Intl.message(
      'please upload your Family registration.',
      name: 'upload_ques1',
      desc: '',
      args: [],
    );
  }

  /// `Did you get high education ?`
  String get ques2 {
    return Intl.message(
      'Did you get high education ?',
      name: 'ques2',
      desc: '',
      args: [],
    );
  }

  /// `please upload your collage degree .`
  String get upload_ques2 {
    return Intl.message(
      'please upload your collage degree .',
      name: 'upload_ques2',
      desc: '',
      args: [],
    );
  }

  /// `Did you finish your military service ? `
  String get ques3 {
    return Intl.message(
      'Did you finish your military service ? ',
      name: 'ques3',
      desc: '',
      args: [],
    );
  }

  /// `please upload your Military certificate.`
  String get upload_ques3 {
    return Intl.message(
      'please upload your Military certificate.',
      name: 'upload_ques3',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any physical or mental illness ?`
  String get ques4 {
    return Intl.message(
      'Do you have any physical or mental illness ?',
      name: 'ques4',
      desc: '',
      args: [],
    );
  }

  /// `please upload your upload medical report.`
  String get upload_ques4 {
    return Intl.message(
      'please upload your upload medical report.',
      name: 'upload_ques4',
      desc: '',
      args: [],
    );
  }

  /// `Do you have any foreign wife ? `
  String get ques5 {
    return Intl.message(
      'Do you have any foreign wife ? ',
      name: 'ques5',
      desc: '',
      args: [],
    );
  }

  /// `please upload your Family registration.`
  String get upload_ques5 {
    return Intl.message(
      'please upload your Family registration.',
      name: 'upload_ques5',
      desc: '',
      args: [],
    );
  }

  /// `Do you have a previous criminal conviction ?`
  String get ques6 {
    return Intl.message(
      'Do you have a previous criminal conviction ?',
      name: 'ques6',
      desc: '',
      args: [],
    );
  }

  /// `please upload Criminal records certificate.`
  String get upload_ques6 {
    return Intl.message(
      'please upload Criminal records certificate.',
      name: 'upload_ques6',
      desc: '',
      args: [],
    );
  }

  /// `please upload Payment receipt.`
  String get upload_Payment_receipt {
    return Intl.message(
      'please upload Payment receipt.',
      name: 'upload_Payment_receipt',
      desc: '',
      args: [],
    );
  }

  /// `please upload personal photo.`
  String get upload_personal_photo {
    return Intl.message(
      'please upload personal photo.',
      name: 'upload_personal_photo',
      desc: '',
      args: [],
    );
  }

  /// `please upload your campaign as a video or link`
  String get upload_your_campaign_form {
    return Intl.message(
      'please upload your campaign as a video or link',
      name: 'upload_your_campaign_form',
      desc: '',
      args: [],
    );
  }

  /// `input your video link ....`
  String get video_link {
    return Intl.message(
      'input your video link ....',
      name: 'video_link',
      desc: '',
      args: [],
    );
  }

  /// `upload your video `
  String get upload_your_video {
    return Intl.message(
      'upload your video ',
      name: 'upload_your_video',
      desc: '',
      args: [],
    );
  }

  /// `write a bio about yourself..... `
  String get bio {
    return Intl.message(
      'write a bio about yourself..... ',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `write your goals.... `
  String get goals {
    return Intl.message(
      'write your goals.... ',
      name: 'goals',
      desc: '',
      args: [],
    );
  }

  /// `Your application has been accepted as a candidate please press the bellow button to upload your campaign as a video ,write a Bio about yourself and your goals which you will acheive when being a president. `
  String get notification_content {
    return Intl.message(
      'Your application has been accepted as a candidate please press the bellow button to upload your campaign as a video ,write a Bio about yourself and your goals which you will acheive when being a president. ',
      name: 'notification_content',
      desc: '',
      args: [],
    );
  }

  /// `You have submitted successfully.`
  String get submit_successfully {
    return Intl.message(
      'You have submitted successfully.',
      name: 'submit_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Are you ready to vote?`
  String get onboarding1_title {
    return Intl.message(
      'Are you ready to vote?',
      name: 'onboarding1_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to iDemocracy, the app that makes voting secure & transparent.Take part in elections,wherever you are.`
  String get onboarding1_desc {
    return Intl.message(
      'Welcome to iDemocracy, the app that makes voting secure & transparent.Take part in elections,wherever you are.',
      name: 'onboarding1_desc',
      desc: '',
      args: [],
    );
  }

  /// `100% safe and secure`
  String get onboarding2_title {
    return Intl.message(
      '100% safe and secure',
      name: 'onboarding2_title',
      desc: '',
      args: [],
    );
  }

  /// `voteing`
  String get onboarding2_title2 {
    return Intl.message(
      'voteing',
      name: 'onboarding2_title2',
      desc: '',
      args: [],
    );
  }

  /// `Since our app is built on blockchain,it is very secure,Results and votes can’t be manipulated by a third party.`
  String get onboarding2_desc {
    return Intl.message(
      'Since our app is built on blockchain,it is very secure,Results and votes can’t be manipulated by a third party.',
      name: 'onboarding2_desc',
      desc: '',
      args: [],
    );
  }

  /// `Results are Completely open,`
  String get onboarding3_title {
    return Intl.message(
      'Results are Completely open,',
      name: 'onboarding3_title',
      desc: '',
      args: [],
    );
  }

  /// `clear and verifiable`
  String get onboarding3_title2 {
    return Intl.message(
      'clear and verifiable',
      name: 'onboarding3_title2',
      desc: '',
      args: [],
    );
  }

  /// `Full transparency is made possible by the blockchain technology. Any participant in the system has the ability to verify each vote.`
  String get onboarding3_desc {
    return Intl.message(
      'Full transparency is made possible by the blockchain technology. Any participant in the system has the ability to verify each vote.',
      name: 'onboarding3_desc',
      desc: '',
      args: [],
    );
  }

  /// `Your Identity will remain`
  String get onboarding4_title {
    return Intl.message(
      'Your Identity will remain',
      name: 'onboarding4_title',
      desc: '',
      args: [],
    );
  }

  /// `anonymous`
  String get onboarding4_title2 {
    return Intl.message(
      'anonymous',
      name: 'onboarding4_title2',
      desc: '',
      args: [],
    );
  }

  /// `Full transparency is made possible by the blockchain technology. Any participant in the system has the ability to verify each vote.`
  String get onboarding4_desc {
    return Intl.message(
      'Full transparency is made possible by the blockchain technology. Any participant in the system has the ability to verify each vote.',
      name: 'onboarding4_desc',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Get Started`
  String get lets_go {
    return Intl.message(
      'Let’s Get Started',
      name: 'lets_go',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `teeest`
  String get change_test {
    return Intl.message(
      'teeest',
      name: 'change_test',
      desc: '',
      args: [],
    );
  }

  /// `should choose candidate`
  String get error_to_should_choose_candatae_in_voting_screen {
    return Intl.message(
      'should choose candidate',
      name: 'error_to_should_choose_candatae_in_voting_screen',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register_word {
    return Intl.message(
      'Register',
      name: 'register_word',
      desc: '',
      args: [],
    );
  }

  /// `create your new account`
  String get crate_account_register {
    return Intl.message(
      'create your new account',
      name: 'crate_account_register',
      desc: '',
      args: [],
    );
  }

  /// `already having an account ?`
  String get Already_having_an_account {
    return Intl.message(
      'already having an account ?',
      name: 'Already_having_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Upload National ID`
  String get Upload_ID {
    return Intl.message(
      'Upload National ID',
      name: 'Upload_ID',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get National_ID {
    return Intl.message(
      'National ID',
      name: 'National_ID',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters or numbers long`
  String get error_length_password {
    return Intl.message(
      'Password must be at least 8 characters or numbers long',
      name: 'error_length_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'Confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get error_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'error_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Take a real-time photo`
  String get Take_Realtime_photo {
    return Intl.message(
      'Take a real-time photo',
      name: 'Take_Realtime_photo',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get Confirm_password_is_required {
    return Intl.message(
      'This field is required',
      name: 'Confirm_password_is_required',
      desc: '',
      args: [],
    );
  }

  /// `upload all image`
  String get upload_all_image {
    return Intl.message(
      'upload all image',
      name: 'upload_all_image',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back !`
  String get welcome_back {
    return Intl.message(
      'Welcome Back !',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Log in to your account`
  String get enter_your_account {
    return Intl.message(
      'Log in to your account',
      name: 'enter_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Acount`
  String get login_button {
    return Intl.message(
      'Create Acount',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `Verification Fail`
  String get verfication_fail {
    return Intl.message(
      'Verification Fail',
      name: 'verfication_fail',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get try_agin {
    return Intl.message(
      'Try Again',
      name: 'try_agin',
      desc: '',
      args: [],
    );
  }

  /// `Verification Successful`
  String get varfication_succses {
    return Intl.message(
      'Verification Successful',
      name: 'varfication_succses',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to iDemocracy`
  String get welcome_in_id {
    return Intl.message(
      'Welcome to iDemocracy',
      name: 'welcome_in_id',
      desc: '',
      args: [],
    );
  }

  /// `Go To Home`
  String get go_home {
    return Intl.message(
      'Go To Home',
      name: 'go_home',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `If You Forgot your password please go to your governorate’s admin !! `
  String get forget_password {
    return Intl.message(
      'If You Forgot your password please go to your governorate’s admin !! ',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forget {
    return Intl.message(
      'Forget Password ?',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get creat_new_account {
    return Intl.message(
      'Create Account',
      name: 'creat_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter National ID`
  String get error_should_enter_id {
    return Intl.message(
      'Please Enter National ID',
      name: 'error_should_enter_id',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter 14 numbers `
  String get error_lenght_id {
    return Intl.message(
      'Please Enter 14 numbers ',
      name: 'error_lenght_id',
      desc: '',
      args: [],
    );
  }

  /// `hello `
  String get hello {
    return Intl.message(
      'hello ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Applay`
  String get applay {
    return Intl.message(
      'Applay',
      name: 'applay',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Vote`
  String get vote_vutton {
    return Intl.message(
      'Vote',
      name: 'vote_vutton',
      desc: '',
      args: [],
    );
  }

  /// `You are already registered as a candidate`
  String get error_candidate {
    return Intl.message(
      'You are already registered as a candidate',
      name: 'error_candidate',
      desc: '',
      args: [],
    );
  }

  /// `Period Ended`
  String get end_period {
    return Intl.message(
      'Period Ended',
      name: 'end_period',
      desc: '',
      args: [],
    );
  }

  /// `Haven't started yet`
  String get not_start_period {
    return Intl.message(
      'Haven\'t started yet',
      name: 'not_start_period',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get mint {
    return Intl.message(
      'Minute',
      name: 'mint',
      desc: '',
      args: [],
    );
  }

  /// `Elections Have Ended`
  String get vot_end {
    return Intl.message(
      'Elections Have Ended',
      name: 'vot_end',
      desc: '',
      args: [],
    );
  }

  /// `Elections Ended After`
  String get vote_end_after {
    return Intl.message(
      'Elections Ended After',
      name: 'vote_end_after',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get chang_password {
    return Intl.message(
      'Change Password',
      name: 'chang_password',
      desc: '',
      args: [],
    );
  }

  /// `If You Forgot your old password please go to your governorate’s admin`
  String get hint_change {
    return Intl.message(
      'If You Forgot your old password please go to your governorate’s admin',
      name: 'hint_change',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get old_pas {
    return Intl.message(
      'Old Password',
      name: 'old_pas',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_pas {
    return Intl.message(
      'New Password',
      name: 'new_pas',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get conf_pass {
    return Intl.message(
      'Confirm Password',
      name: 'conf_pass',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get sumb {
    return Intl.message(
      'submit',
      name: 'sumb',
      desc: '',
      args: [],
    );
  }

  /// `Password is Change Successfully`
  String get change_sucsses {
    return Intl.message(
      'Password is Change Successfully',
      name: 'change_sucsses',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out? You will lose all your information`
  String get hint_logout {
    return Intl.message(
      'Are you sure you want to log out? You will lose all your information',
      name: 'hint_logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enter_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your job`
  String get enter_job {
    return Intl.message(
      'Enter your job',
      name: 'enter_job',
      desc: '',
      args: [],
    );
  }

  /// `Enter your educational level`
  String get enter_educ {
    return Intl.message(
      'Enter your educational level',
      name: 'enter_educ',
      desc: '',
      args: [],
    );
  }

  /// `Please upload all files`
  String get shoulad_upload_all {
    return Intl.message(
      'Please upload all files',
      name: 'shoulad_upload_all',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been successfully registered. Please wait until the announcement of the candidates.`
  String get hint_form {
    return Intl.message(
      'Your request has been successfully registered. Please wait until the announcement of the candidates.',
      name: 'hint_form',
      desc: '',
      args: [],
    );
  }

  /// `Add links`
  String get add_link {
    return Intl.message(
      'Add links',
      name: 'add_link',
      desc: '',
      args: [],
    );
  }

  /// `Add campaign`
  String get add_camp {
    return Intl.message(
      'Add campaign',
      name: 'add_camp',
      desc: '',
      args: [],
    );
  }

  /// `Campaign not added`
  String get not_add_camp {
    return Intl.message(
      'Campaign not added',
      name: 'not_add_camp',
      desc: '',
      args: [],
    );
  }

  /// `Campaign added successfully`
  String get add_camp_succsfly {
    return Intl.message(
      'Campaign added successfully',
      name: 'add_camp_succsfly',
      desc: '',
      args: [],
    );
  }

  /// `Video must be uploaded`
  String get upload_vide {
    return Intl.message(
      'Video must be uploaded',
      name: 'upload_vide',
      desc: '',
      args: [],
    );
  }

  /// `End After`
  String get wnded_after {
    return Intl.message(
      'End After',
      name: 'wnded_after',
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
