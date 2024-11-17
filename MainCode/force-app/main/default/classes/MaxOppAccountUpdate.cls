public with sharing class MaxOppAccountUpdate {
    public MaxOppAccountUpdate() {

    }
    public static void updateMaxOppAccount(List<Opportunity> newList, Map<id,Opportunity> oldMap){

            List<Account> accList = new List<Account>();
            List<Opportunity> oppList = new List<Opportunity>();
            for(Opportunity opp : newList){
                if(opp.accountId != null && opp.amount != null && opp.amount != oldmap.get(opp.id).amount){
                    Opportunity op = [select id, name, accountId from Opportunity where id = :opp.id];
                }
            }
        }
    }