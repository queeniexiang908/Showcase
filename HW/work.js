/*
Karina Ionkina and Queenie Xiang
SoftDev02 pd8
K18 -- Reductio ad Absurdum JS Version 
2018-05-01
*/ 


/*
list comp + reduce to 
- find frequency of a single word
- total frequency of a group of words
- most frequently occuring word
*/

var frequency = function(word, the_file) {
    var sum = 0;
    
    var word_freq = the_file.map(function(i) {
       if (i == word) {
	   return 1;
       }
       else {
	   return 0;
       }  
    });

    return word_freq.reduce(function(sum,y) {if (sum != null) {return sum+y}});

}
    
var group_frequency = function(list_of_words, the_file) {
    sum = 0; 
    var word_freq = the_file.map(function(i) {
	var check = 0;
	
	if (i.length > 1) {
	    for (x in i) {
		if (i[x] == list_of_words[x]) {
		    check++;
		}
            }
	}

	if (check == list_of_words.length) {
		return 1;
	}

	else {
	    return null;
	}
    });
    
    return word_freq.reduce(function(sum,y) {if (sum != null) {return sum+y}});   
};

var group_frequency = function(list_of_words, the_file) {
    sum = 0; 
    var word_freq = the_file.map(function(i) {
	var check = 0;
	
	if (i.length > 1) {
	    for (x in i) {
		if (i[x] == list_of_words[x]) {
		    check++;
		}
            }
	}

	if (check == list_of_words.length) {
		return 1;
	}

	else {
	    return null;
	}
    });
    
    return word_freq.reduce(function(sum,y) {if (sum != null) {return sum+y}});   
};

var most_freq(the_file, word) {
    var most_freq = function(the_file) {
	arr2 = []; 
	for (x in the_file) {
		arr2.push(frequency(the_file[x], the_file));
    }

    max = Math.max.apply(Math, arr2);
	
	for (i in arr2) {
		if (arr2[i] == max) {
			return the_file[i];
        }
    }
		
}; 
 
