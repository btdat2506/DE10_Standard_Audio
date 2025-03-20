# DE10_Standard_Audio

- Config hệ thống: Nios II, chứa các IP University Program của Intel/Altera: Audio, Audio and Video Config.
    - IP Audio là IP quản lý chip WM8731.
    - IP Audio and Video Config là để đơn giản hóa quá trình giao tiếp I2C vào WM8731 thông qua các hàm HAL.
    - IP Audio Clock là để cung cấp xung Clock chip WM8731
- [**RegisterMap.md**](./RegisterMap.md) là file chứa thông tin các thanh ghi của WM8731, trích xuất từ Datasheet.
- [**audio_data.mif**](./audio_data.mif) lấy lại từ github [AntonZero/WM8731-Audio-codec-on-DE10Standard-FPGA-board](https://github.com/AntonZero/WM8731-Audio-codec-on-DE10Standard-FPGA-board). File này chạy được trên Repo gốc, nhưng chưa biết đối với Repo này.

## Ghi chú
Khi thay đổi máy tính, cần mở Platform Designer lại, dẫn đường dẫn lại file [audio_data.mif](./audio_data.mif) cho On-chip Memory. Đường dẫn này không được cập nhật tự động. Sau khi xong thì Generate lại, kiểm tra trong `audio_system/synthesis/submodules/audio_system_audio_rom.v` , xác định `parameter INIT_FILE = "..."` đã được để đúng đường dẫn.