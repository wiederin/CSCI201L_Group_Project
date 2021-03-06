package Scraping;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Vector;

public class Department {
	public Vector<Course> courses = new Vector<Course>();
//	private String name = "";
	public String acronym = "";
	
	public Department(String acro) {
		String filename = System.getProperty("user.dir") + "\\classCSV\\" + acro + ".csv";
		acronym = acro;
		courses = parseCourses(filename);
	}
	
	public void printInfo() {
		System.out.println(acronym + ": ");
		for (int i = 0; i < courses.size(); i++) {
			System.out.println("	at " + i + " " + courses.get(i).name);
		}
	}

	
	
	
	// PRIVATE HELPER FUNCTIONS BELOW
	private static Vector<Course> parseCourses(String filename) {
		Vector<Course> courses = new Vector<Course>();
		String line = "";
		String[] parts = null;
		try {
			FileReader fr = new FileReader(filename);
			BufferedReader br = new BufferedReader(fr);
			line = br.readLine();
			line = br.readLine();
			try {
				while (line != null) {
					parts = Algorithms.readCSV(line);
	
					if (parts[0].contentEquals("'")) {
						System.out.println("Early return " + filename + " " + line);
						return courses;
					}
					
					// Create new course if the first few columns are blank
					if (parts[0].length() != 0 && parts[1].length() != 0 && parts[3].length() != 0) {
						courses.add(new Course(parts[0], parts[1], parts[3]));
					}
					Course course = courses.get(courses.size()-1);
		
					if (parts[5].length() != 0) 
						course.addSection(new Section(parts, course));
		
					line = br.readLine();	
				}
				br.close();
			} catch (Exception e) {
//				System.out.println("Error in Department for " + filename + ": " + e.getMessage());
//				System.out.println(line);
				return courses;
			}
			br.close();
			fr.close();	
		} catch (FileNotFoundException fnfe) {
			System.out.println("The file " + filename + " cannot be found. \n");
			return courses;
		} catch (IOException ioe) {
			System.out.println("Input/Output Error: " + ioe.getMessage() + "\n");
			return courses;
		} catch (Exception e) {
			System.out.println("Error in Department for " + filename + ": " + e.getMessage());
			System.out.println(line);
			for (int i = 0; i < parts.length; i++) 
				System.out.println(i + ": " + parts[i]);
			return courses;
		}
		return courses; 
	}
}

}
