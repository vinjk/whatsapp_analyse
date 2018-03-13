
%Read whatsapp chat from txt file
% Change the path to wherever you're chat file is
filepath = '/chats/chat_from_whatsapp.txt';
doc = fileread(filepath);

%Give the name of the author whose message you want to analyse
author = 'Vineet';
[nmsgs, date_freq, ~] = analyse_whatsapp(doc, author);

%Plot message counts per date and some simple stats
plot_date_freq(date_freq, author);



