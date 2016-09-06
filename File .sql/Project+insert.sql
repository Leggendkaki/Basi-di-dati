drop table if exists hack;
drop table if exists cell;
drop table if exists field;
drop table if exists link;
drop table if exists modstatus;
drop table if exists resonatorowner;
drop table if exists resonatorlevel;
drop table if exists medal;
drop table if exists stats;
drop table if exists inventory;
drop table if exists weapon;
drop table if exists resonator;
drop table if exists portalmod;
drop table if exists powercube;
drop table if exists portalkey;
drop table if exists player;
drop table if exists portal;



drop table if exists player;
CREATE TABLE player(
nickname CHAR( 20 ) NOT NULL ,
email CHAR( 30 ) NOT NULL ,
faction char(1) NOT NULL default 'r',
level tinyint(2) not null default 1,
gpslat double( 10, 6 ) default '0.0',
gpslon double( 10, 6 ) default '0.0',
PRIMARY KEY ( nickname, email )
)ENGINE=InnoDB;


drop table if exists inventory;
CREATE TABLE inventory(
nickname CHAR( 20 ) NOT NULL ,
itemnumber INTEGER ( 4 )default 0,
PRIMARY KEY ( nickname),
FOREIGN KEY ( nickname ) REFERENCES player( nickname )
on delete cascade
)ENGINE=InnoDB;


drop table if exists weapon;
CREATE TABLE weapon(
nickname CHAR( 20 ) NOT NULL ,
xmpl1 INTEGER ( 4 ) NOT NULL default 0,
xmpl2 INTEGER ( 4 ) NOT NULL default 0,
xmpl3 INTEGER ( 4 ) NOT NULL default 0,
xmpl4 INTEGER ( 4 ) NOT NULL default 0,
xmpl5 INTEGER ( 4 ) NOT NULL default 0,
xmpl6 INTEGER ( 4 ) NOT NULL default 0,
xmpl7 INTEGER ( 4 ) NOT NULL default 0,
xmpl8 INTEGER ( 4 ) NOT NULL default 0,
usl1 INTEGER ( 4 ) NOT NULL default 0,
usl2 INTEGER ( 4 ) NOT NULL default 0,
usl3 INTEGER ( 4 ) NOT NULL default 0,
usl4 INTEGER ( 4 ) NOT NULL default 0,
usl5 INTEGER ( 4 ) NOT NULL default 0,
usl6 INTEGER ( 4 ) NOT NULL default 0,
usl7 INTEGER ( 4 ) NOT NULL default 0,
usl8 INTEGER ( 4 ) NOT NULL default 0,
adarefractor INTEGER ( 4 ) NOT NULL default 0,
jarvisvirus INTEGER ( 4 ) NOT NULL default 0,
PRIMARY KEY ( nickname),
FOREIGN KEY ( nickname ) REFERENCES player( nickname ) 
on delete cascade
)ENGINE=InnoDB;


drop table if exists resonator;
CREATE TABLE resonator(
nickname CHAR( 20 ) NOT NULL ,
rl1 INTEGER ( 4 ) NOT NULL default 0,
rl2 INTEGER ( 4 ) NOT NULL default 0,
rl3 INTEGER ( 4 ) NOT NULL default 0,
rl4 INTEGER ( 4 ) NOT NULL default 0,
rl5 INTEGER ( 4 ) NOT NULL default 0,
rl6 INTEGER ( 4 ) NOT NULL default 0,
rl7 INTEGER ( 4 ) NOT NULL default 0,
rl8 INTEGER ( 4 ) NOT NULL default 0,
PRIMARY KEY ( nickname),
FOREIGN KEY ( nickname ) REFERENCES player( nickname ) 
on delete cascade
)ENGINE=InnoDB;


drop table if exists portalmod;
CREATE TABLE portalmod(
nickname CHAR( 20 ) NOT NULL ,
shieldcommon INTEGER ( 4 ) NOT NULL default 0,
shieldrare INTEGER ( 4 ) NOT NULL default 0,
shieldveryrare INTEGER ( 4 ) NOT NULL default 0,
axashield INTEGER ( 4 ) NOT NULL default 0,
multihackcommon INTEGER ( 4 ) NOT NULL default 0,
multihackrare INTEGER ( 4 ) NOT NULL default 0,
multihackveryrare INTEGER ( 4 ) NOT NULL default 0,
heatsinkcommon INTEGER ( 4 ) NOT NULL default 0,
heatsinkrare INTEGER ( 4 ) NOT NULL default 0,
heatsinkveryrare INTEGER ( 4 ) NOT NULL default 0,
turret INTEGER ( 4 ) NOT NULL default 0,
linkamp INTEGER ( 4 ) NOT NULL default 0,
forceamp INTEGER ( 4 ) NOT NULL default 0,
PRIMARY KEY ( nickname),
FOREIGN KEY ( nickname ) REFERENCES player( nickname ) 
on delete cascade
)ENGINE=InnoDB;


drop table if exists powercube;
CREATE TABLE powercube(
nickname CHAR( 20 ) NOT NULL ,
pcl1 INTEGER ( 4 ) NOT NULL default 0,
pcl2 INTEGER ( 4 ) NOT NULL default 0,
pcl3 INTEGER ( 4 ) NOT NULL default 0,
pcl4 INTEGER ( 4 ) NOT NULL default 0,
pcl5 INTEGER ( 4 ) NOT NULL default 0,
pcl6 INTEGER ( 4 ) NOT NULL default 0,
pcl7 INTEGER ( 4 ) NOT NULL default 0,
pcl8 INTEGER ( 4 ) NOT NULL default 0,
PRIMARY KEY ( nickname),
FOREIGN KEY ( nickname ) REFERENCES player( nickname ) 
on delete cascade
)ENGINE=InnoDB;


drop table if exists portalkey;
CREATE TABLE portalkey(
nickname CHAR( 20 ) NOT NULL ,
gpslat double( 10, 6 ) default null,
gpslon double( 10, 6 ) default null,
Amount INTEGER ( 4 ) NOT NULL default 0,
primary key (nickname, gpslat, gpslon),
FOREIGN KEY ( nickname ) REFERENCES player( nickname ) 
on delete cascade
)ENGINE=InnoDB;


drop table if exists stats;
create table stats(
nickname CHAR( 20 ) NOT NULL ,
ap integer(20) not null default 0,
explorer integer(10) not null default 0,
trekker integer(10) not null default 0,
builder integer(10) not null default 0,
connector integer(10) not null default 0,
mindcontroller integer(10) not null default 0,
illuminator integer(10) not null default 0,
recharger integer(10) not null default 0,
liberator integer(10) not null default 0,
pioner integer(10) not null default 0,
engineer integer(10) not null default 0,
purifier integer(10) not null default 0,
guardian integer(10) not null default 0,
specops integer(10) not null default 0,
hacker integer(10) not null default 0,
translator integer(10) not null default 0,
sojourner integer(10) not null default 0,
recruiter integer(10) not null default 0,
primary key (nickname),
foreign key (nickname) references player(nickname)
on delete cascade
)ENGINE=InnoDB;


drop table if exists medal;
create table medal(
nickname CHAR( 20 ) NOT NULL ,
explorer integer(10) not null default 0,
trekker integer(10) not null default 0,
builder integer(10) not null default 0,
connector integer(10) not null default 0,
mindcontroller integer(10) not null default 0,
illuminator integer(10) not null default 0,
recharger integer(10) not null default 0,
liberator integer(10) not null default 0,
pioner integer(10) not null default 0,
engineer integer(10) not null default 0,
purifier integer(10) not null default 0,
guardian integer(10) not null default 0,
specops integer(10) not null default 0,
hacker integer(10) not null default 0,
translator integer(10) not null default 0,
sojourner integer(10) not null default 0,
recruiter integer(10) not null default 0,
primary key (nickname),
foreign key (nickname) references player(nickname)
on delete cascade
)ENGINE=InnoDB;


drop table if exists portal;
CREATE TABLE portal(
gpslat double( 10, 6 ) NOT NULL ,
gpslon double( 10, 6 ) NOT NULL ,
name CHAR( 50 ) NOT NULL ,
owner CHAR( 20 ) default null,
cell CHAR( 16 ) NOT NULL ,
capturedate TIMESTAMP default CURRENT_TIMESTAMP,
linknumber INTEGER( 1 ) NOT NULL default 0,
faction char(1) NOT NULL default 'n',
level integer not null default 1, 
energy INTEGER( 20 ) NOT NULL default 0,
modenergy INTEGER( 20 ) NOT NULL default 0,
primary key (gpslat, gpslon)
)ENGINE=InnoDB;


drop table if exists resonatorlevel;
CREATE TABLE resonatorlevel(
gpslat double( 10, 6 ) NOT NULL ,
gpslon double( 10, 6 ) NOT NULL ,
resonator1 TINYINT( 1 ) default 0,
resonator2 TINYINT( 1 ) default 0,
resonator3 TINYINT( 1 ) default 0,
resonator4 TINYINT( 1 ) default 0,
resonator5 TINYINT( 1 ) default 0,
resonator6 TINYINT( 1 ) default 0,
resonator7 TINYINT( 1 ) default 0,
resonator8 TINYINT( 1 ) default 0,
PRIMARY KEY ( gpslat, gpslon ) ,
FOREIGN KEY ( gpslat, gpslon ) REFERENCES portal( gpslat, gpslon )
on delete cascade	
)ENGINE=InnoDB;


drop table if exists resonatorowner;
CREATE TABLE resonatorowner(
gpslat double( 10, 6 ) NOT NULL ,
gpslon double( 10, 6 ) NOT NULL ,
resonator1 CHAR( 20 ) ,
resonator2 CHAR( 20 ) ,
resonator3 CHAR( 20 ) ,
resonator4 CHAR( 20 ) ,
resonator5 CHAR( 20 ) ,
resonator6 CHAR( 20 ) ,
resonator7 CHAR( 20 ) ,
resonator8 CHAR( 20 ) ,
PRIMARY KEY ( gpslat, gpslon ) ,
FOREIGN KEY ( gpslat, gpslon ) REFERENCES portal( gpslat, gpslon )
on delete cascade	
)ENGINE=InnoDB;


drop table if exists modstatus;
CREATE TABLE modstatus(
gpslat double( 10, 6 ) NOT NULL ,
gpslon double( 10, 6 ) NOT NULL ,
slot1 CHAR( 20 ) default '0',
slot2 CHAR( 20 ) default '0',
slot3 CHAR( 20 ) default '0',
slot4 CHAR( 20 ) default '0',
PRIMARY KEY ( gpslat, gpslon ) ,
FOREIGN KEY ( gpslat, gpslon ) REFERENCES portal( gpslat, gpslon )
on delete cascade	
)ENGINE=InnoDB;


drop table if exists link;
CREATE TABLE link(
gpslat1 double( 10, 6 ) NOT NULL ,
gpslon1 double( 10, 6 ) NOT NULL ,
gpslat2 double( 10, 6 ) NOT NULL ,
gpslon2 double( 10, 6 ) NOT NULL ,
owner CHAR( 20 ) NOT NULL ,
cell CHAR( 16 ) NOT NULL ,
capturedate TIMESTAMP NOT NULL ,
faction char(1) NOT NULL,
primary key (gpslat1, gpslon1, gpslat2, gpslon2)
)ENGINE=InnoDB;


drop table if exists field;
CREATE TABLE field(
gpslat1 double( 10, 6 ) NOT NULL ,
gpslon1 double( 10, 6 ) NOT NULL ,
gpslat2 double( 10, 6 ) NOT NULL ,
gpslon2 double( 10, 6 ) NOT NULL ,
gpslat3 double( 10, 6 ) NOT NULL ,
gpslon3 double( 10, 6 ) NOT NULL ,
cell CHAR( 16 ) NOT NULL ,
capturedate TIMESTAMP NOT NULL ,
faction char(1) NOT NULL,
primary key (gpslat1, gpslon1, gpslat2, gpslon2, gpslat3, gpslon3)
)ENGINE=InnoDB;


drop table if exists cell;
CREATE TABLE cell(
cellcode CHAR( 16 ) NOT NULL ,
totalmuresistance INTEGER( 12 ) NOT NULL DEFAULT 0,
totalmuenlightened INTEGER( 12 ) NOT NULL DEFAULT 0
)ENGINE=InnoDB;


drop table if exists hack;
create table hack (
nickname CHAR(20) not null,	
gpslat double(10,6) default 0,
gpslon double(10,6) default 0,
firsthack TIMESTAMP,
previoushack TIMESTAMP,
hacknumber int(2),
primary key (nickname, gpslat, gpslon)
);

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

								/*newplayer*/
drop procedure if exists newplayer;
delimiter |
create procedure newplayer
(
  textplayer CHAR( 20 ),
  textemail CHAR( 30 ),
  textfaction char(1)
)
begin
insert into player (nickname, email, faction)
values (textplayer, textemail, textfaction);
end |
delimiter ;

								/*neutralizeportal*/
drop procedure if exists neutralizeportal;
delimiter |
create procedure neutralizeportal
(
  player CHAR( 20 ),
  lat double(10,6),
  lon double(10,6)
)
begin
  update portal set owner=null, faction='n', linknumber='0' where gpslat=lat and gpslon=lon;
  update resonatorlevel set resonator1=0, resonator2=0, resonator3=0, resonator4=0, resonator5=0, resonator6=0, resonator7=0, resonator8=0 where gpslat=lat and gpslon=lon;
  update resonatorowner set resonator1=null, resonator2=null, resonator3=null, resonator4=null, resonator5=null, resonator6=null, resonator7=null, resonator8=null where gpslat=lat and gpslon=lon;
  update modstatus set slot1='0', slot2='0', slot3='0', slot4='0' where gpslat=lat and gpslon=lon;
  delete from link where gpslat1=lat and gpslon1=lon or gpslat2=lat and gpslon2=lon;
  delete from field where gpslat1=lat and gpslon1=lon or gpslat2=lat and gpslon2=lon or gpslat3=lat and gpslon3=lon;
  update stats set AP=AP+600, purifier=purifier+8 where nickname=player;
end |
delimiter ;

								/*inventorycalc*/
drop procedure if exists inventorycalc;
delimiter |
create procedure inventorycalc
(
player CHAR( 20 )
)
begin
set @w := (select SUM(xmpl1+xmpl2+xmpl3+xmpl4+xmpl5+xmpl6+xmpl7+xmpl8+usl1+usl2+usl3+usl4+usl5+usl6+usl7+usl8+adarefractor+jarvisvirus) from weapon where nickname=player);
set @r := (select SUM(rl1+rl2+rl3+rl4+rl5+rl6+rl7+rl8) from resonator where nickname=player);
set @pc:= (select SUM(pcl1+pcl2+pcl3+pcl4+pcl5+pcl6+pcl7+pcl8) from powercube where nickname=player);
set @pm:= (select SUM(shieldcommon+shieldrare+shieldveryrare+axashield+multihackcommon+multihackrare+multihackveryrare+heatsinkcommon+heatsinkrare+heatsinkveryrare+turret+linkamp+forceamp) from portalmod where nickname=player);
set @pk:=0;
set @pk:= (select SUM(amount) from portalkey where nickname=player);
update inventory set itemnumber=(@w+@r+@pc+@pm) where nickname=player;
end |
delimiter ;

								/*hackportal*/
drop procedure if exists hackportal;
delimiter |
create procedure hackportal(
  IN player CHAR(20),
  IN lat double(10,6),
  IN lon double(10,6),
  OUT plevel integer(1),
  OUT rquantity integer(1),
  OUT xmpquantity integer(1),
  OUT cubequantity integer(1),
  OUT pkey integer(1)
  )
begin
  set plevel=(select level from portal where gpslat=lat and gpslon=lon);
  set rquantity = (select floor(rand()*(4-0)+0));
        if(plevel=1 and rquantity>0) then  update resonator set rl1=rl1+rquantity where nickname=player; end if;
	if(plevel=2 and rquantity>0) then  update resonator set rl2=rl2+rquantity where nickname=player; end if;
	if(plevel=3 and rquantity>0) then  update resonator set rl3=rl3+rquantity where nickname=player; end if;
	if(plevel=4 and rquantity>0) then  update resonator set rl4=rl4+rquantity where nickname=player; end if;
	if(plevel=5 and rquantity>0) then  update resonator set rl5=rl5+rquantity where nickname=player; end if;
	if(plevel=6 and rquantity>0) then  update resonator set rl6=rl6+rquantity where nickname=player; end if;
	if(plevel=7 and rquantity>0) then  update resonator set rl7=rl7+rquantity where nickname=player; end if;
	if(plevel=8 and rquantity>0) then  update resonator set rl8=rl8+rquantity where nickname=player; end if;
  set xmpquantity = (select floor(rand()*(3-0)+0));
	if(plevel=1 and xmpquantity>0) then  update weapon set xmpl1=xmpl1+xmpquantity where nickname=player; end if;
	if(plevel=2 and xmpquantity>0) then  update weapon set xmpl2=xmpl2+xmpquantity where nickname=player; end if;
	if(plevel=3 and xmpquantity>0) then  update weapon set xmpl3=xmpl3+xmpquantity where nickname=player; end if;
	if(plevel=4 and xmpquantity>0) then  update weapon set xmpl4=xmpl4+xmpquantity where nickname=player; end if;
	if(plevel=5 and xmpquantity>0) then  update weapon set xmpl5=xmpl5+xmpquantity where nickname=player; end if;
	if(plevel=6 and xmpquantity>0) then  update weapon set xmpl6=xmpl6+xmpquantity where nickname=player; end if;
	if(plevel=7 and xmpquantity>0) then  update weapon set xmpl7=xmpl7+xmpquantity where nickname=player; end if;
	if(plevel=8 and xmpquantity>0) then  update weapon set xmpl8=xmpl8+xmpquantity where nickname=player; end if;
  set cubequantity = (select floor(rand()*(2-0)+0));
	if(plevel=1 and cubequantity>0) then  update powercube set pcl1=pcl1+xmpquantity where nickname=player; end if;
	if(plevel=2 and cubequantity>0) then  update powercube set pcl2=pcl2+xmpquantity where nickname=player; end if;
	if(plevel=3 and cubequantity>0) then  update powercube set pcl3=pcl3+xmpquantity where nickname=player; end if;
	if(plevel=4 and cubequantity>0) then  update powercube set pcl4=pcl4+xmpquantity where nickname=player; end if;
	if(plevel=5 and cubequantity>0) then  update powercube set pcl5=pcl5+xmpquantity where nickname=player; end if;
	if(plevel=6 and cubequantity>0) then  update powercube set pcl6=pcl6+xmpquantity where nickname=player; end if;
	if(plevel=7 and cubequantity>0) then  update powercube set pcl7=pcl7+xmpquantity where nickname=player; end if;
	if(plevel=8 and cubequantity>0) then  update powercube set pcl8=pcl8+xmpquantity where nickname=player; end if;
  set pkey = (select floor(rand()*(2-0)+0));
	IF ISNULL((select amount from portalkey where gpslat=lat and gpslon=lon) and pkey=1) then 
		insert into portalkey(nickname,gpslat,gpslon,amount) values (player,lat,lon,1);
	else
    	if(pkey>0) then
		update amout set amount=amount+pkey where nickname=player and gpslat=lat and gpslon=lon;
        end if;
	end if;
end |
delimiter ;

								/*newplayer*/
drop trigger if exists newplayer;
delimiter |
create trigger newplayer 
after insert on player
for each row
begin
insert into inventory(nickname)
values(new.nickname);
insert into weapon (nickname)
values(new.nickname);
insert into resonator(nickname)
values(new.nickname);
insert into portalmod(nickname)
values(new.nickname);
insert into powercube(nickname)
values(new.nickname);
insert into stats(nickname)
values(new.nickname);
insert into medal(nickname)
values(new.nickname);
end |
delimiter ;

								/*newportal*/
drop trigger if exists newportal;
delimiter |
create trigger newportal 
after insert on portal
for each row
begin
insert into resonatorlevel(gpslat, gpslon) 
values(new.gpslat, new.gpslon);
insert into resonatorowner(gpslat, gpslon) 
values(new.gpslat, new.gpslon);
insert into modstatus(gpslat, gpslon) 
values(new.gpslat, new.gpslon);
end |
delimiter ;

								/*checkmedal*/
drop trigger if exists checkmedal;
delimiter |
create trigger checkmedal
after update on stats
for each row
begin
if (new.explorer>old.explorer) then
set @var:= (select explorer from stats where nickname=new.nickname);
if (@var>=30000) then update medal set explorer=5 where nickname=new.nickname; 
else if (@var>=10000 and @var<30000) then update medal set explorer=4 where nickname=new.nickname; 
else if (@var>=2000 and @var<10000) then update medal set explorer=3 where nickname=new.nickname; 
else if (@var>=1000 and @var<2000) then update medal set explorer=2 where nickname=new.nickname; 
else if (@var>=100 and @var<1000) then update medal set explorer=1 where nickname=new.nickname; 
else if (@var>=0 and @var<100) then update medal set explorer=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.trekker>old.trekker) then
set @var:= (select trekker from stats where nickname=new.nickname);
if (@var>=2500) then update medal set trekker=5 where nickname=new.nickname; 
else if (@var>=1000 and @var<2500) then update medal set trekker=4 where nickname=new.nickname; 
else if (@var>=300 and @var<1000) then update medal set trekker=3 where nickname=new.nickname; 
else if (@var>=100 and @var<300) then update medal set trekker=2 where nickname=new.nickname; 
else if (@var>=10 and @var<100) then update medal set trekker=1 where nickname=new.nickname; 
else if (@var>=0 and @var<10) then update medal set trekker=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.builder>old.builder) then
set @var:= (select builder from stats where nickname=new.nickname);
if (@var>=200000) then update medal set builder=5 where nickname=new.nickname; 
else if (@var>=100000 and @var<200000) then update medal set builder=4 where nickname=new.nickname; 
else if (@var>=30000 and @var<200000) then update medal set builder=3 where nickname=new.nickname; 
else if (@var>=10000 and @var<30000) then update medal set builder=2 where nickname=new.nickname; 
else if (@var>=2000 and @var<10000) then update medal set builder=1 where nickname=new.nickname; 
else if (@var>=0 and @var<2000) then update medal set builder=0 where nickname=new.nickname; 
end if; end if; end if; end if; end if; end if; end if;
if (new.connector>old.connector) then
set @var:= (select connector from stats where nickname=new.nickname);
if (@var>=100000) then update medal set connector=5 where nickname=new.nickname;  
else if (@var>=25000 and @var<100000) then update medal set connector=4 where nickname=new.nickname; 
else if (@var>=5000 and @var<25000) then update medal set connector=3 where nickname=new.nickname; 
else if (@var>=1000 and @var<5000) then update medal set connector=2 where nickname=new.nickname;
else if (@var>=50 and @var<1000) then update medal set connector=1 where nickname=new.nickname;
else if (@var>=0 and @var<50) then update medal set connector=0 where nickname=new.nickname;
end if; end if; end if; end if; end if; end if; end if;
if (new.mindcontroller>old.mindcontroller) then
set @var:= (select mindcontroller from stats where nickname=new.nickname);
if (@var>=40000) then update medal set mindcontroller=5 where nickname=new.nickname; 
else if (@var>=10000 and @var<40000) then update medal set mindcontroller=4 where nickname=new.nickname; 
else if (@var>=2000 and @var<10000) then update medal set mindcontroller=3 where nickname=new.nickname; 
else if (@var>=500 and @var<2000) then update medal set mindcontroller=2 where nickname=new.nickname; 
else if (@var>=10 and @var<500) then update medal set mindcontroller=1 where nickname=new.nickname; 
else if (@var>=0 and @var<10) then update medal set mindcontroller=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.illuminator>old.illuminator) then
set @var:= (select illuminator from stats where nickname=new.nickname);
if (@var>=4000000) then update medal set illuminator=5 where nickname=new.nickname; 
else if (@var>=1000000 and @var<4000000) then update medal set illuminator=4 where nickname=new.nickname; 
else if (@var>=250000 and @var<1000000) then update medal set illuminator=3 where nickname=new.nickname; 
else if (@var>=50000 and @var<250000) then update medal set illuminator=2 where nickname=new.nickname; 
else if (@var>=5000 and @var<50000) then update medal set illuminator=1 where nickname=new.nickname; 
else if (@var>=0 and @var<5000) then update medal set illuminator=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.recharger>old.recharger) then
set @var:= (select recharger from stats where nickname=new.nickname);
if (@var>=25000000) then update medal set recharger=5 where nickname=new.nickname; 
else if (@var>=10000000 and @var<25000000) then update medal set recharger=4 where nickname=new.nickname; 
else if (@var>=3000000 and @var<10000000) then update medal set recharger=3 where nickname=new.nickname; 
else if (@var>=1000000 and @var<3000000) then update medal set recharger=2 where nickname=new.nickname; 
else if (@var>=10000 and @var<1000000) then update medal set recharger=1 where nickname=new.nickname; 
else if (@var>=0 and @var<100000) then update medal set recharger=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.liberator>old.liberator) then
set @var:= (select liberator from stats where nickname=new.nickname);
if (@var>=40000) then update medal set liberator=5 where nickname=new.nickname; 
else if (@var>=15000 and @var<40000) then update medal set liberator=4 where nickname=new.nickname; 
else if (@var>=5000 and @var<15000) then update medal set liberator=3 where nickname=new.nickname; 
else if (@var>=1000 and @var<5000) then update medal set liberator=2 where nickname=new.nickname; 
else if (@var>=100 and @var<1000) then update medal set liberator=1 where nickname=new.nickname; 
else if (@var>=0 and @var<100) then update medal set liberator=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.pioner>old.pioner) then
set @var:= (select pioner from stats where nickname=new.nickname);
if (@var>=20000) then update medal set pioner=5 where nickname=new.nickname; 
else if (@var>=5000 and @var<20000) then update medal set pioner=4 where nickname=new.nickname; 
else if (@var>=1000 and @var<5000) then update medal set pioner=3 where nickname=new.nickname; 
else if (@var>=200 and @var<100) then update medal set pioner=2 where nickname=new.nickname; 
else if (@var>=20 and @var<200) then update medal set pioner=1 where nickname=new.nickname; 
else if (@var>=0 and @var<20) then update medal set pioner=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.engineer>old.engineer) then
set @var:= (select engineer from stats where nickname=new.nickname);
if (@var>=50000) then update medal set engineer=5 where nickname=new.nickname; 
else if (@var>=20000 and @var<50000) then update medal set engineer=4 where nickname=new.nickname; 
else if (@var>=5000 and @var<20000) then update medal set engineer=3 where nickname=new.nickname; 
else if (@var>=1500 and @var<5000) then update medal set engineer=2 where nickname=new.nickname; 
else if (@var>=150 and @var<1500) then update medal set engineer=1 where nickname=new.nickname; 
else if (@var>=0 and @var<150) then update medal set engineer=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.purifier>old.purifier) then
set @var:= (select purifier from stats where nickname=new.nickname);
if (@var>=300000) then update medal set purifier=5 where nickname=new.nickname; 
else if (@var>=100000 and @var<300000) then update medal set purifier=4 where nickname=new.nickname; 
else if (@var>=30000 and @var<100000) then update medal set purifier=3 where nickname=new.nickname; 
else if (@var>=10000 and @var<30000) then update medal set purifier=2 where nickname=new.nickname; 
else if (@var>=2000 and @var<10000) then update medal set purifier=1 where nickname=new.nickname; 
else if (@var>=0 and @var<2000) then update medal set purifier=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.guardian>old.guardian) then
set @var:= (select guardian from stats where nickname=new.nickname);
if (@var>=150) then update medal set guardian=5 where nickname=new.nickname; 
else if (@var>=90 and @var<150) then update medal set guardian=4 where nickname=new.nickname; 
else if (@var>=20 and @var<90) then update medal set guardian=3 where nickname=new.nickname; 
else if (@var>=10 and @var<20) then update medal set guardian=2 where nickname=new.nickname; 
else if (@var>=3 and @var<10) then update medal set guardian=1 where nickname=new.nickname; 
else if (@var>=0 and @var<3) then update medal set guardian=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.specops>old.specops) then
set @var:= (select specops from stats where nickname=new.nickname);
if (@var>=500) then update medal set specops=5 where nickname=new.nickname; 
else if (@var>=200 and @var<500) then update medal set specops=4 where nickname=new.nickname; 
else if (@var>=100 and @var<200) then update medal set specops=3 where nickname=new.nickname; 
else if (@var>=25 and @var<100) then update medal set specops=2 where nickname=new.nickname; 
else if (@var>=5 and @var<25) then update medal set specops=1 where nickname=new.nickname; 
else if (@var>=0 and @var<5) then update medal set specops=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.hacker>old.hacker) then
set @var:= (select hacker from stats where nickname=new.nickname);
if (@var>=200000) then update medal set hacker=5 where nickname=new.nickname; 
else if (@var>=100000 and @var<300000) then update medal set hacker=4 where nickname=new.nickname; 
else if (@var>=30000 and @var<100000) then update medal set hacker=3 where nickname=new.nickname; 
else if (@var>=10000 and @var<30000) then update medal set hacker=2 where nickname=new.nickname; 
else if (@var>=2000 and @var<10000) then update medal set hacker=1 where nickname=new.nickname; 
else if (@var>=0 and @var<2000) then update medal set hacker=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.translator>old.translator) then
set @var:= (select translator from stats where nickname=new.nickname);
if (@var>=50000) then update medal set translator=5 where nickname=new.nickname; 
else if (@var>=20000 and @var<50000) then update medal set translator=4 where nickname=new.nickname; 
else if (@var>=6000 and @var<20000) then update medal set translator=3 where nickname=new.nickname; 
else if (@var>=2000 and @var<6000) then update medal set translator=2 where nickname=new.nickname; 
else if (@var>=200 and @var<2000) then update medal set translator=1 where nickname=new.nickname; 
else if (@var>=0 and @var<200) then update medal set translator=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.sojourner>old.sojourner) then
set @var:= (select sojourner from stats where nickname=new.nickname);
if (@var>=360) then update medal set sojourner=5 where nickname=new.nickname; 
else if (@var>=180 and @var<360) then update medal set sojourner=4 where nickname=new.nickname; 
else if (@var>=60 and @var<180) then update medal set sojourner=3 where nickname=new.nickname; 
else if (@var>=30 and @var<60) then update medal set sojourner=2 where nickname=new.nickname; 
else if (@var>=15 and @var<30) then update medal set sojourner=1 where nickname=new.nickname; 
else if (@var>=0 and @var<15) then update medal set sojourner=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
if (new.recruiter>old.recruiter) then
set @var:= (select recruiter from stats where nickname=new.nickname);
if (@var>=100) then update medal set recruiter=5 where nickname=new.nickname; 
else if (@var>=50 and @var<100) then update medal set recruiter=4 where nickname=new.nickname; 
else if (@var>=25 and @var<50) then update medal set recruiter=3 where nickname=new.nickname; 
else if (@var>=10 and @var<25) then update medal set recruiter=2 where nickname=new.nickname; 
else if (@var>=2 and @var<10) then update medal set recruiter=1 where nickname=new.nickname; 
else if (@var>=0 and @var<2) then update medal set recruiter=0 where nickname=new.nickname; 
end if;end if; end if; end if; end if; end if; end if;
end |
delimiter ;

								/*checkinventoryweapon*/
drop trigger if exists checkinventoryweapon;
delimiter |
create trigger checkinventoryweapon
after update on weapon
for each row
begin
call inventorycalc(new.nickname);
end |
delimiter ;

								/*checkinventoryresonator*/
drop trigger if exists checkinventoryresonator;
delimiter |
create trigger checkinventoryresonator
after update on resonator
for each row
begin
call inventorycalc(new.nickname);
end |
delimiter ;

								/*checkinventorypc*/
drop trigger if exists checkinventorypc;
delimiter |
create trigger checkinventorypc
after update on powercube
for each row
begin
call inventorycalc(new.nickname);
end |
delimiter ;

								/*checkinventorypk2*/
drop trigger if exists checkinventorypk2;
delimiter |
create trigger checkinventorypk2
after update on portalkey
for each row
begin
call inventorycalc(new.nickname);
end |
delimiter ;

								/*checkinventorypk*/
drop trigger if exists checkinventorypk;
delimiter |
create trigger checkinventorypk
after insert on portalkey
for each row
begin
call inventorycalc(new.nickname);
end |
delimiter ;

								/*checkinventorypm*/
drop trigger if exists checkinventorypm;
delimiter |
create trigger checkinventorypm
after update on portalmod
for each row
begin
call inventorycalc(new.nickname);
end |
delimiter ;

								/*checkportallevel*/
drop trigger if exists checkportallevel;
delimiter |
create trigger checkportallevel
after update on resonatorlevel
for each row
begin
set @level:= (select SUM(resonator1+resonator2+resonator3+resonator4+resonator5+resonator6+resonator7+resonator8)/8 from resonatorlevel where gpslat=new.gpslat and gpslon=new.gpslon);
set @energyp:= @level*6000;
set @truncated:= (select truncate (@level, 0));
if (@truncated=0) then set @truncated:=1; end if;
update portal set level=@truncated, energy=@energyp where gpslat=new.gpslat and gpslon=new.gpslon;
end |
delimiter ;

								/*checklevel*/
drop trigger if exists checklevel;
delimiter |
create trigger checklevel
after update on medal
for each row
begin
set @onyx=0; set @platinum=0; set @gold=0; set @silver=0;
set @var:=(select explorer from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select trekker from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select connector from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select builder from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select mindcontroller from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select illuminator from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select recharger from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select liberator from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select pioner from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select engineer from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select purifier from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select guardian from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select specops from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select hacker from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select translator from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select sojourner from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @var:=(select recruiter from medal where nickname=new.nickname);
if (@var=5) then set @onyx=@onyx+1; set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
  else if (@var=4) then set @platinum=@platinum+1; set @gold=@gold+1; set @silver=@silver+1;
    else if (@var=3) then set @gold=@gold+1; set @silver=@silver+1;
      else if (@var=2) then set @silver=@silver+1;
      end if;
    end if;
  end if;
end if;
set @ap:=(select ap from stats where nickname=new.nickname);
if (@ap>=40000000 and @onyx>=2 and @platinum>=4) then update player set level=16 where nickname=new.nickname;
  else if (@ap>=24000000 and @platinum>=3) then update player set level=15 where nickname=new.nickname;
  else if (@ap>=17000000 and @platinum>=1 and @gold>=7) then update player set level=14 where nickname=new.nickname;
  else if (@ap>=12000000 and @platinum>=1 and @gold>=6) then update player set level=13 where nickname=new.nickname;
  else if (@ap>=8400000 and @gold>=6 and @silver>=7) then update player set level=12 where nickname=new.nickname;
  else if (@ap>=6000000 and @gold>=4 and @silver>=6) then update player set level=11 where nickname=new.nickname;
  else if (@ap>=4000000 and @gold>=2 and @silver>=5) then update player set level=10 where nickname=new.nickname;
  else if (@ap>=2400000 and @gold>=1 and @silver>=4) then update player set level=9 where nickname=new.nickname;
  else if (@ap>=1200000) then update player set level=8 where nickname=new.nickname;
  else if (@ap>=600000) then update player set level=7 where nickname=new.nickname;
  else if (@ap>=300000) then update player set level=6 where nickname=new.nickname;
  else if (@ap>=150000) then update player set level=5 where nickname=new.nickname;
  else if (@ap>=70000) then update player set level=4 where nickname=new.nickname;
  else if (@ap>=20000) then update player set level=3 where nickname=new.nickname;
  else if (@ap>=2500) then update player set level=2 where nickname=new.nickname;
end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if; end if;
end |
delimiter ;

								/*linknumberinsert*/
drop trigger if exists linknumberinsert;
delimiter |
create trigger linknumberinsert
after insert on link
for each row
begin
set @var1=0;
set @var2=0;
set @var1:=(select count(*) from link where gpslat1=new.gpslat1 and gpslon1=new.gpslon1 or gpslat2=new.gpslat1 and gpslon2=new.gpslon1);
set @var2:=(select count(*) from link where gpslat1=new.gpslat2 and gpslon1=new.gpslon2 or gpslat2=new.gpslat2 and gpslon2=new.gpslon2);
update portal set linknumber=@var1 where gpslat=new.gpslat1 and gpslon=new.gpslon1;
update portal set linknumber=@var2 where gpslat=new.gpslat2 and gpslon=new.gpslon2;
end |
delimiter ;

insert into player values
('Leggend', 'leggend.lorenzo@gmail.com', 'e', 16, 45.220448, 12.277936);
update weapon set xmpl7=124, xmpl8=500, usl7=10, usl8=56, adarefractor=22, jarvisvirus=16 where nickname='Leggend';
update resonator set rl5=32, rl5=44, rl6=55, rl7=104, rl8=95 where nickname='Leggend';
update powercube set pcl7=21, pcl8=126 where nickname='Leggend';
update portalmod set shieldcommon=10, shieldrare=50, shieldveryrare=34, axashield=21, multihackcommon=10, multihackrare=16, multihackveryrare=11,
heatsinkcommon=12, heatsinkrare=16, heatsinkveryrare=14, turret=2, linkamp=14, forceamp=6 where nickname='Leggend';
insert into portalkey values ('Leggend', 45.411157, 11.887541, 4);
insert into portalkey values ('Leggend', 45.411509, 11.888374, 3);
update stats
set ap=44001212, explorer=4276, trekker=2678, builder=68469, connector=13043, mindcontroller=5733, illuminator=5284939, recharger=155487330, liberator=10047, pioner=2277, engineer=6163, purifier=61703,
guardian=366, specops=163, hacker=66148, translator=63948, sojourner=99, recruiter=0 where nickname='Leggend';

insert into player values
('tssp', 'trotomas@gmail.com', 'e', 11, 45.551137, 11.526607);
update weapon set xmpl7=21, xmpl8=652, usl7=10, usl8=56, adarefractor=9, jarvisvirus=9 where nickname='tssp';
update resonator set rl5=32, rl5=44, rl6=55, rl7=104, rl8=95 where nickname='tssp';
update powercube set pcl7=21, pcl8=126 where nickname='tssp';
update portalmod set shieldcommon=10, shieldrare=50, shieldveryrare=34, axashield=21, multihackcommon=10, multihackrare=16, multihackveryrare=11,
heatsinkcommon=12, heatsinkrare=16, heatsinkveryrare=14, turret=2, linkamp=14, forceamp=6 where nickname='tssp';
update stats
set ap=7258498, explorer=1352, trekker=588, builder=9600, connector=1505, mindcontroller=786, illuminator=27555, recharger=13702577, liberator=1912, pioner=1027, engineer=1282, purifier=12145,
guardian=97, specops=1, hacker=6340, translator=16150, sojourner=29, recruiter=0 where nickname='tssp';

insert into player values ('MoonbaseAlpha','alessandro.spiandore@gmail.com','e',15,45.220448, 12.277936);
insert into player values ('VyrusxXx','giovanni.viaro@gmail.com ','e',12,45.220448, 12.277936);
insert into player values ('halfdark','comanandreia@gmai.com','e',8,45.220448, 12.277936);
insert into player values ('Quintino','quintino@enl.it','e',14,45.220448, 12.277936);
insert into player values ('B4b4u ','Michele.ciacci@gmail.com ','e',16, 45.220448, 12.277936);
insert into player values ('sbrodolo','sbrodoland@gmail.com','r',11, 45.220448, 12.277936);
insert into player values ('stylee','dario.santamaria@gmail.com','e',16, 45.406527,11.891245);
insert into player values ('GiMmYPD','gimmypd@gmail.com','r',16, 45.406527,11.891245);
insert into player values ('EchoBravo00','tetide@gmail.com','e',10, 45.29099, 12.02997);
insert into player values ('RBX21','erebox@gmail.com','e',15,45.41001, 11.90759);

update weapon set xmpl1=0, xmpl2=0, xmpl3=0, xmpl4=0, xmpl5=0, xmpl6=0, xmpl7=100, xmpl8=500, usl1=0, usl2=0, usl3=0, usl4=0, usl5=0, usl6=0, usl7=0, usl8=100, adarefractor=100, jarvisvirus=25 where nickname='MoonbaseAlpha';
update weapon set xmpl1=0, xmpl2=0, xmpl3=0, xmpl4=99, xmpl5=123, xmpl6=80, xmpl7=59, xmpl8=14, usl1=12, usl2=2, usl3=5, usl4=2, usl5=5, usl6=3, usl7=0, usl8=0, adarefractor=1, jarvisvirus=7 where nickname='VyrusxXx';
update weapon set xmpl1=35, xmpl2=29, xmpl3=36, xmpl4=52, xmpl5=68, xmpl6=266, xmpl7=140, xmpl8=333, usl1=4, usl2=5, usl3=4, usl4=5, usl5=49, usl6=2, usl7=10, usl8=8, adarefractor=1, jarvisvirus=1 where nickname='halfdark';
update weapon set xmpl1=5, xmpl2=6, xmpl3=8, xmpl4=6, xmpl5=25, xmpl6=37, xmpl7=150, xmpl8=650, usl1=5, usl2=5, usl3=6, usl4=6, usl5=4, usl6=5, usl7=35, usl8=98, adarefractor=5, jarvisvirus=8 where nickname='Quintino';
update weapon set xmpl1=0, xmpl2=0, xmpl3=0, xmpl4=0, xmpl5=0, xmpl6=0, xmpl7=0, xmpl8=400, usl1=0, usl2=0, usl3=0, usl4=0, usl5=0, usl6=0, usl7=0, usl8=150, adarefractor=20, jarvisvirus=10 where nickname='B4b4u';
update weapon set xmpl1=12, xmpl2=0, xmpl3=0, xmpl4=0, xmpl5=0, xmpl6=0, xmpl7=100, xmpl8=500, usl1=0, usl2=0, usl3=0, usl4=0, usl5=0, usl6=0, usl7=0, usl8=0, adarefractor=0, jarvisvirus=0 where nickname='sbrodolo';
update weapon set xmpl1=1, xmpl2=1, xmpl3=0, xmpl4=11, xmpl5=15, xmpl6=25, xmpl7=300, xmpl8=223, usl1=0, usl2=0, usl3=0, usl4=0, usl5=1, usl6=0, usl7=60, usl8=93, adarefractor=37, jarvisvirus=43 where nickname='stylee';
update weapon set xmpl1=150, xmpl2=12, xmpl3=23, xmpl4=3, xmpl5=0, xmpl6=51, xmpl7=88, xmpl8=1010, usl1=1, usl2=1, usl3=0, usl4=0, usl5=0, usl6=0, usl7=0, usl8=15, adarefractor=2, jarvisvirus=15 where nickname='GiMmYPD';
update weapon set xmpl1=18, xmpl2=5, xmpl3=2, xmpl4=3, xmpl5=4, xmpl6=4, xmpl7=52, xmpl8=284, usl1=15, usl2=0, usl3=0, usl4=0, usl5=0, usl6=15, usl7=51, usl8=3, adarefractor=39, jarvisvirus=10 where nickname='EchoBravo00';
update weapon set xmpl1=0, xmpl2=0, xmpl3=0, xmpl4=0, xmpl5=0, xmpl6=72, xmpl7=159, xmpl8=214, usl1=0, usl2=0, usl3=0, usl4=3, usl5=2, usl6=2, usl7=5, usl8=12, adarefractor=23, jarvisvirus=7 where nickname='RBX21';

update resonator set rl1=0,rl2=0,rl3=0,rl4=60,rl5=60,rl6=120,rl7=120,rl8=120 where nickname='MoonbaseAlpha';
update resonator set rl1=28,rl2=0,rl3=2,rl4=2,rl5=0,rl6=1,rl7=35,rl8=4 where nickname='VyrusxXx';
update resonator set rl1=3,rl2=8,rl3=8,rl4=2,rl5=10,rl6=33,rl7=106,rl8=7 where nickname='halfdark';
update resonator set rl1=2,rl2=6,rl3=3,rl4=35,rl5=50,rl6=59,rl7=80,rl8=99 where nickname='Quintino';
update resonator set rl1=20,rl2=20,rl3=20,rl4=20,rl5=20,rl6=20,rl7=100,rl8=100 where nickname='B4b4u';
update resonator set rl1=30,rl2=30,rl3=30,rl4=30,rl5=30,rl6=30,rl7=30,rl8=30 where nickname='sbrodolo';
update resonator set rl1=13,rl2=2,rl3=14,rl4=11,rl5=31,rl6=28,rl7=17,rl8=22 where nickname='stylee';
update resonator set rl1=12,rl2=0,rl3=156,rl4=12,rl5=56,rl6=64,rl7=55,rl8=1 where nickname='GiMmYPD';
update resonator set rl1=176,rl2=78,rl3=9,rl4=8,rl5=4,rl6=9,rl7=64,rl8=76 where nickname='EchoBravo00';
update resonator set rl1=246,rl2=90,rl3=6,rl4=13,rl5=87,rl6=21,rl7=183,rl8=149 where nickname='RBX21';

update powercube set pcl1=0,pcl2=0,pcl3=0,pcl4=0,pcl5=0,pcl6=0,pcl7=0,pcl8=200 where nickname='MoonbaseAlpha';
update powercube set pcl1=0,pcl2=0,pcl3=0,pcl4=0,pcl5=0,pcl6=0,pcl7=0,pcl8=4 where nickname='VyrusxXx';
update powercube set pcl1=3,pcl2=2,pcl3=1,pcl4=4,pcl5=7,pcl6=15,pcl7=15,pcl8=84 where nickname='halfdark';
update powercube set pcl1=0,pcl2=2,pcl3=1,pcl4=5,pcl5=6,pcl6=15,pcl7=35,pcl8=154 where nickname='Quintino';
update powercube set pcl1=0,pcl2=0,pcl3=0,pcl4=0,pcl5=0,pcl6=0,pcl7=0,pcl8=150 where nickname='B4b4u';
update powercube set pcl1=0,pcl2=0,pcl3=0,pcl4=0,pcl5=0,pcl6=0,pcl7=0,pcl8=0 where nickname='sbrodolo';
update powercube set pcl1=2,pcl2=0,pcl3=0,pcl4=1,pcl5=0,pcl6=5,pcl7=0,pcl8=89 where nickname='stylee';
update powercube set pcl1=0,pcl2=0,pcl3=0,pcl4=0,pcl5=0,pcl6=0,pcl7=12,pcl8=65 where nickname='GiMmYPD';
update powercube set pcl1=2,pcl2=0,pcl3=0,pcl4=0,pcl5=0,pcl6=0,pcl7=1,pcl8=115 where nickname='EchoBravo00';
update powercube set pcl1=0,pcl2=0,pcl3=0,pcl4=0,pcl5=0,pcl6=0,pcl7=16,pcl8=95 where nickname='RBX21';

update portalmod set shieldcommon=25,shieldrare=45,shieldveryrare=25,axashield=15,multihackcommon=0,multihackrare=25,multihackveryrare=25,heatsinkcommon=0,heatsinkrare=25,heatsinkveryrare=25,turret=0,linkamp=0,forceamp=10 where nickname='MoonbaseAlpha';
update portalmod set shieldcommon=9,shieldrare=3,shieldveryrare=2,axashield=0,multihackcommon=15,multihackrare=0,multihackveryrare=0,heatsinkcommon=21,heatsinkrare=0,heatsinkveryrare=1,turret=42,linkamp=6,forceamp=38 where nickname='VyrusxXx';
update portalmod set shieldcommon=12,shieldrare=23,shieldveryrare=5,axashield=9,multihackcommon=7,multihackrare=4,multihackveryrare=2,heatsinkcommon=5,heatsinkrare=5,heatsinkveryrare=1,turret=36,linkamp=23,forceamp=35 where nickname='halfdark';
update portalmod set shieldcommon=48,shieldrare=52,shieldveryrare=36,axashield=29,multihackcommon=2,multihackrare=19,multihackveryrare=22,heatsinkcommon=2,heatsinkrare=23,heatsinkveryrare=15,turret=5,linkamp=3,forceamp=34 where nickname='Quintino';
update portalmod set shieldcommon=0,shieldrare=0,shieldveryrare=100,axashield=50,multihackcommon=0,multihackrare=0,multihackveryrare=0,heatsinkcommon=0,heatsinkrare=0,heatsinkveryrare=0,turret=0,linkamp=0,forceamp=0 where nickname='B4b4u';
update portalmod set shieldcommon=0,shieldrare=0,shieldveryrare=0,axashield=0,multihackcommon=0,multihackrare=0,multihackveryrare=4,heatsinkcommon=4,heatsinkrare=6,heatsinkveryrare=5,turret=3,linkamp=1,forceamp=1 where nickname='sbrodolo';
update portalmod set shieldcommon=1,shieldrare=6,shieldveryrare=1,axashield=2,multihackcommon=52,multihackrare=20,multihackveryrare=11,heatsinkcommon=22,heatsinkrare=46,heatsinkveryrare=10,turret=10,linkamp=0,forceamp=8 where nickname='stylee';
update portalmod set shieldcommon=10,shieldrare=2,shieldveryrare=55,axashield=12,multihackcommon=0,multihackrare=0,multihackveryrare=1,heatsinkcommon=0,heatsinkrare=0,heatsinkveryrare=2,turret=12,linkamp=8,forceamp=4 where nickname='GiMmYPD';
update portalmod set shieldcommon=85,shieldrare=24,shieldveryrare=20,axashield=19,multihackcommon=45,multihackrare=12,multihackveryrare=10,heatsinkcommon=63,heatsinkrare=13,heatsinkveryrare=17,turret=15,linkamp=2,forceamp=19 where nickname='EchoBravo00';
update portalmod set shieldcommon=9,shieldrare=3,shieldveryrare=1,axashield=2,multihackcommon=2,multihackrare=20,multihackveryrare=6,heatsinkcommon=1,heatsinkrare=20,heatsinkveryrare=12,turret=21,linkamp=0,forceamp=5 where nickname='RBX21';

update stats set AP=35285709,explorer=3827,builder=47397,illuminator=5659076,recharger=154240943,liberator=7377,pioner=2539,engineer=5272,purifier=38607,guardian=430,specops=1,hacker=58661,translator=21071,sojourner=108,recruiter=1,trekker=1603 where nickname='MoonbaseAlpha';
update stats set AP=12537735,explorer=1095,builder=19435,illuminator=385389,recharger=10024455,liberator=3817,pioner=763,engineer=2005,purifier=26952,guardian=34,specops=21,hacker=10551,translator=12305,sojourner=107,recruiter=1,trekker=621 where nickname='VyrusxXx';
update stats set AP=2050320,explorer=685,builder=4026,illuminator=20188,recharger=3517464,liberator=509,pioner=310,engineer=339,purifier=1297,guardian=24,specops=8,hacker=2296,translator=465,sojourner=24,recruiter=1,trekker=133 where nickname='halfdark';
update stats set AP=21741583,explorer=2512,builder=27596,illuminator=4118753,recharger=95084632,liberator=4958,pioner=3472,engineer=3149,purifier=29864,guardian=407,specops=1,hacker=30682,translator=12945,sojourner=73,recruiter=0,trekker=1346 where nickname='Quintino';
update stats set AP=44250000,explorer=12900,builder=54000,illuminator=12000000,recharger=125000000,liberator=9500,pioner=6500,engineer=5600,purifier=74000,guardian=282,specops=296,hacker=69000,translator=29000,sojourner=105,recruiter=0,trekker=2460 where nickname='B4b4u';
update stats set AP=300000000,explorer=1,builder=50000000,illuminator=1,recharger=1,liberator=555,pioner=1,engineer=1,purifier=1,guardian=1,specops=1,hacker=55,translator=1,sojourner=1,recruiter=8,trekker=1 where nickname='sbrodolo';
update stats set AP=41574014,explorer=5523,builder=65202,illuminator=43312492,recharger=155499447,liberator=8603,pioner=2852,engineer=4435,purifier=62744,guardian=385,specops=2,hacker=74299,translator=30305,sojourner=108,recruiter=0,trekker=1812 where nickname='stylee';
update stats set AP=54325023,explorer=12,builder=15236,illuminator=7,recharger=145000,liberator=186,pioner=1561,engineer=876,purifier=44684,guardian=2,specops=185,hacker=4564,translator=8454,sojourner=108,recruiter=12,trekker=2130 where nickname='GiMmYPD';
update stats set AP=4602871,explorer=1466,builder=8416,illuminator=3066220,recharger=26874512,liberator=1037,pioner=596,engineer=1209,purifier=4065,guardian=123,specops=38,hacker=6326,translator=6657,sojourner=108,recruiter=0,trekker=508 where nickname='EchoBravo00';
update stats set AP=254227827,explorer=2359,builder=36667,illuminator=1911454,recharger=80360646,liberator=5585,pioner=1610,engineer=2867,purifier=32374,guardian=391,specops=6,hacker=34204,translator=6803,sojourner=108,recruiter=0,trekker=946 where nickname='RBX21';


insert into player(nickname, email, faction, gpslat,gpslon) values
('newblue', 'blue@gmail.com', 'r',  45.220448, 12.277936);
insert into player(nickname, email) values
('newgreen', 'green@gmail.com');


insert into portal(gpslat, gpslon, name, owner, cell, faction) values
(45.411157, 11.887541, 'Torre Archimede', 'Leggend', 'NR01-FOXTROT-15', 'e');
update resonatorlevel 
set resonator1=8,resonator2=7,resonator3=6,resonator4=6,resonator5=5,resonator6=4,resonator7=5,resonator8=4 
where gpslat=45.411157 and gpslon=11.887541;
update resonatorowner
set resonator1='Leggend',resonator2='Leggend',resonator3='Leggend',resonator4='Leggend',resonator5='Leggend',resonator6='Leggend',resonator7='Leggend',resonator8='Leggend' 
where gpslat=45.411157 and gpslon=11.887541;
insert into portal(gpslat, gpslon, name, owner, cell, faction) values
(45.411403, 11.887598, 'Mosaico Torre Archimede', 'Leggend', 'NR01-FOXTROT-15', 'e');
update resonatorlevel
set resonator1=4, resonator2=4,resonator3=6,resonator4=6,resonator5=5,resonator6=4,resonator7=5,resonator8=2 
where gpslat=45.411403 and gpslon=11.887598;
update resonatorowner
set resonator1='Leggend',resonator2='Leggend',resonator3='Leggend',resonator4='Leggend',resonator5='Leggend',resonator6='Leggend',resonator7='Leggend',resonator8='Leggend' 
where gpslat=45.411403 and gpslon=11.887598;
insert into portal(gpslat, gpslon, name, owner, cell, faction) values
(45.411509, 11.888374, 'Dipartimento di Economia', 'Leggend', 'NR01-FOXTROT-15', 'e');
update resonatorlevel
set resonator1=4,resonator2=4,resonator3=3,resonator4=3,resonator5=5,resonator6=4,resonator7=2,resonator8=2 
where gpslat=45.411509 and gpslon=11.888374;
update resonatorowner
set resonator1='Leggend',resonator2='Leggend',resonator3='Leggend',resonator4='Leggend',resonator5='Leggend',resonator6='Leggend',resonator7='Leggend',resonator8='Leggend' 
where gpslat=45.411509 and gpslon=11.888374;
insert into link (gpslat1, gpslon1, gpslat2, gpslon2, owner, cell, capturedate, faction) values
(45.411157, 11.887541, 45.411403, 11.887598, 'Leggend', 'NR01-FOXTROT-15', current_timestamp, 'e');
insert into link (gpslat1, gpslon1, gpslat2, gpslon2, owner, cell, capturedate, faction) values
(45.411509, 11.888374, 45.411157, 11.887541, 'Leggend', 'NR01-FOXTROT-15', current_timestamp, 'e');
insert into link (gpslat1, gpslon1, gpslat2, gpslon2, owner, cell, capturedate, faction) values
(45.411403, 11.887598, 45.411509, 11.888374, 'Leggend', 'NR01-FOXTROT-15', current_timestamp, 'e');
insert into field (gpslat1, gpslon1, gpslat2, gpslon2, gpslat3, gpslon3, cell, capturedate, faction) values
(45.411157, 11.887541, 45.411403, 11.887598, 45.411509, 11.888374, 'NR01-FOXTROT-15', current_timestamp, 'e');
insert into portal(gpslat, gpslon, name, owner, cell, faction, level) values
(45.408318,11.886975, 'Aula Luzzatti', 'Leggend', 'NR01-FOXTROT-15', 'e',8);
update resonatorlevel 
set resonator1=8,resonator2=8,resonator3=8,resonator4=8,resonator5=8,resonator6=8,resonator7=8,resonator8=8 
where gpslat=45.408318 and gpslon=11.886975;
update resonatorowner
set resonator1='Leggend',resonator2='Leggend',resonator3='Leggend',resonator4='Leggend',resonator5='Leggend',resonator6='Leggend',resonator7='Leggend',resonator8='Leggend' 
where gpslat=45.408318 and gpslon=11.886975;


insert into portal(gpslat, gpslon, name, cell) values
(45.410685, 11.888441, 'Ponte ciclopedonale Balbino Del Nunzio', 'NR01-FOXTROT-15');
insert into portal(gpslat, gpslon, name, cell) values
(45.41219, 11.887196, 'Scultura Aliena', 'NR01-FOXTROT-15');
insert into portal(gpslat, gpslon, name, cell) values
(41.890096, 12.492676, 'Roma - Colosseo', 'AF11-SIERRA-07');
insert into portal(gpslat, gpslon, name, cell) values
(45.407888, 11.886188, 'Complesso Paolotti', 'NR01-FOXTROT-15');
insert into portal(gpslat, gpslon, name, cell) values
(45.407706, 11.886541, 'Pollaio', 'NR01-FOXTROT-15');
insert into portal(gpslat, gpslon, name, cell) values
(45.416842, 11.879404, 'Hotel Grand Italia', 'NR01-FOXTROT-15');
insert into portal(gpslat, gpslon, name, cell) values
(45.417235, 11.880388, 'Padova - Stazione Centrale', 'NR01-FOXTROT-15');
insert into portal(gpslat, gpslon, name, cell) values
(45.414461, 11.887234, 'Palazzo di giustizia', 'NR01-FOXTROT-15');

insert into portal(gpslat, gpslon, name, owner, cell, faction) values
(45.410808, 11.889692, 'Mensa Piovego', 'sbrodolo', 'NR01-FOXTROT-15', 'r');
update resonatorlevel 
set resonator1=8,resonator2=7,resonator3=6,resonator4=6,resonator5=5,resonator6=4,resonator7=5,resonator8=4 
where gpslat=45.410808 and gpslon=11.889692;
update resonatorowner
set resonator1='sbrodolo',resonator2='sbrodolo',resonator3='sbrodolo',resonator4='sbrodolo',resonator5='sbrodolo',resonator6='sbrodolo',resonator7='sbrodolo',resonator8='sbrodolo' 
where gpslat=45.410808 and gpslon=11.889692;




