/*
 *  profile.cpp
 *
 *  Created by Jonathan Maletic on 3/29/2012.
 *  Copyright 2013 Kent State University. All rights reserved.
 *
 *  Modified by:
 *
 */

#include "profile.hpp"

////////////////////////////////////////////////////////////////////////
// Prints out the profile.
//
// TODO: Very simple output, need columns with nice headings.
// 
std::ostream& operator<< (std::ostream& out, const profile& p) {
    out << "File: " << fileName << std::endl;
    for(std::map<std::string, int>::const_iterator i = p.item.begin(); i != p.item.end(); ++i) {
        out << i->first << " " << i->second << std::endl;        
    }
    out << std::endl;
    return out;
}



////////////////////////////////////////////////////////// 
// PRE:  n >= 0
// POST: Returns a text version of a positive integer long
std::string intToString(int n) {
    assert(n >= 0);
    std::string result;
    
    if (n == 0) return "0";
    while (n > 0) {
        result = char(int('0') + (n % 10)) + result;
        n = n / 10;
    }  
    return result;
}
