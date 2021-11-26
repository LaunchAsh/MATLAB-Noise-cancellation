function Plot_Discrimination_function(x,fs,f_d,mark,T,MA)
%Ham ve do thi xac dinh khoang lang và tieng noi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot_Discrimination_function(x,fs,f_d,mark,T,MA)
%x : tin hieu dau vao
%fs : tan so dau vào
%f_d : do dai 1 khung tin hieu
%mark : vi tri tieng noi/khoang lang
%T : gia tri bien chuan
%MA : cuong do tin hieu trung binh
    N = length(x);              %do dai tin hieu(mau)
    t = 1/fs:1/fs:N/fs;         %Sinh truc thoi gian
    f_size = floor(f_d*fs);     %So mau cua 1 khung
    f_s1 = floor(f_size/2);     %1 nua mau cua 1 khung
    n_f = floor(N/f_size);      %So luong khung chia theo chieu dai tin hieu
    %luu cac vi tri chuyen tu khoang lang sang am thanh va nguoc lai
    mark1 = [];
    for i = 1:2*n_f-2
        if mark(i)*mark(i+1)<0
            mark1 = [mark1,i];
        end
    end
    %%
    plot(t,x,'Linewidth',1);        %ve tin hieu dau vao
    hold on;                        %bat ve chen
    grid on;                        %bat chia toa do
    yline(T,'--k','Linewidth',1);   %ve bien chuan
    %%
    %ve cuong do tin hieu trung binh
    MA_sample = zeros(1,N);         
    temp = 0;
    %Chi ve 1 nua khung duoc chia theo do dai tin hieu
    for i = 1:n_f-1
        MA_sample(temp+1:temp + f_size) = MA((2*(i-1))+1);
        temp = temp + f_size;
    end
    MA_sample((n_f-1)*f_size:end) = MA(2*n_f-1);
    plot(t,MA_sample,'m','Linewidth',1);         
    hold on;                                    %bat ve chen
    %%
    %Xac ding cac vi tri va ve vach phan dinh tieng noi/khoang lang
    for i = 1:length(mark1)
        if mod(mark1(i),2) == 1
            marking = (((mark1(i)+1)/2)*f_size+1)/fs;
        else
            marking = ((mark1(i)/2)*f_size + f_s1 + 1)/fs;
        end
            plot([marking,marking],[min(x),max(x)],'--r','Linewidth',1.5);
    end
    xlabel('Time(s)');                                  %truc thoi gian
    ylabel('Amplitude');                                %truc biên do
    title('Speech/Silence Discrimination')              %ten do thi
    legend('Base Signal','Threshold','MA','Speech');  %chu thich
end