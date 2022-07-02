function [] = WaveletEnergySpectrum(u,accuracy,Max_period)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wavelet Energy Spectrum is the technique for decomposing a time-domain signal
%%%%%%%%%%%%%%%%%%%%%%
% Input:
%	u: time-amplitude of the signal:
%			u(:,1): Time steps
%			u(:,2): Amplitude steps
%	accuracy: higher, more detail, Select 40 as it is realistic for Earthquake Engineering apprication
%	Max_period: Maximum period that will be shown in the figure
%
% Created by Masoud Shadlou
% Created date:	05-Nov-2007  
% Last Edit time: NA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = u(:,1);
xs = u(:,2); % superstructure
dt = t(2,1) - t(1,1);

dl = dt*4;
L = 2048*dt;
coefs = cwt(xs,1:512,'mexh');
WES = ((abs(coefs)).^2/(pi));
T = dl:(L-dl)/512:L;

F1 = figure(1);
    contour(t,T(1,1:512),WES,accuracy,'Fill','on');    
    grid on;box on;
    set(gca,'Ylim',[0 Max_period],'YTick',[0 0.25 0.5 0.75 1 1.25],'YGrid','on','YMinorTick','on','FontSize',12,'FontWeight','bold','FontAngle','italic','Ycolor','k');
    set(gca,'Xlim',[0 10],'XTick',[0 2.5 5 7.5 10],'XGrid','on','XMinorTick','on','Xcolor','k');
    set(gca,'Position',[0.13 0.33 0.775 0.6]);
    set(gca,'Color',[0 0 0.4]);
    xlabel('Time (sec.)','FontSize',12,'FontWeight','bold','FontAngle','italic');
    ylabel('Period (sec.)','FontSize',14,'FontWeight','bold','FontAngle','italic');  
	
	% Following part of the code, as its current syntax, may not work in MATLAB v > 12a so update it using compativle syntax or comment it    
    ax4 = colorbar('horiz');  
    axes(ax4);
    set(gca,'FontSize',11,'ZGrid','on','YGrid','on','XGrid','on','FontWeight','bold','FontAngle','italic');
    set(gca,'Position',[0.13 0.14 0.775 0.04]);
    xlabel('WES  ( m^2 / s^4 )','FontSize',11,'FontWeight','bold','FontAngle','italic')
    grid on;box on;

end