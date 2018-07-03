# paper-matlab-njupt
研究生毕业论文的matlab代码

整个代码结构分三个部分：ensemble-obj、ensemble-out、local。
其中ensemble-obj是基于集成目标干扰的特征选择算法。是FWELL、FWELL-OBJ(基于目标干扰的特征选择算法)以及FWELL-ENOBJ(基于集成目标干扰的特征选择算法)三部分的对比试验。包括隐私度和特征维数两部分试验。
ensemble-out是基于输出干扰的两种集成特征选择算法(FELP和FPLE)，同样该部分的每个实验也包括隐私度和特征维数两部分试验。	local是对局部差分隐私的特征选择算法的试验，同FWELL、FWELL-OUT(基于输出干扰的特征选择算法)以及FWELL-LOCAL(基于局部差分隐私的特征选择算法)的对比。同样该部分试验也包括隐私度和特征维数两部分试验。

每个实验都是从main函数作为整个程序的入口，用SVM和3NN两种分类器，所以整个实验结果分两部分。	

	