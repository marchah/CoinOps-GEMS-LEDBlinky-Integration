# CoinOps LEDBlinky Integration

This in a WIP for integrated LEDBlinbky into CoinOps.

Feel free to create a ticket about suggestions, ideas and imporvements.

## Installation

### Install With Compatible Hardware

- Select your CoinOps version folder and drag & drop the files from `launchers.windows` in your CoinOps `launchers.windows` folder.
- Drag and drop the folder `plugins` into your CoinOps root folder
- Generate your `LEDBlinkyInputMap.xml` using `plugins/LEDBlinky/GenLEDBlinkyInputMap.exe` (check this video for more infos [Instructions](https://www.youtube.com/watch?v=opu6NofnyWg))
- Optional: put your LEDBlinky activation keys inside `plugins/LEDBlinky`
- Generate `mame.xml`: go to the folder `plugins/ledblinky-integration/scripts` and double click on `GenerateMameXML.bat`

### Install Without Compatible Hardware

- Select your CoinOps version folder and drag & drop the files from `launchers.windows` in your CoinOps `launchers.windows` folder.
- Drag and drop the folder `plugins` into your CoinOps root folder
- Go to folder `plugins/ledblinky-integration`, open `config.cmd` and set `is_ledblinky_activated` to `0`

## Usage

- Start: double click on `plugins/ledblinky-integration/scripts/StartLEDBlinky.bat` (LEDBlinky will also start when you launch any game)
- Stop: double click on `plugins/ledblinky-integration/scripts/StopLEDBlinky.bat` (you can also exit it on the "minify" [idk the real name] taskbar)

## Options

- You can deactivated LEDBlinky by setting `is_ledblinky_activated` to `0` in `plugins/ledblinky-integration/config.cmd`
- You can change the `frontend_default_animation` is `plugins/ledblinky-integration/config.cmd`

## Console Color Rules

_If you have a better idea don't hesitate to create a ticket_

- Shoulder: `White`
- Trigger: `Brown`

## TODO

- Fix a better animation that `random.lwax`, it's very annoying => create a basic animation just displaying CoinOps menu buttons (shoulder or trigger to switch between letters).
- Deactivate LEDBlinky voice at startup
- I don't like the fact that I'm using a `.bat` file to save config, should be a `.ini` instead.
- Create a `.bat` file to generate `mame.xml`
- Need to find a way to start LEDBlinky when CoinOps start
- Need to find a way to stop LEDBlinky when CoinOps exit
- Need to test if servostick is working
- Should i use only one `.bat` launchers instead of one per emulator? Make less script files but may loose in customisation.

### Diamonds

- MAME: [Missing games colors & controls](https://github.com/marchah/CoinOps-LEDBlinky-Integration/blob/master/scripts/diamondsInfo.json)

### Gems

- Genesis: ???
- MAME: [Missing games colors & controls](https://github.com/marchah/CoinOps-LEDBlinky-Integration/blob/master/scripts/gemsInfo.json)
- SNES: ???

### Gems Plus

- DC: missing individual game colors
- DK: ???
- Dolphin: missing individual game colors
- Genesis: missing individual game colors
- MAME: [Missing games colors & controls](https://github.com/marchah/CoinOps-LEDBlinky-Integration/blob/master/scripts/gemsPlusInfo.json)
- N64: missing individual game colors
- PSP: missing individual game colors
- SegaCD: missing individual game colors
- SNES: missing individual game colors

### Next 2

Pack handled

#### Arcade Official Trusted Pack

- Atomiswave: missing individual game colors.
- MAME: [Missing games colors & controls](https://github.com/marchah/CoinOps-LEDBlinky-Integration/blob/master/scripts/next2ArcadeOfficialInfo.json)
- Model 2: missing defaults & individual game colors. **JoyKey doesn't start on the background**
- Model 3: missing defaults & individual game colors.
- Naomi: missing individual game colors.

### Dreamcast Official TRUSTED PACK

Missing individual game colors

### MSX Mame Official Trusted Pack

Missing individual game colors

### Model 2 Official Addon Pack (MeanGreene13)

Missing defaults & individual game colors **JoyKey doesn't start on the background**

### Model 3 Official Addon Pack (MeanGreene13)

Missing defaults & individual game colors

### Nintendo 64 Official TRUSTED PACK

Missing individual game colors

### PlayStation 1 Official TRUSTED PACK

Missing individual game colors

## Testing

What is you don't have LEDBlinky capable hardware and still want to help testing? Well good news you can.
Just follow the install instructions and set `is_ledblinky_activated` to `0` in `plugins/ledblinky-integration/config.cmd`.
You will be able to play your games like a stock CoinOps and it will help test that the customs `bat` launchers are working properly.

### Diamonds

- **mame** -> Alien Storm
- **mameNEW** -> **??? (untested)**

### Gems

- **Genesis** -> **??? (untested)**
- **mame** -> Alien Storm
- **SNES** -> **??? (untested)**

### Gems Plus

- **C64** -> Uridium
- **DC** -> Border Down
- **DK** -> **??? (untested)**
- **Dolphin** -> F-Zero GX
- **Genesis** -> Eco The Dolphin
- **mame** -> Alien Storm
- **mameNEW** -> **??? (untested)**
- **N64** -> Super Mario 64
- **PSP** -> Ultimate Ghosts 'n Goblins
- **PSX** -> Crash Bandicoot 2
- **SegaCD** -> Sonic CD
- **SNES** -> Axelay
- **SNESalt** -> Super Mario World II

### Next 2

#### Arcade Official Trusted Pack

- **Atomiswave** -> Demolish Fist
- **mame** -> 1941
- **Model 2** -> Daytona USA
- **Model 3** -> Daytona USA 2
- **Naomi** -> Power Stone

#### Dreamcast Official TRUSTED PACK

- **Dreamcast Official** -> 18 Wheller
- **Dreamcast Redream Official SUB** -> 18 Wheller

#### Model 2 Official Addon Pack (MeanGreene13)

- **Model 2** -> Dead or Alive

#### Model 3 Official Addon Pack (MeanGreene13)

- **Model 3** -> Fighting Vipers 2

#### MSX Mame Official Trusted Pack

- **MSX Cart** -> Aleste
- **MSX Disk** -> Aleste 2

#### Nintendo 64 Official TRUSTED PACK

- **Nintendo 64 Official** -> 007 Golden Eye
- **Nintendo 64 Project64 SUB** -> 007 Golden Eye

#### PlayStation 1 Official TRUSTED PACK

- **Playstation 1 Official** -> Ape Escape

## Scripts

Scripts are located in `plugins/ledblinky-integration/scripts`

- `DebugLEDBlue.bat`: light all the LEDs in blue
- `DebugLEDGreen.bat`: light all the LEDs in green
- `DebugLEDRed.bat`: light all the LEDs in red
- `DebugLEDWhite.bat`: light all the LEDs in white
- `GenerateMameXML.bat`: generate mame.xml and place it in the correct folder
- `StartLEDBlinky.bat`: start LEDBlinky
- `StopLEDBlinky.bat`: exit LEDBlinky

## Notes

- If you use an IPAC Ultimate I/O, you will have to configure the board in DInput, Xinput protocol doesn't support it. On IPAC software to map the input you will have use the right joystick instead of the Dpad and will have to invert `Select` and `Start`
