library tests;

import 'dart:html';
import 'dart:json';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';

import 'package:js/js.dart' as js;
import 'package:google_maps/js_wrap.dart';
import 'package:google_maps/google_maps.dart';

injectSource(code) {
  final script = new ScriptElement();
  script.type = 'text/javascript';
  script.innerHtml = code;
  document.body.nodes.add(script);
}

main() {
  useHtmlConfiguration();

  test('LatLng.toString call js', () {
    js.scoped(() {
      final latLng = new LatLng(2, 8);
      expect(latLng.toString(), equals("(2, 8)"));
    });
  });

  test('LatLng.equals call js', () {
    js.scoped(() {
      final latLng1 = new LatLng(2, 8);
      final latLng2 = new LatLng(2, 8);
      final latLng3 = new LatLng(2, 9);
      expect(latLng1.equals(latLng2), isTrue);
      expect(latLng1.equals(latLng3), isFalse);
    });
  });

  test('jsList works', () {
    js.scoped(() {
      injectSource('myArray=[];');
      final myArray = new JsList<String>.fromJsProxy(js.context.myArray, null);
      expect(myArray.length, equals(0));
      // []

      myArray.add("e0");
      expect(myArray.length, equals(1));
      expect(myArray[0], equals("e0"));
      // ["e0"]

      myArray.addAll(["e1", "e2"]);
      expect(myArray.length, equals(3));
      expect(myArray[0], equals("e0"));
      expect(myArray[1], equals("e1"));
      expect(myArray[2], equals("e2"));
      expect(myArray.first, equals("e0"));
      expect(myArray.last, equals("e2"));
      // ["e0", "e1", "e2"]

      myArray.length = 5;
      expect(myArray.length, equals(5));
      expect(myArray[0], equals("e0"));
      expect(myArray[1], equals("e1"));
      expect(myArray[2], equals("e2"));
      expect(myArray[3], isNull);
      expect(myArray[4], isNull);
      // ["e0", "e1", "e2", null, null]

      expect(() => myArray.length = 0, throws);
      expect(myArray.length, equals(5));
      // ["e0", "e1", "e2", null, null]

      myArray[3] = "e4";
      myArray[4] = "e3";
      expect(myArray.length, equals(5));
      expect(myArray[3], equals("e4"));
      expect(myArray[4], equals("e3"));
      // ["e0", "e1", "e2", "e4", "e3"]

      myArray.sort((String a, String b) => a.compareTo(b));
      expect(myArray.length, equals(5));
      expect(myArray[0], equals("e0"));
      expect(myArray[1], equals("e1"));
      expect(myArray[2], equals("e2"));
      expect(myArray[3], equals("e3"));
      expect(myArray[4], equals("e4"));
      // ["e0", "e1", "e2", "e3", "e4"]

      expect(myArray.removeAt(4), equals("e4"));
      expect(myArray.length, equals(4));
      expect(myArray[0], equals("e0"));
      expect(myArray[1], equals("e1"));
      expect(myArray[2], equals("e2"));
      expect(myArray[3], equals("e3"));
      // ["e0", "e1", "e2", "e3"]

      expect(myArray.removeLast(), equals("e3"));
      expect(myArray.length, equals(3));
      expect(myArray[0], equals("e0"));
      expect(myArray[1], equals("e1"));
      expect(myArray[2], equals("e2"));
      // ["e0", "e1", "e2"]

      final iterator = myArray.iterator;
      iterator.moveNext();
      expect(iterator.current, equals("e0"));
      iterator.moveNext();
      expect(iterator.current, equals("e1"));
      iterator.moveNext();
      expect(iterator.current, equals("e2"));

      myArray.clear();
      expect(myArray.length, equals(0));
      // []
    });
  });

  test('MVCArray works', () {
    js.scoped(() {
      final mvcArray = new MVCArray();
      mvcArray.on.insertAt.add((num i) => print("inserted at $i"));
      mvcArray.on.removeAt.add((num i, e) => print("removed $e at $i"));
      mvcArray.on.setAt.add((num i, e) => print("set $e at $i"));
      mvcArray.push("aa");
      expect(mvcArray.length, equals(1));
      mvcArray.setAt(0, "bb");
      expect(mvcArray.length, equals(1));
      mvcArray.removeAt(0);
      expect(mvcArray.length, equals(0));
    });
  });
}
