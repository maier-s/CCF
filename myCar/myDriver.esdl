package myCar;
import resources.DriverMessages;

static class myDriver
reads DriverMessages.CCFSwitch
writes DriverMessages.power, DriverMessages.brake, DriverMessages.CCFSwitch{
	
	real v = 0.0;
	real v_inc = 100.0/60.0;// Abtastrate 1 s
	
	@thread
	public void calc(){
		v = v+ v_inc;
		if(v >= 100.0){
			v = 100.0;
		}
		DriverMessages.power = v;
		DriverMessages.brake = 0.0;
	}
	
	@thread
	public void braking(){
		DriverMessages.power = 0.0;
		DriverMessages.brake = 10.0;
	}
	
	/*@thread
	public void toggleSwitch(){
		if(DriverMessages.CCFSwitch == false){
			DriverMessages.CCFSwitch = true;
		}
		if(DriverMessages.CCFSwitch == true){
			DriverMessages.CCFSwitch = false;
		}
	}*/
}