
import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/main/data/model/bottom_navigation_bar_item_model.dart';

List<BottomNavigationBarItemModel> items = [
  BottomNavigationBarItemModel(
    image: Image.asset('assets/icons/home.png', width: 18, height: 18),
    activeImage: Image.asset('assets/icons/activeHome.png', width: 18, height: 18),
    text: 'Главная',
  ),
  BottomNavigationBarItemModel(
    image: Image.asset(
      'assets/icons/announcement.png',
      width: 18,
      height: 18,
    ),
    activeImage:
        Image.asset('assets/icons/activeAnnouncement.png', width: 18, height: 18),
    text: 'Объявления',
  ),
  BottomNavigationBarItemModel(
    image: Image.asset('assets/icons/issue.png', width: 18, height: 18),
    activeImage: Image.asset('assets/icons/activeIssue.png', width: 18, height: 18),
    text: 'Вопрос',
  ),
  BottomNavigationBarItemModel(
    image: Image.asset('assets/icons/group.png', width: 18, height: 18),
    activeImage: Image.asset('assets/icons/activeGroup.png', width: 18, height: 18),
    text: 'Сообщества',
  ),
  BottomNavigationBarItemModel(
    image: Image.asset('assets/icons/account.png', width: 18, height: 18),
    activeImage: Image.asset('assets/icons/accountActive.png', width: 18, height: 18),
    text: 'Профиль',
  ),
];
