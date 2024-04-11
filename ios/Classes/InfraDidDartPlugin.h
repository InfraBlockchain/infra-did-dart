#import <Flutter/Flutter.h>

@interface InfraDidDartPlugin : NSObject<FlutterPlugin>
@end
// NOTE: Append the lines below to ios/Classes/<your>Plugin.h

/**
 * ===========================================================================
 */
const char *infra_generate_ss58_did(const char *network_id);

const char *infra_generate_ss58_did_from_phrase(const char *suri, const char *network_id);

const char *infra_did_to_hex_public_key(const char *did);

const char *infra_ss58_address_to_did(const char *address, const char *network_id);

const char *infra_resolve(const char *did);

const char *infra_issue_credential(const char *did,
                                   const char *credential_json,
                                   const char *hex_private_key);

const char *infra_verify_credential(const char *credential_json);

const char *infra_issue_presentation(const char *did,
                                     const char *credential_json,
                                     const char *hex_private_key);

const char *infra_verify_presentation(const char *presentation_json);

void rust_cstr_free(char *s);

/**
 * Retrieve a human-readable description of the most recent error encountered by a InfraDID C
 * function. The returned string is valid until the next call to a InfraDID function in the current
 * thread, and should not be mutated or freed. If there has not been any error, `NULL` is returned.
 */
const char *infra_error_message(void);

/**
 * Retrieve a numeric code for the most recent error encountered by a InfraDID C function. If there
 * has not been an error, 0 is returned.
 */
int infra_error_code(void);

