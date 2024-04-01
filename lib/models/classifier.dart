import 'package:flutter/services.dart';

import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  // name of the model file
  final _modelFile = 'stable_model.tflite';
  final _vocabFile = 'vocabulary.txt';

  // Maximum length of sentence
  final int _sentenceLen = 100;

  final String start = '<START>';
  final String pad = '<PAD>';
  final String unk = '<UNKNOWN>';

  late Map<String, int> _dict;

  // TensorFlow Lite Interpreter object
  late Interpreter _interpreter;

  Classifier._();

  static Future<Classifier> create() async {
    var classifier = Classifier._();
    await classifier._loadModel();
    await classifier._loadDictionary();
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

  List<double> classify(String rawText) {
    // tokenizeInputText returns List<List<double>>
    // of shape [1, 256].
    List<List<double>> input = tokenizeInputText(rawText);

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

  List<List<double>> tokenizeInputText(String text) {
    // Whitespace tokenization
    final toks = text.toLowerCase().split(' ');
    print(toks.length);

    // Create a list of length==_sentenceLen filled with the value <pad>
    var vec = List<double>.filled(_sentenceLen, _dict[pad]!.toDouble());

    var index = 0;
    if (_dict.containsKey(start)) {
      vec[index++] = _dict[start]!.toDouble();
    }

    // For each word in sentence find corresponding index in dict
    for (var tok in toks) {
      if (index > _sentenceLen - 1) break;
      if (tok.isEmpty) continue;

      vec[index++] = _dict.containsKey(tok)
          ? _dict[tok]!.toDouble()
          : _dict[pad]!.toDouble();
    }

    // returning List<List<double>> as our interpreter input tensor expects the shape, [1,256]
    return [vec];
  }
}
