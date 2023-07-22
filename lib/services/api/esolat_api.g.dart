// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esolat_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWaktuSolatHariIniHash() =>
    r'b534dc3960900a643c2bb1615e81e0f3e23cc9ad';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetWaktuSolatHariIniRef = AutoDisposeFutureProviderRef<ESolat?>;

/// See also [getWaktuSolatHariIni].
@ProviderFor(getWaktuSolatHariIni)
const getWaktuSolatHariIniProvider = GetWaktuSolatHariIniFamily();

/// See also [getWaktuSolatHariIni].
class GetWaktuSolatHariIniFamily extends Family<AsyncValue<ESolat?>> {
  /// See also [getWaktuSolatHariIni].
  const GetWaktuSolatHariIniFamily();

  /// See also [getWaktuSolatHariIni].
  GetWaktuSolatHariIniProvider call({
    TempohJadual? tempohJadual,
    ZonWaktuSolat? zonWaktuSolat,
  }) {
    return GetWaktuSolatHariIniProvider(
      tempohJadual: tempohJadual,
      zonWaktuSolat: zonWaktuSolat,
    );
  }

  @override
  GetWaktuSolatHariIniProvider getProviderOverride(
    covariant GetWaktuSolatHariIniProvider provider,
  ) {
    return call(
      tempohJadual: provider.tempohJadual,
      zonWaktuSolat: provider.zonWaktuSolat,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getWaktuSolatHariIniProvider';
}

/// See also [getWaktuSolatHariIni].
class GetWaktuSolatHariIniProvider extends AutoDisposeFutureProvider<ESolat?> {
  /// See also [getWaktuSolatHariIni].
  GetWaktuSolatHariIniProvider({
    this.tempohJadual,
    this.zonWaktuSolat,
  }) : super.internal(
          (ref) => getWaktuSolatHariIni(
            ref,
            tempohJadual: tempohJadual,
            zonWaktuSolat: zonWaktuSolat,
          ),
          from: getWaktuSolatHariIniProvider,
          name: r'getWaktuSolatHariIniProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWaktuSolatHariIniHash,
          dependencies: GetWaktuSolatHariIniFamily._dependencies,
          allTransitiveDependencies:
              GetWaktuSolatHariIniFamily._allTransitiveDependencies,
        );

  final TempohJadual? tempohJadual;
  final ZonWaktuSolat? zonWaktuSolat;

  @override
  bool operator ==(Object other) {
    return other is GetWaktuSolatHariIniProvider &&
        other.tempohJadual == tempohJadual &&
        other.zonWaktuSolat == zonWaktuSolat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tempohJadual.hashCode);
    hash = _SystemHash.combine(hash, zonWaktuSolat.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
