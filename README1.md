# 15 Smart Contracts Solidity Assignment

## Thông tin sinh viên
* Họ và tên: Phạm Thùy Huyền Trâm
* Mã số sinh viên (Roll No): 30201425095
* Môi trường Test: Remix IDE kết nối qua Custom External Http Provider (Ganache Local)

---

## Bảng trạng thái hoàn thành (Status Table)

| STT | Tên Smart Contract | Mô tả ngắn gọn | Trạng thái Compile | Trạng thái Test | Ảnh minh họa (Screenshots) |
| :---: | :--- | :--- | :---: | :---: | :--- |
| **01** | `01_Counter.sol` | Tăng/giảm giá trị số nguyên | ✅ Thành công | ✅ Đã test (Happy & Revert) | `screenshots/01_test1.png`, `01_test2.png` |
| **02** | `02_Storage.sol` | Lưu trữ và đọc giá trị số | ✅ Thành công | ✅ Đã test (Happy & Revert) | `screenshots/02_test1.png`, `02_test2.png` |
| **03** | `03_EvenOdd.sol` | Kiểm tra số chẵn hay lẻ | ✅ Thành công | ✅ Đã test (Happy & Revert) | `screenshots/03_test1.png`, `03_test2.png` |
| **04** | `04_Ownable.sol` | Phân quyền sở hữu hợp đồng | ✅ Thành công | ✅ Đã test (Happy & Revert) | `screenshots/04_test1.png`, `04_test2.png` |
| **05** | `05_SimpleBank.sol` | Ngân hàng on-chain chống Re-entrancy | ✅ Thành công | ✅ Đã test (Happy & Revert) | `screenshots/05_test1.png`, `05_test2.png` |
| **06** | `06_Voting.sol` | Hệ thống bầu cử phi tập trung | ✅ Thành công | ✅ Đã test (Happy & Revert) | `screenshots/06_test1.png`, `06_test2.png` |
| **07** | `07_MyToken.sol` | Tạo ERC-20 Token cơ bản | ✅ Thành công | ✅ Đã test (Happy & Revert) | `screenshots/07_test1.png`, `07_test2.png` |
| **08** | `08_Crowdfunding.sol` | Gọi vốn cộng đồng theo thời hạn | ⏳ Đang cập nhật | ⏳ Đang cập nhật | `screenshots/08_test1.png`, `08_test2.png` |
| **09** | `09_MultiSigWallet.sol` | Ví đa chữ ký phê duyệt giao dịch | ⏳ Đang cập nhật | ⏳ Đang cập nhật | `screenshots/09_test1.png`, `09_test2.png` |
| **10** | `10_TimeLock.sol` | Khóa thời gian thực thi chức năng | ⏳ Đang cập nhật | ⏳ Đang cập nhật | `screenshots/10_test1.png`, `10_test2.png` |
| **11** | `11_DataRegistry.sol` | Lưu trữ dữ liệu băm minh bạch | ⏳ Đang cập nhật | ⏳ Đang cập nhật | `screenshots/11_test1.png`, `11_test2.png` |
| **12** | `12_Escrow.sol` | Hợp đồng ký quỹ trung gian an toàn | ⏳ Đang cập nhật | ⏳ Đang cập nhật | `screenshots/12_test1.png`, `12_test2.png` |
| **13** | `13_AccessControl.sol` | Quản lý phân quyền nhiều cấp độ | ⏳ Đang cập nhật | ⏳ Đang cập nhật | `screenshots/13_test1.png`, `13_test2.png` |
| **14** | `14_RateLimiter.sol` | Giới hạn tần suất gọi hàm chống spam | ⏳ Đang cập nhật | ⏳ Đang cập nhật | `screenshots/14_test1.png`, `14_test2.png` |
| **15** | `15_EmergencyStop.sol` | Cơ chế ngắt khẩn cấp (Circuit Breaker)| ⏳ Đang cập nhật | ⏳ Đang cập nhật | `screenshots/15_test1.png`, `15_test2.png` |

---

## Cấu trúc thư mục dự án
```text
solidity-smart-contracts-assignment/
│
├── contracts/               # Chứa các file mã nguồn Solidity (.sol) sạch
│   ├── 01_Counter.sol
│   ├── 02_Storage.sol
│   ├── ...
│   └── 07_MyToken.sol
│
├── screenshots/             # Chứa ảnh minh chứng test trên Remix & Ganache
│   ├── 01_test1.png
│   ├── 01_test2.png
│   └── ...
│
├── report/                  # Thư mục chứa báo cáo chi tiết
│   └── REPORT.md
│
└── README.md                # Tài liệu tổng quan dự án