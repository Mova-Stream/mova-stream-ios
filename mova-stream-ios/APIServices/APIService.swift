//
//  MetfoneESimAPIService.swift
//  mocha
//
//  Created by HAU NGUYEN on 29/4/25.
//  Copyright © 2025 TTND. All rights reserved.
//

import Foundation

enum NetworkErrorType {
    case INVALID_TRANSACTION_STATUS
    case TRY_AGAIN_TRANSACTION_STATUS
    case SYSTEM_ERROR
}

struct NetworkError: Error {
    var code: String?
    var message: String?
    var type: NetworkErrorType?
}

// SupportedDevices
typealias SupportedDevicesResponseDataType = MetfoneESimBaseResultResponse<String>

protocol MetfoneESimAPIServiceDelegate {
    // MARK: getListSupportedDevices
    func getListSupportedDevices(parameters: MetfoneESimSupportedDeviceModelRequest, completion: @escaping (Result<SupportedDevicesResponseDataType, NetworkError>) -> Void)
}


class MetfoneESimAPIService: MetfoneESimAPIServiceDelegate {
    
    // MARK: - getListSupportedDevices
    func getListSupportedDevices(parameters: MetfoneESimSupportedDeviceModelRequest, completion: @escaping (Result<SupportedDevicesResponseDataType, NetworkError>) -> Void) {
        
        guard let parameters = parameters.jsonDict else { return }
        
//        Networking.shared.call(responseType: MetfoneESimBaseResponse<MetfoneESimSupportedDeviceModelResponse>.self, path: API_BUYESIM_GET_LIST_ESIM_DEVICES, parameters: parameters) { response in
//            switch response {
//            case .success(let result):
//                if let result = result.result {
//                    completion(.success(result))
//                } else {
//                    completion(.failure(MetfoneESimError(code: result.errorCode, message: result.errorMessage)))
//                }
//            case .failure(let error):
//                completion(.failure(MetfoneESimError(code: nil, message: error.errorMessage)))
//            }
//        }
    }
}
