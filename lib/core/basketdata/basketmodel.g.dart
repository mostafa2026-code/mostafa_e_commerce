// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basketmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketmodelAdapter extends TypeAdapter<Basketmodel> {
  @override
  final int typeId = 0;

  @override
  Basketmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Basketmodel(
      name: fields[1] as String,
      id: fields[2] as String,
      image: fields[3] as String,
      pecknumber: fields[4] as int,
      total_price: fields[5] as double,
      loved: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Basketmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.pecknumber)
      ..writeByte(5)
      ..write(obj.total_price)
      ..writeByte(6)
      ..write(obj.loved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
