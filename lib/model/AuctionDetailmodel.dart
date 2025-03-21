class AuctionDetailModel {
  String? message;
  int? statusCode;
  ResponseData? responseData;

  AuctionDetailModel({this.message, this.statusCode, this.responseData});

  AuctionDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? auctionNo;
  String? auctionBrief;
  String? auctionDetail;
  String? departmentName;
  String? officerName;
  String? keywordText;
  String? startDate;
  String? endDate;
  int? auctionResult;
  int? biddingForm;
  int? biddingType;
  int? checkReservePrice;
  int? isItemSelection;
  String? documentFee;
  int? eventTypeId;
  int? extendBy;
  int? extendWhen;
  int? extMode;
  int? firstBidCond;
  int? isAutoBidAllowed;
  int? isAutoExt;
  int? isBidderNameMasking;
  int? isEncodedName;
  int? isIncDecInPeriod;
  int? isItemWiseTime;
  String? participationFee;
  String? productLocation;
  int? propertyCount;
  int? showBidderWiseForm;
  int? showRank;
  Null? timeForIncDecToItem;
  int? totalExt;
  int? brdMode;
  int? isDecodeBidder;
  int? showWinAmountOnListing;
  int? isMinQtyReq;
  int? isBidPriceIncDecInTimesReq;
  int? typeOfAuction;
  double? eventValue;
  int? noOfBidRestriction;
  String? resultSharingDuration;
  String? defaultCurrency;
  int? shareL1H1AfterAuc;
  int? displayOfficerName;
  int? decimalValueUpto;
  int? showWinningBid;
  int? showWinnerName;
  int? isBidderWiseStartPrice;
  int? isCertRequired;
  int? isDemoAuction;
  int? greaterRank;
  int? isEvaluationReq;
  int? resultSharingForSpecificDuration;
  int? durationToDisplayL1H1;
  int? forHomePage;
  int? showIpAddress;
  int? isEmdReq;
  var emdAmt;
  int? emdPaymentMode;
  double? biddingCapacity;
  int? isRegistrationCharges;
  int? registrationChargesMode;
  String? registrationCharges;
  int? breakPriceBid;
  int? isResultApiRequired;
  int? isHideLiveBidToOfficer;
  String? borrowerName;
  int? rankLogic;
  int? showLastBid;
  int? userDetailId;
  int? isNegotiationAllowed;
  int? isRestrictBidderOnl1h1;
  int? isMobABAllow;
  double? prevEstimatedValue;
  String? remarks;
  int? isDecodeBidderDone;
  int? isBidCapacityReq;
  int? isRestrictH1Bidder;
  int? isRestOfAucMoneyRequired;
  int? isDisplaybidderRealName;
  int? isDisplayL1ItemWiseAndGTWise;
  int? isShowReservePriceToBidder;
  int? bidAllocationCriteria;
  int? securityFees;
  int? taxType;
  int? isGSTRequired;
  int? cgst;
  int? sgst;
  int? igst;
  String? prequalification;
  int? formContract;
  int? productId;
  int? auctionSector;
  int? noOfBidAllowed;
  int? isEventwiseRegretAllowed;
  int? isUploadRefDocAllowed;
  int? isBidderWiseQtyReq;
  int? aucParamGovColumnId;
  int? auctionworkflowuserid;
  String? emdPayableAt;
  int? currentExt;
  int? auctionType;
  int? auctionId;
  int? auctionMode;
  int? isDutchAuction;
  String? endDateVirtual;
  int? incDecInMultiple;
  int? incDecRuleOn;
  int? incDecType;
  int? procurementNatureId;
  int? rankForExt;
  int? showWinningAmount;
  int? configureTimeForItem;
  int? itemDuration;
  int? incDecOptions;
  int? incDecOptionsInTimes;
  bool? iagree;

  ResponseData(
      {this.auctionNo,
      this.auctionBrief,
      this.auctionDetail,
      this.departmentName,
      this.officerName,
      this.keywordText,
      this.startDate,
      this.endDate,
      this.auctionResult,
      this.biddingForm,
      this.biddingType,
      this.checkReservePrice,
      this.isItemSelection,
      this.documentFee,
      this.eventTypeId,
      this.extendBy,
      this.extendWhen,
      this.extMode,
      this.firstBidCond,
      this.isAutoBidAllowed,
      this.isAutoExt,
      this.isBidderNameMasking,
      this.isEncodedName,
      this.isIncDecInPeriod,
      this.isItemWiseTime,
      this.participationFee,
      this.productLocation,
      this.propertyCount,
      this.showBidderWiseForm,
      this.showRank,
      this.timeForIncDecToItem,
      this.totalExt,
      this.brdMode,
      this.isDecodeBidder,
      this.showWinAmountOnListing,
      this.isMinQtyReq,
      this.isBidPriceIncDecInTimesReq,
      this.typeOfAuction,
      this.eventValue,
      this.noOfBidRestriction,
      this.resultSharingDuration,
      this.defaultCurrency,
      this.shareL1H1AfterAuc,
      this.displayOfficerName,
      this.decimalValueUpto,
      this.showWinningBid,
      this.showWinnerName,
      this.isBidderWiseStartPrice,
      this.isCertRequired,
      this.isDemoAuction,
      this.greaterRank,
      this.isEvaluationReq,
      this.resultSharingForSpecificDuration,
      this.durationToDisplayL1H1,
      this.forHomePage,
      this.showIpAddress,
      this.isEmdReq,
      this.emdAmt,
      this.emdPaymentMode,
      this.biddingCapacity,
      this.isRegistrationCharges,
      this.registrationChargesMode,
      this.registrationCharges,
      this.breakPriceBid,
      this.isResultApiRequired,
      this.isHideLiveBidToOfficer,
      this.borrowerName,
      this.rankLogic,
      this.showLastBid,
      this.userDetailId,
      this.isNegotiationAllowed,
      this.isRestrictBidderOnl1h1,
      this.isMobABAllow,
      this.prevEstimatedValue,
      this.remarks,
      this.isDecodeBidderDone,
      this.isBidCapacityReq,
      this.isRestrictH1Bidder,
      this.isRestOfAucMoneyRequired,
      this.isDisplaybidderRealName,
      this.isDisplayL1ItemWiseAndGTWise,
      this.isShowReservePriceToBidder,
      this.bidAllocationCriteria,
      this.securityFees,
      this.taxType,
      this.isGSTRequired,
      this.cgst,
      this.sgst,
      this.igst,
      this.prequalification,
      this.formContract,
      this.productId,
      this.auctionSector,
      this.noOfBidAllowed,
      this.isEventwiseRegretAllowed,
      this.isUploadRefDocAllowed,
      this.isBidderWiseQtyReq,
      this.aucParamGovColumnId,
      this.auctionworkflowuserid,
      this.emdPayableAt,
      this.currentExt,
      this.auctionType,
      this.auctionId,
      this.auctionMode,
      this.isDutchAuction,
      this.endDateVirtual,
      this.incDecInMultiple,
      this.incDecRuleOn,
      this.incDecType,
      this.procurementNatureId,
      this.rankForExt,
      this.showWinningAmount,
      this.configureTimeForItem,
      this.itemDuration,
      this.incDecOptions,
      this.incDecOptionsInTimes,
      this.iagree});

  ResponseData.fromJson(Map<String, dynamic> json) {
    auctionNo = json['auctionNo'];
    auctionBrief = json['auctionBrief'];
    auctionDetail = json['auctionDetail'];
    departmentName = json['departmentName'];
    officerName = json['officerName'];
    keywordText = json['keywordText'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    auctionResult = json['auctionResult'];
    biddingForm = json['biddingForm'];
    biddingType = json['biddingType'];
    checkReservePrice = json['checkReservePrice'];
    isItemSelection = json['isItemSelection'];
    documentFee = json['documentFee'];
    eventTypeId = json['eventTypeId'];
    extendBy = json['extendBy'];
    extendWhen = json['extendWhen'];
    extMode = json['extMode'];
    firstBidCond = json['firstBidCond'];
    isAutoBidAllowed = json['isAutoBidAllowed'];
    isAutoExt = json['isAutoExt'];
    isBidderNameMasking = json['isBidderNameMasking'];
    isEncodedName = json['isEncodedName'];
    isIncDecInPeriod = json['isIncDecInPeriod'];
    isItemWiseTime = json['isItemWiseTime'];
    participationFee = json['participationFee'];
    productLocation = json['productLocation'];
    propertyCount = json['propertyCount'];
    showBidderWiseForm = json['showBidderWiseForm'];
    showRank = json['showRank'];
    timeForIncDecToItem = json['timeForIncDecToItem'];
    totalExt = json['totalExt'];
    brdMode = json['brdMode'];
    isDecodeBidder = json['isDecodeBidder'];
    showWinAmountOnListing = json['showWinAmountOnListing'];
    isMinQtyReq = json['isMinQtyReq'];
    isBidPriceIncDecInTimesReq = json['isBidPriceIncDecInTimesReq'];
    typeOfAuction = json['typeOfAuction'];
    eventValue = json['eventValue'];
    noOfBidRestriction = json['noOfBidRestriction'];
    resultSharingDuration = json['resultSharingDuration'];
    defaultCurrency = json['defaultCurrency'];
    shareL1H1AfterAuc = json['shareL1H1AfterAuc'];
    displayOfficerName = json['displayOfficerName'];
    decimalValueUpto = json['decimalValueUpto'];
    showWinningBid = json['showWinningBid'];
    showWinnerName = json['showWinnerName'];
    isBidderWiseStartPrice = json['isBidderWiseStartPrice'];
    isCertRequired = json['isCertRequired'];
    isDemoAuction = json['isDemoAuction'];
    greaterRank = json['greaterRank'];
    isEvaluationReq = json['isEvaluationReq'];
    resultSharingForSpecificDuration = json['resultSharingForSpecificDuration'];
    durationToDisplayL1H1 = json['durationToDisplayL1H1'];
    forHomePage = json['forHomePage'];
    showIpAddress = json['showIpAddress'];
    isEmdReq = json['isEmdReq'];
    emdAmt = json['emdAmt'];
    emdPaymentMode = json['emdPaymentMode'];
    biddingCapacity = json['biddingCapacity'];
    isRegistrationCharges = json['isRegistrationCharges'];
    registrationChargesMode = json['registrationChargesMode'];
    registrationCharges = json['registrationCharges'];
    breakPriceBid = json['breakPriceBid'];
    isResultApiRequired = json['isResultApiRequired'];
    isHideLiveBidToOfficer = json['isHideLiveBidToOfficer'];
    borrowerName = json['borrowerName'];
    rankLogic = json['rankLogic'];
    showLastBid = json['showLastBid'];
    userDetailId = json['userDetailId'];
    isNegotiationAllowed = json['isNegotiationAllowed'];
    isRestrictBidderOnl1h1 = json['isRestrictBidderOnl1h1'];
    isMobABAllow = json['isMobABAllow'];
    prevEstimatedValue = json['prevEstimatedValue'];
    remarks = json['remarks'];
    isDecodeBidderDone = json['isDecodeBidderDone'];
    isBidCapacityReq = json['isBidCapacityReq'];
    isRestrictH1Bidder = json['isRestrictH1Bidder'];
    isRestOfAucMoneyRequired = json['isRestOfAucMoneyRequired'];
    isDisplaybidderRealName = json['isDisplaybidderRealName'];
    isDisplayL1ItemWiseAndGTWise = json['isDisplayL1ItemWiseAndGTWise'];
    isShowReservePriceToBidder = json['isShowReservePriceToBidder'];
    bidAllocationCriteria = json['bidAllocationCriteria'];
    securityFees = json['securityFees'];
    taxType = json['taxType'];
    isGSTRequired = json['isGSTRequired'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    igst = json['igst'];
    prequalification = json['prequalification'];
    formContract = json['formContract'];
    productId = json['productId'];
    auctionSector = json['auctionSector'];
    noOfBidAllowed = json['noOfBidAllowed'];
    isEventwiseRegretAllowed = json['isEventwiseRegretAllowed'];
    isUploadRefDocAllowed = json['isUploadRefDocAllowed'];
    isBidderWiseQtyReq = json['isBidderWiseQtyReq'];
    aucParamGovColumnId = json['aucParamGovColumnId'];
    auctionworkflowuserid = json['auctionworkflowuserid'];
    emdPayableAt = json['emdPayableAt'];
    currentExt = json['currentExt'];
    auctionType = json['auctionType'];
    auctionId = json['auctionId'];
    auctionMode = json['auctionMode'];
    isDutchAuction = json['isDutchAuction'];
    endDateVirtual = json['endDateVirtual'];
    incDecInMultiple = json['incDecInMultiple'];
    incDecRuleOn = json['incDecRuleOn'];
    incDecType = json['incDecType'];
    procurementNatureId = json['procurementNatureId'];
    rankForExt = json['rankForExt'];
    showWinningAmount = json['showWinningAmount'];
    configureTimeForItem = json['configureTimeForItem'];
    itemDuration = json['itemDuration'];
    incDecOptions = json['incDecOptions'];
    incDecOptionsInTimes = json['incDecOptionsInTimes'];
    iagree = json['iagree'];
  }

  get responseData => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auctionNo'] = this.auctionNo;
    data['auctionBrief'] = this.auctionBrief;
    data['auctionDetail'] = this.auctionDetail;
    data['departmentName'] = this.departmentName;
    data['officerName'] = this.officerName;
    data['keywordText'] = this.keywordText;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['auctionResult'] = this.auctionResult;
    data['biddingForm'] = this.biddingForm;
    data['biddingType'] = this.biddingType;
    data['checkReservePrice'] = this.checkReservePrice;
    data['isItemSelection'] = this.isItemSelection;
    data['documentFee'] = this.documentFee;
    data['eventTypeId'] = this.eventTypeId;
    data['extendBy'] = this.extendBy;
    data['extendWhen'] = this.extendWhen;
    data['extMode'] = this.extMode;
    data['firstBidCond'] = this.firstBidCond;
    data['isAutoBidAllowed'] = this.isAutoBidAllowed;
    data['isAutoExt'] = this.isAutoExt;
    data['isBidderNameMasking'] = this.isBidderNameMasking;
    data['isEncodedName'] = this.isEncodedName;
    data['isIncDecInPeriod'] = this.isIncDecInPeriod;
    data['isItemWiseTime'] = this.isItemWiseTime;
    data['participationFee'] = this.participationFee;
    data['productLocation'] = this.productLocation;
    data['propertyCount'] = this.propertyCount;
    data['showBidderWiseForm'] = this.showBidderWiseForm;
    data['showRank'] = this.showRank;
    data['timeForIncDecToItem'] = this.timeForIncDecToItem;
    data['totalExt'] = this.totalExt;
    data['brdMode'] = this.brdMode;
    data['isDecodeBidder'] = this.isDecodeBidder;
    data['showWinAmountOnListing'] = this.showWinAmountOnListing;
    data['isMinQtyReq'] = this.isMinQtyReq;
    data['isBidPriceIncDecInTimesReq'] = this.isBidPriceIncDecInTimesReq;
    data['typeOfAuction'] = this.typeOfAuction;
    data['eventValue'] = this.eventValue;
    data['noOfBidRestriction'] = this.noOfBidRestriction;
    data['resultSharingDuration'] = this.resultSharingDuration;
    data['defaultCurrency'] = this.defaultCurrency;
    data['shareL1H1AfterAuc'] = this.shareL1H1AfterAuc;
    data['displayOfficerName'] = this.displayOfficerName;
    data['decimalValueUpto'] = this.decimalValueUpto;
    data['showWinningBid'] = this.showWinningBid;
    data['showWinnerName'] = this.showWinnerName;
    data['isBidderWiseStartPrice'] = this.isBidderWiseStartPrice;
    data['isCertRequired'] = this.isCertRequired;
    data['isDemoAuction'] = this.isDemoAuction;
    data['greaterRank'] = this.greaterRank;
    data['isEvaluationReq'] = this.isEvaluationReq;
    data['resultSharingForSpecificDuration'] =
        this.resultSharingForSpecificDuration;
    data['durationToDisplayL1H1'] = this.durationToDisplayL1H1;
    data['forHomePage'] = this.forHomePage;
    data['showIpAddress'] = this.showIpAddress;
    data['isEmdReq'] = this.isEmdReq;
    data['emdAmt'] = this.emdAmt;
    data['emdPaymentMode'] = this.emdPaymentMode;
    data['biddingCapacity'] = this.biddingCapacity;
    data['isRegistrationCharges'] = this.isRegistrationCharges;
    data['registrationChargesMode'] = this.registrationChargesMode;
    data['registrationCharges'] = this.registrationCharges;
    data['breakPriceBid'] = this.breakPriceBid;
    data['isResultApiRequired'] = this.isResultApiRequired;
    data['isHideLiveBidToOfficer'] = this.isHideLiveBidToOfficer;
    data['borrowerName'] = this.borrowerName;
    data['rankLogic'] = this.rankLogic;
    data['showLastBid'] = this.showLastBid;
    data['userDetailId'] = this.userDetailId;
    data['isNegotiationAllowed'] = this.isNegotiationAllowed;
    data['isRestrictBidderOnl1h1'] = this.isRestrictBidderOnl1h1;
    data['isMobABAllow'] = this.isMobABAllow;
    data['prevEstimatedValue'] = this.prevEstimatedValue;
    data['remarks'] = this.remarks;
    data['isDecodeBidderDone'] = this.isDecodeBidderDone;
    data['isBidCapacityReq'] = this.isBidCapacityReq;
    data['isRestrictH1Bidder'] = this.isRestrictH1Bidder;
    data['isRestOfAucMoneyRequired'] = this.isRestOfAucMoneyRequired;
    data['isDisplaybidderRealName'] = this.isDisplaybidderRealName;
    data['isDisplayL1ItemWiseAndGTWise'] = this.isDisplayL1ItemWiseAndGTWise;
    data['isShowReservePriceToBidder'] = this.isShowReservePriceToBidder;
    data['bidAllocationCriteria'] = this.bidAllocationCriteria;
    data['securityFees'] = this.securityFees;
    data['taxType'] = this.taxType;
    data['isGSTRequired'] = this.isGSTRequired;
    data['cgst'] = this.cgst;
    data['sgst'] = this.sgst;
    data['igst'] = this.igst;
    data['prequalification'] = this.prequalification;
    data['formContract'] = this.formContract;
    data['productId'] = this.productId;
    data['auctionSector'] = this.auctionSector;
    data['noOfBidAllowed'] = this.noOfBidAllowed;
    data['isEventwiseRegretAllowed'] = this.isEventwiseRegretAllowed;
    data['isUploadRefDocAllowed'] = this.isUploadRefDocAllowed;
    data['isBidderWiseQtyReq'] = this.isBidderWiseQtyReq;
    data['aucParamGovColumnId'] = this.aucParamGovColumnId;
    data['auctionworkflowuserid'] = this.auctionworkflowuserid;
    data['emdPayableAt'] = this.emdPayableAt;
    data['currentExt'] = this.currentExt;
    data['auctionType'] = this.auctionType;
    data['auctionId'] = this.auctionId;
    data['auctionMode'] = this.auctionMode;
    data['isDutchAuction'] = this.isDutchAuction;
    data['endDateVirtual'] = this.endDateVirtual;
    data['incDecInMultiple'] = this.incDecInMultiple;
    data['incDecRuleOn'] = this.incDecRuleOn;
    data['incDecType'] = this.incDecType;
    data['procurementNatureId'] = this.procurementNatureId;
    data['rankForExt'] = this.rankForExt;
    data['showWinningAmount'] = this.showWinningAmount;
    data['configureTimeForItem'] = this.configureTimeForItem;
    data['itemDuration'] = this.itemDuration;
    data['incDecOptions'] = this.incDecOptions;
    data['incDecOptionsInTimes'] = this.incDecOptionsInTimes;
    data['iagree'] = this.iagree;
    return data;
  }
}
