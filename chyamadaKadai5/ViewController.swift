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
    private var alertMessage: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        guard firstTextField.text != "" else {
            alertMessage = "割られる数を入力してください"
            alert()
            return
        }
        guard secondTextField.text != "" else {
            alertMessage = "割る数を入力してください"
            alert()
            return
        }
        guard secondTextField.text != "0" else {
            alertMessage = "割る数には０を入力しないでください"
            alert()
            return
        }

        // 文字列がペーストされた場合は実行時エラーで終了させるためバインディングせずに対応
        let firstNumber = Double(firstTextField.text!)
        let secondNumber = Double(secondTextField.text!)
        let result = firstNumber! / secondNumber!
        resultLabel.text = String(result)

        self.firstTextField.resignFirstResponder()
        self.secondTextField.resignFirstResponder()
    }
}

extension ViewController {
    @objc private func alert() {
        let alertController = UIAlertController(title: "課題5",
                                                message: alertMessage,
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK",
                                        style: .default,
                                        handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
