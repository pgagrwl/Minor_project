%% Grain Growth with counting numbers of "Nucleus and Grains"

%%
% This code is for the nucleation of a liquid(l) taken as a 100 * 100 array and 
% then distribution of numbers done from 1 to 10 in the liquid.
% The position where 5 is present is found out and displayed in figure 2
% The average of the VonNeumann Neighbourhood of 5 were taken and if the 
% avg of surrounding is greater then 5 then it grows into a nucleus

%%
% Each nucleus is assigned a different color according to its position and then
% Each nucleus of different color grows to from grains until all its neighbours are surrounded by different grain
% The grains are separated from each other by grain boundaries


%%

clear

l=zeros(100,100); %%liquid
rand_dist=randi([1,10],100,100); %%random distribution of 1 to 10
n_p=zeros(100,100); %%possible nucleation sites
nuc=zeros(100,100);%% nucleated liquid
%nuc=l+n_p;
point=zeros(100,100);
grow=zeros(100,100); %% growth of the nucleus
n_l= l+rand_dist;  %% liquid after random distribution
[rs,cs]=size(n_l);


figure;
image(l);
pause(2);
figure;
imagesc(n_l);
pause(2);
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

end
pause(2);
 figure;
imagesc(point);

pause(2);
figure;
imagesc(nuc);

nuc_place=find(point==1);
num_point=numel(nuc_place);
for loop=1:10000
    if point(loop)==1
        point(loop)=loop;
    end
end
siz=size(point);
[I,J]=ind2sub(rs,nuc_place);

for i=1:numel(I)
    if I(i)>1 && point(I(i)-1, J(i))==0, grow(I(i)-1, J(i)) = i; end % above
    if I(i)<siz(1) && point(I(i)+1, J(i))==0, grow(I(i)+1, J(i)) = i; end % below
    if J(i)>1 && point(I(i), J(i)-1)==0, grow(I(i), J(i)-1) = i; end % left
    if J(i)<siz(2) && point(I(i), J(i)+1)==0, grow(I(i), J(i)+1) = i; end % right
end

figure;
imagesc(point);

figure;
imagesc(grow);


point=grow;
for i=1:150
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
    pause(0.2);
     imagesc(grow);
 end

for r=1:99
    for c=1:99
        if (grow(r,c)~=grow(r,c+1)) || (grow(r,c)~=grow(r+1,c))
            grow(r,c)=0;
        end
    end
end
for r=100
    for c=1:99
        if (grow(r,c)~=grow(r,c+1))
            grow(r,c)=0;
        end
    end
end
for r=1:99
    for c=100
        if  (grow(r,c)~=grow(r+1,c))
            grow(r,c)=0;
        end
    end
end


pause(5);
figure;
imagesc(grow); 
disp('Number of Nucleus')
disp(numel(nuc_place))
disp('Number of Grains')
disp(num_point)
