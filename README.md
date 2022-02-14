# Source code mẫu và hướng dẫn tích hợp OnetimeCA của VNPTSmartCA

Đối với Project mẫu, clone repository và khởi chạy.

## Yêu cầu

- VNPT OnetimeCA iOS SDK được thiết kế để chạy tốt với iOS phiên bản **9.0** trở lên.
- Tải toàn bộ **XCFrameworks** từ link sau: <https://www.dropbox.com/s/7qbj5yl90awxj9c/OnetimeCAFrameworks.zip?dl=1>
- Cấu hình tại **Targets Project** -> **Build Settings** -> **Build Options** -> **Enable Bitcode**, chuyển từ **Yes** -> **No**

### Cài đặt

- Sau khi đã có toàn bộ XCFramework, kéo thả toàn bộ file *.xcframework thả vào mục **Targets Project** -> **General** -> **Frameworks, Libraries, and Embedded Content**
- Riêng file **FlutterPluginRegistrant.xcframework**, chuyển thành **Do Not Embedded**

### Các bước cấu hình

**Bước 1:** Khởi tạo SDK

```swift
import OnetimeVNPTSmartCAFramework
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var onetimeCA: OnetimeVNPTSmartCA?; // Khởi tạo biến global để sử dụng ở những file khác trong Project.
    var partnerId = "xxx-xxx-xxx-xxx"; // PartnerID được VNPTSmartCA cung cấp khi yêu cầu tích hợp.

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.onetimeCA = OnetimeVNPTSmartCA(
            environment: OnetimeVNPTSmartCA.ENVIRONMENT.DEMO, // Có 2 môi trường được cung cấp đó là DEMO và PRODUCTION.
            partnerId: self.partnerId,
            lang: OnetimeVNPTSmartCA.LANG.VI); // Có 2 ngôn ngữ được hỗ trợ đó là: VI: Tiếng Việt và EN: Tiếng Anh.
        return true
    }
}
```

**Bước 2:** Sử dụng các hàm cơ bản

- Hàm lấy thông tin accessToken và Credential

```swift
@objc func getAuthentication() {
        // SDK tự động xử lý các trường hợp về token: Hết hạn, chưa kích hoạt...
        (UIApplication.shared.delegate as! AppDelegate).onetimeCA?.getAuthentication(viewController: self, callback: {authResult in
            if authResult.status == SmartCAResultCode.SUCCESS_CODE {
              // Hàm showDialog được viết sẵn trong file Dialog.swift trong Project mẫu.
                self.showDialog(title: "Đã kích hoạt thành công", message: "\(authResult.data)");
            } else {
                // SDK tự động hiển thị giao diện
            }
        });
    }
```

- Hàm xác nhận / hủy giao dịch chờ ký số

```swift
@objc func getWaitingTransaction() {
        (UIApplication.shared.delegate as! AppDelegate).onetimeCA?.getAuthentication(viewController: self, callback: { authResult in
                if authResult.status == SmartCAResultCode.SUCCESS_CODE {
                    (UIApplication.shared.delegate as! AppDelegate).onetimeCA?.getWaitingTransaction(viewController: self, tranId: "xxx-xxx-xxx", callback: { wtResult in // tranId: Được lấy sau khi tạo giao dịch từ Web Portal
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
        
    }
```

## Tác giả

VNPT SmartCA Development Team

## Bản quyền ©

[Copyright (c) 2021 VNPTSmartCA](https://github.com/VNPTSmartCA/ios-onetimeca-sdk-example/blob/master/LICENSE).

## Liên hệ - Hỗ trợ

email: hoangdinhoi@vnpt.vn
