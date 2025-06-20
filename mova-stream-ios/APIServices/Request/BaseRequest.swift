//
//  MetfoneESimRequestModels.swift
//  mocha
//
//  Created by ALTEK DT on 15/5/25.
//  Copyright © 2025 TTND. All rights reserved.
//

import Foundation

// MARK: - MetfoneESimBaseRequest
struct MetfoneESimBaseRequest<T: Codable>: Codable {
    var language: String?
    var userName: String?
    var wsCode: String?
    var wsRequest: T?
}

// MARK: - MetfoneESimSupportedDeviceModelRequest
struct MetfoneESimSupportedDeviceModelRequest: Codable {
    var language: String?
    var account: String?
}

// MARK: - MetfoneESimRecommendModelRequest
struct MetfoneESimRecommendModelRequest: Codable {
    var isdn: String?
}

// MARK: - MetfoneESimLookupIsdnMobileModelRequest
struct MetfoneESimLookupIsdnMobileModelRequest: Codable {
    var language: String?
    var isdn: String?
    var pageSize: String?
    var pageNo: String?
    var priceFrom: String?
    var priceTo: String?
}

// MARK: - MetfoneESimCheckLimitBuyEsimModelRequest
struct MetfoneESimCheckLimitBuyEsimModelRequest: Codable {
    var account: String?
}


// MARK: - MetfoneESimDetectCardIDEKYCModelRequest
struct MetfoneESimDetectCardIDEKYCModelRequest: Codable {
    var language: String?
    var dealerIsdn: String?
    var isdn: String?
    var serial: String?
    var image: String?
    var isTest: Int?
}

// MARK: - MetfoneESimDetectPassportEKYCModelRequest
struct MetfoneESimDetectPassportEKYCModelRequest: Codable {
    var language: String?
    var dealerIsdn: String?
    var isdn: String?
    var serial: String?
    var image: String?
    var isTest: Int?
}

// MARK: - MetfoneESimDetectPassportEKYCModelRequest
struct MetfoneESimDetectVisaEKYCModelRequest: Codable {
    var language: String?
    var transKycId: String?
    var visaImage: String?
}

// MARK: - MetfoneESimDetectFaceEKYCModelRequest
struct MetfoneESimDetectFaceEKYCModelRequest: Codable {
    var language: String?
    var dealerIsdn: String?
    var transId: String?
    var pathFront: String?
    var image: String?
    var isTest: Int?
}

// MARK: - MetfoneESimHistoryOrderedNumberEKYCModelRequest
struct MetfoneESimHistoryOrderedNumberEKYCModelRequest: Codable {
    var account: String?
    var fromDate: String?
    var toDate: String?
    var isdn: String?
    var orderCode: String?
    var status: String?
    var page: String?
    var pageSize: String?
}

// MARK: - MetfoneESimPackageModelRequest
struct MetfoneESimDataPackagesModelRequest: Codable {}

// MARK: - MetfoneESimPrePaymentInitEKYCModelRequest
struct MetfoneESimPrePaymentInitEKYCModelRequest: Codable {
    var account: String?
    var isdn: String?
    var packageCode: String?
    var portraitBase64: String?
    var frontBase64: String?
    var visaBase64: String?
    var dob: String?
    var idNumber: String?
    var fullName: String?
    var transIdKyc: String?
    var isKYCFail: String?
    var orderCode: String?
}

// MARK: - MetfoneESimInitABAPaymentModelRequest
struct MetfoneESimInitABAPaymentModelRequest: Codable {
    var transId: String?
    var orderCode: String?
    var isTest: Int?
}

// MARK: - MetfoneESimInitEMoneyPaymentModelRequest
struct MetfoneESimInitEMoneyPaymentModelRequest: Codable {
    var transId: String?
    var orderCode: String?
    var isTest: Int?
}

// MARK: - MetfoneESimInitEMoneyPaymentModelRequest
struct MetfoneESimTransactionStatusEKYCModelRequest: Codable {
    var transId: String?
    var orderCode: String?
}
