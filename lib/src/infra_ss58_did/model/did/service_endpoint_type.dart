class ServiceEndpointType {
  int _value;
  ServiceEndpointType(int value) : _value = value;
  int get value => _value;
  void setLinkedDomains() => _value |= int.parse('0001', radix: 2);
  bool isLinkedDomains() => _value & int.parse('0001', radix: 2) != 0;
}
