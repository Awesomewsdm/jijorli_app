import 'package:flutter/material.dart';
import 'seat_layout_model.dart';

class SeatBookingScreen extends StatelessWidget {
  const SeatBookingScreen({super.key, this.model});
  final SeatLayoutModel? model;
  final seatSize = 40.0;
  @override
  Widget build(BuildContext context) {
    var seatCounter = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Seat Selection Screen"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: List.generate(model!.rowBreaks, (row) {
            return Wrap(
                children: List.generate(model!.cols, (col) {
              // Adding middle gap

              if ((col == model!.gapColIndex) &&
                  (row != model!.rowBreaks - 1 && model!.isLastFilled)) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: seatSize,
                    width: seatSize,
                    alignment: Alignment.center,
                  ),
                );
              }

              // numbering the seats
              seatCounter++;
              String seatNo = '$seatCounter';
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.blue),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7.0),
                      ),
                    ),
                    height: seatSize,
                    width: seatSize,
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        seatNo,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              );
            }));
          }),
        ),
      ),
    );
  }
}
