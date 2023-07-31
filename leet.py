class Solution(object):
    def originalDigits(self, s):
        """
        :type s: str
        :rtype: str
        """
        dic={}
        for i in range(len(s)):
            if s[i] not in dic:
                dic[s[i]]=0
            dic[s[i]]+=1
        arr=[0]*10 #store 0 to 9 digit count!
        ls=dic.keys()
        
