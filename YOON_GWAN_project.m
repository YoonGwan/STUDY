
clc; close all; clear;

f_id = fopen('source_JPARK2019_vfinal.txt', 'r');
format_read = '%2s';

Sample_r = fscanf(f_id,format_read);

OurSource = [];
SourceCount = [];
learning_code_length = [];
learning_point_t = [];

sample_length = length(Sample_r);

R = [];

LearningPhase_array = 1000:1000:80000;

for i=  4 : 7 ;
for idx_learning = 1:length(LearningPhase_array)
    LearningPhase = LearningPhase_array(idx_learning);
    
    for idx = 1:LearningPhase
        if ismember(Sample_r(idx), OurSource)
            sample_idx = find(Sample_r(idx) == OurSource);
        else
            OurSource = [OurSource, Sample_r(idx)];
        end
    end
    
    for idx = 1:length(OurSource)
        SourceCount(idx) = count(Sample_r(1:LearningPhase), (OurSource(idx)));
    end
    
    Prob = SourceCount/LearningPhase; 
     for idx = 1:length(OurSource)
     OurSource_cell{idx} = OurSource(idx);
     end
     Huffman_output = huffmandict(OurSource_cell, Prob);
     for idx = 1: length(OurSource)
          code_length(idx) = count(Sample_r(LearningPhase_array+1:sample_length),(OurSource(idx))) * length(Huffman_output{idx,2});
      end
 

    Goal = [];
    Real_code_length = sum(code_length,(1:-2));
    expected_code_length = LearningPhase_array * i + Real_code_length;
    Goal = [Goal, expected_code_length];
    Avg_bit= expected_code_length/10^5;
    
end
    R = [R, expected_code_length];
    [M, I] = min(Goal);
    learning_code_length = [learning_code_length, M]
    learning_point_t = [learning_point_t, I * 1000]
    plot(LearningPhase_array,Avg_bit)
end