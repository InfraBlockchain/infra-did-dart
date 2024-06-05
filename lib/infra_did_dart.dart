/// Support for doing something awesome.
///
/// More dartdocs go here.
library infra_did_dart;

/// Infra DID (account did, public key did)
export 'src/infra_did/infra_did_base.dart';
export 'src/infra_did/key/key.dart';
export 'src/infra_did/util/util.dart';
export 'src/infra_did/resolver/resolver.dart';
export 'src/infra_did/verifiable/verifiable.dart';

/// Infra SS58 DID (ss58 based did)
export 'src/infra_ss58_did/infra_ss58_did.dart';
export 'src/infra_ss58_did/model/infra_ss58_did_document.dart';
export 'src/infra_ss58_did/model/infra_ss58_did_set.dart';
export 'src/infra_ss58_did/model/exception.dart';
export 'src/infra_ss58_did/model/signer.dart';
export 'src/infra_ss58_did/model/did/did_key.dart';
export 'src/infra_ss58_did/model/did/onchain_did_detail.dart';
export 'src/infra_ss58_did/model/did/service_endpoint_type.dart';
export 'src/infra_ss58_did/model/did/verification_relationship.dart';
export 'src/infra_ss58_did/verifiable/verifiable_credential.dart';
export 'src/infra_ss58_did/verifiable/verifiable_presentation.dart';
export 'src/infra_ss58_did/chain/blob.dart';
export 'src/infra_ss58_did/chain/did.dart';
export 'src/infra_ss58_did/chain/revocation.dart';
export 'src/infra_ss58_did/chain/trust_entity.dart';
export 'src/infra_ss58_did/resolver/resolver.dart';

// TODO: Export any libraries intended for clients of this package.
