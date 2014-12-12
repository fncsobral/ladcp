function plot_menu
% initialize the plot menu for LADCP processing
%
% version 0.4	last change 16.11.2012

% G.Krahmann, IFM-GEOMAR, 2004

% changed location of windows for OSX     GK, 15.07.2008  0.2-->0.3
% use sfigure instead of figure           GK, 16.11.2012  0.3-->0.4

dd = dir('tmp/*.fig');
for n=1:length(dd)
  delete(['tmp/',dd(n).name])
end

% handle newer matlab versions
if version('-release')>=14
  imac = 0;
else
  imac = ismac;
end

% create 2 windows
% one for the control menu and one for the actual plots
sfigure(1);
clf
set(gcf,'position',[10,10+imac*100,170,750],'numbertitle','off','menubar',...
  'none','name','LADCP 1');
sfigure(2);
clf
set(gcf,'position',[190,10+imac*100,800,696],'numbertitle','off',...
  'name','LADCP 2');

% create the menu
sfigure(1);
uicontrol('style','frame','position',[10,10,150,600]);
uicontrol('style','frame','position',[10,620,150,120]);

uicontrol('style','text','position',[15,705,140,30],...
  'horizontalalignment','center','string','LADCP',...
  'fontsize',18);
uicontrol('style','text','position',[15,665,140,30],...
  'horizontalalignment','center','string','processing',...
  'fontsize',18);
uicontrol('style','text','position',[15,625,140,30],...
  'horizontalalignment','center','string','display',...
  'fontsize',18);

uicontrol('style','push','position',[15,585,140,20],...
  'horizontalalignment','center','string','UV-profiles',...
  'callback',{@plot_controls, 1});
uicontrol('style','push','position',[15,560,140,20],...
  'horizontalalignment','center','string','W,Z,sensors',...
  'callback',{@plot_controls, 2});
uicontrol('style','push','position',[15,535,140,20],...
  'horizontalalignment','center','string','ERR-profiles',...
  'callback',{@plot_controls, 3});
uicontrol('style','push','position',[15,510,140,20],...
  'horizontalalignment','center','string','SURF/BOT recog.',...
  'callback',{@plot_controls, 4});
uicontrol('style','push','position',[15,485,140,20],...
  'horizontalalignment','center','string','Heading dual',...
  'callback',{@plot_controls, 5});
uicontrol('style','push','position',[15,460,140,20],...
  'horizontalalignment','center','string','HDG/PIT/ROL',...
  'callback',{@plot_controls, 6});
uicontrol('style','push','position',[15,435,140,20],...
  'horizontalalignment','center','string','CTD motion',...
  'callback',{@plot_controls, 7});
uicontrol('style','push','position',[15,410,140,20],...
  'horizontalalignment','center','string','CTD-LADCP merging',...
  'callback',{@plot_controls, 8});
uicontrol('style','push','position',[15,385,140,20],...
  'horizontalalignment','center','string','SADCP',...
  'callback',{@plot_controls, 9});
uicontrol('style','push','position',[15,360,140,20],...
  'horizontalalignment','center','string','Vel offset',...
  'callback',{@plot_controls, 10});
uicontrol('style','push','position',[15,335,140,20],...
  'horizontalalignment','center','string','Warnings',...
  'callback',{@plot_controls, 11});
uicontrol('style','push','position',[15,310,140,20],...
  'horizontalalignment','center','string','Inv. Weights',...
  'callback',{@plot_controls, 12});
uicontrol('style','push','position',[15,285,140,20],...
  'horizontalalignment','center','string','Bottom Track',...
  'callback',{@plot_controls, 13});
uicontrol('style','push','position',[15,260,140,20],...
  'horizontalalignment','center','string','TargetStr Edited',...
  'callback',{@plot_controls, 14});
uicontrol('style','push','position',[15,235,140,20],...
  'horizontalalignment','center','string','Correl. Edited',...
  'callback',{@plot_controls, 15});
uicontrol('style','push','position',[15,210,140,20],...
  'horizontalalignment','center','string','Inv. Weights 2',...
  'callback',{@plot_controls, 16});


% nested function plot_controls
% control function for LADCP plotmenu
  function [] = plot_controls(obj, ~, fig)
    
    % reloads the stored figure into the display window  
    figload(['tmp/',int2str(fig),'.fig'],2) 
    figure(1)
    
    % find selected control and set it black
    set(findobj('foregroundcolor',[1,0,0]),'foregroundcolor',[0,0,0]);
    % set selected control to red
    set(obj,'foregroundcolor',[1,0,0]);

    
  end % end of plot_controls

end % end of plot_menu
