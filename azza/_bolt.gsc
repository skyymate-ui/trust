//		HOW DOES THIS WORK
//
// 1. Use "+saveBolt" to save a new position
// 2. Use "+delBolt" to delete the last saved position
// 3. Use "+startBolt" to start (who would've thought)
// 4. If you jump, you'll be detached from the bolt movement
// 5. Use the "boltTime" dvar to change the travel time. This is the TOTAL time to travel between every point. The lower the time, the faster you go. You can use decimal values.

#include common_scripts\utility;
#include maps\mp\_utility;





calls_bolt()
{
	
	setDvarIfUninitialized( "boltTime", "Bolt movement travel time (in seconds)" );
	
	if(!isDefined(self.pers["boltPoscount"]))
		self.pers["boltPoscount"] = 0;

	if(isSubStr(getDvar("boltTime"), "(in seconds)"))
		setDvar("boltTime", 5);

	self thread SaveBoltPos();
	self thread DeleteBoltPos();
	self thread BoltStart();
}

SaveBoltPos()
{
	  self endon("stopbolt");
	self endon("disconnect");
	self notifyOnPlayerCommand("boltSave", "+savebolt");

	for (;;)
	{
		self waittill("boltSave");

		self.pers["boltPoscount"] += 1;
		self.pers["boltOrigin"][self.pers["boltPoscount"]] = self GetOrigin();
		self IPrintLn("Position ^3#" + self.pers["boltPoscount"] + " ^7saved : " + self.origin );
	}
}	
DeleteBoltPos()
{
	 self endon("stopdel");
	self endon("disconnect");
	self notifyOnPlayerCommand( "boltDel", "+delbolt" );

	for (;;)
	{
		self waittill("boltDel");

		if(self.pers["boltPoscount"] == 0) self IPrintLn("There's nothing to delete");
		else
		{
			self.pers["boltOrigin"][self.pers["boltPoscount"]] = undefined;
			self IPrintLn( "Position ^3#" + self.pers["boltPoscount"] + " ^7deleted!" );
			self.pers["boltPoscount"] -= 1;
		}
	}
}

BoltStart()
{
	self endon("disconnect");
	self endon("killbolt");
	self notifyOnplayerCommand("boltStart", "+startBolt");

	for(;;)
	{
		self waittill("boltStart");

		if (self.pers["boltPoscount"] == 0)
		{
			self IPrintLn("There's no point(s) to travel to");
			continue;
		}

		boltModel = spawn( "script_model", self.origin );
		boltModel SetModel( "tag_origin" );
		boltModel EnableLinkTo();
		self PlayerLinkTo( boltModel, "tag_origin", 1, 360, 360, 360, 360, false );
		self thread WatchJumping( boltModel );

		for (i=1 ; i < self.pers["boltPoscount"] + 1 ; i++)
		{
			boltModel MoveTo( self.pers["boltOrigin"][i], getDvarFloat( "boltTime" ) / self.pers["boltPoscount"], 0, 0 );
			wait ( getDvarFloat( "boltTime" ) / self.pers["boltPoscount"] );
		}

		self Unlink();
		boltModel delete();
	}
}

WatchJumping(model)
{
	self endon("disconnect");
	self notifyOnplayerCommand("detachBolt", "+gostand");

	for(;;)
	{
		self waittill("detachBolt");

		self Unlink();
		model delete();
		self notify("killbolt");
		self thread BoltStart();
	}
}