class SeatLayoutModel {
  final int rows;
  final int cols;
  List<Map<String, dynamic>> seatTypes;
  final int gap;
  final int gapColIndex;
  final bool isLastFilled;
  final int rowBreaks;
  SeatLayoutModel({
    required this.rows,
    required this.cols,
    required this.seatTypes,
    required this.gap,
    required this.gapColIndex,
    required this.isLastFilled,
    required this.rowBreaks,
  });
}

final executiveseatLayout = SeatLayoutModel(
  rows: 10,
  cols: 4,
  seatTypes: [],
  gap: 2,
  gapColIndex: 2,
  isLastFilled: true,
  rowBreaks: 10,
);

final economyseatLayout = SeatLayoutModel(
  rows: 12,
  cols: 5,
  seatTypes: [
    {
      "Accra": 200,
      "Tema": 200,
      "Takoradi": 200,
    }
  ],
  gap: 2,
  gapColIndex: 2,
  isLastFilled: true,
  rowBreaks: 11,
);
