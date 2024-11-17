public class NewCaseListController
{
    public list<case> getNewcases()
    {
        list<case> cases = [select id,caseNumber from case where status = 'New'];
    return cases;

    }
}