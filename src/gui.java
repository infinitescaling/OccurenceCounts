import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;


public class gui extends JFrame{

String inputFile, wordList; 

	public gui()
	{
		super("GUI");
		this.setLayout(new GridBagLayout());
		GridBagLayout gridbag = new GridBagLayout();
		GridBagConstraints c = new GridBagConstraints();


		JPanel buttonPanel = new JPanel();

		buttonPanel.setLayout(gridbag);
		
		c.gridx = 1;
		c.gridy = 0;
		add(buttonPanel,c);
	
		JButton inputFile = new JButton("inputFile");
		JButton wordList = new JButton("wordList");
		JButton output = new JButton("output to output.txt");
		
		buttonPanel.add(inputFile);
		buttonPanel.add(wordList);
		buttonPanel.add(output);
		
		inputFile.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent e) {
				final JFileChooser fc = new JFileChooser();
				
				int returnVal = fc.showOpenDialog(null);
				File f = null; 
		        if(returnVal == JFileChooser.APPROVE_OPTION) {
		        	f = fc.getSelectedFile();
		        }
		        
		        gui.this.inputFile = f.getAbsolutePath();
			}
		
		
		});
		wordList.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent e) {
				final JFileChooser fc = new JFileChooser();
				
				int returnVal = fc.showOpenDialog(null);
				File f = null; 
		        if(returnVal == JFileChooser.APPROVE_OPTION) {
		        	f = fc.getSelectedFile();
		        }
		        
		        gui.this.wordList = f.getAbsolutePath();
			}
		
		
		});
		
		output.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent e) {
				if(gui.this.inputFile.equalsIgnoreCase("") || gui.this.inputFile.equalsIgnoreCase(null) || 
						gui.this.wordList.equalsIgnoreCase("") || gui.this.wordList.equalsIgnoreCase(null))
					JOptionPane.showMessageDialog (null, "Invalid input files", "Error", JOptionPane.INFORMATION_MESSAGE);

				else{
					try {
//						System.out.println("ruby occurence.rb " + gui.this.inputFile + " " + gui.this.wordList + " " + ">>" + "output.txt");
						Runtime.getRuntime().exec("ruby occurence.rb " + gui.this.inputFile + " " + gui.this.wordList);
						JOptionPane.showMessageDialog (null, "Successful", "Success", JOptionPane.INFORMATION_MESSAGE);
					} 
					catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
		
		
		});
		
	}
	
	
	
	public static void main(String[] args){

  		final JFrame newGui = new gui();
  		newGui.setSize(600,300);
  		newGui.setMinimumSize(new Dimension(600, 300));
  		newGui.setVisible(true);
  		newGui.setResizable(true);
		newGui.setLocationRelativeTo(null);
		newGui.setDefaultCloseOperation(EXIT_ON_CLOSE);
		newGui.pack();

	}
	
}
