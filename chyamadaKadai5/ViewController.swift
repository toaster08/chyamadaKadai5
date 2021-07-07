//
//  ViewController.swift
//  chyamadaKadai5
//
//  Created by toaster on 2021/07/05.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var calculateButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        [firstTextField, secondTextField].forEach { $0.keyboardType = .numberPad }

        calculateButton.addTarget(self,
                                  action: #selector(calculate),
                                  for: .touchUpInside)

        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapView)
        )
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func didTapView() {
        view.endEditing(true)
    }
}

extension ViewController {
    @objc private func calculate() {
        guard let firstNumber = Double(firstTextField.text!) else {
            presentAlert(message: "割られる数を入力してください")
            return
        }
        guard let secondNumber = Double(secondTextField.text!) else {
            presentAlert(message: "割る数を入力してください")
            return
        }
        guard secondNumber != 0 else {
            presentAlert(message: "割る数には０を入力しないでください")
            return
        }

        let result = firstNumber / secondNumber
        resultLabel.text = String(result)

        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
    }
}

extension ViewController {
    @objc private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "課題5",
                                                message: message,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK",
                                        style: .default,
                                        handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
