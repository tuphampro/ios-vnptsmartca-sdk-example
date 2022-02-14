// Copyright © VNPT-IT eGov. All right reversed.
// Author: Hoang Dinh Hoi
// Date: Feb 14, 2022
// Tùy chỉnh dialog

import Foundation
import UIKit

struct ProgressDialog {
    static var alert = UIAlertController();
    static var progressView = UIProgressView();
    static var progressPoint: Float = 0 {
        didSet {
            if progressPoint == 1 {
                ProgressDialog.alert.dismiss(animated: true, completion: nil);
            }
        }
    }
}

extension UIViewController {
    // Hàm bắt đầu loading
    func loadingStart() {
        ProgressDialog.alert = UIAlertController(title: nil, message: "Vui lòng đợi...", preferredStyle: .alert);
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50));
        loadingIndicator.hidesWhenStopped = true;
        loadingIndicator.style = UIActivityIndicatorView.Style.gray;
        loadingIndicator.startAnimating();
        
        ProgressDialog.alert.view.addSubview(loadingIndicator);
        present(ProgressDialog.alert, animated: true, completion: nil);
    }
    // Hàm dừng loading
    func loadingStop() {
        ProgressDialog.alert.dismiss(animated: true, completion: nil);
    }
    
    func showDialog(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil);
        }));
        self.present(alert, animated: true, completion: nil)
    }
}
