function plot_date_freq(date_freq, author)
%Plot data out
mn = mean(str2double(date_freq(:,2)));
std_dev = std(str2double(date_freq(:,2)));

bar(datetime(date_freq(:,1)),str2double(date_freq(:,2)))
xlabel('Date->')
ylabel('# of msgs')
title([author,'s chat freq (',char(date_freq(1,1)),' - ',char(date_freq(end,1)),')'])
str1 = ['Mean = ',num2str(mn),' msgs per day'];
str2 = ['Std Dev = ',num2str(std_dev)];
dim = [.2 .5 .3 .3]; annotation('textbox',dim,'String',str1,'FitBoxToText','on');
dim = [.6 .5 .3 .3]; annotation('textbox',dim,'String',str2,'FitBoxToText','on');