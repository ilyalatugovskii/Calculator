//
//  CalculatorScreenPresenter.swift
//  calculator
//
//  Created by Ilya Latugovskii on 10.05.2020.
//  Copyright (c) 2020 Ilya Latugovskii. All rights reserved.
//

import UIKit

protocol CalculatorScreenPresentationLogic {
  func presentData(response: CalculatorScreen.Model.Response.ResponseType)
}

class CalculatorScreenPresenter: CalculatorScreenPresentationLogic {
  weak var viewController: CalculatorScreenDisplayLogic?
  
  func presentData(response: CalculatorScreen.Model.Response.ResponseType) {
  
  }
  
}
