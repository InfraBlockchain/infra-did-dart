#import <Flutter/Flutter.h>

@interface InfraDidDartPlugin : NSObject<FlutterPlugin>
@end
// NOTE: Append the lines below to ios/Classes/<your>Plugin.h

char *random_phrase(uint32_t words_number);

char *substrate_address(const char *suri, uint8_t prefix);

char *generate_ss58_did(void);

void rust_cstr_free(char *s);
