<div align="center">


# HyperOS Porting Project
### 
Основной источник проекта

 https://github.com/ljc-fight/miui_port

Русский&nbsp;&nbsp;|&nbsp;&nbsp;[English](/README.md)

</div>

## Intro

- Скрипт для портирования проекта HyperOS на      устройства Android 13 "Onekey"

### Протестированные устройства и портромы
- Протестированные устройства: Xiaomi 10/Pro/Ultra (umi/cmi/cas) (с последней версией/xiaomi.eu MIUI14 ROM)
- Протестированные порты: Xiaomi Mi 13 /13Pro /14 /14Pro K70Pro Stable и Dev stock с возможностью прошивки zip、xiaomi.eu новейшее HyperOS прошивки

## Working
- Face unlock
- Fringerprint
- Camera(from leaked mi10s A13 based hyperos)
- Automatic Brightness
- NFC
- etc


## BUG

- При разблокировке устройства экран может мерцать, может помочь включение опции "Отключить наложения HW" в настройках разработчика.

## Описание
- Все вышеуказанные тесты основаны на официальной версии Xiaomi 10/10Pro/10 Ultra/xiaomi.eu MIUI 14. для устройств V-AB необходим тестер.

## How to use
- On WSL、ubuntu、deepin and other Linux
```shell
    sudo apt update
    sudo apt upgrade
    sudo apt install git -y
    # Clone project
    git clone https://github.com/toraidl/hyperos_port.git
    cd hyperos_port
    # Install dependencies
    sudo ./setup.sh
    # Start porting
    sudo ./port.sh <baserom> <portrom>
```
- on macOS (AMD64)
```shell
    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Clone project
    git clone https://github.com/toraidl/hyperos_port.git
    cd hyperos_port
    # Install dependencies
    sudo ./setup.sh
     # Start porting
    sudo ./port.sh <baserom> <portrom>
```
- On Termux Android (not tested)
```shell
    pkg update
    pkg upgrade
    pkg install git tsu -y
    # Clone project
    git clone https://github.com/toraidl/hyperos_port.git
    cd hyperos_port/
    # Install depenencies
    ./setup.sh
    # Enter root mode 
    tsu
    ./port.sh <baserom> <portrom>
```
- baserom и portrom могут быть прямой ссылкой для скачивания. вы можете получить ссылку для скачивания ota со сторонних веб-сайтов.

## Кредиты
> В этом проекте часть или весь контент взят из следующих проектов с открытым исходным кодом. Особая благодарность разработчикам этих проектов.

- [「BypassSignCheck」by Weverses](https://github.com/Weverses/BypassSignCheck)
- [「contextpatch」 by ColdWindScholar](https://github.com/ColdWindScholar/TIK)
- [「fspatch」by affggh](https://github.com/affggh/fspatch)
- [「gettype」by affggh](https://github.com/affggh/gettype)
- [「lpunpack」by unix3dgforce](https://github.com/unix3dgforce/lpunpack)
- [「miui_port」by ljc-fight](https://github.com/ljc-fight/miui_port)
- etc