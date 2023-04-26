package baithuchanhso3;

import baithuchanhso3.model.repository.Table1Repository;
import baithuchanhso3.model.utils.DBUtils;
import baithuchanhso3.view.Menu;

public class RunMenu1 {
    public static void main(String[] args) {
        DBUtils.instance.SetUsernamePassword("root", "ComTMM0112");
        Table1Repository repo = new Table1Repository();
        Menu menu = new Menu(repo);
        menu.setVisible(true);
    }
}
