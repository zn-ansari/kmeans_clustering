clear all
figure
load('hw3_data(1).mat')
 
for i=1:4
    subplot(2,2,i)
    k=kmeans(X,i);
    hold on;
    gscatter(X(:,1),X(:,2),k,'brgk','o');
    if i~=1
        title("For "+i+" clusters");
        else
        title("Dataset");
    end
end