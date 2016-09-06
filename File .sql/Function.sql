								/*checkfullresonator*/
drop function if exists checkfullresonator;
delimiter |
create function checkfullresonator
(
  latstart double(10, 6),
  lonstart double(10, 6),
  giveout bool
) returns bool
begin
set @empty:= (select SUM(resonator1+resonator2+resonator3+resonator4+resonator5+resonator6+resonator7+resonator8) from resonatorlevel where gpslat=latstart and gpslon=lonstart);
  if (@empty!=0) then 
  set giveout=true;
  return giveout;
  else set giveout=false; return giveout;
  end if;
end |
delimiter ;

								/*checklinknumber*/
drop function if exists checklinknumber;
delimiter |
create function checklinknumber
(
  latstart double(10, 6),
  lonstart double(10, 6),
  giveout bool
) returns bool
begin
set @linknumber := (select linknumber from portal where gpslat=latstart and gpslon=lonstart);
if (@linknumber>=0 and @linknumber<8) then
  set giveout=true;
  return giveout;
else set giveout=false; return giveout;
end if;
end |
delimiter ;

								/*checkexistinglink*/
drop function if exists checkexistinglink;
delimiter |
create function checkexistinglink
(
  lat1 double(10, 6),
  lon1 double(10, 6),
  lat2 double(10, 6),
  lon2 double(10, 6),
  giveout bool
) returns bool
begin
set @link := (select count(*) from link l where gpslat1=lat1 and gpslon1=lon1 and gpslat2=lat2 and gpslon2=lon2);
set @linkinverse := (select count(*) from link l where gpslat1=lat2 and gpslon1=lon2 and gpslat2=lat1 and gpslon2=lon1);
if ((select @link)=1 or (select @linkinverse)=1) then 
set giveout=false; return giveout;
else set giveout=true; return giveout;
end if;
end |
delimiter ;

								/*createlink*/
drop function if exists createlink;
delimiter |
create function createlink
(
  player CHAR(20),
  lat1 double(10,6),
  lon1 double(10,6),
  lat2 double(10,6),
  lon2 double(10,6),
  giveout bool
) returns bool
begin
if (lat1=lat2 and lon1=lon2) then
set giveout=false; return giveout;
else
set @f := (select p.faction from player p where nickname=player);
set @cellt:= (select p.cell from portal p where gpslat=lat1 and gpslon=lon1);
set @f1:= (select faction from portal where gpslat=lat1 and gpslon=lon1);
set @f2:= (select faction from portal where gpslat=lat2 and gpslon=lon2);
   if (@f1=@f2)then
   insert into link (gpslat1, gpslon1, gpslat2, gpslon2, owner, cell, capturedate, faction) values
   (lat1, lon1, lat2, lon2, player,@cellt, current_timestamp, @f);
   update stats set AP=AP+315, connector=connector+1 where nickname=player;
   set giveout=true; return giveout;
   else set giveout=false; return giveout;
   end if;
end if;
end |
delimiter ;

								/*createfield*/
drop function if exists createfield;
delimiter |
create function createfield
(
  player CHAR(20),
  latstart double(10, 6),
  lonstart double(10, 6),
  latend double(10, 6),
  lonend double(10, 6),
  giveout bool
) returns bool
begin
set @latfield:=(select sp.gpslat2 from (startportal sp join endportal ep on (sp.gpslat2=ep.gpslat2 and sp.gpslon2=ep.gpslon2)) limit 1);
set @lonfield:=(select sp.gpslon2 from (startportal sp join endportal ep on (sp.gpslat2=ep.gpslat2 and sp.gpslon2=ep.gpslon2)) limit 1);
set @f := (select p.faction from player p where nickname=player);
set @cellt:= (select p.cell from portal p where gpslat=latstart and gpslon=lonstart);
if (@latfield !=0 and @lonfield !=0) then
insert into field (gpslat1, gpslon1, gpslat2, gpslon2, gpslat3, gpslon3, cell, capturedate, faction) values
(latstart, lonstart, latend, lonend, @latfield, @lonfield, @cellt, current_timestamp, @f);
update stats set AP=AP+1250, mindcontroller=mindcontroller+1 where nickname=player;
set giveout=true;
return giveout;
else set giveout=false; return giveout;
end if;
end |
delimiter ;

								/*deploy*/
drop function if exists deploy;
delimiter |
create function deploy
(
  player CHAR( 20 ),
  pfaction char(1),
  lat double(10,6),
  lon double(10,6),
  r tinyint(1),
  slot tinyint(1),
  giveout bool
) returns bool
begin
set @f := (select faction from portal where gpslat=lat and gpslon=lon);
if (@f='n') then
  if (slot=1) then
    update portal set faction=pfaction, owner=player where gpslat=lat and gpslon=lon;
    update resonatorlevel set resonator1=r where gpslat=lat and gpslon=lon;
    update resonatorowner set resonator1=player where gpslat=lat and gpslon=lon;
    update stats set AP=AP+625, builder=builder+1, liberator=liberator+1 where nickname=player;
    set giveout=true; return giveout;
  end if;
  if (slot=2) then
    update portal set faction=pfaction, owner=player where gpslat=lat and gpslon=lon;
    update resonatorlevel set resonator2=r where gpslat=lat and gpslon=lon;
    update resonatorowner set resonator2=player where gpslat=lat and gpslon=lon;
    update stats set AP=AP+625, builder=builder+1, liberator=liberator+1 where nickname=player;
    set giveout=true; return giveout;
  end if;
  if (slot=3) then
    update portal set faction=pfaction, owner=player where gpslat=lat and gpslon=lon;
    update resonatorlevel set resonator3=r where gpslat=lat and gpslon=lon;
    update resonatorowner set resonator3=player where gpslat=lat and gpslon=lon;
    update stats set AP=AP+625, builder=builder+1, liberator=liberator+1 where nickname=player;
    set giveout=true; return giveout;
  end if;
  if (slot=4) then
    update portal set faction=pfaction, owner=player where gpslat=lat and gpslon=lon;
    update resonatorlevel set resonator4=r where gpslat=lat and gpslon=lon;
    update resonatorowner set resonator4=player where gpslat=lat and gpslon=lon;
    update stats set AP=AP+625, builder=builder+1, liberator=liberator+1 where nickname=player;
    set giveout=true; return giveout;
  end if;
  if (slot=5) then
    update portal set faction=pfaction, owner=player where gpslat=lat and gpslon=lon;
    update resonatorlevel set resonator5=r where gpslat=lat and gpslon=lon;
    update resonatorowner set resonator5=player where gpslat=lat and gpslon=lon;
    update stats set AP=AP+625, builder=builder+1, liberator=liberator+1 where nickname=player;
    set giveout=true; return giveout;
  end if;
  if (slot=6) then
    update portal set faction=pfaction, owner=player where gpslat=lat and gpslon=lon;
    update resonatorlevel set resonator6=r where gpslat=lat and gpslon=lon;
    update resonatorowner set resonator6=player where gpslat=lat and gpslon=lon;
    update stats set AP=AP+625, builder=builder+1, liberator=liberator+1 where nickname=player;
    set giveout=true; return giveout;
  end if;
  if (slot=7) then
    update portal set faction=pfaction, owner=player where gpslat=lat and gpslon=lon;
    update resonatorlevel set resonator7=r where gpslat=lat and gpslon=lon;
    update resonatorowner set resonator7=player where gpslat=lat and gpslon=lon;
    update stats set AP=AP+625, builder=builder+1, liberator=liberator+1 where nickname=player;
    set giveout=true; return giveout;
  end if;
  if (slot=8) then
    update portal set faction=pfaction, owner=player where gpslat=lat and gpslon=lon;
    update resonatorlevel set resonator8=r where gpslat=lat and gpslon=lon;
    update resonatorowner set resonator8=player where gpslat=lat and gpslon=lon;
    update stats set AP=AP+625, builder=builder+1, liberator=liberator+1 where nickname=player;
    set giveout=true; return giveout;
  end if;
else if (@f=pfaction) then
	if (slot=1) then
	set @var:= (select resonator1 from resonatorlevel where gpslat=lat and gpslon=lon);
	  if (r>@var) then
	    update resonatorlevel set resonator1=r where gpslat=lat and gpslon=lon;
	    update resonatorowner set resonator1=player where gpslat=lat and gpslon=lon;
	    update stats set AP=AP+125, builder=builder+1 where nickname=player;
	    set giveout=true; return giveout;
	  else set giveout=false; return giveout;
	  end if;
	end if;
	if (slot=2) then
	set @var:= (select resonator2 from resonatorlevel where gpslat=lat and gpslon=lon);
	  if (r>@var) then
	    update resonatorlevel set resonator2=r where gpslat=lat and gpslon=lon;
	    update resonatorowner set resonator2=player where gpslat=lat and gpslon=lon;
	    update stats set AP=AP+125, builder=builder+1 where nickname=player;
	    set giveout=true; return giveout;
	  else set giveout=false; return giveout;
	  end if;
	end if;
	if (slot=3) then
	set @var:= (select resonator3 from resonatorlevel where gpslat=lat and gpslon=lon);
	  if (r>@var) then
	    update resonatorlevel set resonator3=r where gpslat=lat and gpslon=lon;
	    update resonatorowner set resonator3=player where gpslat=lat and gpslon=lon;
	    update stats set AP=AP+125, builder=builder+1 where nickname=player;
	    set giveout=true; return giveout;
	  else set giveout=false; return giveout;
	  end if;
	end if;
	if (slot=4) then
	set @var:= (select resonator4 from resonatorlevel where gpslat=lat and gpslon=lon);
	  if (r>@var) then
	    update resonatorlevel set resonator4=r where gpslat=lat and gpslon=lon;
	    update resonatorowner set resonator4=player where gpslat=lat and gpslon=lon;
	    update stats set AP=AP+125, builder=builder+1 where nickname=player;
	    set giveout=true; return giveout;
	  else set giveout=false; return giveout;
	  end if;
	end if;
	if (slot=5) then
	set @var:= (select resonator5 from resonatorlevel where gpslat=lat and gpslon=lon);
	  if (r>@var) then
	    update resonatorlevel set resonator5=r where gpslat=lat and gpslon=lon;
	    update resonatorowner set resonator5=player where gpslat=lat and gpslon=lon;
	    update stats set AP=AP+125, builder=builder+1 where nickname=player;
	    set giveout=true; return giveout;
	  else set giveout=false; return giveout;
	  end if;
	end if;
	if (slot=6) then
	set @var:= (select resonator6 from resonatorlevel where gpslat=lat and gpslon=lon);
	  if (r>@var) then
	    update resonatorlevel set resonator6=r where gpslat=lat and gpslon=lon;
	    update resonatorowner set resonator6=player where gpslat=lat and gpslon=lon;
	    update stats set AP=AP+125, builder=builder+1 where nickname=player;
	    set giveout=true; return giveout;
	  else set giveout=false; return giveout;
	  end if;
	end if;
	if (slot=7) then
	set @var:= (select resonator7 from resonatorlevel where gpslat=lat and gpslon=lon);
	  if (r>@var) then
	    update resonatorlevel set resonator7=r where gpslat=lat and gpslon=lon;
	    update resonatorowner set resonator7=player where gpslat=lat and gpslon=lon;
	    update stats set AP=AP+125, builder=builder+1 where nickname=player;
	    set giveout=true; return giveout;
	  else set giveout=false; return giveout;
	  end if;
	end if;
	if (slot=8) then
	set @var:= (select resonator8 from resonatorlevel where gpslat=lat and gpslon=lon);
	  if (r>@var) then
	    update resonatorlevel set resonator8=r where gpslat=lat and gpslon=lon;
	    update resonatorowner set resonator8=player where gpslat=lat and gpslon=lon;
	    update stats set AP=AP+125, builder=builder+1 where nickname=player;
	    set giveout=true; return giveout;
	  else set giveout=false; return giveout;
	  end if;
	end if;
     else set giveout=false; return giveout;
     end if;
end if;
end |
delimiter ;

								/*insertmod*/
drop function if exists insertmod;
delimiter |
create function insertmod
(
  player CHAR( 20 ),
  faction char(1),
  lat double(10,6),
  lon double(10,6),
  modc char(20),
  slot tinyint(1),
  giveout bool
) returns bool
begin
set @f:=(select faction from portal where gpslat=lat and gpslon=lon);
if (@f=faction) then
  if (slot=1) then
  set @var=(select slot1 from modstatus where gpslat=lat and gpslon=lon);
    if (@var='0') then
    update modstatus set slot1=modc where gpslat=lat and gpslon=lon;
    update stats set AP=AP+125, engineer=engineer+1 where nickname=player;
    set giveout=true; return giveout;
  else set giveout=false; return giveout;
    end if; 
  end if;
  if (slot=2) then
  set @var=(select slot2 from modstatus where gpslat=lat and gpslon=lon);
    if (@var='0') then
      update modstatus set slot2=modc where gpslat=lat and gpslon=lon;
      update stats set AP=AP+125, engineer=engineer+1 where nickname=player;
      set giveout=true; return giveout;
    else set giveout=false; return giveout;
    end if; 
  end if;
  if (slot=3) then
    set @var=(select slot3 from modstatus where gpslat=lat and gpslon=lon);
    if (@var='0') then
      update modstatus set slot3=modc where gpslat=lat and gpslon=lon;
      update stats set AP=AP+125, engineer=engineer+1 where nickname=player;
      set giveout=true; return giveout;
    else set giveout=false; return giveout;
    end if; 
  end if;
  if (slot=4) then
    set @var=(select slot4 from modstatus where gpslat=lat and gpslon=lon);
    if (@var='0') then
      update modstatus set slot4=modc where gpslat=lat and gpslon=lon;
      update stats set AP=AP+125, engineer=engineer+1 where nickname=player;
      set giveout=true; return giveout;
    else set giveout=false; return giveout;
    end if; 
  end if;
else set giveout=false; return false;
end if;
end |
delimiter ;

								/*checkhack*/
drop function if exists checkhack;
delimiter |
CREATE FUNCTION checkhack (
  player CHAR(20),     
  lat DOUBLE(10,6),
  lon DOUBLE(10,6),
  exitok INTEGER(2)
) RETURNS INTEGER
BEGIN
  SET @checkburnout := (SELECT firsthack FROM hack WHERE nickname=player AND gpslat=lat AND gpslon=lon);
  IF ISNULL(@checkburnout) THEN
        INSERT INTO hack(nickname,gpslat,gpslon,firsthack,previoushack,hacknumber) VALUES (player,lat,lon,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,1);
        SET exitok = 1;
        RETURN exitok;
  END IF;
  SET @hackcount := (SELECT hacknumber FROM hack WHERE nickname=player AND gpslat=lat AND gpslon=lon);
  IF(@hackcount=4) THEN
         IF(SELECT timestampdiff(HOUR,@checkburnout,CURRENT_TIMESTAMP)<4) THEN
                 SET exitok=2; 
                 RETURN exitok;
        ELSE
                UPDATE hack SET hacknumber=1,firsthack=current_timestamp WHERE nickname=player and gpslat=lat and gpslon=lon;
                SET exitok=3;
                RETURN exitok;
        END IF;
 ELSE
   SET @prevhack := (select previoushack from hack where nickname=player AND gpslat=lat AND gpslon=lon);
  IF(SELECT timestampdiff(MINUTE,@prevhack,CURRENT_TIMESTAMP)<5) THEN
        SET exitok=4;
        RETURN exitok;
  ELSE
	update hack set hacknumber=hacknumber+1,previoushack=current_timestamp where nickname=player and gpslat=lat and gpslon=lon;
        SET exitok=3;
        RETURN exitok;
  END IF;
END IF;
END |
delimiter ;

