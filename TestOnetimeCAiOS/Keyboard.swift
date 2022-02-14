// Copyright © VNPT-IT eGov. All right reversed.
// Author: Hoang Dinh Hoi
// Date: Feb 14, 2022
// Tự động ẩn bàn phím ảo khi người dùng ấn vào bất cứ khu vực nào của màn hình.

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard));
        tap.cancelsTouchesInView = false;
        view.addGestureRecognizer(tap);
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true);
    }
}
