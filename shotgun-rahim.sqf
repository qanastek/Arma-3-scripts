player addEventHandler ["Fired", {

	// L'arme pour l'aquelle le script ce lance 
	_weaponClass = "srifle_DMR_01_F"; 
	 
	// Si le joueur n'a pas dans ses mains l'arme défini en haut alors le script n'est pas exécuté 
	if (currentWeapon player != _weaponClass)
	then
	{
		// Si la fonction existe déjà alors la supprimer 
		if ( !(isNil "FEH_shotgunPlayer") ) 
		then 
		{ 
		    player removeeventhandler["fired", FEH_shotgunPlayer]; 
		};

		// Définit la fonction 
		FEH_shotgunPlayer = player addeventhandler ["fired", 
		{ 
		  _numBullets = 1; // # bullets added to each bullet fired 
		  _spread = 1; // bullets spread angle 
		  _rndAngle = 0.5; // max random angle added to spread 
		  _startRadius = 0.0; // distance sideways bullets appear from original 
		  _distanceOut = 0.75; // distance forward bullets appear from original 
		  _bulletsPerCircle = 1; // # bullets per each revolution of spiral 
		  _degreeStep = 360 / _bulletsPerCircle; 
		   
		  // populate offsets array 
		  _bulletInfo = []; 
		  _angle = 0; 
		   
		    while {_angle < _degreeStep * _numBullets} 
		    do 
		    { 
		        _radius = _startRadius + (_angle * 0.0003); 
		        _offsetX = _radius * ( cos _angle ); 
		        _offsetZ = _radius * ( sin _angle ); 
		        _offset = [_offsetX, _distanceOut, _offsetZ];   
		 
		        _angleRadius = _angle / 360; 
		        _angleX = _spread * (cos _angle) * _angleRadius; 
		        _rndAngleX = _rndAngle/2 - random(_rndAngle); 
		        _angleZ = _spread * (sin _angle) * _angleRadius; 
		        _rndAngleZ = _rndAngle / 2 - random(_rndAngle); 
		        _angles = [_angleX + _rndAngleX, _angleZ + _rndAngleZ]; 
		 
		        _bulletInfo pushBack [_offset, _angles]; 
		 
		        _angle = _angle + _degreeStep; 
		    }; 
		   
		  // get bullet info 
		  _bullet = nearestObject [_this select 0,_this select 4]; 
		  _bulletType = typeOf _bullet; 
		  _bulletpos = getPos _bullet; 
		  _weapdir = player weaponDirection currentWeapon player; 
		  _up = vectorUp _bullet; 
		  _bulletPitchBank = _bullet call BIS_fnc_getPitchBank; 
		  _bulletPitch = _bulletPitchBank select 0; 
		  _bulletBank = _bulletPitchBank select 1; 
		  _bulletDir = getDir _bullet; 
		   
		  // spawn bullets 
		  { 
		    _o = createVehicle [_bulletType, [0,0,0], [], 0, "CAN_COLLIDE"]; 
		    _o setVectorDirAndUp[_weapdir,_up]; 
		    _offset = _x select 0; 
		    _vecToAdd = (_o modelToWorld _offset); 
		    _bulletPos2 = _bulletPos vectorAdd _vecToAdd; 
		    _o setPos _bulletPos2; 
		     
		    _angles = _x select 1; 
		    _dir = _angles select 0; 
		    _pitch = _angles select 1; 
		     
		    _o setDir _bulletDir + _dir; 
		    [_o, _bulletPitch + _pitch, _bulletBank] call BIS_fnc_setPitchBank; 
		     
		    _o setVelocityModelSpace [0, vectorMagnitude (velocity _bullet), 0]; 
		     
		  } forEach _bulletInfo;   
		   
		}];	
	} else
	{
		// Si la fonction existe déjà alors la supprimer 
		if ( !(isNil "FEH_shotgunPlayer") ) 
		then 
		{ 
		    player removeeventhandler["fired", FEH_shotgunPlayer]; 
		}; 
		 
		// Définit la fonction 
		FEH_shotgunPlayer = player addeventhandler ["fired", 
		{ 
		  _numBullets = 6; // # bullets added to each bullet fired 
		  _spread = 1; // bullets spread angle 
		  _rndAngle = 0.5; // max random angle added to spread 
		  _startRadius = 0.0; // distance sideways bullets appear from original 
		  _distanceOut = 0.75; // distance forward bullets appear from original 
		  _bulletsPerCircle = 6; // # bullets per each revolution of spiral 
		  _degreeStep = 360 / _bulletsPerCircle; 
		   
		  // populate offsets array 
		  _bulletInfo = []; 
		  _angle = 0; 
		   
		    while {_angle < _degreeStep * _numBullets} 
		    do 
		    { 
		        _radius = _startRadius + (_angle * 0.0003); 
		        _offsetX = _radius * ( cos _angle ); 
		        _offsetZ = _radius * ( sin _angle ); 
		        _offset = [_offsetX, _distanceOut, _offsetZ];   
		 
		        _angleRadius = _angle / 360; 
		        _angleX = _spread * (cos _angle) * _angleRadius; 
		        _rndAngleX = _rndAngle/2 - random(_rndAngle); 
		        _angleZ = _spread * (sin _angle) * _angleRadius; 
		        _rndAngleZ = _rndAngle / 2 - random(_rndAngle); 
		        _angles = [_angleX + _rndAngleX, _angleZ + _rndAngleZ]; 
		 
		        _bulletInfo pushBack [_offset, _angles]; 
		 
		        _angle = _angle + _degreeStep; 
		    }; 
		   
		  // get bullet info 
		  _bullet = nearestObject [_this select 0,_this select 4]; 
		  _bulletType = typeOf _bullet; 
		  _bulletpos = getPos _bullet; 
		  _weapdir = player weaponDirection currentWeapon player; 
		  _up = vectorUp _bullet; 
		  _bulletPitchBank = _bullet call BIS_fnc_getPitchBank; 
		  _bulletPitch = _bulletPitchBank select 0; 
		  _bulletBank = _bulletPitchBank select 1; 
		  _bulletDir = getDir _bullet; 
		   
		  // spawn bullets 
		  { 
		    _o = createVehicle [_bulletType, [0,0,0], [], 0, "CAN_COLLIDE"]; 
		    _o setVectorDirAndUp[_weapdir,_up]; 
		    _offset = _x select 0; 
		    _vecToAdd = (_o modelToWorld _offset); 
		    _bulletPos2 = _bulletPos vectorAdd _vecToAdd; 
		    _o setPos _bulletPos2; 
		     
		    _angles = _x select 1; 
		    _dir = _angles select 0; 
		    _pitch = _angles select 1; 
		     
		    _o setDir _bulletDir + _dir; 
		    [_o, _bulletPitch + _pitch, _bulletBank] call BIS_fnc_setPitchBank; 
		     
		    _o setVelocityModelSpace [0, vectorMagnitude (velocity _bullet), 0]; 
		     
		  } forEach _bulletInfo;
		  }];
		};   
		
}];
