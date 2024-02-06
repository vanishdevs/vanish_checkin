# ESX Check-in Script

## Description

This script adds a medical treatment functionality to your FiveM server, allowing players to receive treatment from a designated NPC at a specified location. Players can interact with the NPC, pay a treatment cost, and get revived if needed.

## Features

- Configurable treatment location using vector3 coordinates.
- Customizable heading (rotation) for the ped model at the treatment location.
- Adjustable cost for treatment in the in-game currency.
- Cooldown period to prevent rapid consecutive treatments.
- Configurable ped model for the NPC providing the treatment.
- Support for different notification systems (e.g., pNotify, in-game chat).
- Universal notification function for both client-side and server-side scripts.

## Installation

1. Download the script files.
2. Place the script files in your FiveM server's resources folder.
3. Ensure that you have the required dependencies installed (e.g., ESX framework).
4. Add the script to your server configuration file (`server.cfg`) using `ensure` or `start`.

## Configuration

The script is customizable through the `config.lua` file. Adjust the following parameters to suit your server:

- `location`: The coordinates of the treatment location (vector4).
- `EMSAvailability`: Amount of EMS that have to be online for this system to not heal players and seek medical attention from those online.
- `treatmentCost`: Cost of treatment in in-game currency.
- `healingCooldown`: Cooldown period between consecutive treatments.
- `pedModel`: Model of the ped NPC providing the treatment.
- `notificationType`: Type of notification system used for displaying messages.

## Usage

Players can approach the designated treatment location and interact with the NPC to receive treatment. The interaction prompts and costs are configurable.

## Notifications

The script supports different notification systems. Customize the `ShowNotification` function in the `config.lua` file to match your preferred notification system.

## Credits

- [ESX Framework](https://github.com/esx-framework/esx-core): Used for player-related functions.

## License

This script is released under the [MIT License](LICENSE.md).
