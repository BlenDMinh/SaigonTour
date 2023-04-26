package baithuchanhso3.view;
import java.awt.*;
import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.*;
import java.awt.event.*;
import java.util.ArrayList;

import baithuchanhso3.model.entity.Table1;
import baithuchanhso3.model.repository.Table1Repository;
import baithuchanhso3.model.utils.DBUtils;

public class Menu extends JFrame {
    private static String DEFAULT_CONNETION_URL = "jdbc:mysql://localhost:3306/data";
    private static String DEFAULT_QUERY = "SELECT * FROM Table1";
    // UI-COMPONENT
    JLabel label1, url_l, query_l;
    JTextField url, query;
    Panel panel1, panel2, panel3;
    Button okButton, resetButton, exitButton;
    JTable table;
    JScrollPane sp;

    DefaultTableModel model = new DefaultTableModel(
			null,
			new String[] {"Id", "Name", "Address", "Total"}
		);

    private void clearTable() {
        while(model.getRowCount() > 0)
            model.removeRow(0);
    }

    private void init() {
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        url_l = new JLabel("Input Infomation:");
        query_l = new JLabel("SQL:");

        url = new JTextField(DEFAULT_CONNETION_URL);
        url.getDocument().addDocumentListener(new DocumentListener() {

            @Override
            public void insertUpdate(DocumentEvent e) {
                changedUpdate(e);
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                changedUpdate(e);
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                DBUtils.instance.setUrl(url.getText());
            }
        });

        query = new JTextField(DEFAULT_QUERY);

        panel2 = new Panel(new GridLayout(2,2));
        panel2.add(url_l);
        panel2.add(url);
        panel2.add(query_l);
        panel2.add(query);

        okButton  = new Button("OK"); 
        resetButton = new Button("Reset");
        exitButton = new Button("Exit");

        panel3 = new Panel(new FlowLayout());
        panel3.add(okButton);
        panel3.add(resetButton);
        panel3.add(exitButton);

        table = new JTable();
		table.setModel(model);
        sp = new JScrollPane(table);

        panel1 = new Panel(new BorderLayout());
        panel1.add(panel2,BorderLayout.NORTH);
        panel1.add(panel3,BorderLayout.SOUTH);
        panel1.add(sp,BorderLayout.CENTER);
        add(panel1);

        setSize(1280, 720);

        // EVENT
        okButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                String q = query.getText();
                ArrayList<Table1> entities = null;
                if(q.equalsIgnoreCase("SELECT * FROM Table1"))
                    entities = (ArrayList<Table1>) repository.findAll();
                else
                    entities = (ArrayList<Table1>) repository.customQuery(q);
                if(entities == null)
                    entities = (ArrayList<Table1>) repository.findAll();
                clearTable();
                for(Table1 entity : entities) {
                    Object[] row = new Object[] {entity.getId().toString(), entity.getName(), entity.getAddress(), entity.getTotal().toString()};
                    model.addRow(row);
                }
            }
            
        });

        resetButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                url.setText(DEFAULT_CONNETION_URL);
                query.setText(DEFAULT_QUERY);
                clearTable();
            }
            
        });

        exitButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
            
        });
    }

    private final Table1Repository repository;

    public Menu(Table1Repository repository) {
        this.repository = repository;
        init();
    }
}
