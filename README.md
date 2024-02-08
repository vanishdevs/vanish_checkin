# Check-in Script

## Description

This script adds a medical treatment functionality to your FiveM server, allowing players to receive treatment from a designated NPC at a specified location. Players can interact with the NPC, pay a treatment cost, and get revived if needed.

## Features

- Choose to either use as a standalone or with a framework (ESX)
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

- `Framework`: Specify the framework for the script or leave blank ('') if you are using this as a standalone system.
- `UseTarget`: If you want to use a targeting system, set this to true. This enables interaction with the ped (ox_target only).
- `location`: The locations where the ped is spawned for interaction, using vector4 for coordinates. Add more coordinates as needed, ensuring proper syntax.
- `standalonerespawn`: If you choose to make this script standalone, define where you want to respawn when you receive treatment (ignore if you are using a framework).
- `EMSAvailability`: The amount of medics/EMS that must be online for this system to work.
- `treatmentCost`: Cost of treatment in in-game currency (e.g., dollars).
- `notificationType`: Type of notification system used for displaying messages (e.g., "esx", "chat", etc.).


## Usage

Players can approach the designated treatment location and interact with the NPC to receive treatment. The interaction prompts and costs are configurable.

## Notifications

The script supports different notification systems. Customize the `ShowNotification` function in the `config.lua` file to match your preferred notification system.

## Credits

- [ESX Framework](https://github.com/esx-framework/esx_core): Used for player-related functions.
- [OX LIB](https://github.com/overextended/ox_lib): Used for library related calls.
- [OX Target](https://github.com/overextended/ox_target): Used for ped interaction.

## License

This script is released under the [MIT License](LICENSE.md).
