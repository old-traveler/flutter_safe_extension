// ignore: sdk_version_extension_methods
import 'package:flutter/material.dart';

extension SafeIterable<E> on Iterable<E> {
  E get safeFirst => this == null || this.isEmpty ? null : this.first;

  E safeReduce(E combine(E value, E element)) {
    if (this == null || this.isEmpty) {
      return null;
    }
    return this.reduce(combine);
  }

  E get safeLast => this == null || this.isEmpty ? null : this.last;

  E safeFirstWhere(bool test(E element), {E orElse()}) {
    return this.firstWhere(test, orElse: orElse ?? () => null);
  }

  E safeLastWhere(bool test(E element), {E orElse()}) {
    return this.lastWhere(test, orElse: orElse ?? () => null);
  }

  E safeSingleWhere(bool test(E element), {E orElse()}) {
    return this.safeSingleWhere(test, orElse: orElse ?? () => null);
  }

  E safeElementAt(int index) {
    if (index == null) return null;
    int elementIndex = 0;
    for (E element in this) {
      if (index == elementIndex) return element;
      elementIndex++;
    }
    return null;
  }
}

// ignore: sdk_version_extension_methods
extension SafeList<E> on List<E> {
  E getOrNull(int index) {
    if (this == null || !this.indexSafe(index)) {
      return null;
    }
    return this[index];
  }

  bool indexSafe(int index) {
    return !(index < 0 || index >= this.length);
  }

  bool addIfNotNull(E e) {
    if (e == null) {
      return false;
    }
    this.add(e);
    return true;
  }

  bool addAllIfNotNull(Iterable<E> iterable) {
    if (iterable == null || iterable.isEmpty) {
      return false;
    }
    this.addAll(iterable);
    return true;
  }

  bool safeInsert(int index, E e) {
    if (e == null || index is! int || (index < 0 || index >= length + 1)) {
      return false;
    }
    this.insert(index, e);
    return true;
  }

  bool safeInsertAll(int index, Iterable<E> iterable) {
    if (index is! int ||
        (index < 0 || index >= length + 1) ||
        iterable?.isNotEmpty != true) {
      return false;
    }
    this.insertAll(index, iterable);
    return true;
  }

  E safeRemove(int index) {
    if (this.indexSafe(index)) {
      return this.removeAt(index);
    }
    return null;
  }

  E safeRemoveLast() {
    if (this?.isNotEmpty == true) {
      return this.removeLast();
    }
    return null;
  }

  E safeRemoveFirst() {
    if (this?.isNotEmpty == true) {
      return this.removeAt(0);
    }
    return null;
  }
}

// ignore: sdk_version_extension_methods
extension SafeSet<E> on Set<E> {
  bool addIfNotNull(E e) {
    if (e != null) {
      return this.add(e);
    }
    return false;
  }

  bool addAllIfNotNull(Iterable<E> elements) {
    if (elements != null) {
      this.addAll(elements);
      return true;
    }
    return false;
  }

  bool safeRemoveAll(Iterable<Object> elements) {
    if (elements == null || elements.isEmpty) {
      return false;
    }
    this.removeAll(elements);
    return true;
  }
}

// ignore: sdk_version_extension_methods
extension SafeString on String {
  String get text => this ?? '';

  double toDouble([double defaultValue = 0.0]) {
    if (this == null) {
      return defaultValue;
    }
    return double.tryParse(this) ?? defaultValue;
  }

  int toInt([int defaultValue = 0]) {
    if (this == null) {
      return defaultValue;
    }
    return int.tryParse(this) ?? defaultValue;
  }
}

typedef SafeCallback<T, R> = R Function(T it);

// ignore: sdk_version_extension_methods
extension SafeObject<T> on T {
  R let<R>(SafeCallback<T, R> callback) {
    return callback(this);
  }

  void nullRun(VoidCallback callback) {
    if (this == null) {
      return callback();
    }
  }

  T also(SafeCallback<T, void> callback) {
    callback(this);
    return this;
  }
}
