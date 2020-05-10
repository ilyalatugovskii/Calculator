//
//  CalculatorScreenViewController.swift
//  calculator
//
//  Created by Ilya Latugovskii on 10.05.2020.
//  Copyright (c) 2020 Ilya Latugovskii. All rights reserved.
//

import UIKit

protocol CalculatorScreenDisplayLogic: class {
  func displayData(viewModel: CalculatorScreen.Model.ViewModel.ViewModelData)
}

class CalculatorScreenViewController: UIViewController, CalculatorScreenDisplayLogic {

  var interactor: CalculatorScreenBusinessLogic?
  var router: (NSObjectProtocol & CalculatorScreenRoutingLogic)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = CalculatorScreenInteractor()
    let presenter             = CalculatorScreenPresenter()
    let router                = CalculatorScreenRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  // MARK: Routing
  

  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func displayData(viewModel: CalculatorScreen.Model.ViewModel.ViewModelData) {

  }
  
}
