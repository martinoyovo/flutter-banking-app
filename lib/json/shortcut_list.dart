import 'package:flutter/material.dart';
import 'package:flutter_banking_app/pages/send_money.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';

List shortcutList = [
  {
    "color": Color(0xFF026EF4),
    "icon": IconlyBold.Download
  },
  {
    "color": Color(0xFFFB6A4B),
    "icon": IconlyBold.Upload,
    "route": SendMoney()
  },
  {
    "color": Color(0xFF2BB33A),
    "icon": IconlyBold.Wallet
  },
  {
    "color": Color(0xFFAF52C1),
    "icon": IconlyBold.Category
  },
];

List profilesShortcutList = [
  {
    "color": Color(0xFFe2a935),
    "icon": IconlyBold.Chart
  },
  {
    "color": Color(0xFF2290b8),
    "icon": IconlyBold.Notification
  },
  {
    "color": Color(0xFF6bcde8),
    "icon": IconlyBold.Setting
  },
  {
    "color": Color(0xFF6b41dc),
    "icon": Icons.logout
  },
];