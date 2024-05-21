class OnchainDIDDetail {
  final OnChain onChain;

  OnchainDIDDetail({required this.onChain});

  factory OnchainDIDDetail.fromJson(Map<String, dynamic> json) {
    return OnchainDIDDetail(
      onChain: OnChain.fromJson(json['OnChain']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'OnChain': onChain.toJson(),
    };
  }
}

class OnChain {
  final int nonce;
  final OnChainData data;

  OnChain({required this.nonce, required this.data});

  factory OnChain.fromJson(Map<String, dynamic> json) {
    return OnChain(
      nonce: json['nonce'],
      data: OnChainData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nonce': nonce,
      'data': data.toJson(),
    };
  }
}

class OnChainData {
  final int lastKeyId;
  final int activeControllerKeys;
  final int activeControllers;

  OnChainData({
    required this.lastKeyId,
    required this.activeControllerKeys,
    required this.activeControllers,
  });

  factory OnChainData.fromJson(Map<String, dynamic> json) {
    return OnChainData(
      lastKeyId: json['lastKeyId'],
      activeControllerKeys: json['activeControllerKeys'],
      activeControllers: json['activeControllers'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastKeyId': lastKeyId,
      'activeControllerKeys': activeControllerKeys,
      'activeControllers': activeControllers,
    };
  }
}
