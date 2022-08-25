class Transactions {
  late String title; // ชื่อรายการ
  late double amount; // จำนวนเงิน
  late DateTime date; // เวลา

  Transactions({
    required this.title, 
    required this.amount, 
    required this.date});
}
