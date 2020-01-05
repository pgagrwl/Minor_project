%% Nucleation, Grain Growth and Ostwald Ripening


% This code is for the nucleation of a liquid(l) taken as a 100 * 100 array and 
% then distribution of numbers done from 1 to 10 in the liquid.
% The position where 5 is present is found out and displayed in figure 2
% The average of the VonNeumann Neighbourhood of 5 were taken and if the 
% avg of surrounding is greater then 5 then it grows into a nucleus

%%
% Each nucleus is assigned a different color according to its position and then
% Each nucleus of different color grows to form grains untill all its neighbours are surrounded by different grain
% The grains are separated from each other by grain boundaries


%%

clear

l=zeros(500,500); %%liquid
rand_dist=randi([1,10],500,500); %%random distribution of 1 to 10
n_p=zeros(500,500); %%possible nucleation sites
nuc=zeros(500,500);%% nucleated liquid
point=zeros(500,500);
grow=zeros(500,500); %% growth of the nucleus
n_l= l+rand_dist;  %% liquid after random distribution
[rs,cs]=size(n_l);


imagesc(n_l);

image(l);
for r=1:rs
    for c=1:cs
        if n_l(r,c)==5
            n_p(r,c)=n_l(r,c);
        end
    end
end
pause(2);
  figure;

imagesc(n_p);
pause(2);
%%
for r=1:rs
    for c=1:cs
       
        if (r==1 && c==1)
            if n_l(r,c)==5
                sum= n_l(r+1,c)+n_l(r,c+1);
                avg=sum/2;
                if avg>5
                nuc(r+1,c)=1;
                nuc(r,c+1)=1;
                nuc(r,c)=1;
                point(r,c)=1;
                end
            end
        end
        
        if (r==1 && c==cs)
            if n_l(r,c)==5
                sum= n_l(r+1,c)+n_l(r,c-1);
                avg=sum/2;
                if avg>5
                nuc(r+1,c)=1;
                nuc(r,c-1)=1;
                nuc(r,c)=1;
                end
            end
        end
        
        if (r==rs && c==1)
            if n_l(r,c)==5
                sum= n_l(r-1,c)+n_l(r,c+1);
                avg=sum/2;
                if avg>5
                nuc(r-1,c)=1;
                nuc(r,c+1)=1;
                nuc(r,c)=1;
                point(r,c)=1;
                end
            end
        end
        
        if (r==rs && c==cs)
               if n_l(r,c)==5
                sum= n_l(r-1,c)+n_l(r,c-1);
                avg=sum/2;
                if avg>5
                nuc(r-1,c)=1;
                nuc(r,c-1)=1;
                nuc(r,c)=1;
                point(r,c)=1;
                end
               end 
        end
        if(r==1 && c~=1 && c~=cs)
            if n_l(r,c)==5
                sum= n_l(r+1,c)+n_l(r,c+1)+n_l(r,c-1);
                avg=sum/3;
                if avg>5
                nuc(r+1,c)=1;
                nuc(r,c-1)=1;
                nuc(r,c+1)=1;
                nuc(r,c)=1;
                point(r,c)=1;
                end
            end
        end
        %
        if(r~=1 && r~=rs && c==1)
            if n_l(r,c)==5
                sum= n_l(r+1,c)+n_l(r,c+1)+n_l(r-1,c);
                avg=sum/3;
                if avg>5
                nuc(r+1,c)=1;
                nuc(r-1,c)=1;
                nuc(r,c+1)=1;
                nuc(r,c)=1;
                point(r,c)=1;
                end
            end
        end
        if (r==rs && c~=cs && c~=1)
            if n_l(r,c)==5
                sum= n_l(r-1,c)+n_l(r,c+1)+n_l(r,c-1);
                avg=sum/3;
                if avg>5
                nuc(r-1,c)=1;
                nuc(r,c-1)=1;
                nuc(r,c+1)=1;
                nuc(r,c)=1;
                point(r,c)=1;
                end
            end
        end
        if (r~=rs && r~=1 && c==cs)
            if n_l(r,c)==5
                sum= n_l(r+1,c)+n_l(r,c-1)+n_l(r-1,c);
                avg=sum/3;
                if avg>5
                nuc(r-1,c)=1;
                nuc(r+1,c)=1;
                nuc(r,c-1)=1;
                nuc(r,c)=1;
                point(r,c)=1;
                end
            end
        end
        if (r>1 && r<rs && c>1 && c<cs)
          if n_l(r,c)==5
            sum= n_l(r+1,c)+n_l(r,c+1)+n_l(r-1,c)+n_l(r,c-1);
                avg=sum/4;
                if avg>5
                  nuc(r+1,c)=1;
                  nuc(r-1,c)=1;
                  nuc(r,c-1)=1;
                  nuc(r,c+1)=1;
                  nuc(r,c)=1;
                point(r,c)=1;
                end
          end
        end
if n_l(r,c)~=5 
    n_l(r,c)=0;
end


    end
   imagesc(n_l);

pause(0.01);  

end
pause(2);
  figure;
imagesc(point);
pause(2);
imagesc(nuc);

%%
nuc_place=find(point==1);
num_point=numel(nuc_place);
for loop=1:250000
    if point(loop)==1
        point(loop)=loop;
    end
end
siz=size(point);
[I,J]=ind2sub(rs,nuc_place);
pause(2);
figure;
imagesc(point);
for i=1:numel(I)
    if I(i)>1 && point(I(i)-1, J(i))==0, grow(I(i)-1, J(i)) = i; end % above
    if I(i)<siz(1) && point(I(i)+1, J(i))==0, grow(I(i)+1, J(i)) = i; end % below
    if J(i)>1 && point(I(i), J(i)-1)==0, grow(I(i), J(i)-1) = i; end % left
    if J(i)<siz(2) && point(I(i), J(i)+1)==0, grow(I(i), J(i)+1) = i; end % right
end
pause(2);
 figure;
imagesc(point);

 figure;
imagesc(grow);

%%
point=grow;
for i=1:500
for r=1:rs
    for c=1:cs
       if (r>1 && r<rs && c>1 && c<cs)
        if point(r,c)~=0
            if point(r-1,c)==0
                grow(r-1,c)=grow(r,c);
            end
             if point(r+1,c)==0
                grow(r+1,c)=grow(r,c);
             end
             if point(r,c-1)==0
                grow(r,c-1)=grow(r,c);
             end
             if point(r,c+1)==0
                grow(r,c+1)=grow(r,c);
             end
        end
       end
      
       if (r==1 && c>1 && c<cs)
        if point(r,c)~=0

             if point(r+1,c)==0
                grow(r+1,c)=grow(r,c);
             end
             if point(r,c-1)==0
                grow(r,c-1)=grow(r,c);
             end
             if point(r,c+1)==0
                grow(r,c+1)=grow(r,c);
             end
        end
       end
    if (r==rs && c>1 && c<cs)
        if point(r,c)~=0
            if point(r-1,c)==0
                grow(r-1,c)=grow(r,c);
            end
             
             if point(r,c-1)==0
                grow(r,c-1)=grow(r,c);
             end
             if point(r,c+1)==0
                grow(r,c+1)=grow(r,c);
             end
        end
     end    
     if (r>1 && r<rs && c==1)
        if point(r,c)~=0
            if point(r-1,c)==0
                grow(r-1,c)=grow(r,c);
            end
             if point(r+1,c)==0
                grow(r+1,c)=grow(r,c);
             end

             if point(r,c+1)==0
                grow(r,c+1)=grow(r,c);
             end
        end
     end
      
     if ( r>1 && r<rs && c==cs)
        if point(r,c)~=0
            if point(r-1,c)==0
                grow(r-1,c)=grow(r,c);
            end
             if point(r+1,c)==0
                grow(r+1,c)=grow(r,c);
             end
             if point(r,c-1)==0
                grow(r,c-1)=grow(r,c);
             end

        end
      end
    end
end
point=grow;
    pause(0.1);
     imagesc(grow);
 end

pause(2);
 figure;
imagesc(grow); 
num=zeros(num_point,1);
num_surr=zeros(num_point,1);
surr=zeros(500,500);
for r=1:499
    for c=1:499
        if (grow(r,c)~=grow(r,c+1)) || (grow(r,c)~=grow(r+1,c))
            grow(r,c)=0;
        end
    end
end
for r=500
    for c=1:499
        if (grow(r,c)~=grow(r,c+1))
            grow(r,c)=0;
        end
    end
end
for r=1:499
    for c=500
        if  (grow(r,c)~=grow(r+1,c))
            grow(r,c)=0;
        end
    end
end


pause(2);
figure;
imagesc(grow); 

for i=1:num_point
 for r=1:rs
     for c=1:cs
         if grow(r,c)== i
               num(i)=num(i)+1;
         end
     end
 end
end

grain=grow;
max_size=max(num);
min_size=min(num(num>0)); %smallest grain
smg_color=find(num==min(num(num>0))); %color index of smallest grain

%%

for ost=1:200

for r=1:rs
  for c=1:cs
            if min_size <= (max_size)
            if (r>1 && r<rs && c>1 && c<cs)
             if grain(r,c)==smg_color
                if grain(r-1,c)~=smg_color && grain(r-1,c)~=0
                surr(r-1,c)=grain(r-1,c);
                grain(r-1,c)=0;
                end
                if grain(r+1,c)~=smg_color && grain(r+1,c)~=0
                surr(r+1,c)=grain(r+1,c);
                grain(r+1,c)=0;
                end
                if grain(r,c-1)~=smg_color && grain(r,c-1)~=0
                surr(r,c-1)=grain(r,c-1);
                grain(r,c-1)=0;
                end
                if grain(r,c+1)~=smg_color && grain(r,c+1)~=0
                surr(r,c+1)=grain(r,c+1);
                grain(r,c+1)=0;
                end
             end
            end
       if (r==1 && c>1 && c<cs)
            if grain(r,c)==smg_color
                if grain(r+1,c)~=smg_color && grain(r+1,c)~=0
                surr(r+1,c)=grain(r+1,c);
                grain(r+1,c)=0;
                end
                if grain(r,c-1)~=smg_color && grain(r,c-1)~=0
                surr(r,c-1)=grain(r,c-1);
                grain(r,c-1)=0;
                end
                if grain(r,c+1)~=smg_color && grain(r,c+1)~=0
                surr(r,c+1)=grain(r,c+1);
                grain(r,c+1)=0;
                end
             end
       end
    if (r==rs && c>1 && c<cs)
             if grain(r,c)==smg_color
                if grain(r-1,c)~=smg_color && grain(r-1,c)~=0
                surr(r-1,c)=grain(r-1,c);
                grain(r-1,c)=0;
                end
                if grain(r,c-1)~=smg_color && grain(r,c-1)~=0
                surr(r,c-1)=grain(r,c-1);
                grain(r,c-1)=0;
                end
                if grain(r,c+1)~=smg_color && grain(r,c+1)~=0
                surr(r,c+1)=grain(r,c+1);
                grain(r,c+1)=0;
                end
             end
     end    
     if (r>1 && r<rs && c==1)
            if grain(r,c)==smg_color
                if grain(r-1,c)~=smg_color && grain(r-1,c)~=0
                surr(r-1,c)=grain(r-1,c);
                grain(r-1,c)=0;
                end
                if grain(r+1,c)~=smg_color && grain(r+1,c)~=0
                surr(r+1,c)=grain(r+1,c);
                grain(r+1,c)=0;
                end

                if grain(r,c+1)~=smg_color && grain(r,c+1)~=0
                surr(r,c+1)=grain(r,c+1);
                grain(r,c+1)=0;
                end
             end
     end
      
         if ( r>1 && r<rs && c==cs)
           if grain(r,c)==smg_color
                if grain(r-1,c)~=smg_color && grain(r-1,c)~=0
                surr(r-1,c)=grain(r-1,c);
                grain(r-1,c)=0;
                end
                if grain(r+1,c)~=smg_color && grain(r+1,c)~=0
                surr(r+1,c)=grain(r+1,c);
                grain(r+1,c)=0;
                end
                if grain(r,c-1)~=smg_color && grain(r,c-1)~=0
                surr(r,c-1)=grain(r,c-1);
                grain(r,c-1)=0;
                end
            end
          end
            end
        
   end
 end
pause(0.1);
imagesc(grain);
 %%
% for r=1:499
%     for c=1:499
%         if (grain(r,c)~=grain(r,c+1)) || (grain(r,c)~=grain(r+1,c))
%             grain(r,c)=0;
%         end
%     end
% end
% for r=500
%     for c=1:499
%         if (grain(r,c)~=grain(r,c+1))
%             grain(r,c)=0;
%         end
%     end
% end
% for r=1:499
%     for c=500
%         if  (grain(r,c)~=grain(r+1,c))
%             grain(r,c)=0;
%         end
%     end
% end
% 
% 
% pause(2);
% figure;
% imagesc(grain); 

%%
for i=1:num_point
    for r=1:rs
        for c=1:cs
            if surr(r,c)==i
                num_surr(i)=num_surr(i)+1;
            end
        end
    end
end
surr_sort=sort(num_surr,'descend');
highest_surr=surr_sort(1,1);
sec_high=surr_sort(2,1);
third_high=surr_sort(3,1);
new_color=find(num_surr==highest_surr);
sec_color=find(num_surr==sec_high,1);
third_color=find(num_surr==third_high,1);

smg_count=0;new=0;sec_count=0;third_count=0;
for r=1:rs
 for c=1:cs
      if grow(r,c)==smg_color
      smg_count=smg_count+1;
      end
      if grow(r,c)==new_color
          new=new+1;
      end
      if grow(r,c)==sec_color
          sec_count=sec_count+1;
      end
      if grow(r,c)==third_color
          third_count=third_count+1;
      end
  end
end

 for r=1:rs
     for c=1:cs
        if ((highest_surr ~= sec_high) || (highest_surr~=third_high) || (sec_high~=third_high)) 
         if 0.7*new > smg_count
             if grow(r,c)==smg_color
                 grow(r,c)=new_color;
             end
                  
         elseif 0.7*sec_count > smg_count
                 if grow(r,c)==smg_color
                     grow(r,c)=sec_color;
                 end
             
         elseif 0.7*third_count > smg_count
                 if grow(r,c)==smg_color
                     grow(r,c)=third_color;
                 end        
     
         end
        else 
            if highest_surr==sec_high 
                if 0.7*new>smg_count
                    if grow(r,c)==smg_color
                        grow(r,c)=new_color;
                    end
                elseif 0.7*sec_count>smg_count
                    if grow(r,c)==smg_color
                        grow(r,c)=sec_color;
                    end
                    elseif sec_count>new
                    if grow(r,c)==smg_color
                         grow(r,c)=sec_color;
                    end
                elseif new > sec_count
                    if grow(r,c)==smg_color
                         grow(r,c)=new_color;
                    end
                end
            elseif highest_surr==sec_high && sec_count==new
                if third_count>smg_count
                    if grow(r,c)==smg_color
                        grow(r,c)=third_color;
                    end
                else
                    if grow(r,c)==smg_color
                        grow(r,c)=new_color;
                    end
                end
                
            elseif sec_high==third_high
                    if sec_count>third_count
                        if grow(r,c)==smg_color
                            grow(r,c)=sec_color;
                        end
                    elseif third_count>sec_count
                        if grow(r,c)==smg_color
                            grow(r,c)=third_color;
                        end
                    end
            elseif highest_surr==third_high
                if new>third_count
                    if grow(r,c)==smg_color
                        grow(r,c)=new_color;
                    end
                elseif third_count>new
                    if grow(r,c)==smg_color
                        grow(r,c)=third_color;
                    end
                end
            elseif highest_surr==sec_high && sec_high==third_high && highest_surr==third_high
               
                if new > sec_count && new>third_count
                    if grow(r,c)==smg_color
                        grow(r,c)=new_color;
                    end
                elseif sec_count > new && sec_count>third_count
                    if grow(r,c)==smg_color
                        grow(r,c)=sec_color;
                    end
                elseif third_count>new && third_count>sec_count
                    if grow(r,c)==smg_color
                        grow(r,c)=third_color;
                    end
                end
            end
        end 
        
         
         
     end
  end
 

pause(0.1);
imagesc(grow);
 surr=zeros(500,500);
num=zeros(num_point,1);
 num_surr=zeros(num_point,1);
for i=1:num_point
 for r=1:rs
     for c=1:cs
         if grow(r,c)== i
               num(i)=num(i)+1;
         end
     end
 end
end
grain=grow;
min_size=min(num(num>0)); %smallest grain
smg_color=find(num==min(num(num>0))); %color index of smallest grain
 pause(0.1);
 imagesc(grow);
end
pause(2);
figure;
imagesc(grow);
%% 

for r=1:499
    for c=1:499
        if (grow(r,c)~=grow(r,c+1)) || (grow(r,c)~=grow(r+1,c))
            grow(r,c)=0;
        end
    end
end
for r=500
    for c=1:499
        if (grow(r,c)~=grow(r,c+1))
            grow(r,c)=0;
        end
    end
end
for r=1:499
    for c=500
        if  (grow(r,c)~=grow(r+1,c))
            grow(r,c)=0;
        end
    end
end


pause(2);
figure;
imagesc(grow); 

