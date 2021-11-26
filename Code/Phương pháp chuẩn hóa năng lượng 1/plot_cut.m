function plot_cut(y,fs,ch,val,f_d)
%ham nay tinh toan va ve phan doan khoang lang tieng noi  
%ham nay dung  cho ca hai ch??ng trinh su dung chuan hoa nang luong
%phan doan nang luong dua vao dua vao nang luong khung da chuan hoa 
%va dieu kien moi khoang lang dai hon 200ms
%--------------------------------------------------------------------------
le = length(y);     %lay do dai tin hieu
so = 0.2*fs;        %so mau ung voi 200ms
laytile = f_d*fs/2; %lam tron so mau tin hieu ung voi 1 khung nang luong
dem = so/laytile;   %so khung nang luong ung voi 200ms
loc = [];           %vector luu cac vi tri phan doan cua tin hieu 
sta = [];           %vector luu trang thai vi tri(1:start,-1:end)
%-----------------------------------------------------------------------
%tinh toan phan doan tin hieu theo nang luong khung 
%-------------------------------------------------------------------------- 
v1 = val*ones(1,length(ch));%vector nguong gioi han khoang lang tieng noi
if(ch(1)>=val)
    loc = [loc 1];
    sta = [sta 1];
end
for i=2:dem
    if((ch(i)>=val)&&(max(ch(1:i-1))<val))
        loc = [loc (i-1)*laytile+1];
        sta = [sta 1];
    end
    if((ch(i)>=val)&&(max(ch(i+1:i+dem))<val))
        loc = [loc (i-1)*laytile+1];
        sta = [sta -1];
    end
end
for i=dem+1:length(ch)-dem-1
    if((ch(i)>=val)&&(max(ch(i-dem:i-1))<val))
        loc = [loc (i-1)*laytile+1];
        sta = [sta 1];
    end
    if((ch(i)>=val)&&(max(ch(i+1:i+dem))<val))
        loc = [loc (i-1)*laytile+1];
        sta = [sta -1];
    end
end
for i=length(ch)-dem:length(ch)-1
    if((ch(i)>=val)&&(max(ch(i-dem:i-1))<val))
        loc = [loc (i-1)*laytile+1];
        sta = [sta 1];
    end
    if((ch(i)>=val)&&(max(ch(i+1:end))<val))
        loc = [loc (i-1)*laytile+1];
        sta = [sta -1];
    end
end
if(ch(end)>=val&&(max(ch(end-dem:end-1)<val)))
    loc = [loc (i-1)*laytile+1];
     sta = [sta 1];
end
%sinh truc thoi gian cho tin hieu
subplot(3,1,1)
plot(y);%ve tin hieu
title('Tin hieu'); %tieu de
ylabel('Bien do');%bien do tin hieu
xlabel('Chieu dai tin hieu');%
axis([1 length(y) min(y) max(y)]);
subplot(3,1,2)
T = 1:length(ch);
plot(T,ch);%ve nang luong khung da chuan hoa
hold on;
p3=plot(v1);%ve nguong xac dinh khoang lang, tieng noi
hold off;
axis([1 length(ch) min(ch) max(ch)]);
title('Chuan hoa nang luong'); %tieu de
ylabel('Bien do');
xlabel('Khung');
legend([p3],'moc xac dinh');%dat ten 
subplot(3,1,3)
plot(y);
axis([1 length(y) min(y) max(y)]);
hold on;

for i=1:length(loc)%ve chia khung voi cac chi so tim duoc 
    if(sta(i) == 1)
        p1=plot([loc(i),loc(i)],[min(y) , max(y)],'r--','Linewidth',0.5);%ve duong bat dau
    else p2=plot([loc(i),loc(i)],[min(y) , max(y)],'k--','Linewidth',0.5);%ve duong ket thuc
    end
end
hold off;
title('Phan doan tin hieu khoang lang, tieng noi');
xlabel('Chieu dai tin hieu');
legend([p1,p2],'Bat dau','Ket thuc');%dat ten
end
%ket thuc ham



    
        

 