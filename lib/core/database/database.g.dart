// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodosTable extends Todos with TableInfo<$TodosTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, completed, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Todo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TodosTable createAlias(String alias) {
    return $TodosTable(attachedDatabase, alias);
  }
}

class Todo extends DataClass implements Insertable<Todo> {
  final int id;
  final String title;
  final bool completed;
  final DateTime createdAt;
  const Todo({
    required this.id,
    required this.title,
    required this.completed,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['completed'] = Variable<bool>(completed);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TodosCompanion toCompanion(bool nullToAbsent) {
    return TodosCompanion(
      id: Value(id),
      title: Value(title),
      completed: Value(completed),
      createdAt: Value(createdAt),
    );
  }

  factory Todo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Todo(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      completed: serializer.fromJson<bool>(json['completed']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'completed': serializer.toJson<bool>(completed),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Todo copyWith({
    int? id,
    String? title,
    bool? completed,
    DateTime? createdAt,
  }) => Todo(
    id: id ?? this.id,
    title: title ?? this.title,
    completed: completed ?? this.completed,
    createdAt: createdAt ?? this.createdAt,
  );
  Todo copyWithCompanion(TodosCompanion data) {
    return Todo(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      completed: data.completed.present ? data.completed.value : this.completed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Todo(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completed: $completed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, completed, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          other.id == this.id &&
          other.title == this.title &&
          other.completed == this.completed &&
          other.createdAt == this.createdAt);
}

class TodosCompanion extends UpdateCompanion<Todo> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> completed;
  final Value<DateTime> createdAt;
  const TodosCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.completed = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodosCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.completed = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? completed,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (completed != null) 'completed': completed,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodosCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<bool>? completed,
    Value<DateTime>? createdAt,
  }) {
    return TodosCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodosCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completed: $completed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ShopRecordsTable extends ShopRecords
    with TableInfo<$ShopRecordsTable, ShopRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shopNoMeta = const VerificationMeta('shopNo');
  @override
  late final GeneratedColumn<String> shopNo = GeneratedColumn<String>(
    'shop_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerNameMeta = const VerificationMeta(
    'ownerName',
  );
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
    'owner_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerNidMeta = const VerificationMeta(
    'ownerNid',
  );
  @override
  late final GeneratedColumn<String> ownerNid = GeneratedColumn<String>(
    'owner_nid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerPhoneMeta = const VerificationMeta(
    'ownerPhone',
  );
  @override
  late final GeneratedColumn<String> ownerPhone = GeneratedColumn<String>(
    'owner_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sqftMeta = const VerificationMeta('sqft');
  @override
  late final GeneratedColumn<int> sqft = GeneratedColumn<int>(
    'sqft',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _meterNoMeta = const VerificationMeta(
    'meterNo',
  );
  @override
  late final GeneratedColumn<String> meterNo = GeneratedColumn<String>(
    'meter_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<String> deletedAt = GeneratedColumn<String>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    shopNo,
    ownerName,
    ownerNid,
    ownerPhone,
    sqft,
    meterNo,
    isActive,
    createdAt,
    updatedAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('shop_no')) {
      context.handle(
        _shopNoMeta,
        shopNo.isAcceptableOrUnknown(data['shop_no']!, _shopNoMeta),
      );
    } else if (isInserting) {
      context.missing(_shopNoMeta);
    }
    if (data.containsKey('owner_name')) {
      context.handle(
        _ownerNameMeta,
        ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerNameMeta);
    }
    if (data.containsKey('owner_nid')) {
      context.handle(
        _ownerNidMeta,
        ownerNid.isAcceptableOrUnknown(data['owner_nid']!, _ownerNidMeta),
      );
    }
    if (data.containsKey('owner_phone')) {
      context.handle(
        _ownerPhoneMeta,
        ownerPhone.isAcceptableOrUnknown(data['owner_phone']!, _ownerPhoneMeta),
      );
    }
    if (data.containsKey('sqft')) {
      context.handle(
        _sqftMeta,
        sqft.isAcceptableOrUnknown(data['sqft']!, _sqftMeta),
      );
    }
    if (data.containsKey('meter_no')) {
      context.handle(
        _meterNoMeta,
        meterNo.isAcceptableOrUnknown(data['meter_no']!, _meterNoMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShopRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      shopNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shop_no'],
      )!,
      ownerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_name'],
      )!,
      ownerNid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_nid'],
      ),
      ownerPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_phone'],
      ),
      sqft: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sqft'],
      ),
      meterNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meter_no'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $ShopRecordsTable createAlias(String alias) {
    return $ShopRecordsTable(attachedDatabase, alias);
  }
}

class ShopRecord extends DataClass implements Insertable<ShopRecord> {
  final int id;
  final String shopNo;
  final String ownerName;
  final String? ownerNid;
  final String? ownerPhone;
  final int? sqft;
  final String? meterNo;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  const ShopRecord({
    required this.id,
    required this.shopNo,
    required this.ownerName,
    this.ownerNid,
    this.ownerPhone,
    this.sqft,
    this.meterNo,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['shop_no'] = Variable<String>(shopNo);
    map['owner_name'] = Variable<String>(ownerName);
    if (!nullToAbsent || ownerNid != null) {
      map['owner_nid'] = Variable<String>(ownerNid);
    }
    if (!nullToAbsent || ownerPhone != null) {
      map['owner_phone'] = Variable<String>(ownerPhone);
    }
    if (!nullToAbsent || sqft != null) {
      map['sqft'] = Variable<int>(sqft);
    }
    if (!nullToAbsent || meterNo != null) {
      map['meter_no'] = Variable<String>(meterNo);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<String>(deletedAt);
    }
    return map;
  }

  ShopRecordsCompanion toCompanion(bool nullToAbsent) {
    return ShopRecordsCompanion(
      id: Value(id),
      shopNo: Value(shopNo),
      ownerName: Value(ownerName),
      ownerNid: ownerNid == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerNid),
      ownerPhone: ownerPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerPhone),
      sqft: sqft == null && nullToAbsent ? const Value.absent() : Value(sqft),
      meterNo: meterNo == null && nullToAbsent
          ? const Value.absent()
          : Value(meterNo),
      isActive: Value(isActive),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ShopRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopRecord(
      id: serializer.fromJson<int>(json['id']),
      shopNo: serializer.fromJson<String>(json['shopNo']),
      ownerName: serializer.fromJson<String>(json['ownerName']),
      ownerNid: serializer.fromJson<String?>(json['ownerNid']),
      ownerPhone: serializer.fromJson<String?>(json['ownerPhone']),
      sqft: serializer.fromJson<int?>(json['sqft']),
      meterNo: serializer.fromJson<String?>(json['meterNo']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      deletedAt: serializer.fromJson<String?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'shopNo': serializer.toJson<String>(shopNo),
      'ownerName': serializer.toJson<String>(ownerName),
      'ownerNid': serializer.toJson<String?>(ownerNid),
      'ownerPhone': serializer.toJson<String?>(ownerPhone),
      'sqft': serializer.toJson<int?>(sqft),
      'meterNo': serializer.toJson<String?>(meterNo),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'deletedAt': serializer.toJson<String?>(deletedAt),
    };
  }

  ShopRecord copyWith({
    int? id,
    String? shopNo,
    String? ownerName,
    Value<String?> ownerNid = const Value.absent(),
    Value<String?> ownerPhone = const Value.absent(),
    Value<int?> sqft = const Value.absent(),
    Value<String?> meterNo = const Value.absent(),
    bool? isActive,
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> deletedAt = const Value.absent(),
  }) => ShopRecord(
    id: id ?? this.id,
    shopNo: shopNo ?? this.shopNo,
    ownerName: ownerName ?? this.ownerName,
    ownerNid: ownerNid.present ? ownerNid.value : this.ownerNid,
    ownerPhone: ownerPhone.present ? ownerPhone.value : this.ownerPhone,
    sqft: sqft.present ? sqft.value : this.sqft,
    meterNo: meterNo.present ? meterNo.value : this.meterNo,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  ShopRecord copyWithCompanion(ShopRecordsCompanion data) {
    return ShopRecord(
      id: data.id.present ? data.id.value : this.id,
      shopNo: data.shopNo.present ? data.shopNo.value : this.shopNo,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      ownerNid: data.ownerNid.present ? data.ownerNid.value : this.ownerNid,
      ownerPhone: data.ownerPhone.present
          ? data.ownerPhone.value
          : this.ownerPhone,
      sqft: data.sqft.present ? data.sqft.value : this.sqft,
      meterNo: data.meterNo.present ? data.meterNo.value : this.meterNo,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopRecord(')
          ..write('id: $id, ')
          ..write('shopNo: $shopNo, ')
          ..write('ownerName: $ownerName, ')
          ..write('ownerNid: $ownerNid, ')
          ..write('ownerPhone: $ownerPhone, ')
          ..write('sqft: $sqft, ')
          ..write('meterNo: $meterNo, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopNo,
    ownerName,
    ownerNid,
    ownerPhone,
    sqft,
    meterNo,
    isActive,
    createdAt,
    updatedAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopRecord &&
          other.id == this.id &&
          other.shopNo == this.shopNo &&
          other.ownerName == this.ownerName &&
          other.ownerNid == this.ownerNid &&
          other.ownerPhone == this.ownerPhone &&
          other.sqft == this.sqft &&
          other.meterNo == this.meterNo &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ShopRecordsCompanion extends UpdateCompanion<ShopRecord> {
  final Value<int> id;
  final Value<String> shopNo;
  final Value<String> ownerName;
  final Value<String?> ownerNid;
  final Value<String?> ownerPhone;
  final Value<int?> sqft;
  final Value<String?> meterNo;
  final Value<bool> isActive;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<String?> deletedAt;
  const ShopRecordsCompanion({
    this.id = const Value.absent(),
    this.shopNo = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.ownerNid = const Value.absent(),
    this.ownerPhone = const Value.absent(),
    this.sqft = const Value.absent(),
    this.meterNo = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  ShopRecordsCompanion.insert({
    this.id = const Value.absent(),
    required String shopNo,
    required String ownerName,
    this.ownerNid = const Value.absent(),
    this.ownerPhone = const Value.absent(),
    this.sqft = const Value.absent(),
    this.meterNo = const Value.absent(),
    required bool isActive,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  }) : shopNo = Value(shopNo),
       ownerName = Value(ownerName),
       isActive = Value(isActive);
  static Insertable<ShopRecord> custom({
    Expression<int>? id,
    Expression<String>? shopNo,
    Expression<String>? ownerName,
    Expression<String>? ownerNid,
    Expression<String>? ownerPhone,
    Expression<int>? sqft,
    Expression<String>? meterNo,
    Expression<bool>? isActive,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shopNo != null) 'shop_no': shopNo,
      if (ownerName != null) 'owner_name': ownerName,
      if (ownerNid != null) 'owner_nid': ownerNid,
      if (ownerPhone != null) 'owner_phone': ownerPhone,
      if (sqft != null) 'sqft': sqft,
      if (meterNo != null) 'meter_no': meterNo,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  ShopRecordsCompanion copyWith({
    Value<int>? id,
    Value<String>? shopNo,
    Value<String>? ownerName,
    Value<String?>? ownerNid,
    Value<String?>? ownerPhone,
    Value<int?>? sqft,
    Value<String?>? meterNo,
    Value<bool>? isActive,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
    Value<String?>? deletedAt,
  }) {
    return ShopRecordsCompanion(
      id: id ?? this.id,
      shopNo: shopNo ?? this.shopNo,
      ownerName: ownerName ?? this.ownerName,
      ownerNid: ownerNid ?? this.ownerNid,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      sqft: sqft ?? this.sqft,
      meterNo: meterNo ?? this.meterNo,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shopNo.present) {
      map['shop_no'] = Variable<String>(shopNo.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (ownerNid.present) {
      map['owner_nid'] = Variable<String>(ownerNid.value);
    }
    if (ownerPhone.present) {
      map['owner_phone'] = Variable<String>(ownerPhone.value);
    }
    if (sqft.present) {
      map['sqft'] = Variable<int>(sqft.value);
    }
    if (meterNo.present) {
      map['meter_no'] = Variable<String>(meterNo.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<String>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopRecordsCompanion(')
          ..write('id: $id, ')
          ..write('shopNo: $shopNo, ')
          ..write('ownerName: $ownerName, ')
          ..write('ownerNid: $ownerNid, ')
          ..write('ownerPhone: $ownerPhone, ')
          ..write('sqft: $sqft, ')
          ..write('meterNo: $meterNo, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $ShopPageCacheRecordsTable extends ShopPageCacheRecords
    with TableInfo<$ShopPageCacheRecordsTable, ShopPageCacheRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopPageCacheRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
    'page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _perPageMeta = const VerificationMeta(
    'perPage',
  );
  @override
  late final GeneratedColumn<int> perPage = GeneratedColumn<int>(
    'per_page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentPageMeta = const VerificationMeta(
    'currentPage',
  );
  @override
  late final GeneratedColumn<int> currentPage = GeneratedColumn<int>(
    'current_page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstPageUrlMeta = const VerificationMeta(
    'firstPageUrl',
  );
  @override
  late final GeneratedColumn<String> firstPageUrl = GeneratedColumn<String>(
    'first_page_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromItemMeta = const VerificationMeta(
    'fromItem',
  );
  @override
  late final GeneratedColumn<int> fromItem = GeneratedColumn<int>(
    'from_item',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastPageMeta = const VerificationMeta(
    'lastPage',
  );
  @override
  late final GeneratedColumn<int> lastPage = GeneratedColumn<int>(
    'last_page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastPageUrlMeta = const VerificationMeta(
    'lastPageUrl',
  );
  @override
  late final GeneratedColumn<String> lastPageUrl = GeneratedColumn<String>(
    'last_page_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextPageUrlMeta = const VerificationMeta(
    'nextPageUrl',
  );
  @override
  late final GeneratedColumn<String> nextPageUrl = GeneratedColumn<String>(
    'next_page_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prevPageUrlMeta = const VerificationMeta(
    'prevPageUrl',
  );
  @override
  late final GeneratedColumn<String> prevPageUrl = GeneratedColumn<String>(
    'prev_page_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _toItemMeta = const VerificationMeta('toItem');
  @override
  late final GeneratedColumn<int> toItem = GeneratedColumn<int>(
    'to_item',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    page,
    perPage,
    currentPage,
    firstPageUrl,
    fromItem,
    lastPage,
    lastPageUrl,
    nextPageUrl,
    path,
    prevPageUrl,
    toItem,
    total,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_page_cache_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopPageCacheRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page')) {
      context.handle(
        _pageMeta,
        page.isAcceptableOrUnknown(data['page']!, _pageMeta),
      );
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('per_page')) {
      context.handle(
        _perPageMeta,
        perPage.isAcceptableOrUnknown(data['per_page']!, _perPageMeta),
      );
    } else if (isInserting) {
      context.missing(_perPageMeta);
    }
    if (data.containsKey('current_page')) {
      context.handle(
        _currentPageMeta,
        currentPage.isAcceptableOrUnknown(
          data['current_page']!,
          _currentPageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentPageMeta);
    }
    if (data.containsKey('first_page_url')) {
      context.handle(
        _firstPageUrlMeta,
        firstPageUrl.isAcceptableOrUnknown(
          data['first_page_url']!,
          _firstPageUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstPageUrlMeta);
    }
    if (data.containsKey('from_item')) {
      context.handle(
        _fromItemMeta,
        fromItem.isAcceptableOrUnknown(data['from_item']!, _fromItemMeta),
      );
    }
    if (data.containsKey('last_page')) {
      context.handle(
        _lastPageMeta,
        lastPage.isAcceptableOrUnknown(data['last_page']!, _lastPageMeta),
      );
    } else if (isInserting) {
      context.missing(_lastPageMeta);
    }
    if (data.containsKey('last_page_url')) {
      context.handle(
        _lastPageUrlMeta,
        lastPageUrl.isAcceptableOrUnknown(
          data['last_page_url']!,
          _lastPageUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastPageUrlMeta);
    }
    if (data.containsKey('next_page_url')) {
      context.handle(
        _nextPageUrlMeta,
        nextPageUrl.isAcceptableOrUnknown(
          data['next_page_url']!,
          _nextPageUrlMeta,
        ),
      );
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('prev_page_url')) {
      context.handle(
        _prevPageUrlMeta,
        prevPageUrl.isAcceptableOrUnknown(
          data['prev_page_url']!,
          _prevPageUrlMeta,
        ),
      );
    }
    if (data.containsKey('to_item')) {
      context.handle(
        _toItemMeta,
        toItem.isAcceptableOrUnknown(data['to_item']!, _toItemMeta),
      );
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {page, perPage};
  @override
  ShopPageCacheRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopPageCacheRecord(
      page: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page'],
      )!,
      perPage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}per_page'],
      )!,
      currentPage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_page'],
      )!,
      firstPageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_page_url'],
      )!,
      fromItem: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}from_item'],
      ),
      lastPage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_page'],
      )!,
      lastPageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_page_url'],
      )!,
      nextPageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_page_url'],
      ),
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      prevPageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prev_page_url'],
      ),
      toItem: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}to_item'],
      ),
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $ShopPageCacheRecordsTable createAlias(String alias) {
    return $ShopPageCacheRecordsTable(attachedDatabase, alias);
  }
}

class ShopPageCacheRecord extends DataClass
    implements Insertable<ShopPageCacheRecord> {
  final int page;
  final int perPage;
  final int currentPage;
  final String firstPageUrl;
  final int? fromItem;
  final int lastPage;
  final String lastPageUrl;
  final String? nextPageUrl;
  final String path;
  final String? prevPageUrl;
  final int? toItem;
  final int total;
  final DateTime cachedAt;
  const ShopPageCacheRecord({
    required this.page,
    required this.perPage,
    required this.currentPage,
    required this.firstPageUrl,
    this.fromItem,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    this.prevPageUrl,
    this.toItem,
    required this.total,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page'] = Variable<int>(page);
    map['per_page'] = Variable<int>(perPage);
    map['current_page'] = Variable<int>(currentPage);
    map['first_page_url'] = Variable<String>(firstPageUrl);
    if (!nullToAbsent || fromItem != null) {
      map['from_item'] = Variable<int>(fromItem);
    }
    map['last_page'] = Variable<int>(lastPage);
    map['last_page_url'] = Variable<String>(lastPageUrl);
    if (!nullToAbsent || nextPageUrl != null) {
      map['next_page_url'] = Variable<String>(nextPageUrl);
    }
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || prevPageUrl != null) {
      map['prev_page_url'] = Variable<String>(prevPageUrl);
    }
    if (!nullToAbsent || toItem != null) {
      map['to_item'] = Variable<int>(toItem);
    }
    map['total'] = Variable<int>(total);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  ShopPageCacheRecordsCompanion toCompanion(bool nullToAbsent) {
    return ShopPageCacheRecordsCompanion(
      page: Value(page),
      perPage: Value(perPage),
      currentPage: Value(currentPage),
      firstPageUrl: Value(firstPageUrl),
      fromItem: fromItem == null && nullToAbsent
          ? const Value.absent()
          : Value(fromItem),
      lastPage: Value(lastPage),
      lastPageUrl: Value(lastPageUrl),
      nextPageUrl: nextPageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(nextPageUrl),
      path: Value(path),
      prevPageUrl: prevPageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(prevPageUrl),
      toItem: toItem == null && nullToAbsent
          ? const Value.absent()
          : Value(toItem),
      total: Value(total),
      cachedAt: Value(cachedAt),
    );
  }

  factory ShopPageCacheRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopPageCacheRecord(
      page: serializer.fromJson<int>(json['page']),
      perPage: serializer.fromJson<int>(json['perPage']),
      currentPage: serializer.fromJson<int>(json['currentPage']),
      firstPageUrl: serializer.fromJson<String>(json['firstPageUrl']),
      fromItem: serializer.fromJson<int?>(json['fromItem']),
      lastPage: serializer.fromJson<int>(json['lastPage']),
      lastPageUrl: serializer.fromJson<String>(json['lastPageUrl']),
      nextPageUrl: serializer.fromJson<String?>(json['nextPageUrl']),
      path: serializer.fromJson<String>(json['path']),
      prevPageUrl: serializer.fromJson<String?>(json['prevPageUrl']),
      toItem: serializer.fromJson<int?>(json['toItem']),
      total: serializer.fromJson<int>(json['total']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'page': serializer.toJson<int>(page),
      'perPage': serializer.toJson<int>(perPage),
      'currentPage': serializer.toJson<int>(currentPage),
      'firstPageUrl': serializer.toJson<String>(firstPageUrl),
      'fromItem': serializer.toJson<int?>(fromItem),
      'lastPage': serializer.toJson<int>(lastPage),
      'lastPageUrl': serializer.toJson<String>(lastPageUrl),
      'nextPageUrl': serializer.toJson<String?>(nextPageUrl),
      'path': serializer.toJson<String>(path),
      'prevPageUrl': serializer.toJson<String?>(prevPageUrl),
      'toItem': serializer.toJson<int?>(toItem),
      'total': serializer.toJson<int>(total),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  ShopPageCacheRecord copyWith({
    int? page,
    int? perPage,
    int? currentPage,
    String? firstPageUrl,
    Value<int?> fromItem = const Value.absent(),
    int? lastPage,
    String? lastPageUrl,
    Value<String?> nextPageUrl = const Value.absent(),
    String? path,
    Value<String?> prevPageUrl = const Value.absent(),
    Value<int?> toItem = const Value.absent(),
    int? total,
    DateTime? cachedAt,
  }) => ShopPageCacheRecord(
    page: page ?? this.page,
    perPage: perPage ?? this.perPage,
    currentPage: currentPage ?? this.currentPage,
    firstPageUrl: firstPageUrl ?? this.firstPageUrl,
    fromItem: fromItem.present ? fromItem.value : this.fromItem,
    lastPage: lastPage ?? this.lastPage,
    lastPageUrl: lastPageUrl ?? this.lastPageUrl,
    nextPageUrl: nextPageUrl.present ? nextPageUrl.value : this.nextPageUrl,
    path: path ?? this.path,
    prevPageUrl: prevPageUrl.present ? prevPageUrl.value : this.prevPageUrl,
    toItem: toItem.present ? toItem.value : this.toItem,
    total: total ?? this.total,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  ShopPageCacheRecord copyWithCompanion(ShopPageCacheRecordsCompanion data) {
    return ShopPageCacheRecord(
      page: data.page.present ? data.page.value : this.page,
      perPage: data.perPage.present ? data.perPage.value : this.perPage,
      currentPage: data.currentPage.present
          ? data.currentPage.value
          : this.currentPage,
      firstPageUrl: data.firstPageUrl.present
          ? data.firstPageUrl.value
          : this.firstPageUrl,
      fromItem: data.fromItem.present ? data.fromItem.value : this.fromItem,
      lastPage: data.lastPage.present ? data.lastPage.value : this.lastPage,
      lastPageUrl: data.lastPageUrl.present
          ? data.lastPageUrl.value
          : this.lastPageUrl,
      nextPageUrl: data.nextPageUrl.present
          ? data.nextPageUrl.value
          : this.nextPageUrl,
      path: data.path.present ? data.path.value : this.path,
      prevPageUrl: data.prevPageUrl.present
          ? data.prevPageUrl.value
          : this.prevPageUrl,
      toItem: data.toItem.present ? data.toItem.value : this.toItem,
      total: data.total.present ? data.total.value : this.total,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopPageCacheRecord(')
          ..write('page: $page, ')
          ..write('perPage: $perPage, ')
          ..write('currentPage: $currentPage, ')
          ..write('firstPageUrl: $firstPageUrl, ')
          ..write('fromItem: $fromItem, ')
          ..write('lastPage: $lastPage, ')
          ..write('lastPageUrl: $lastPageUrl, ')
          ..write('nextPageUrl: $nextPageUrl, ')
          ..write('path: $path, ')
          ..write('prevPageUrl: $prevPageUrl, ')
          ..write('toItem: $toItem, ')
          ..write('total: $total, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    page,
    perPage,
    currentPage,
    firstPageUrl,
    fromItem,
    lastPage,
    lastPageUrl,
    nextPageUrl,
    path,
    prevPageUrl,
    toItem,
    total,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopPageCacheRecord &&
          other.page == this.page &&
          other.perPage == this.perPage &&
          other.currentPage == this.currentPage &&
          other.firstPageUrl == this.firstPageUrl &&
          other.fromItem == this.fromItem &&
          other.lastPage == this.lastPage &&
          other.lastPageUrl == this.lastPageUrl &&
          other.nextPageUrl == this.nextPageUrl &&
          other.path == this.path &&
          other.prevPageUrl == this.prevPageUrl &&
          other.toItem == this.toItem &&
          other.total == this.total &&
          other.cachedAt == this.cachedAt);
}

class ShopPageCacheRecordsCompanion
    extends UpdateCompanion<ShopPageCacheRecord> {
  final Value<int> page;
  final Value<int> perPage;
  final Value<int> currentPage;
  final Value<String> firstPageUrl;
  final Value<int?> fromItem;
  final Value<int> lastPage;
  final Value<String> lastPageUrl;
  final Value<String?> nextPageUrl;
  final Value<String> path;
  final Value<String?> prevPageUrl;
  final Value<int?> toItem;
  final Value<int> total;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const ShopPageCacheRecordsCompanion({
    this.page = const Value.absent(),
    this.perPage = const Value.absent(),
    this.currentPage = const Value.absent(),
    this.firstPageUrl = const Value.absent(),
    this.fromItem = const Value.absent(),
    this.lastPage = const Value.absent(),
    this.lastPageUrl = const Value.absent(),
    this.nextPageUrl = const Value.absent(),
    this.path = const Value.absent(),
    this.prevPageUrl = const Value.absent(),
    this.toItem = const Value.absent(),
    this.total = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShopPageCacheRecordsCompanion.insert({
    required int page,
    required int perPage,
    required int currentPage,
    required String firstPageUrl,
    this.fromItem = const Value.absent(),
    required int lastPage,
    required String lastPageUrl,
    this.nextPageUrl = const Value.absent(),
    required String path,
    this.prevPageUrl = const Value.absent(),
    this.toItem = const Value.absent(),
    required int total,
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : page = Value(page),
       perPage = Value(perPage),
       currentPage = Value(currentPage),
       firstPageUrl = Value(firstPageUrl),
       lastPage = Value(lastPage),
       lastPageUrl = Value(lastPageUrl),
       path = Value(path),
       total = Value(total);
  static Insertable<ShopPageCacheRecord> custom({
    Expression<int>? page,
    Expression<int>? perPage,
    Expression<int>? currentPage,
    Expression<String>? firstPageUrl,
    Expression<int>? fromItem,
    Expression<int>? lastPage,
    Expression<String>? lastPageUrl,
    Expression<String>? nextPageUrl,
    Expression<String>? path,
    Expression<String>? prevPageUrl,
    Expression<int>? toItem,
    Expression<int>? total,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
      if (currentPage != null) 'current_page': currentPage,
      if (firstPageUrl != null) 'first_page_url': firstPageUrl,
      if (fromItem != null) 'from_item': fromItem,
      if (lastPage != null) 'last_page': lastPage,
      if (lastPageUrl != null) 'last_page_url': lastPageUrl,
      if (nextPageUrl != null) 'next_page_url': nextPageUrl,
      if (path != null) 'path': path,
      if (prevPageUrl != null) 'prev_page_url': prevPageUrl,
      if (toItem != null) 'to_item': toItem,
      if (total != null) 'total': total,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShopPageCacheRecordsCompanion copyWith({
    Value<int>? page,
    Value<int>? perPage,
    Value<int>? currentPage,
    Value<String>? firstPageUrl,
    Value<int?>? fromItem,
    Value<int>? lastPage,
    Value<String>? lastPageUrl,
    Value<String?>? nextPageUrl,
    Value<String>? path,
    Value<String?>? prevPageUrl,
    Value<int?>? toItem,
    Value<int>? total,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return ShopPageCacheRecordsCompanion(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      currentPage: currentPage ?? this.currentPage,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      fromItem: fromItem ?? this.fromItem,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      toItem: toItem ?? this.toItem,
      total: total ?? this.total,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (perPage.present) {
      map['per_page'] = Variable<int>(perPage.value);
    }
    if (currentPage.present) {
      map['current_page'] = Variable<int>(currentPage.value);
    }
    if (firstPageUrl.present) {
      map['first_page_url'] = Variable<String>(firstPageUrl.value);
    }
    if (fromItem.present) {
      map['from_item'] = Variable<int>(fromItem.value);
    }
    if (lastPage.present) {
      map['last_page'] = Variable<int>(lastPage.value);
    }
    if (lastPageUrl.present) {
      map['last_page_url'] = Variable<String>(lastPageUrl.value);
    }
    if (nextPageUrl.present) {
      map['next_page_url'] = Variable<String>(nextPageUrl.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (prevPageUrl.present) {
      map['prev_page_url'] = Variable<String>(prevPageUrl.value);
    }
    if (toItem.present) {
      map['to_item'] = Variable<int>(toItem.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopPageCacheRecordsCompanion(')
          ..write('page: $page, ')
          ..write('perPage: $perPage, ')
          ..write('currentPage: $currentPage, ')
          ..write('firstPageUrl: $firstPageUrl, ')
          ..write('fromItem: $fromItem, ')
          ..write('lastPage: $lastPage, ')
          ..write('lastPageUrl: $lastPageUrl, ')
          ..write('nextPageUrl: $nextPageUrl, ')
          ..write('path: $path, ')
          ..write('prevPageUrl: $prevPageUrl, ')
          ..write('toItem: $toItem, ')
          ..write('total: $total, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShopPageItemRecordsTable extends ShopPageItemRecords
    with TableInfo<$ShopPageItemRecordsTable, ShopPageItemRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopPageItemRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
    'page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _perPageMeta = const VerificationMeta(
    'perPage',
  );
  @override
  late final GeneratedColumn<int> perPage = GeneratedColumn<int>(
    'per_page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shopIdMeta = const VerificationMeta('shopId');
  @override
  late final GeneratedColumn<int> shopId = GeneratedColumn<int>(
    'shop_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES shop_records (id)',
    ),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [page, perPage, shopId, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_page_item_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopPageItemRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page')) {
      context.handle(
        _pageMeta,
        page.isAcceptableOrUnknown(data['page']!, _pageMeta),
      );
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('per_page')) {
      context.handle(
        _perPageMeta,
        perPage.isAcceptableOrUnknown(data['per_page']!, _perPageMeta),
      );
    } else if (isInserting) {
      context.missing(_perPageMeta);
    }
    if (data.containsKey('shop_id')) {
      context.handle(
        _shopIdMeta,
        shopId.isAcceptableOrUnknown(data['shop_id']!, _shopIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shopIdMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {page, perPage, shopId};
  @override
  ShopPageItemRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopPageItemRecord(
      page: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page'],
      )!,
      perPage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}per_page'],
      )!,
      shopId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shop_id'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $ShopPageItemRecordsTable createAlias(String alias) {
    return $ShopPageItemRecordsTable(attachedDatabase, alias);
  }
}

class ShopPageItemRecord extends DataClass
    implements Insertable<ShopPageItemRecord> {
  final int page;
  final int perPage;
  final int shopId;
  final int sortOrder;
  const ShopPageItemRecord({
    required this.page,
    required this.perPage,
    required this.shopId,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page'] = Variable<int>(page);
    map['per_page'] = Variable<int>(perPage);
    map['shop_id'] = Variable<int>(shopId);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ShopPageItemRecordsCompanion toCompanion(bool nullToAbsent) {
    return ShopPageItemRecordsCompanion(
      page: Value(page),
      perPage: Value(perPage),
      shopId: Value(shopId),
      sortOrder: Value(sortOrder),
    );
  }

  factory ShopPageItemRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopPageItemRecord(
      page: serializer.fromJson<int>(json['page']),
      perPage: serializer.fromJson<int>(json['perPage']),
      shopId: serializer.fromJson<int>(json['shopId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'page': serializer.toJson<int>(page),
      'perPage': serializer.toJson<int>(perPage),
      'shopId': serializer.toJson<int>(shopId),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ShopPageItemRecord copyWith({
    int? page,
    int? perPage,
    int? shopId,
    int? sortOrder,
  }) => ShopPageItemRecord(
    page: page ?? this.page,
    perPage: perPage ?? this.perPage,
    shopId: shopId ?? this.shopId,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  ShopPageItemRecord copyWithCompanion(ShopPageItemRecordsCompanion data) {
    return ShopPageItemRecord(
      page: data.page.present ? data.page.value : this.page,
      perPage: data.perPage.present ? data.perPage.value : this.perPage,
      shopId: data.shopId.present ? data.shopId.value : this.shopId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopPageItemRecord(')
          ..write('page: $page, ')
          ..write('perPage: $perPage, ')
          ..write('shopId: $shopId, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(page, perPage, shopId, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopPageItemRecord &&
          other.page == this.page &&
          other.perPage == this.perPage &&
          other.shopId == this.shopId &&
          other.sortOrder == this.sortOrder);
}

class ShopPageItemRecordsCompanion extends UpdateCompanion<ShopPageItemRecord> {
  final Value<int> page;
  final Value<int> perPage;
  final Value<int> shopId;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const ShopPageItemRecordsCompanion({
    this.page = const Value.absent(),
    this.perPage = const Value.absent(),
    this.shopId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShopPageItemRecordsCompanion.insert({
    required int page,
    required int perPage,
    required int shopId,
    required int sortOrder,
    this.rowid = const Value.absent(),
  }) : page = Value(page),
       perPage = Value(perPage),
       shopId = Value(shopId),
       sortOrder = Value(sortOrder);
  static Insertable<ShopPageItemRecord> custom({
    Expression<int>? page,
    Expression<int>? perPage,
    Expression<int>? shopId,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
      if (shopId != null) 'shop_id': shopId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShopPageItemRecordsCompanion copyWith({
    Value<int>? page,
    Value<int>? perPage,
    Value<int>? shopId,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return ShopPageItemRecordsCompanion(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      shopId: shopId ?? this.shopId,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (perPage.present) {
      map['per_page'] = Variable<int>(perPage.value);
    }
    if (shopId.present) {
      map['shop_id'] = Variable<int>(shopId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopPageItemRecordsCompanion(')
          ..write('page: $page, ')
          ..write('perPage: $perPage, ')
          ..write('shopId: $shopId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShopPageLinkRecordsTable extends ShopPageLinkRecords
    with TableInfo<$ShopPageLinkRecordsTable, ShopPageLinkRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShopPageLinkRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageMeta = const VerificationMeta('page');
  @override
  late final GeneratedColumn<int> page = GeneratedColumn<int>(
    'page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _perPageMeta = const VerificationMeta(
    'perPage',
  );
  @override
  late final GeneratedColumn<int> perPage = GeneratedColumn<int>(
    'per_page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pageNoMeta = const VerificationMeta('pageNo');
  @override
  late final GeneratedColumn<int> pageNo = GeneratedColumn<int>(
    'page_no',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    page,
    perPage,
    sortOrder,
    label,
    url,
    pageNo,
    active,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shop_page_link_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShopPageLinkRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page')) {
      context.handle(
        _pageMeta,
        page.isAcceptableOrUnknown(data['page']!, _pageMeta),
      );
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    if (data.containsKey('per_page')) {
      context.handle(
        _perPageMeta,
        perPage.isAcceptableOrUnknown(data['per_page']!, _perPageMeta),
      );
    } else if (isInserting) {
      context.missing(_perPageMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('page_no')) {
      context.handle(
        _pageNoMeta,
        pageNo.isAcceptableOrUnknown(data['page_no']!, _pageNoMeta),
      );
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {page, perPage, sortOrder};
  @override
  ShopPageLinkRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShopPageLinkRecord(
      page: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page'],
      )!,
      perPage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}per_page'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      pageNo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_no'],
      ),
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $ShopPageLinkRecordsTable createAlias(String alias) {
    return $ShopPageLinkRecordsTable(attachedDatabase, alias);
  }
}

class ShopPageLinkRecord extends DataClass
    implements Insertable<ShopPageLinkRecord> {
  final int page;
  final int perPage;
  final int sortOrder;
  final String label;
  final String? url;
  final int? pageNo;
  final bool active;
  const ShopPageLinkRecord({
    required this.page,
    required this.perPage,
    required this.sortOrder,
    required this.label,
    this.url,
    this.pageNo,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page'] = Variable<int>(page);
    map['per_page'] = Variable<int>(perPage);
    map['sort_order'] = Variable<int>(sortOrder);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || pageNo != null) {
      map['page_no'] = Variable<int>(pageNo);
    }
    map['active'] = Variable<bool>(active);
    return map;
  }

  ShopPageLinkRecordsCompanion toCompanion(bool nullToAbsent) {
    return ShopPageLinkRecordsCompanion(
      page: Value(page),
      perPage: Value(perPage),
      sortOrder: Value(sortOrder),
      label: Value(label),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      pageNo: pageNo == null && nullToAbsent
          ? const Value.absent()
          : Value(pageNo),
      active: Value(active),
    );
  }

  factory ShopPageLinkRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShopPageLinkRecord(
      page: serializer.fromJson<int>(json['page']),
      perPage: serializer.fromJson<int>(json['perPage']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      label: serializer.fromJson<String>(json['label']),
      url: serializer.fromJson<String?>(json['url']),
      pageNo: serializer.fromJson<int?>(json['pageNo']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'page': serializer.toJson<int>(page),
      'perPage': serializer.toJson<int>(perPage),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'label': serializer.toJson<String>(label),
      'url': serializer.toJson<String?>(url),
      'pageNo': serializer.toJson<int?>(pageNo),
      'active': serializer.toJson<bool>(active),
    };
  }

  ShopPageLinkRecord copyWith({
    int? page,
    int? perPage,
    int? sortOrder,
    String? label,
    Value<String?> url = const Value.absent(),
    Value<int?> pageNo = const Value.absent(),
    bool? active,
  }) => ShopPageLinkRecord(
    page: page ?? this.page,
    perPage: perPage ?? this.perPage,
    sortOrder: sortOrder ?? this.sortOrder,
    label: label ?? this.label,
    url: url.present ? url.value : this.url,
    pageNo: pageNo.present ? pageNo.value : this.pageNo,
    active: active ?? this.active,
  );
  ShopPageLinkRecord copyWithCompanion(ShopPageLinkRecordsCompanion data) {
    return ShopPageLinkRecord(
      page: data.page.present ? data.page.value : this.page,
      perPage: data.perPage.present ? data.perPage.value : this.perPage,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      label: data.label.present ? data.label.value : this.label,
      url: data.url.present ? data.url.value : this.url,
      pageNo: data.pageNo.present ? data.pageNo.value : this.pageNo,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShopPageLinkRecord(')
          ..write('page: $page, ')
          ..write('perPage: $perPage, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('label: $label, ')
          ..write('url: $url, ')
          ..write('pageNo: $pageNo, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(page, perPage, sortOrder, label, url, pageNo, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShopPageLinkRecord &&
          other.page == this.page &&
          other.perPage == this.perPage &&
          other.sortOrder == this.sortOrder &&
          other.label == this.label &&
          other.url == this.url &&
          other.pageNo == this.pageNo &&
          other.active == this.active);
}

class ShopPageLinkRecordsCompanion extends UpdateCompanion<ShopPageLinkRecord> {
  final Value<int> page;
  final Value<int> perPage;
  final Value<int> sortOrder;
  final Value<String> label;
  final Value<String?> url;
  final Value<int?> pageNo;
  final Value<bool> active;
  final Value<int> rowid;
  const ShopPageLinkRecordsCompanion({
    this.page = const Value.absent(),
    this.perPage = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.label = const Value.absent(),
    this.url = const Value.absent(),
    this.pageNo = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShopPageLinkRecordsCompanion.insert({
    required int page,
    required int perPage,
    required int sortOrder,
    required String label,
    this.url = const Value.absent(),
    this.pageNo = const Value.absent(),
    required bool active,
    this.rowid = const Value.absent(),
  }) : page = Value(page),
       perPage = Value(perPage),
       sortOrder = Value(sortOrder),
       label = Value(label),
       active = Value(active);
  static Insertable<ShopPageLinkRecord> custom({
    Expression<int>? page,
    Expression<int>? perPage,
    Expression<int>? sortOrder,
    Expression<String>? label,
    Expression<String>? url,
    Expression<int>? pageNo,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (page != null) 'page': page,
      if (perPage != null) 'per_page': perPage,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (label != null) 'label': label,
      if (url != null) 'url': url,
      if (pageNo != null) 'page_no': pageNo,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShopPageLinkRecordsCompanion copyWith({
    Value<int>? page,
    Value<int>? perPage,
    Value<int>? sortOrder,
    Value<String>? label,
    Value<String?>? url,
    Value<int?>? pageNo,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return ShopPageLinkRecordsCompanion(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      sortOrder: sortOrder ?? this.sortOrder,
      label: label ?? this.label,
      url: url ?? this.url,
      pageNo: pageNo ?? this.pageNo,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (perPage.present) {
      map['per_page'] = Variable<int>(perPage.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (pageNo.present) {
      map['page_no'] = Variable<int>(pageNo.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShopPageLinkRecordsCompanion(')
          ..write('page: $page, ')
          ..write('perPage: $perPage, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('label: $label, ')
          ..write('url: $url, ')
          ..write('pageNo: $pageNo, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodosTable todos = $TodosTable(this);
  late final $ShopRecordsTable shopRecords = $ShopRecordsTable(this);
  late final $ShopPageCacheRecordsTable shopPageCacheRecords =
      $ShopPageCacheRecordsTable(this);
  late final $ShopPageItemRecordsTable shopPageItemRecords =
      $ShopPageItemRecordsTable(this);
  late final $ShopPageLinkRecordsTable shopPageLinkRecords =
      $ShopPageLinkRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    todos,
    shopRecords,
    shopPageCacheRecords,
    shopPageItemRecords,
    shopPageLinkRecords,
  ];
}

typedef $$TodosTableCreateCompanionBuilder =
    TodosCompanion Function({
      Value<int> id,
      required String title,
      Value<bool> completed,
      Value<DateTime> createdAt,
    });
typedef $$TodosTableUpdateCompanionBuilder =
    TodosCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<bool> completed,
      Value<DateTime> createdAt,
    });

class $$TodosTableFilterComposer extends Composer<_$AppDatabase, $TodosTable> {
  $$TodosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TodosTableOrderingComposer
    extends Composer<_$AppDatabase, $TodosTable> {
  $$TodosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TodosTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodosTable> {
  $$TodosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TodosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TodosTable,
          Todo,
          $$TodosTableFilterComposer,
          $$TodosTableOrderingComposer,
          $$TodosTableAnnotationComposer,
          $$TodosTableCreateCompanionBuilder,
          $$TodosTableUpdateCompanionBuilder,
          (Todo, BaseReferences<_$AppDatabase, $TodosTable, Todo>),
          Todo,
          PrefetchHooks Function()
        > {
  $$TodosTableTableManager(_$AppDatabase db, $TodosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TodosCompanion(
                id: id,
                title: title,
                completed: completed,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<bool> completed = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TodosCompanion.insert(
                id: id,
                title: title,
                completed: completed,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TodosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TodosTable,
      Todo,
      $$TodosTableFilterComposer,
      $$TodosTableOrderingComposer,
      $$TodosTableAnnotationComposer,
      $$TodosTableCreateCompanionBuilder,
      $$TodosTableUpdateCompanionBuilder,
      (Todo, BaseReferences<_$AppDatabase, $TodosTable, Todo>),
      Todo,
      PrefetchHooks Function()
    >;
typedef $$ShopRecordsTableCreateCompanionBuilder =
    ShopRecordsCompanion Function({
      Value<int> id,
      required String shopNo,
      required String ownerName,
      Value<String?> ownerNid,
      Value<String?> ownerPhone,
      Value<int?> sqft,
      Value<String?> meterNo,
      required bool isActive,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> deletedAt,
    });
typedef $$ShopRecordsTableUpdateCompanionBuilder =
    ShopRecordsCompanion Function({
      Value<int> id,
      Value<String> shopNo,
      Value<String> ownerName,
      Value<String?> ownerNid,
      Value<String?> ownerPhone,
      Value<int?> sqft,
      Value<String?> meterNo,
      Value<bool> isActive,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> deletedAt,
    });

final class $$ShopRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $ShopRecordsTable, ShopRecord> {
  $$ShopRecordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $ShopPageItemRecordsTable,
    List<ShopPageItemRecord>
  >
  _shopPageItemRecordsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.shopPageItemRecords,
        aliasName: $_aliasNameGenerator(
          db.shopRecords.id,
          db.shopPageItemRecords.shopId,
        ),
      );

  $$ShopPageItemRecordsTableProcessedTableManager get shopPageItemRecordsRefs {
    final manager = $$ShopPageItemRecordsTableTableManager(
      $_db,
      $_db.shopPageItemRecords,
    ).filter((f) => f.shopId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shopPageItemRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ShopRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ShopRecordsTable> {
  $$ShopRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shopNo => $composableBuilder(
    column: $table.shopNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerNid => $composableBuilder(
    column: $table.ownerNid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerPhone => $composableBuilder(
    column: $table.ownerPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sqft => $composableBuilder(
    column: $table.sqft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meterNo => $composableBuilder(
    column: $table.meterNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> shopPageItemRecordsRefs(
    Expression<bool> Function($$ShopPageItemRecordsTableFilterComposer f) f,
  ) {
    final $$ShopPageItemRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shopPageItemRecords,
      getReferencedColumn: (t) => t.shopId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopPageItemRecordsTableFilterComposer(
            $db: $db,
            $table: $db.shopPageItemRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ShopRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShopRecordsTable> {
  $$ShopRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shopNo => $composableBuilder(
    column: $table.shopNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerNid => $composableBuilder(
    column: $table.ownerNid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerPhone => $composableBuilder(
    column: $table.ownerPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sqft => $composableBuilder(
    column: $table.sqft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meterNo => $composableBuilder(
    column: $table.meterNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShopRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShopRecordsTable> {
  $$ShopRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get shopNo =>
      $composableBuilder(column: $table.shopNo, builder: (column) => column);

  GeneratedColumn<String> get ownerName =>
      $composableBuilder(column: $table.ownerName, builder: (column) => column);

  GeneratedColumn<String> get ownerNid =>
      $composableBuilder(column: $table.ownerNid, builder: (column) => column);

  GeneratedColumn<String> get ownerPhone => $composableBuilder(
    column: $table.ownerPhone,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sqft =>
      $composableBuilder(column: $table.sqft, builder: (column) => column);

  GeneratedColumn<String> get meterNo =>
      $composableBuilder(column: $table.meterNo, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> shopPageItemRecordsRefs<T extends Object>(
    Expression<T> Function($$ShopPageItemRecordsTableAnnotationComposer a) f,
  ) {
    final $$ShopPageItemRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.shopPageItemRecords,
          getReferencedColumn: (t) => t.shopId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ShopPageItemRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.shopPageItemRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ShopRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShopRecordsTable,
          ShopRecord,
          $$ShopRecordsTableFilterComposer,
          $$ShopRecordsTableOrderingComposer,
          $$ShopRecordsTableAnnotationComposer,
          $$ShopRecordsTableCreateCompanionBuilder,
          $$ShopRecordsTableUpdateCompanionBuilder,
          (ShopRecord, $$ShopRecordsTableReferences),
          ShopRecord,
          PrefetchHooks Function({bool shopPageItemRecordsRefs})
        > {
  $$ShopRecordsTableTableManager(_$AppDatabase db, $ShopRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShopRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> shopNo = const Value.absent(),
                Value<String> ownerName = const Value.absent(),
                Value<String?> ownerNid = const Value.absent(),
                Value<String?> ownerPhone = const Value.absent(),
                Value<int?> sqft = const Value.absent(),
                Value<String?> meterNo = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> deletedAt = const Value.absent(),
              }) => ShopRecordsCompanion(
                id: id,
                shopNo: shopNo,
                ownerName: ownerName,
                ownerNid: ownerNid,
                ownerPhone: ownerPhone,
                sqft: sqft,
                meterNo: meterNo,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String shopNo,
                required String ownerName,
                Value<String?> ownerNid = const Value.absent(),
                Value<String?> ownerPhone = const Value.absent(),
                Value<int?> sqft = const Value.absent(),
                Value<String?> meterNo = const Value.absent(),
                required bool isActive,
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> deletedAt = const Value.absent(),
              }) => ShopRecordsCompanion.insert(
                id: id,
                shopNo: shopNo,
                ownerName: ownerName,
                ownerNid: ownerNid,
                ownerPhone: ownerPhone,
                sqft: sqft,
                meterNo: meterNo,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shopPageItemRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (shopPageItemRecordsRefs) db.shopPageItemRecords,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (shopPageItemRecordsRefs)
                    await $_getPrefetchedData<
                      ShopRecord,
                      $ShopRecordsTable,
                      ShopPageItemRecord
                    >(
                      currentTable: table,
                      referencedTable: $$ShopRecordsTableReferences
                          ._shopPageItemRecordsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ShopRecordsTableReferences(
                            db,
                            table,
                            p0,
                          ).shopPageItemRecordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.shopId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ShopRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShopRecordsTable,
      ShopRecord,
      $$ShopRecordsTableFilterComposer,
      $$ShopRecordsTableOrderingComposer,
      $$ShopRecordsTableAnnotationComposer,
      $$ShopRecordsTableCreateCompanionBuilder,
      $$ShopRecordsTableUpdateCompanionBuilder,
      (ShopRecord, $$ShopRecordsTableReferences),
      ShopRecord,
      PrefetchHooks Function({bool shopPageItemRecordsRefs})
    >;
typedef $$ShopPageCacheRecordsTableCreateCompanionBuilder =
    ShopPageCacheRecordsCompanion Function({
      required int page,
      required int perPage,
      required int currentPage,
      required String firstPageUrl,
      Value<int?> fromItem,
      required int lastPage,
      required String lastPageUrl,
      Value<String?> nextPageUrl,
      required String path,
      Value<String?> prevPageUrl,
      Value<int?> toItem,
      required int total,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });
typedef $$ShopPageCacheRecordsTableUpdateCompanionBuilder =
    ShopPageCacheRecordsCompanion Function({
      Value<int> page,
      Value<int> perPage,
      Value<int> currentPage,
      Value<String> firstPageUrl,
      Value<int?> fromItem,
      Value<int> lastPage,
      Value<String> lastPageUrl,
      Value<String?> nextPageUrl,
      Value<String> path,
      Value<String?> prevPageUrl,
      Value<int?> toItem,
      Value<int> total,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$ShopPageCacheRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ShopPageCacheRecordsTable> {
  $$ShopPageCacheRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perPage => $composableBuilder(
    column: $table.perPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentPage => $composableBuilder(
    column: $table.currentPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstPageUrl => $composableBuilder(
    column: $table.firstPageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fromItem => $composableBuilder(
    column: $table.fromItem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastPage => $composableBuilder(
    column: $table.lastPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastPageUrl => $composableBuilder(
    column: $table.lastPageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextPageUrl => $composableBuilder(
    column: $table.nextPageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prevPageUrl => $composableBuilder(
    column: $table.prevPageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get toItem => $composableBuilder(
    column: $table.toItem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShopPageCacheRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShopPageCacheRecordsTable> {
  $$ShopPageCacheRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perPage => $composableBuilder(
    column: $table.perPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentPage => $composableBuilder(
    column: $table.currentPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstPageUrl => $composableBuilder(
    column: $table.firstPageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fromItem => $composableBuilder(
    column: $table.fromItem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastPage => $composableBuilder(
    column: $table.lastPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastPageUrl => $composableBuilder(
    column: $table.lastPageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextPageUrl => $composableBuilder(
    column: $table.nextPageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prevPageUrl => $composableBuilder(
    column: $table.prevPageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get toItem => $composableBuilder(
    column: $table.toItem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShopPageCacheRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShopPageCacheRecordsTable> {
  $$ShopPageCacheRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<int> get perPage =>
      $composableBuilder(column: $table.perPage, builder: (column) => column);

  GeneratedColumn<int> get currentPage => $composableBuilder(
    column: $table.currentPage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstPageUrl => $composableBuilder(
    column: $table.firstPageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fromItem =>
      $composableBuilder(column: $table.fromItem, builder: (column) => column);

  GeneratedColumn<int> get lastPage =>
      $composableBuilder(column: $table.lastPage, builder: (column) => column);

  GeneratedColumn<String> get lastPageUrl => $composableBuilder(
    column: $table.lastPageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextPageUrl => $composableBuilder(
    column: $table.nextPageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get prevPageUrl => $composableBuilder(
    column: $table.prevPageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get toItem =>
      $composableBuilder(column: $table.toItem, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$ShopPageCacheRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShopPageCacheRecordsTable,
          ShopPageCacheRecord,
          $$ShopPageCacheRecordsTableFilterComposer,
          $$ShopPageCacheRecordsTableOrderingComposer,
          $$ShopPageCacheRecordsTableAnnotationComposer,
          $$ShopPageCacheRecordsTableCreateCompanionBuilder,
          $$ShopPageCacheRecordsTableUpdateCompanionBuilder,
          (
            ShopPageCacheRecord,
            BaseReferences<
              _$AppDatabase,
              $ShopPageCacheRecordsTable,
              ShopPageCacheRecord
            >,
          ),
          ShopPageCacheRecord,
          PrefetchHooks Function()
        > {
  $$ShopPageCacheRecordsTableTableManager(
    _$AppDatabase db,
    $ShopPageCacheRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopPageCacheRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopPageCacheRecordsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ShopPageCacheRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> page = const Value.absent(),
                Value<int> perPage = const Value.absent(),
                Value<int> currentPage = const Value.absent(),
                Value<String> firstPageUrl = const Value.absent(),
                Value<int?> fromItem = const Value.absent(),
                Value<int> lastPage = const Value.absent(),
                Value<String> lastPageUrl = const Value.absent(),
                Value<String?> nextPageUrl = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String?> prevPageUrl = const Value.absent(),
                Value<int?> toItem = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShopPageCacheRecordsCompanion(
                page: page,
                perPage: perPage,
                currentPage: currentPage,
                firstPageUrl: firstPageUrl,
                fromItem: fromItem,
                lastPage: lastPage,
                lastPageUrl: lastPageUrl,
                nextPageUrl: nextPageUrl,
                path: path,
                prevPageUrl: prevPageUrl,
                toItem: toItem,
                total: total,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int page,
                required int perPage,
                required int currentPage,
                required String firstPageUrl,
                Value<int?> fromItem = const Value.absent(),
                required int lastPage,
                required String lastPageUrl,
                Value<String?> nextPageUrl = const Value.absent(),
                required String path,
                Value<String?> prevPageUrl = const Value.absent(),
                Value<int?> toItem = const Value.absent(),
                required int total,
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShopPageCacheRecordsCompanion.insert(
                page: page,
                perPage: perPage,
                currentPage: currentPage,
                firstPageUrl: firstPageUrl,
                fromItem: fromItem,
                lastPage: lastPage,
                lastPageUrl: lastPageUrl,
                nextPageUrl: nextPageUrl,
                path: path,
                prevPageUrl: prevPageUrl,
                toItem: toItem,
                total: total,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShopPageCacheRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShopPageCacheRecordsTable,
      ShopPageCacheRecord,
      $$ShopPageCacheRecordsTableFilterComposer,
      $$ShopPageCacheRecordsTableOrderingComposer,
      $$ShopPageCacheRecordsTableAnnotationComposer,
      $$ShopPageCacheRecordsTableCreateCompanionBuilder,
      $$ShopPageCacheRecordsTableUpdateCompanionBuilder,
      (
        ShopPageCacheRecord,
        BaseReferences<
          _$AppDatabase,
          $ShopPageCacheRecordsTable,
          ShopPageCacheRecord
        >,
      ),
      ShopPageCacheRecord,
      PrefetchHooks Function()
    >;
typedef $$ShopPageItemRecordsTableCreateCompanionBuilder =
    ShopPageItemRecordsCompanion Function({
      required int page,
      required int perPage,
      required int shopId,
      required int sortOrder,
      Value<int> rowid,
    });
typedef $$ShopPageItemRecordsTableUpdateCompanionBuilder =
    ShopPageItemRecordsCompanion Function({
      Value<int> page,
      Value<int> perPage,
      Value<int> shopId,
      Value<int> sortOrder,
      Value<int> rowid,
    });

final class $$ShopPageItemRecordsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ShopPageItemRecordsTable,
          ShopPageItemRecord
        > {
  $$ShopPageItemRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ShopRecordsTable _shopIdTable(_$AppDatabase db) =>
      db.shopRecords.createAlias(
        $_aliasNameGenerator(db.shopPageItemRecords.shopId, db.shopRecords.id),
      );

  $$ShopRecordsTableProcessedTableManager get shopId {
    final $_column = $_itemColumn<int>('shop_id')!;

    final manager = $$ShopRecordsTableTableManager(
      $_db,
      $_db.shopRecords,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shopIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShopPageItemRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ShopPageItemRecordsTable> {
  $$ShopPageItemRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perPage => $composableBuilder(
    column: $table.perPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$ShopRecordsTableFilterComposer get shopId {
    final $$ShopRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopId,
      referencedTable: $db.shopRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopRecordsTableFilterComposer(
            $db: $db,
            $table: $db.shopRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPageItemRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShopPageItemRecordsTable> {
  $$ShopPageItemRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perPage => $composableBuilder(
    column: $table.perPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$ShopRecordsTableOrderingComposer get shopId {
    final $$ShopRecordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopId,
      referencedTable: $db.shopRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopRecordsTableOrderingComposer(
            $db: $db,
            $table: $db.shopRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPageItemRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShopPageItemRecordsTable> {
  $$ShopPageItemRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<int> get perPage =>
      $composableBuilder(column: $table.perPage, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$ShopRecordsTableAnnotationComposer get shopId {
    final $$ShopRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shopId,
      referencedTable: $db.shopRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShopRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.shopRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShopPageItemRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShopPageItemRecordsTable,
          ShopPageItemRecord,
          $$ShopPageItemRecordsTableFilterComposer,
          $$ShopPageItemRecordsTableOrderingComposer,
          $$ShopPageItemRecordsTableAnnotationComposer,
          $$ShopPageItemRecordsTableCreateCompanionBuilder,
          $$ShopPageItemRecordsTableUpdateCompanionBuilder,
          (ShopPageItemRecord, $$ShopPageItemRecordsTableReferences),
          ShopPageItemRecord,
          PrefetchHooks Function({bool shopId})
        > {
  $$ShopPageItemRecordsTableTableManager(
    _$AppDatabase db,
    $ShopPageItemRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopPageItemRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopPageItemRecordsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ShopPageItemRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> page = const Value.absent(),
                Value<int> perPage = const Value.absent(),
                Value<int> shopId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShopPageItemRecordsCompanion(
                page: page,
                perPage: perPage,
                shopId: shopId,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int page,
                required int perPage,
                required int shopId,
                required int sortOrder,
                Value<int> rowid = const Value.absent(),
              }) => ShopPageItemRecordsCompanion.insert(
                page: page,
                perPage: perPage,
                shopId: shopId,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShopPageItemRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shopId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shopId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shopId,
                                referencedTable:
                                    $$ShopPageItemRecordsTableReferences
                                        ._shopIdTable(db),
                                referencedColumn:
                                    $$ShopPageItemRecordsTableReferences
                                        ._shopIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShopPageItemRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShopPageItemRecordsTable,
      ShopPageItemRecord,
      $$ShopPageItemRecordsTableFilterComposer,
      $$ShopPageItemRecordsTableOrderingComposer,
      $$ShopPageItemRecordsTableAnnotationComposer,
      $$ShopPageItemRecordsTableCreateCompanionBuilder,
      $$ShopPageItemRecordsTableUpdateCompanionBuilder,
      (ShopPageItemRecord, $$ShopPageItemRecordsTableReferences),
      ShopPageItemRecord,
      PrefetchHooks Function({bool shopId})
    >;
typedef $$ShopPageLinkRecordsTableCreateCompanionBuilder =
    ShopPageLinkRecordsCompanion Function({
      required int page,
      required int perPage,
      required int sortOrder,
      required String label,
      Value<String?> url,
      Value<int?> pageNo,
      required bool active,
      Value<int> rowid,
    });
typedef $$ShopPageLinkRecordsTableUpdateCompanionBuilder =
    ShopPageLinkRecordsCompanion Function({
      Value<int> page,
      Value<int> perPage,
      Value<int> sortOrder,
      Value<String> label,
      Value<String?> url,
      Value<int?> pageNo,
      Value<bool> active,
      Value<int> rowid,
    });

class $$ShopPageLinkRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ShopPageLinkRecordsTable> {
  $$ShopPageLinkRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get perPage => $composableBuilder(
    column: $table.perPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageNo => $composableBuilder(
    column: $table.pageNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShopPageLinkRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShopPageLinkRecordsTable> {
  $$ShopPageLinkRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get page => $composableBuilder(
    column: $table.page,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get perPage => $composableBuilder(
    column: $table.perPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageNo => $composableBuilder(
    column: $table.pageNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShopPageLinkRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShopPageLinkRecordsTable> {
  $$ShopPageLinkRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get page =>
      $composableBuilder(column: $table.page, builder: (column) => column);

  GeneratedColumn<int> get perPage =>
      $composableBuilder(column: $table.perPage, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<int> get pageNo =>
      $composableBuilder(column: $table.pageNo, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);
}

class $$ShopPageLinkRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShopPageLinkRecordsTable,
          ShopPageLinkRecord,
          $$ShopPageLinkRecordsTableFilterComposer,
          $$ShopPageLinkRecordsTableOrderingComposer,
          $$ShopPageLinkRecordsTableAnnotationComposer,
          $$ShopPageLinkRecordsTableCreateCompanionBuilder,
          $$ShopPageLinkRecordsTableUpdateCompanionBuilder,
          (
            ShopPageLinkRecord,
            BaseReferences<
              _$AppDatabase,
              $ShopPageLinkRecordsTable,
              ShopPageLinkRecord
            >,
          ),
          ShopPageLinkRecord,
          PrefetchHooks Function()
        > {
  $$ShopPageLinkRecordsTableTableManager(
    _$AppDatabase db,
    $ShopPageLinkRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShopPageLinkRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShopPageLinkRecordsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ShopPageLinkRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> page = const Value.absent(),
                Value<int> perPage = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<int?> pageNo = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShopPageLinkRecordsCompanion(
                page: page,
                perPage: perPage,
                sortOrder: sortOrder,
                label: label,
                url: url,
                pageNo: pageNo,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int page,
                required int perPage,
                required int sortOrder,
                required String label,
                Value<String?> url = const Value.absent(),
                Value<int?> pageNo = const Value.absent(),
                required bool active,
                Value<int> rowid = const Value.absent(),
              }) => ShopPageLinkRecordsCompanion.insert(
                page: page,
                perPage: perPage,
                sortOrder: sortOrder,
                label: label,
                url: url,
                pageNo: pageNo,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShopPageLinkRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShopPageLinkRecordsTable,
      ShopPageLinkRecord,
      $$ShopPageLinkRecordsTableFilterComposer,
      $$ShopPageLinkRecordsTableOrderingComposer,
      $$ShopPageLinkRecordsTableAnnotationComposer,
      $$ShopPageLinkRecordsTableCreateCompanionBuilder,
      $$ShopPageLinkRecordsTableUpdateCompanionBuilder,
      (
        ShopPageLinkRecord,
        BaseReferences<
          _$AppDatabase,
          $ShopPageLinkRecordsTable,
          ShopPageLinkRecord
        >,
      ),
      ShopPageLinkRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodosTableTableManager get todos =>
      $$TodosTableTableManager(_db, _db.todos);
  $$ShopRecordsTableTableManager get shopRecords =>
      $$ShopRecordsTableTableManager(_db, _db.shopRecords);
  $$ShopPageCacheRecordsTableTableManager get shopPageCacheRecords =>
      $$ShopPageCacheRecordsTableTableManager(_db, _db.shopPageCacheRecords);
  $$ShopPageItemRecordsTableTableManager get shopPageItemRecords =>
      $$ShopPageItemRecordsTableTableManager(_db, _db.shopPageItemRecords);
  $$ShopPageLinkRecordsTableTableManager get shopPageLinkRecords =>
      $$ShopPageLinkRecordsTableTableManager(_db, _db.shopPageLinkRecords);
}
