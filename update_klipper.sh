sudo service klipper stop
cd ~/klipper
git pull

make clean KCONFIG_CONFIG=config.manta
make menuconfig KCONFIG_CONFIG=config.manta
make KCONFIG_CONFIG=config.manta
python3 ~/katapult/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-id/usb-katapult_stm32g0b1xx_25000C001850425938323120-if00

read -p "Manta firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=config.ebb36
make menuconfig KCONFIG_CONFIG=config.ebb36
make KCONFIG_CONFIG=config.ebb36
python3 ~/katapult/scripts/flashtool.py -i can0 -u c4cdb986010c -r
python3 ~/katapult/scripts/flashtool.py -i can0 -f ~/klipper/out/klipper.bin -u c4cdb986010c

sudo service klipper start
