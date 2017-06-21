package edu.mum.coffee.utilities;

import java.text.DateFormat;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Locale;

public class Utility {

	private static DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT,
			Locale.US);
	private static DateFormat tf = DateFormat.getTimeInstance(DateFormat.SHORT,
			Locale.US);
	
	public static Date getDate()
	{
		return Date.from(LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
	}
	
	public static Date getDateFromString(String strDate)
	{
		String[] d = strDate.split("-");
		Date customDate = null;
		try {
			customDate = df.parse(d[0] + "/" + d[1] + "/" + d[2]);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return customDate;
	}
	
	public static Date getTimeFromString(String strDate)
	{		
		Date customTime = null;
		String[] d = strDate.split(":"); 
		
		try {
			
			int hour =Integer.valueOf(d[0]); 
			if( hour > 12)
				customTime = tf.parse(hour - 12 + ":" +d[1] + " PM");
			else if(Integer.valueOf(d[0]) == 12)
				customTime = tf.parse(d[0] + ":" + d[1] +" PM");
			else
				customTime = tf.parse(d[0] + ":" + d[1] +" AM");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return customTime;
	}
	
	public static String getDate(String date) {
		return df.format(getDateFromString(date));
	}
	
	public static String getTime(String time) {
		return tf.format(getTimeFromString(time));
	}	
	
}
