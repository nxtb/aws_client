// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

import 'enum_output.meta.dart';
export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Enum output
class EnumOutput {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  EnumOutput({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'EnumOutput',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  Future<OutputShape> operationName0() async {
    final $request = <String, dynamic>{};
    final $result = await _protocol.send(
      $request,
      action: 'OperationName',
      version: '2020-01-01',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shapes: shapes,
    );
    return OutputShape.fromXml($result);
  }
}

class OutputShape {
  final EC2EnumType? fooEnum;
  final List<EC2EnumType>? listEnums;

  OutputShape({
    this.fooEnum,
    this.listEnums,
  });
  factory OutputShape.fromXml(_s.XmlElement elem) {
    return OutputShape(
      fooEnum: _s.extractXmlStringValue(elem, 'FooEnum')?.toEC2EnumType(),
      listEnums: _s.extractXmlChild(elem, 'ListEnums')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'member')
          .map((s) => s.toEC2EnumType())
          .toList()),
    );
  }
}

enum EC2EnumType {
  foo,
  bar,
}

extension on EC2EnumType {
  String toValue() {
    switch (this) {
      case EC2EnumType.foo:
        return 'foo';
      case EC2EnumType.bar:
        return 'bar';
    }
  }
}

extension on String {
  EC2EnumType toEC2EnumType() {
    switch (this) {
      case 'foo':
        return EC2EnumType.foo;
      case 'bar':
        return EC2EnumType.bar;
    }
    throw Exception('$this is not known in enum EC2EnumType');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{};
