import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:stopwordies/stopwordies.dart';
import 'package:text_analysis/text_analysis.dart';

import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  // name of the model vocabulary files
  final _modelFile = 'model_24.tflite';
  final _vocabFile = 'vocabulary.txt';

  // Maximum length of sentence
  final int _sentenceLen = 256;

  final String start = '<START>';
  final String pad = '<PAD>';
  final String unk = '<UNKNOWN>';

  late Map<String, int> _dict;

  var stopWords = <String>[];

  // TensorFlow Lite Interpreter object
  late Interpreter _interpreter;

  Classifier._();

  static Future<Classifier> create() async {
    var classifier = Classifier._();
    await classifier._loadModel();
    await classifier._loadDictionary();
    await classifier._loadStopWords();
    return classifier;
  }

  _loadModel() async {
    // Creating the interpreter using Interpreter.fromAsset
    _interpreter = await Interpreter.fromAsset('assets/$_modelFile');
    // print('Interpreter loaded successfully');
  }

  _loadDictionary() async {
    final vocab = await rootBundle.loadString('assets/$_vocabFile');
    var dict = <String, int>{};
    final vocabList = vocab.split('\n');
    for (var i = 0; i < vocabList.length; i++) {
      var entry = vocabList[i].trim().split(' ');
      dict[entry[0]] = int.parse(entry[1]);
    }
    _dict = dict;
    // print('Dictionary loaded successfully');
  }

  _loadStopWords() async {
    stopWords = await StopWordies.getFor(locale: SWLocale.en);
  }

  Future<List<double>> classify(String rawText) async {
    // Remove stop words
    // rawText = rawText
    //     .toLowerCase()
    //     .split(' ')
    //     .where((word) => !stopWords.contains(word))
    //     .join(' ');

    // tokenizeInputText returns List<List<double>>
    // of shape [1, 256].
    List<List<double>> input = await tokenizeInputText(rawText);

    // output of shape [1,7].
    var output = List<double>.filled(7, 0).reshape([1, 7]);

    // The run method will run inference and
    // store the resulting values in output.
    _interpreter.run(input, output);

    return [
      output[0][0],
      output[0][1],
      output[0][2],
      output[0][3],
      output[0][4],
      output[0][5],
      output[0][6]
    ];
  }

  Future<List<List<double>>> tokenizeInputText(String text) async {
    // Whitespace tokenization
    // final tokens = text.toLowerCase().split(' ');
    final tokens = await _preProcessing(text);
    log(tokens.toString());

    // Create a list of length==_sentenceLen filled with the value <pad>
    var vec = List<double>.filled(_sentenceLen, _dict[pad]!.toDouble());

    var index = 0;
    if (_dict.containsKey(start)) {
      vec[index++] = _dict[start]!.toDouble();
    }

    // For each word in sentence find corresponding index in dict
    for (var tok in tokens) {
      if (index > _sentenceLen - 1) break;
      if (tok.isEmpty) continue;

      vec[index++] = _dict.containsKey(tok)
          ? _dict[tok]!.toDouble()
          : _dict[pad]!.toDouble();
    }

    // returning List<List<double>> as our interpreter input tensor expects the shape, [1,256]
    return [vec];
  }

  Future<List<String>> _preProcessing(String txt) async {
    // tokenize the source
    final doc = await TextDocument.analyze(
      sourceText: txt,
      analyzer: English.analyzer,
      nGramRange: const NGramRange(1, 1),
    );
    return doc.tokens.map((e) => e.term).toList();
  }
}
