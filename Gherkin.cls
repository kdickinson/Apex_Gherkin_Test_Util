@isTest
public class Gherkin {
    private String[] givens;
    private String[] whens;
    private String[] thens; 

    public Gherkin() {
        this.givens = new String[]{};
        this.whens = new String[]{};
        this.thens = new String[]{};
    }

    public void addGiven(String text) {
        givens.add(text);
    }
    public void addWhen(String text) {
        whens.add(text);
    }
    public void addThen(String text) {
        thens.add(text);
    }

    public String getGiven() {
        return getRequirements(this.givens, 'GIVEN');
    }
    public String getWhen() {
        return getRequirements(this.whens, 'WHEN');
    }
    public String getThen() {
        return getRequirements(this.thens, 'THEN');        
    }
    public String get() {
        return getGiven() + getWhen() + getThen();
    }
    public String getErrorMessage(String but) {
        return this.get() + '\n BUT ' + but;
    }

    private String getRequirements(String[] reqs, String type) {
        Integer size = reqs.size();
        if(size == 0) return '';

        String res = type == 'GIVEN' ? '' : '\n';
        res += type + ' ' + reqs[0];
        for(Integer i = 1; i < size; i++) {
            res += '\n   ' + 'AND ' + reqs[i];
        }
        return res;
    }
}