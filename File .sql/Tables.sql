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

