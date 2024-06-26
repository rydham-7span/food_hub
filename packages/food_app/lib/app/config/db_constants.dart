class ConstantDb {
  static String sqlForCreateTicketTable = '''
  uuid text not null,
  user_id int not null,
  event_id int not null,
  package_id int default null,
  parent_id int default null,
  booking_no text default null,
  ticket_no text primary key not null,
  sell_type text default user,
  section text default null,
  row text default null,
  seat text default null,
  used_at text default null,
  used int default 0,
  status text default unpaid
  ''';
  static String sqlForCreateTicketHistoryTable = '''
  id integer primary key autoincrement,
  uuid text not null,
  ticket_no text default null,
  type text default valid,
  direction text default dIn,
  last_valid_at text default null
  ''';
}
