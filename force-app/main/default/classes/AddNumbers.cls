//class testing pull request and find difference test getdiff new 1 test deployment 1
public with sharing class AddNumbers {
    public AddNumbers() {
        System.debug('Inside constructor');
    }

    public Integer addandres(Integer firstnum, Integer secondnum){
        return firstnum+secondnum;
    }
}
