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


