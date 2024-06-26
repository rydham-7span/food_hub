import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:food_ui/food_ui.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ApiConstants {
  static const String login = 'sales-app/login';
  static const String logout = 'sales-app/logout';
  static const String dashBoardEvent = 'sales-app/events';
  static const String favouriteEvent = 'sales-app/events/%s/favourite';
  static const String city = 'sales-app/city-options';
  static const String eventDetails = 'sales-app/events/%s';
  static const String statistics = 'sales-app/events/%s/statistics';
  static const String closeEvent = 'sales-app/events/%s/close-event-sales';
  static const String chart = 'sales-app/events/%s/statistics-chart';
  static const String compCheckout = 'sales-app/events/%s/complimentary-checkout';
  static const String eventDailyReport = 'sales-app/events/%s/generate-daily-report';
  static const String guestList = 'sales-app/events/%s/guests';
  static const String guestListDetail = 'sales-app/events/%s/guests/%s';
  static const String guestStatistics = 'sales-app/events/%s/scanning-statistics';
  static const String guestValidate = 'sales-app/events/%s/guests/validate';
  static const String refundTicket = 'sales-app/tickets/%s/refund';
  static const String voidTicket = 'sales-app/tickets/%s/void';
  static const String resendTicket = 'sales-app/tickets/%s/resend';
  static const String scannerCodeGenerate = 'sales-app/scanners';
  static const String scannerVerify = 'sales-app/scanner/verify';
  static const String scannerValidate = 'sales-app/validate';
  static const String scannerTicketInfo = 'sales-app/tickets/info';
  static const String forgotPassword = 'sales-app/forgot-password';
  static const String resetPassword = 'sales-app/reset-password';
  static const String exportTicketReport = 'sales-app/events/%s/export-ticket-report';
  static const String updateGuest = 'sales-app/tickets/%s/update-contact-info';
  static const String scannerHistory = 'sales-app/tickets-scan-histories';
  static const String appVersion = 'sales-app/platforms/%s';
  static const String syncTickets = 'sales-app/events/%s/sync-tickets';
  static const String syncBackToServer = 'sales-app/scanner/%s/sync-offline-validated-tickets';
  static const String fetchRoles = 'sales-app/roles';
  static const String roleWisePermission = 'sales-app/roles/%s/permissions';
  static const String createUserRole = 'sales-app/events/%s/users';
  static const String fetchUserForRole = 'sales-app/events/%s/users';
  static const String fetchEventWisePermission = 'sales-app/events/%s/user-permissions';
  static const String fetchUserDetails = 'sales-app/events/%s/users/%s';
}

abstract class AppConstants {
  static const String appName = 'EventMania BoxOffice';
  static const String tokenKey = 'token';
  static const String scannerCodeKey = 'scannerCode';
  static const String lastSyncTimeKey = 'syncKey';
  static const String eventWisePermissionKey = 'permissionKey';
  static const String publishEvent = 'published';
  static const String archiveEvent = 'archived';
  static const String draftEvent = 'draft';
  static const String notCheckIn = 'Not checked in';
  static const String checkedIn = 'Checked In';
  static const String partialCheckedIn = 'Partial checked in';
  static const String scanningInStatus = 'in';
  static const String scanningOutStatus = 'out';
  static const String playStoreLink =
      'https://play.google.com/store/apps/details?id=com.eventmania.scanner';
  static const String appStoreLink = 'https://apps.apple.com/in/app/id6480520351';
  static QRViewController? qrViewController;

  static int getIntForGuestDetails(String data) {
    if (data == notCheckIn) {
      return 0;
    } else if (data == checkedIn) {
      return 1;
    } else {
      return 2;
    }
  }

  static EventTransformer<Event> debounce<Event>({
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }

  static Future<String> getDbPath() async {
    late Directory path;
    if (Platform.isIOS) {
      path = await getLibraryDirectory();
    } else {
      path = await getApplicationDocumentsDirectory();
    }

    return '${path.path}/tb_str';
  }

  static Future<void> launchUrlForUpdate(BuildContext context) async {
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(AppConstants.appStoreLink))) {
        try {
          await launchUrl(Uri.parse(AppConstants.appStoreLink));
        } catch (e) {
          await Future.delayed(Duration.zero).then(
            (value) => AppUtils.showSnackBar(context, null, isError: true),
          );
        }
      }
    } else {
      if (await canLaunchUrl(Uri.parse(AppConstants.playStoreLink))) {
        try {
          await launchUrl(Uri.parse(AppConstants.playStoreLink));
        } catch (e) {
          await Future.delayed(Duration.zero).then(
            (value) => AppUtils.showSnackBar(context, null, isError: true),
          );
        }
      }
    }
  }
}

abstract class ErrorConstants {
  static const String unknownErrorKey = 'unknown';
  static const String noInternetKey = 'no_connection';
  static const String wrongCredentialKey = 'password';
  static const String wrongEmailKey = 'email';
  static const String wrongAuthCode = 'scanner_auth_code';
  static const String nothingToSync = 'nothing_sync';
  static const String scannerCodeNotFound = 'code_not_found';
}

abstract class DatabaseConstant {
  static const String dbName = 'embOffline.db';
  static const String ticketTable = 'ticket_tbl';
  static const String ticketHistoryTable = 'ticket_history_tbl';
}

abstract class RolesConstant {
  static const String allowScanning = 'allow_scanning';
  static const String createScanning = 'create_scanner_code';
  static const String allowGuestListAccess = 'allow_guest_list_access';
  static const String viewEventOverview = 'view_event_overview';
  static const String viewEventAttendance = 'view_event_attendance';
  static const String sendEventReport = 'send_event_report';
  static const String allowGuestResendTicket = 'allow_guest_resend_ticket';
  static const String allowGuestCheckInOut = 'allow_guest_check_in_out';
  static const String allowGuestContactInformationUpdate = 'allow_guest_contact_information_update';
  static const String allowFullRefundTicket = 'allow_full_refund_ticket';
  static const String allowPartialRefundTicket = 'allow_partial_refund_ticket';
  static const String allowVoidTicket = 'allow_void_ticket';
  static const String sendWillCallList = 'send_will_call_list';
  static const String sendCompTicket = 'send_comp_ticket';
  static const String closeEventSales = 'close_event_sales';
  static const String viewRole = 'view_role';
  static const String createRole = 'create_role';
  static const String updateRole = 'update_role';
  static const String deleteRole = 'delete_role';
}

abstract class ModuleConstant {
  static const String scanner = 'scanner';
  static const String dashboard = 'event-dashboard';
  static const String role = 'role';
  static const String guestList = 'guest-list';
}
