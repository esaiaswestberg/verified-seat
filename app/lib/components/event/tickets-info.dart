import 'package:flutter/material.dart';
import 'package:verified_seat/components/labels/subtitle.dart';

class TicketsInfo extends StatelessWidget {
  const TicketsInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: AlignmentDirectional.topCenter,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SubTitleLabel(text: '54 skannade'),
              SubTitleLabel(
                  text: '6 kvar', fontSize: 15, fontWeight: FontWeight.w400),
            ],
          ),
        ),
      ),
    );
  }
}
