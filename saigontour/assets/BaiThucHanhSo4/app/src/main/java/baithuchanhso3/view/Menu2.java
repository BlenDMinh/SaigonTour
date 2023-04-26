package baithuchanhso3.view;
import java.awt.*;
import javax.swing.*;
import javax.swing.table.*;
import java.awt.event.*;
import java.util.ArrayList;

import baithuchanhso3.model.entity.Student;
import baithuchanhso3.model.repository.StudentRepository;

class ChoiceButton extends JRadioButton {

    public static String selectSQLField = "";
    private static ArrayList<ChoiceButton> choiceButtons = new ArrayList<>();
    public String SQLField;
    public ChoiceButton(String SQLField) {
        super();
        choiceButtons.add(this);
        this.SQLField = SQLField;
        this.setText(SQLField);

        this.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                ChoiceButton button = (ChoiceButton) e.getSource();
                if(button.isSelected()) {
                    for(ChoiceButton b : ChoiceButton.choiceButtons)
                        if(b != button)
                            b.setSelected(false);
                    ChoiceButton.selectSQLField = button.SQLField;
                } else {
                    ChoiceButton.selectSQLField = "";
                }
            }
        });
    }
}

public class Menu2 extends JFrame {
    // UI-COMPONENT
    JLabel label1, fieldValue_l;
    JTextField fieldValue;
    Panel panel1, panel2, panel4;
    Button searchButton, resetButton, exitButton;
    JTable table;
    JScrollPane sp;
    ChoiceButton bId, bName, bDate, bAddress, bGender;

    DefaultTableModel model = new DefaultTableModel(
			null,
			new String[] {"Id", "Name", "Date", "Address", "Gender"}
		);

    private void clearTable() {
        while(model.getRowCount() > 0)
            model.removeRow(0);
    }

    private void init() {
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        fieldValue_l = new JLabel("Input Infomation:");

        fieldValue = new JTextField(50);

        searchButton  = new Button("Search"); 
        resetButton = new Button("Reset");
        exitButton = new Button("Exit");

        panel2 = new Panel(new FlowLayout());
        panel2.add(fieldValue_l);
        panel2.add(fieldValue);
        panel2.add(searchButton);
        panel2.add(resetButton);
        panel2.add(exitButton);

        table = new JTable();
		table.setModel(model);
        sp = new JScrollPane(table);

        bId = new ChoiceButton("Id");
        bName = new ChoiceButton("Name");
        bDate = new ChoiceButton("Date");
        bAddress = new ChoiceButton("Address");
        bGender = new ChoiceButton("Gender");

        panel4 = new Panel(new FlowLayout());
        panel4.add(bId);
        panel4.add(bName);
        panel4.add(bDate);
        panel4.add(bAddress);
        panel4.add(bGender);

        panel1 = new Panel();
        panel1.setLayout(new BoxLayout(panel1, BoxLayout.Y_AXIS));
        panel1.add(panel2);
        panel1.add(panel4);
        panel1.add(sp);
        add(panel1);

        setSize(1280, 720);

        // EVENT
        searchButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                if(ChoiceButton.selectSQLField.isBlank())
                    return;
                ArrayList<Student> students = (ArrayList<Student>) repository.customQuery("SELECT * FROM Student WHERE " + ChoiceButton.selectSQLField + "="+ fieldValue.getText());
                for(Student student : students) {
                    Object[] row = new Object[] {student.getId(), student.getName(), student.getDate(), student.getAddress(), student.getGender()};
                    model.addRow(row);
                }
            }
        });

        resetButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                fieldValue.setText("");
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

    private final StudentRepository repository;

    public Menu2(StudentRepository repository) {
        this.repository = repository;
        init();
    }
}
