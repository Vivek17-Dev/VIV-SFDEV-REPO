trigger LeadConversionTrigger1 on Lead(after update) 
{
    for(lead l:trigger.new)
    {
        if(l.isConverted)
        {
           loanAccountBatchClass la = new loanAccountBatchclass();
            database.executeBatch(la, 5);
        }
        
    }
}