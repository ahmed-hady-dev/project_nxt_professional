import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentageLoading extends StatelessWidget {
  final double loadingPercentage;
  final List<int> filesList;
  const PercentageLoading(
      {super.key, required this.loadingPercentage, required this.filesList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (filesList.isNotEmpty && filesList.length != 1)
          Wrap(
            children: [
              ...List.generate(
                filesList.length,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'File ${index + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      if (filesList[index] == 1)
                        const Icon(Icons.check, color: Colors.green),
                      if (filesList[index] != 1)
                        Text(
                          'uploading'.tr(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularPercentIndicator(
                  animation: true,
                  animationDuration: 2500,
                  curve: Curves.easeOut,
                  percent: loadingPercentage,
                  addAutomaticKeepAlive: false,
                  animateFromLastPercent: true,
                  progressColor: Colors.black,
                  backgroundColor: Colors.black12,
                  radius: MediaQuery.of(context).size.width * 0.2,
                  center: Text(
                    '${(loadingPercentage * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'uploading'.tr(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      ],
    );
  }
}
