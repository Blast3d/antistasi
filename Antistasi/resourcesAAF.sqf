if (!isPlayer AS_commander) exitWith {};

private ["_resourcesAAF","_coste"];

waitUntil {!resourcesIsChanging};
resourcesIsChanging = true;
_coste = _this select 0;

if (isNil "_coste") then {_coste = 0};

_resourcesAAF = AS_persistent getVariable "resourcesAAF";
_resourcesAAF = _resourcesAAF + _coste;
if (_resourcesAAF < 0) then {_resourcesAAF = 0};
AS_persistent setVariable ["resourcesAAF",_resourcesAAF,true];
resourcesIsChanging = false;