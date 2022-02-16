# Source code mẫu và hướng dẫn tích hợp OnetimeCA của VNPTSmartCA

Đối với Project mẫu, clone repository và khởi chạy.

## Yêu cầu

- VNPT OnetimeCA iOS SDK được thiết kế để chạy tốt với iOS phiên bản **9.0** trở lên.
- Tải phiên bản SDK mới nhất từ link sau: <https://github.com/VNPTSmartCA/ios_onetimeca_sdk/releases> (tải file có định dạng OnetimeCAFrameworks_vx.x.x.zip)
- Cấu hình tại **Targets Project** -> **Build Settings** -> **Build Options** -> **Enable Bitcode**, chuyển từ **Yes** -> **No**

### Cài đặt

- Sau khi đã có toàn bộ XCFramework, kéo thả toàn bộ file *.xcframework thả vào mục **Targets Project** -> **General** -> **Frameworks, Libraries, and Embedded Content**
- Riêng file **FlutterPluginRegistrant.xcframework**, chuyển thành **Do Not Embedded**

### Các bước cấu hình

**Bước 1:** Khởi tạo SDK tại chỗ muốn kết nối

```swift
import OnetimeVNPTSmartCAFramework

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var onetimeCA: OnetimeVNPTSmartCA?; // Khởi tạo biến global để sử dụng ở những file khác trong Project.
    var partnerId: String = "xxx-xxx-xxx-xxx"; // PartnerID được VNPTSmartCA cung cấp khi yêu cầu tích hợp.

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

**Lưu ý:** Trước khi gọi hàm **getWaitingTransaction**, cần phải gọi hàm **getAuthentication** thành công với SUCCESS_CODE = 0.

- Hàm lấy thông tin **accessToken** và **Credential**

```swift
func getAuthentication(viewController: UIViewController, callback: @escaping (SmartCAResult) -> Void) -> Void
```

- Hàm xác nhận / hủy giao dịch chờ ký số

```swift
func getWaitingTransaction(viewController: UIViewController, tranId: String, callback: @escaping (SmartCAResult) -> Void) -> Void
```

- Hàm hủy bỏ context mà flutterEngine đang chạy

```swift
func destroySDK() -> Void
```

#### SmartCAResult

| Tên        | Loại dữ liệu | Mô tả                               |
|------------|--------------|-------------------------------------|
| status     | Int          | Trạng thái của dữ liệu trả về       |
| statusDesc | String       | Mô tả trạng thái của dữ liệu trả về |
| data       | String       | Dữ liệu trả về                      |

#### SmartCAResultCode

| Tên                | Mã lỗi |
|--------------------|--------|
| UNKNOWN_ERROR_CODE | 2      |
| USER_CANCEL_CODE   | 1      |
| SUCCESS_CODE       | 0      |

#### Giải thích các tham số sử dụng

| Tham số  | Mô tả                                                                        |
|----------|------------------------------------------------------------------------------|
| tranId   | ID của giao dịch chờ ký số                                                   |
| clientId | ID được VNPTSmartCA cung cấp khi yêu cầu tích hợp, được gửi kèm trong email. |

#### Bảng mã trạng thái gửi về

| Mã    | Mô tả                                      |
|-------|--------------------------------------------|
| 0     | Success                                    |
| 1     | User rejected                              |
| 2     | Unknown error                              |
| 3     | Device not found                           |
| 4     | Can not sign key challenge                 |
| 5     | PIN fail count                             |
| 6     | KAK Not found                              |
| 7     | PIN Not found                              |
| 8     | Token expired                              |
| 30000 | Client not found in system                 |
| 60000 | Credential not exist                       |
| 60001 | Credential not match identity              |
| 60002 | Credential no result                       |
| 60003 | Credential status invalid                  |
| 61000 | Credential assign key failed               |
| 62000 | Signature transaction not found            |
| 62001 | Signature transaction not match identity   |
| 62002 | Signature transaction expired              |
| 62003 | Signature transaction not waiting          |
| 62010 | Signature data request invalid format      |
| 63000 | Credential sign signer authen failed       |
| 63001 | Credential sign init hash signer failed    |
| 63002 | Credential sign file upload failed         |
| 64000 | Credential sign file not support file type |
| 64001 | Credential acceptance generate file failed |
| 64002 | Credential acceptance transaction exist    |

## Tác giả

VNPT SmartCA Development Team

## Bản quyền ©

[Copyright (c) 2021 VNPTSmartCA](https://github.com/VNPTSmartCA/ios-onetimeca-sdk-example/blob/master/LICENSE).

## Liên hệ - Hỗ trợ

email: smartca.vnptit@gmail.com
