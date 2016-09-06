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



