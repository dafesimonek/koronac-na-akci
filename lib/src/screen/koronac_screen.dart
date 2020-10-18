import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:koronac_na_akci/src/service/koronac_service.dart';
import 'package:koronac_na_akci/src/state/koronac_state.dart';
import 'package:koronac_na_akci/src/util.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class KoronacScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _space,
          _infected(context),
          _space,
          _groupInfectedProbability(context),
          _space,
          _groupSize(context),
          _realInfectedEstimate(context),
          _notIsolatedEstimate(context),
        ],
      ),
    ));
  }

  SizedBox get _space {
    return SizedBox(
      height: 30,
    );
  }

  Widget _infected(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
          child: Row(
            children: [
              Text('Nakažených / 100 tis:'),
              SizedBox(width: 16.0),
              Text(
                context.watchState<KoronacState>().testedInfected.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ],
          ),
        ),
        Slider(
          min: 1.0,
          max: 2000.0,
          divisions: 1000,
          label: '${context.watchState<KoronacState>().testedInfected}',
          activeColor: Colors.orange,
          inactiveColor: Colors.orange.withOpacity(0.3),
          value: context.watchState<KoronacState>().testedInfected.toDouble(),
          onChanged: getMy<KoronacService>().setTestedInfected,
        ),
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Počty nakažených podle okresů na Seznamu',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          onTap: _openInfectedDataOnSeznam,
        ),
      ],
    );
  }

  _openInfectedDataOnSeznam() async {
    const url =
        'https://www.seznamzpravy.cz/clanek/pdrobna-mapa-kde-je-v-ceske-republice-koronavirus-93746';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _groupSize(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
          ),
          child: Row(
            children: [
              Text('Lidí na akci:'),
              SizedBox(width: 16.0),
              Text(
                context.watchState<KoronacState>().groupSize.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ],
          ),
        ),
        Slider(
          min: 2.0,
          max: 200.0,
          divisions: 200,
          label: '${context.watchState<KoronacState>().groupSize}',
          value: context.watchState<KoronacState>().groupSize.toDouble(),
          onChanged: getMy<KoronacService>().setGroupSize,
        ),
      ],
    );
  }

  Widget _groupInfectedProbability(BuildContext context) {
    final infectionInGroupProb =
        context.watchState<KoronacState>().infectionInGroupProbability;
    final riskColor = _riskColor(infectionInGroupProb);

    return Container(
      padding: EdgeInsets.all(24.0),
      color: Colors.lightBlueAccent.withOpacity(0.2),
      child: CircularPercentIndicator(
        radius: 130.0,
        lineWidth: 24.0,
        // animation: true,
        percent: infectionInGroupProb,
        center: new Text(
          '${(infectionInGroupProb * 100).round()}%',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        ),
        header: RichText(
          text: TextSpan(
            text: 'Riziko výskytu koronáče na ',
            style: Theme.of(context).textTheme.bodyText2,
            children: <TextSpan>[
              TextSpan(
                  text:
                      'akci pro ${context.watchState<KoronacState>().groupSize} lidí ',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              TextSpan(text: 'je'),
            ],
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: riskColor,
      ),
    );
  }

  Color _riskColor(double prob) {
    if (prob < 0.1) return Colors.green;
    if (prob < 0.25) return Colors.yellow;
    if (prob < 0.5) return Colors.orange;
    if (prob < 0.75) return Colors.deepOrange;
    return Colors.red;
  }

  Widget _realInfectedEstimate(BuildContext context) {
    final realToTestedRatio =
        context.watchState<KoronacState>().realToTestedRatio;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(
                    text: 'Odhad: ',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey)),
                TextSpan(text: 'Reálně infikovaných je nyní '),
                TextSpan(
                    text: '${realToTestedRatio.toStringAsFixed(1)}x více ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'než nalezených'),
              ],
            ),
          ),
        ),
        Slider(
          min: 1.0,
          max: 20.0,
          divisions: 200,
          label: '${realToTestedRatio.toStringAsFixed(1)}x',
          value: realToTestedRatio,
          onChanged: getMy<KoronacService>().setRealToTestedRation,
        ),
      ],
    );
  }

  Widget _notIsolatedEstimate(BuildContext context) {
    final notIsolatedRatio =
        context.watchState<KoronacState>().notIsolatedRatio;
    var notIsolatedPercent = (notIsolatedRatio * 100).round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(
                    text: 'Odhad: ',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey)),
                TextSpan(
                  text: 'O své infekci neví ',
                ),
                TextSpan(
                  text: '$notIsolatedPercent% lidí',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Slider(
          min: 0.01,
          max: 1.0,
          divisions: 100,
          label: '$notIsolatedPercent%',
          value: notIsolatedRatio,
          onChanged: getMy<KoronacService>().setNotIsolatedRatio,
        ),
      ],
    );
  }
}
