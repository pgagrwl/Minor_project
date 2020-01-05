%% Nucleation


%%
% This code is for the nucleation of a liquid(l) taken as a 100 * 100 array and 
% then distribution of numbers done from 1 to 10 in the liquid.
% The position where 5 is present is found out and displayed in figure 2
% The average of the VonNeumann Neighbourhood of 5 were taken and if the 
% avg of surrounding is greater then 5 then it grows into a nucleus


%%

clear

l=zeros(100,100); %%liquid
rand_dist=randi([1,10],100,100); %%random distribution of 1 to 10
n_p=zeros(100,100); %%possible nucleation sites
nuc=zeros(100,100);%% nucleated liquid
nuc_point=zeros(100,100); %Nucleation points
n_l= l+rand_dist;  %% liquid after random distribution
[rs,cs]=size(n_l);


figure;
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
                nuc_point(r,c)=1;
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
                nuc_point(r,c)=1;
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
                nuc_point(r,c)=1;
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
                nuc_point(r,c)=1;
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
                nuc_point(r,c)=1;
                end
            end
        end
        
        if(r~=1 && r~=rs && c==1)
            if n_l(r,c)==5
                sum= n_l(r+1,c)+n_l(r,c+1)+n_l(r-1,c);
                avg=sum/3;
                if avg>5
                nuc(r+1,c)=1;
                nuc(r-1,c)=1;
                nuc(r,c+1)=1;
                nuc(r,c)=1;
                nuc_point(r,c)=1;
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
                nuc_point(r,c)=1;
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
                nuc_point(r,c)=1;
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
                  nuc_point(r,c)=1;
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
imagesc(nuc_point);
pause(2);
figure;
imagesc(nuc);

