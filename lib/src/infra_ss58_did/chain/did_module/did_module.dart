import 'package:infra_did_dart/src/infra_ss58_did/generated/did/did.dart';
import 'package:infra_did_dart/src/infra_ss58_did/model/exception.dart';

import '../../model/did_module/onchain_did_detail.dart';

Future<OnchainDIDDetail> getOnchainDIDDetail(Did api, List<int> hexDid) async {
  final didDetails = await api.query.dIDModule.dids(hexDid);
  if (didDetails != null) {
    return OnchainDIDDetail.fromJson(didDetails.toJson());
  } else {
    throw InfraDIDException(1, "Onchain DID not exist");
  }
}
