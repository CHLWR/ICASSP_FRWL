clc;close all
n=2000;hn=7;k=25;c=2;
randseed
X = twomoon_gen(n/2, n/2, 0.1);
y=[ones(1,n/2) 1+ones(1,n/2)]';
[~, Anchors]= hKM(X',1:n, hn, 1);
Z = ConstructA_NP(X', Anchors,k);
label_FRWL =FRWL(Z,c);
result = ClusteringMeasure(y, label_FRWL);

rl = randperm(c);
cm = colormap(jet(c+2));
for i=1:c
    plot(X(label_FRWL==rl(i),1),X(label_FRWL==rl(i),2),'*', 'color', cm(i,:),'MarkerSize',4); hold on;
end
plot(Anchors(1,:),Anchors(2,:),'o','MarkerFaceColor', cm(c+2,:),'MarkerEdgeColor',0.3*cm(c+2,:),'MarkerSize',5); hold on;
title('FRWL')
 