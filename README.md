# 🚀 CryptoCore Stream Station

**CryptoCore Stream Station** is a Flutter desktop application that acts as a modern **streaming control panel** to launch and manage **Sunshine** (a powerful open-source game streaming host) for low-latency streaming to client devices using **Moonlight**. Built specifically for Windows desktop with GPU acceleration in mind, this project integrates system-level launching and provides an intuitive UI for developers and gamers.

---

## 🎮 Features

- 🖥️ Launch **Sunshine** streaming server directly from the app  
- 📱 Stream GPU-powered apps to mobile using **Moonlight**  
- 🌗 Toggle between **dark** and **light** themes  
- 🎨 Beautiful material design with streaming & gaming-themed UI  
- 🧩 Customizable icons and gamified control panel  
- ⏹️ One-click **Start** and **Stop** streaming control  
- ✅ Designed for **Windows** with full Flutter desktop support  

---

## 🛠️ Getting Started

### ✅ Prerequisites

- Windows 10 or 11
- [Flutter](https://flutter.dev/docs/get-started/install/windows) installed and added to PATH
- Dart SDK (included with Flutter)
- [Visual Studio 2022](https://visualstudio.microsoft.com/vs/) with:
  - "Desktop Development with C++" workload
- [Sunshine](https://github.com/LizardByte/Sunshine) installed on your PC
- [Moonlight](https://moonlight-stream.org/) installed on your mobile device

---

### ▶️ Run the App

```bash
flutter build windows
cd build/windows/x64/runner/Release
./cryptocore_gpu.exe


📁 Folder Structure

/lib
└── main.dart # Main application UI and logic
/assets
└── icons/ # (Optional) Streaming and gaming-related assets
/build # Build output (ignored by version control)


🌐 Resources
📚 Flutter Documentation
🎮 Sunshine - Game Stream Host
📱 Moonlight Streaming Client
🧰 ViGEmBus - Gamepad support (optional)

🤝 Contributing
Contributions, pull requests, and feedback are welcome!
Feel free to fork the repository, improve features, fix bugs, or propose new ideas.
