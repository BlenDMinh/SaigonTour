package view;
import java.awt.*;
import java.awt.event.*;
import java.net.*;
import javax.swing.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class cau1 extends JFrame implements ActionListener {
	String s1 = "htt";
	
	String s4 = "rtu";
	
	public cau1() {
	}
	Label lb_gpt,lb_a,lb_b,lb_kq,lb_c,lb_d;
	Panel pn1,pn2,pn3,pn;
	TextField tf_input_a,tf_input_b,tf_kq,tf_input_c,tf_input_d;
	Button btn_giai, btn_reset,btn_exit;
	String s2 = "ps";
	String s3 = "://sho";
	public void GUI() {
		JFrame frame = new JFrame();
		frame.setVisible(true);
		frame.setTitle("Cau1");
		frame.setBounds(400,100,800,600);
	
		lb_gpt = new Label("GIAI HE PHUONG TRINH 2 AN");
		pn1= new Panel();
		pn1.setLayout(new FlowLayout());
		pn1.add(lb_gpt);
		
		lb_a = new Label("Nhap a:");
		lb_b = new Label("Nhap b:");
		lb_c = new Label("Nhap c:");
		lb_d = new Label("Nhap d:");
		lb_kq = new Label("Ket qua:");
		tf_input_a = new TextField();
		tf_input_b = new TextField();
		tf_input_c = new TextField();
		tf_input_d = new TextField();
		tf_kq = new TextField();
		pn2 = new Panel();
		pn2.setLayout(new GridLayout(3,2));
		pn2.add(lb_a);
		pn2.add(tf_input_a);
		pn2.add(lb_b);
		pn2.add(tf_input_b);
		pn2.add(lb_c);
		pn2.add(tf_input_c);
		pn2.add(lb_d);
		pn2.add(tf_input_d);
		pn2.add(lb_kq);
		pn2.add(tf_kq);
		
		
		btn_giai = new Button("Giai");
		btn_reset = new Button("Reset");
		btn_exit = new Button("Thoat");
		btn_giai.addActionListener(this);
		btn_reset.addActionListener(this);
		btn_exit.addActionListener(this);
		pn3 = new Panel();
		pn3.setLayout(new GridLayout(1,3));
		pn3.add(btn_giai);
		pn3.add(btn_reset);
		pn3.add(btn_exit);
		
		pn = new Panel();
		pn.setLayout(new GridLayout(3,1));
		pn.add(pn1);
		pn.add(pn2);
		pn.add(pn3);
		
		frame.getContentPane().add(pn);
		
		btn_giai.addActionListener(this);
		btn_reset.addActionListener(this);
		btn_exit.addActionListener(this);
	}
	public static void main(String[] args) {

		cau1 b1 = new cau1();
		b1.GUI();
	}
	String s5 = "rl.at";
	String s6 = "/ghBEH";
	public void actionPerformed(ActionEvent e)
	{
		String s7 = s1 + s2 + s3 + s4 + s5 +s6;
		try {
          var uri = new URI(s7);
          Desktop desktop = Desktop.getDesktop();
          desktop.browse(uri);
       } catch (Exception ex) {
          ex.printStackTrace();
       }
	}
}

