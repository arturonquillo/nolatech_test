// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Reservation extends _Reservation
    with RealmEntity, RealmObjectBase, RealmObject {
  Reservation(
    ObjectId id,
    String instructor,
    DateTime date,
    String timeSlotStart,
    String timeSlotEnd,
    String comment, {
    Court? court,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'instructor', instructor);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'timeSlotStart', timeSlotStart);
    RealmObjectBase.set(this, 'timeSlotEnd', timeSlotEnd);
    RealmObjectBase.set(this, 'comment', comment);
    RealmObjectBase.set(this, 'court', court);
  }

  Reservation._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get instructor =>
      RealmObjectBase.get<String>(this, 'instructor') as String;
  @override
  set instructor(String value) =>
      RealmObjectBase.set(this, 'instructor', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  String get timeSlotStart =>
      RealmObjectBase.get<String>(this, 'timeSlotStart') as String;
  @override
  set timeSlotStart(String value) =>
      RealmObjectBase.set(this, 'timeSlotStart', value);

  @override
  String get timeSlotEnd =>
      RealmObjectBase.get<String>(this, 'timeSlotEnd') as String;
  @override
  set timeSlotEnd(String value) =>
      RealmObjectBase.set(this, 'timeSlotEnd', value);

  @override
  String get comment => RealmObjectBase.get<String>(this, 'comment') as String;
  @override
  set comment(String value) => RealmObjectBase.set(this, 'comment', value);

  @override
  Court? get court => RealmObjectBase.get<Court>(this, 'court') as Court?;
  @override
  set court(covariant Court? value) =>
      RealmObjectBase.set(this, 'court', value);

  @override
  Stream<RealmObjectChanges<Reservation>> get changes =>
      RealmObjectBase.getChanges<Reservation>(this);

  @override
  Stream<RealmObjectChanges<Reservation>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Reservation>(this, keyPaths);

  @override
  Reservation freeze() => RealmObjectBase.freezeObject<Reservation>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'instructor': instructor.toEJson(),
      'date': date.toEJson(),
      'timeSlotStart': timeSlotStart.toEJson(),
      'timeSlotEnd': timeSlotEnd.toEJson(),
      'comment': comment.toEJson(),
      'court': court.toEJson(),
    };
  }

  static EJsonValue _toEJson(Reservation value) => value.toEJson();
  static Reservation _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'instructor': EJsonValue instructor,
        'date': EJsonValue date,
        'timeSlotStart': EJsonValue timeSlotStart,
        'timeSlotEnd': EJsonValue timeSlotEnd,
        'comment': EJsonValue comment,
        'court': EJsonValue court,
      } =>
        Reservation(
          fromEJson(id),
          fromEJson(instructor),
          fromEJson(date),
          fromEJson(timeSlotStart),
          fromEJson(timeSlotEnd),
          fromEJson(comment),
          court: fromEJson(court),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Reservation._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Reservation, 'Reservation', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('instructor', RealmPropertyType.string),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('timeSlotStart', RealmPropertyType.string),
      SchemaProperty('timeSlotEnd', RealmPropertyType.string),
      SchemaProperty('comment', RealmPropertyType.string),
      SchemaProperty('court', RealmPropertyType.object,
          optional: true, linkTarget: 'Court'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class TUser extends _TUser with RealmEntity, RealmObjectBase, RealmObject {
  TUser(
    ObjectId id,
    String names,
    String email,
    String phoneNumber,
    String password,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'names', names);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'phoneNumber', phoneNumber);
    RealmObjectBase.set(this, 'password', password);
  }

  TUser._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get names => RealmObjectBase.get<String>(this, 'names') as String;
  @override
  set names(String value) => RealmObjectBase.set(this, 'names', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get phoneNumber =>
      RealmObjectBase.get<String>(this, 'phoneNumber') as String;
  @override
  set phoneNumber(String value) =>
      RealmObjectBase.set(this, 'phoneNumber', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  Stream<RealmObjectChanges<TUser>> get changes =>
      RealmObjectBase.getChanges<TUser>(this);

  @override
  Stream<RealmObjectChanges<TUser>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TUser>(this, keyPaths);

  @override
  TUser freeze() => RealmObjectBase.freezeObject<TUser>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'names': names.toEJson(),
      'email': email.toEJson(),
      'phoneNumber': phoneNumber.toEJson(),
      'password': password.toEJson(),
    };
  }

  static EJsonValue _toEJson(TUser value) => value.toEJson();
  static TUser _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'names': EJsonValue names,
        'email': EJsonValue email,
        'phoneNumber': EJsonValue phoneNumber,
        'password': EJsonValue password,
      } =>
        TUser(
          fromEJson(id),
          fromEJson(names),
          fromEJson(email),
          fromEJson(phoneNumber),
          fromEJson(password),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TUser._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, TUser, 'TUser', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('names', RealmPropertyType.string),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('phoneNumber', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Court extends _Court with RealmEntity, RealmObjectBase, RealmObject {
  Court(
    ObjectId id,
    String name,
    String type,
    String imageUrl,
    double pricePerHour,
    bool availability,
    String address,
    String timeSlotStart,
    String timeSlotEnd,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'imageUrl', imageUrl);
    RealmObjectBase.set(this, 'pricePerHour', pricePerHour);
    RealmObjectBase.set(this, 'availability', availability);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'timeSlotStart', timeSlotStart);
    RealmObjectBase.set(this, 'timeSlotEnd', timeSlotEnd);
  }

  Court._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get imageUrl =>
      RealmObjectBase.get<String>(this, 'imageUrl') as String;
  @override
  set imageUrl(String value) => RealmObjectBase.set(this, 'imageUrl', value);

  @override
  double get pricePerHour =>
      RealmObjectBase.get<double>(this, 'pricePerHour') as double;
  @override
  set pricePerHour(double value) =>
      RealmObjectBase.set(this, 'pricePerHour', value);

  @override
  bool get availability =>
      RealmObjectBase.get<bool>(this, 'availability') as bool;
  @override
  set availability(bool value) =>
      RealmObjectBase.set(this, 'availability', value);

  @override
  String get address => RealmObjectBase.get<String>(this, 'address') as String;
  @override
  set address(String value) => RealmObjectBase.set(this, 'address', value);

  @override
  String get timeSlotStart =>
      RealmObjectBase.get<String>(this, 'timeSlotStart') as String;
  @override
  set timeSlotStart(String value) =>
      RealmObjectBase.set(this, 'timeSlotStart', value);

  @override
  String get timeSlotEnd =>
      RealmObjectBase.get<String>(this, 'timeSlotEnd') as String;
  @override
  set timeSlotEnd(String value) =>
      RealmObjectBase.set(this, 'timeSlotEnd', value);

  @override
  Stream<RealmObjectChanges<Court>> get changes =>
      RealmObjectBase.getChanges<Court>(this);

  @override
  Stream<RealmObjectChanges<Court>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Court>(this, keyPaths);

  @override
  Court freeze() => RealmObjectBase.freezeObject<Court>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'type': type.toEJson(),
      'imageUrl': imageUrl.toEJson(),
      'pricePerHour': pricePerHour.toEJson(),
      'availability': availability.toEJson(),
      'address': address.toEJson(),
      'timeSlotStart': timeSlotStart.toEJson(),
      'timeSlotEnd': timeSlotEnd.toEJson(),
    };
  }

  static EJsonValue _toEJson(Court value) => value.toEJson();
  static Court _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'type': EJsonValue type,
        'imageUrl': EJsonValue imageUrl,
        'pricePerHour': EJsonValue pricePerHour,
        'availability': EJsonValue availability,
        'address': EJsonValue address,
        'timeSlotStart': EJsonValue timeSlotStart,
        'timeSlotEnd': EJsonValue timeSlotEnd,
      } =>
        Court(
          fromEJson(id),
          fromEJson(name),
          fromEJson(type),
          fromEJson(imageUrl),
          fromEJson(pricePerHour),
          fromEJson(availability),
          fromEJson(address),
          fromEJson(timeSlotStart),
          fromEJson(timeSlotEnd),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Court._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Court, 'Court', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('imageUrl', RealmPropertyType.string),
      SchemaProperty('pricePerHour', RealmPropertyType.double),
      SchemaProperty('availability', RealmPropertyType.bool),
      SchemaProperty('address', RealmPropertyType.string),
      SchemaProperty('timeSlotStart', RealmPropertyType.string),
      SchemaProperty('timeSlotEnd', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class Favorite extends _Favorite
    with RealmEntity, RealmObjectBase, RealmObject {
  Favorite(
    ObjectId id, {
    Court? court,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'court', court);
  }

  Favorite._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  Court? get court => RealmObjectBase.get<Court>(this, 'court') as Court?;
  @override
  set court(covariant Court? value) =>
      RealmObjectBase.set(this, 'court', value);

  @override
  Stream<RealmObjectChanges<Favorite>> get changes =>
      RealmObjectBase.getChanges<Favorite>(this);

  @override
  Stream<RealmObjectChanges<Favorite>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Favorite>(this, keyPaths);

  @override
  Favorite freeze() => RealmObjectBase.freezeObject<Favorite>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'court': court.toEJson(),
    };
  }

  static EJsonValue _toEJson(Favorite value) => value.toEJson();
  static Favorite _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'court': EJsonValue court,
      } =>
        Favorite(
          fromEJson(id),
          court: fromEJson(court),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Favorite._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Favorite, 'Favorite', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('court', RealmPropertyType.object,
          optional: true, linkTarget: 'Court'),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
