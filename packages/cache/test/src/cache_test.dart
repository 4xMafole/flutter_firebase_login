// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:cache/cache.dart';

void main() {
  group('CacheClient', () {
    test('can be instantiated', () {
      expect(CacheClient(), isNotNull);
    });

    test(
      'Can write and read a value for a given key',
      () {
        final cache = CacheClient();
        const key = '__key__';
        const value = '__value__';

        expect(cache.read(key: key), isNull);
        cache.write(key: key, value: value);
        expect(cache.read(key: key), equals(value));
      },
    );
  });
}
