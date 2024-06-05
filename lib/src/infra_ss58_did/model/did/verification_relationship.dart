class VerificationRelationship {
  int _value;
  VerificationRelationship(int value) : _value = value;
  int get value => _value;
  void setAuthentication() => _value |= int.parse('0001', radix: 2);
  void setAssertion() => _value |= int.parse('0010', radix: 2);
  void setCapabilityInvocation() => _value |= int.parse('0100', radix: 2);
  void setKeyAgreement() => _value |= int.parse('1000', radix: 2);
  void setAllSigning() => _value |= int.parse('0111', radix: 2);
  bool isAuthentication() => _value & int.parse('0001', radix: 2) != 0;
  bool isAssertion() => _value & int.parse('0010', radix: 2) != 0;
  bool isCapabilityInvocation() => _value & int.parse('0100', radix: 2) != 0;
  bool isKeyAgreement() => _value & int.parse('1000', radix: 2) != 0;
}
