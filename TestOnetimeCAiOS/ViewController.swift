// Copyright © VNPT-IT eGov. All right reversed.
// Author: Hoang Dinh Hoi
// Date: Feb 14, 2022

import UIKit
import OnetimeVNPTSmartCAFramework

@available(iOS 13.0, *)
class ViewController: UIViewController {

    @IBOutlet weak var txtTranID: UITextField!
    @IBOutlet weak var btnConfirmTran: UIButton!
    @IBOutlet weak var btnActivate: UIButton!
    
    var _onetimeCA: OnetimeVNPTSmartCA?;
    var tranId: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._onetimeCA = (UIApplication.shared.delegate as! AppDelegate).onetimeCA;
        self.btnConfirmTran.addTarget(self, action: #selector(getWaitingTransaction), for: .touchUpInside);
        self.btnActivate.addTarget(self, action: #selector(getAuthentication), for: .touchUpInside);
        self.hideKeyboardWhenTappedAround();
    }
    
    // Lấy thông tin về AccessToken & Credential
    @objc func getAuthentication() {
        // SDK tự động xử lý các trường hợp về token: Hết hạn, chưa kích hoạt...
        self._onetimeCA?.getAuthentication(viewController: self, callback: {authResult in
            if authResult.status == SmartCAResultCode.SUCCESS_CODE {
                self.showDialog(title: "Đã kích hoạt thành công", message: "\(authResult.data)");
            } else {
                // SDK tự động hiển thị giao diện
            }
        });
    }
    
    // Khách hàng xác nhận / hủy giao dịch.
    @objc func getWaitingTransaction() {
        if self.txtTranID.text != "" {
            self.tranId = self.txtTranID.text!;
            (UIApplication.shared.delegate as! AppDelegate).onetimeCA?.getAuthentication(viewController: self, callback: { authResult in
                if authResult.status == SmartCAResultCode.SUCCESS_CODE {
                    self._onetimeCA?.getWaitingTransaction(viewController: self, tranId: self.tranId, callback: { wtResult in
                        if wtResult.status == SmartCAResultCode.SUCCESS_CODE {
                            print("Giao dịch thành công: \(wtResult.status) - \(wtResult.statusDesc) - \(wtResult.data)");
                        } else {
                            print("Lỗi giao dịch: \(wtResult.status) - \(wtResult.statusDesc) - \(wtResult.data)");
                        }
                    });
                } else {
                    // SDK tự động hiển thị giao diện
                }
            });
        } else {
            self.showDialog(title: "Có lỗi xảy ra", message: "Vui lòng điền TranID");
        }
        
    }
}

