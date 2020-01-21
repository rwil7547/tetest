public class testMap {

    set<String> strings {get; set;} 
    
    public Set<String> getSet(){
        
        strings = new Set<String>{'one','two','three'};
        
        return strings;
        
    }
    
    
    public Map<String,List<String>> getMap() {
        
        Set<String> theStrings = getSet();
        
        Map<String,List<String>> stringMap = new Map<String,List<String>>();
        
        for (String s : theStrings) {
            List<String> listy = new List<String>{s + ' one', s + ' two', s + ' three'};
            stringMap.put(s, listy);    
        }
        
        return stringMap;
    }

}