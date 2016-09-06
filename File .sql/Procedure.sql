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

