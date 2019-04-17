package Scraping;
import java.util.Vector;

public class Course {
	public Vector<Section> sections = new Vector<Section>();
	public String name = ""; // CSCI-201
	public String department = ""; // CSCI
	public String courseNum = ""; // 201
	public String title = ""; // Principles of Software Development
	public String units; // 4
	Course(String _name, String _title, String _units) {
		name = _name;
		try {
			boolean first = true;
			for (int i = 0; i < _name.length(); i++) {
				if (_name.charAt(i) != '-') {
					if(first)
						department += _name.charAt(i);
					else {
						if (Character.isDigit(_name.charAt(i)))
							courseNum += _name.charAt(i);
					}
				}
				else 
					first = false;
			}
			
			title = _title;
			
			String[] parts = _units.split(".0");
			units = parts[0];
		} catch (Exception e) {
			System.out.println("e here");
		}
		
	}

	
	public Vector<Section> getSections() {
		return sections;
	}
	
	void addSection(Section s) {
		sections.add(s);
	}
	
	public void printInfo() {
		System.out.println(name + ": " + title + " (" + units + ")");
		for (int i = 0; i < sections.size(); i++) {
			System.out.print("\t");
			sections.get(i).printInfo();
		}
	}

}
