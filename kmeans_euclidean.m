clear all
load('data.mat')
k = ones(600,1);

 
for i=1:4
    flag = 0;
    subplot(2,2,i)  
%     i = input('Enter the value of K?');
    C = X(randi([1 600],1,i),:);
    new_C = C;
    while flag==0
    dist = zeros(600,i);
        for j=1:i            
            dist(:,j) = sqrt(((X(:,1))-(C(j,1))).^2+((X(:,2))-(C(j,2))).^2);
        end
        [m_dist,c_indx] = min(dist,[],2);
        for j=1:i
           cnt_indx = c_indx;
           cnt_indx(cnt_indx~=j)=0;
           cnt_indx(cnt_indx==j)=1;
           new_C(j,1) = (cnt_indx'*X(:,1))/sum(cnt_indx==1);
           new_C(j,2) = (cnt_indx'*X(:,2))/sum(cnt_indx==1);           
        end
        if C==new_C
            flag = 1;
        end
        C=new_C;        
        k = c_indx;
        gscatter(X(:,1),X(:,2),k,'brgkm','o');
        if i~=1
        title("For "+i+" clusters");
        else
            title("Dataset");
        end
        pause(0.2)
    end
end
