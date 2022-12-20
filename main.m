clear all
clc
sat_list=string(splitlines(webread("https://celestrak.com/NORAD/elements/geo.txt")));
fprintf("----------------------------------------------------------------------------------------------------\n")
fprintf("******************The satelites which have 45 degree or more inclination***************************\n")
fprintf("----------------------------------------------------------------------------------------------------\n")
for i=1:3:length(sat_list)-1
    name=sat_list(i);
    tle2 = split(sat_list(i+2));
    in_deg=str2num(tle2(3));
    if in_deg >= 45
    
    fprintf("%s\n",name);
    e0=str2num(tle2(5));
    n0=str2num(tle2(8));
    a = (8681663.653 / n0) ^ (2/3);
    hp = a*(1 - e0) - 6371;
    ha = a*(1 + e0) - 6371;
    fprintf("hp = %s km and ha = %s km, both rounded to the nearest km\n",num2str(hp),num2str(ha))

    end
end
% % name1=sat_list(3);
% tle2 = split(sat_list(i+2));
% e0=str2num(tle2(5))
% n0=str2num(tle2(8))
% % Compute semi-major axis
% % Where  a = semi-major axis, km
% % n0 = mean motion at epoch, rev/d
% 
% a = (8681663.653 / n0) ^ (2/3)
% 
% % Compute perigee height
% 
% hp = a*(1 - e0) - 6371
% 
% % where   hp = perigee height, km
% %     e0 = eccentricity at epoch
% %     6371 = Earth's mean radius
% % Compute apogee height
% 
% ha = a*(1 + e0) - 6371
% 
% % where   ha = apogee height, km
% %         e0 = eccentricity at epoch
% %       6371 = Earth's mean radius
% fprintf("hp = %s km and ha = %s km, both rounded to the nearest km",num2str(hp),num2str(ha))
