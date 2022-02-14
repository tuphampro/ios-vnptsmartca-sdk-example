# Source code mẫu và hướng dẫn tích hợp OnetimeCA của VNPTSmartCA

Đối với Project mẫu, clone repository về và khởi chạy.

## Yêu cầu

- VNPT OnetimeCA iOS SDK được thiết kế để chạy tốt với iOS phiên bản **9.0** trở lên.
- Tải toàn bộ **XCFrameworks** từ link sau: <https://www.dropbox.com/s/7qbj5yl90awxj9c/OnetimeCAFrameworks.zip?dl=1>
- Cầu hình tại **Targets Project** -> **Build Settings** -> **Build Options** -> **Enable Bitcode**, chuyển từ **Yes** -> **No**

## Cài đặt

- Sau khi đã có toàn bộ XCFramework, kéo thả toàn bộ file *.xcframework thả vào mục **Targets Project** -> **General** -> **Frameworks, Libraries, and Embedded Content**
- Riêng file *FlutterPluginRegistrant.xcframework*, chuyển thành **Do Not Embedded**

## Tác giả

VNPT SmartCA Development Team

## Bản quyền ©

[Copyright (c) 2021 VNPTSmartCA](https://github.com/VNPTSmartCA/ios-onetimeca-sdk-example/blob/master/LICENSE).

## Liên hệ - Hỗ trợ

email: hoangdinhoi@vnpt.vn
