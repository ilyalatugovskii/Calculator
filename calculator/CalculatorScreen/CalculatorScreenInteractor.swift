//
//  CalculatorScreenInteractor.swift
//  calculator
//
//  Created by Ilya Latugovskii on 10.05.2020.
//  Copyright (c) 2020 Ilya Latugovskii. All rights reserved.
//

import UIKit

protocol CalculatorScreenBusinessLogic {
  func makeRequest(request: CalculatorScreen.Model.Request.RequestType)
}

class CalculatorScreenInteractor: CalculatorScreenBusinessLogic {

  var presenter: CalculatorScreenPresentationLogic?
  var service: CalculatorScreenService?
  
  func makeRequest(request: CalculatorScreen.Model.Request.RequestType) {
    if service == nil {
      service = CalculatorScreenService()
    }
  }
  
}
