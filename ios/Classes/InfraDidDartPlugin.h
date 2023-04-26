#import <Flutter/Flutter.h>

@interface InfraDidDartPlugin : NSObject<FlutterPlugin>
@end
// NOTE: Append the lines below to ios/Classes/<your>Plugin.h

const char *infra_generate_ss58_did(const char *network_id);

const char *infra_generate_ss58_did_from_phrase(const char *suri, const char *network_id);

const char *infra_did_to_hex_public_key(const char *did);

char *ss58_address_to_did(char *address, char *network_id);

char *resolve(const char *did);

char *issue_credential(const char *did, const char *credential_json, const char *hex_private_key);

char *verify_credential(const char *credential_json);

char *issue_presentation(const char *did, const char *credential_json, const char *hex_private_key);

char *verify_presentation(const char *presentation_json);

void rust_cstr_free(char *s);
