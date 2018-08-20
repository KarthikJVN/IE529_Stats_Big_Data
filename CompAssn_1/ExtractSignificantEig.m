function [dim] = ExtractSignificantEig(lamda, accuracy)
dim = 0;
percent = 0;
for indx=1:size(lamda)
    if percent < accuracy
        dim = dim + 1;
    else
        break;
    end
    percent = sum(lamda(1:indx))/sum(lamda);
end