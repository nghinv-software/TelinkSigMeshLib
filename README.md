# TelinkSigMeshLib

TelinkSigMeshLib là một thư viện iOS được phát triển bởi Telink Semiconductor để hỗ trợ việc tích hợp BLE Mesh vào ứng dụng iOS của bạn.

## Yêu cầu
- iOS 12.0+
- Xcode 12.0+

## Cài đặt

### CocoaPods

[CocoaPods](https://cocoapods.org) là trình quản lý dependency cho Swift và Objective-C. Để cài đặt thông qua CocoaPods, trước tiên hãy đảm bảo bạn đã cài đặt CocoaPods. Sau đó thêm dòng sau vào Podfile của bạn:

```ruby
pod 'TelinkSigMeshLib', :git => 'https://github.com/nghinv-software/TelinkSigMeshLib.git', :tag => '1.0.0'
```

Sau đó chạy lệnh:

```bash
pod install
```

## Hướng dẫn sử dụng

### 1. Khởi tạo

```objective-c
#import <TelinkSigMeshLib/TelinkSigMeshLib.h>

// Sử dụng singleton instance
SigMeshLib *meshLib = [SigMeshLib share];
```

### 2. Quản lý Network và Application Keys

```objective-c
// Lấy Network Key
SigNetkeyModel *networkKey = [SigDataSource.share getNetkeyModelWithNetkeyIndex:0];

// Lấy Application Key
SigAppkeyModel *appKey = [SigDataSource.share getAppkeyModelWithAppkeyIndex:0];
```

### 3. Quản lý Node

```objective-c
// Lấy node theo địa chỉ unicast
SigNodeModel *node = [SigDataSource.share getNodeWithAddress:unicastAddress];

// Lấy node theo UUID của thiết bị Bluetooth
SigNodeModel *node = [SigDataSource.share getNodeWithPeripheralUUIDString:peripheralUUID];
```

### 4. Gửi Messages

#### Gửi Configuration Message
```objective-c
SigMessageHandle *handle = [meshLib sendConfigMessage:message 
                                      toDestination:destination 
                                           withTtl:ttl 
                                          command:command];
```

#### Gửi Application Message
```objective-c
SigMessageHandle *handle = [meshLib sendMeshMessage:message 
                                  fromLocalElement:element
                                    toDestination:destination 
                                         withTtl:ttl 
                              usingApplicationKey:appKey 
                                        command:command];
```

### 5. Các Model hỗ trợ

Thư viện hỗ trợ nhiều loại model SIG Mesh tiêu chuẩn:

- Generic OnOff Server/Client
- Generic Level Server/Client
- Generic Power OnOff Server/Client
- Light Lightness Server/Client
- Light CTL Server/Client
- Light HSL Server/Client
- Sensor Server/Client
- Time Server/Client
- Scene Server/Client
- Scheduler Server/Client

### 6. Ví dụ về Provisioning

```objective-c
// Khởi tạo Provisioning Manager
SigProvisioningManager *provisioningManager = [SigProvisioningManager share];

// Thực hiện provisioning với static OOB
[provisioningManager provisionWithNetworkKey:networkKeyData
                               netkeyIndex:0
                                 oobData:staticOOBData
                   capabilitiesResponse:^(SigProvisioningCapabilitiesPdu * _Nonnull capabilities) {
    // Xử lý capabilities
} provisionSuccess:^{
    // Xử lý khi provision thành công
} fail:^(NSError * _Nonnull error) {
    // Xử lý khi provision thất bại
}];
```

### 7. Cấu hình Node

```objective-c
// Cấu hình Network Transmit
[SDKLibCommand configNetworkTransmitSetWithDestination:node.address
                                networkTransmitCount:0x5
                        networkTransmitIntervalSteps:0x2
                                        retryCount:3
                                 responseMaxCount:1
                                 successCallback:^(UInt8 networkTransmitCount, UInt8 networkTransmitIntervalSteps) {
    // Xử lý khi cấu hình thành công
} resultCallback:^(BOOL isResponseAll, NSError * _Nullable error) {
    // Xử lý kết quả
}];

// Bind Application Key
[SDKLibCommand configModelAppBindWithDestination:node.address
                            applicationKeyIndex:0
                                elementAddress:element.unicastAddress
                              modelIdentifier:modelId
                            companyIdentifier:companyId
                             isVendorModelID:NO
                                 retryCount:3
                          responseMaxCount:1
                           successCallback:^(UInt16 elementAddress, UInt16 modelIdentifier, UInt16 companyIdentifier) {
    // Xử lý khi bind thành công                           
} resultCallback:^(BOOL isResponseAll, NSError * _Nullable error) {
    // Xử lý kết quả
}];
```

## Tính năng

- Hỗ trợ BLE Mesh theo chuẩn Bluetooth SIG Mesh
- Quản lý kết nối và truyền thông với các thiết bị mesh
- Hỗ trợ provision và configuration của các node trong mạng mesh
- Tương thích với các thiết bị Telink BLE Mesh

## Framework Dependencies

- CoreBluetooth

## Giấy phép

Copyright © Telink Semiconductor. Tất cả các quyền được bảo lưu.

## Liên hệ

Để biết thêm thông tin, vui lòng truy cập [website của Telink](https://www.telink-semi.com) 