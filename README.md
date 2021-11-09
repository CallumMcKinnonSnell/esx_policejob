# esx_policejob

A re-written, lightweight police job for ESX 1.final that strips away many of the unecessary features that would otherwise be handled by other resources.

### Requirements
* Auto mode
  * [esx_billing]
* Player management (boss actions, armoury, evidence locker)
  * [esx_addoninventory]
  * [esx_datastore]
  * [esx_society]
* Third Eye Targeting system
  * [qtarget]

## Download & Installation

### Manual
- Download
- Place inside appropriate directory
- Add `ensure esx_policejob` to your appropriate cfg.

- Check item names in the (very basic and admittedly poorly written) basic kit script at the bottom of server.lua

### Room for expansion
- Add a way for police to clock into training mode, via a police2 job?


# CREDIT FOR BASE SCRIPT TO THE ORIGINAL CREATOR AS PER BELOW LICENSE

# Legal
### License
esx_policejob - police script for ESX

Copyright (C) 2015-2020 Jérémie N'gadi

This program Is free software: you can redistribute it And/Or modify it under the terms Of the GNU General Public License As published by the Free Software Foundation, either version 3 Of the License, Or (at your option) any later version.

This program Is distributed In the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty Of MERCHANTABILITY Or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License For more details.

You should have received a copy Of the GNU General Public License along with this program. If Not, see http://www.gnu.org/licenses/.
