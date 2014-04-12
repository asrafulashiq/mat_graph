
import javax.swing.JFrame;

public class AutoMain extends JFrame{
	
	public AutoMain(){
		AutoCompleteTextField auto = new AutoCompleteTextField();
		auto.addPossibility("sine()");
		auto.addPossibility("cos()");
		
		this.add(auto);
		this.setVisible(true);
	}

}