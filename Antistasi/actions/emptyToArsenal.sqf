#include "..\macros.hpp"
params [["_truck", objNull]];

if (not isNull _truck and {_truck isKindOf "StaticWeapon"}) exitWith {};

if isNull _truck then {
	private _truckes = nearestObjects [caja, ["LandVehicle"], 20];
	_truckes = _truckes select {not (_x isKindOf "StaticWeapon")};
	_truckes = _truckes - [caja];
	if (count _truckes == 0) then {
		_truck = cajaVeh;
	} else {
		_truck = _truckes select 0;
	};
};
if isNull _truck exitWith {};

private _hint = {
	params ["_message"];
	if isMultiplayer then {
		{
			if (_x distance caja < 20) then {
				[petros,"hint", _message] remoteExec ["commsMP",_x];
			};
		} forEach playableUnits;
	}
	else {
		hint _message;
	};
};

"Unloading ammobox..." call _hint;
[_truck, caja] call AS_fnc_transferToBox;
"Ammobox Loaded" call _hint;