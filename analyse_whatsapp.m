function [nmsgs, date_freq, author] = analyse_whatsapp(doc, author)
nmsgs = 0;

search_string = ['] ',author,':'];
k_msgs = strfind(doc,search_string);
nmsgs = size(k_msgs,2);

for i = 1 : size(k_msgs,2)
    flag = false;
    id = 1;
    slash_cnt = 0;
    while(~flag)
        ch = doc(k_msgs(i)-id);
        if ch == ','
            end_id = k_msgs(i)-(id+1);
        elseif ch == '/'
            slash_cnt = slash_cnt + 1;
            if slash_cnt == 2
                if isstrprop(doc(k_msgs(i) - (id+2)),'digit')
                    start_id = k_msgs(i) - (id+2);
                else
                    start_id = k_msgs(i) - (id+1);
                end
                slash_cnt = 0;
                flag = true;
            end
        end
        id = id + 1;
    end
    date = convertCharsToStrings(doc(start_id : end_id));    
    time_msg_data(i,:) = [date k_msgs(i)];
end

%Compute chat frequency
freq = 0;
date = time_msg_data(1,1);
cnt = 1;
for i = 1 : size(time_msg_data,1)
    if date == time_msg_data(i,1)
        freq = freq + 1;
        date_freq(cnt,:) = [date freq];
    else
        cnt = cnt + 1;
        freq = 1;
        date = time_msg_data(i,1);
        date_freq(cnt,:) = [date freq];
    end
end


