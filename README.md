# Check-in Script
![](https://img.shields.io/github/downloads/vanishdevs/vanish_checkin/total?logo=github)
![](https://img.shields.io/github/downloads/vanishdevs/vanish_checkin/latest/total?logo=github)
![](https://img.shields.io/github/contributors/vanishdevs/vanish_checkin?logo=github)
![](https://img.shields.io/github/v/release/vanishdevs/vanish_checkin?logo=github)

This script adds a medical treatment functionality to your FiveM server, allowing players to receive treatment from a designated NPC at a specified location. Players can interact with the NPC, pay a treatment cost, and get revived if needed.

## Features

- Fully integrated for the ESX framework
- Configurable option to use this script via targeting (ox_target)
- Configurable treatment location using vector4 coordinates.
- Adjustable cost for treatment in the in-game currency.
- Support for different notification systems (e.g., pNotify, in-game chat).
- Universal notification function for both client-side and server-side scripts.

## Installation

1. Download the script files.
2. Place the script files in your FiveM server's resources folder.
3. Ensure that you have the required dependencies installed (e.g., ESX framework).
4. Add the script to your server configuration file (`server.cfg`) using `ensure` or `start`.

## Configuration

The script is customizable through the `config.lua` file. Adjust the following parameters to suit your server:

- `Debug`: Whether to debug the system to see where it fails or not.
- `Framework`: Specify the framework for the script.
- `UseTarget`: If you want to use a targeting system, set this to true. This enables interaction with the ped (ox_target only).
- `PedSettings`: Edit the model and other soon to come features about the ped.
- `locations`: The locations where the ped or zone is spawned for interaction, using vector4 for coordinates. Add more coordinates as needed, ensuring proper syntax.
- `requireEMS`: The amount of medics/EMS that must be online for this system to work.
- `treatmentCost`: Cost of treatment in in-game currency (e.g., dollars).
- `reviveEventTrigger`: Trigger your specified event to revive the player here.

## Usage

Players can approach the designated treatment location and interact with the NPC to receive treatment. The interaction prompts and costs are configurable.

## Notifications

The script supports different notification systems. Customize the `ShowNotification` function in the `config.lua` file to match your preferred notification system.

## Credits

- [ESX Framework](https://github.com/esx-framework/esx_core): Used for player-related functions.
- [ox_lib](https://github.com/overextended/ox_lib): Used for library related calls.
- [ox_target](https://github.com/overextended/ox_target): Used for ped interaction.

## License

This script is released under the [GPL-3.0 License](LICENSE.md).
