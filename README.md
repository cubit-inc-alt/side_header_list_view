
# side_header_list_view

[![pub package](https://img.shields.io/pub/v/side_header_list_view.svg)](https://pub.dartlang.org/packages/side_header_list_view)  
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/renefloor)

Listview with sticky headers like the Android contact page



![alt text](https://raw.githubusercontent.com/renefloor/side_header_list_view/master/example.gif "Example for SideHeaderListView")

![alt text](https://raw.githubusercontent.com/renefloor/side_header_list_view/master/example_horizontal.gif "Example for SideHeaderListView for horizontal")

## Usage


````  
 new SideHeaderListView( // Set how many items the list has itemCount: items.length,     // Set the height of the item widgets. For now this has to be a fixed height  
 itemExtend: 150.0,     // Set the header builder, this needs to return the widget for the side header  
 headerBuilder: (BuildContext context, int index){ return new HeaderWidget(items[index].startDate); },     // Set the item builder, this is everything in the row without the header  
 itemBuilder: (BuildContext context, int index){ return new ListItem(items[index]); },     // HasSameHeader will be used to know whether the header has to be shown for a position   
    hasSameHeader: (int a, int b){  
 return items[a].day == items[b].day; }, );````  
## Example for horizontal scroll  
  
  ````  SizedBox( 
	  height: 160, 
	  child: new SideHeaderListView( 
		  itemCount: names.length, 
		  padding: EdgeInsets.all(16.0), 
		  itemExtend: 120.0, 
		  isHorizontal: true, 
		  headerBuilder: (BuildContext context, int index) { 
			  return new Container( 
				  width: 60, 
				  alignment: Alignment.center, 
				  child: new Text( names[index].substring(0, 1), 
				  style: Theme.of(context).textTheme.headlineMedium, 
				  ), 
			  );
		  }, 
		  horizontalAxisAlignment: MainAxisAlignment.start, 
		  itemBuilder: (BuildContext context, int index) { 
			  return Container( 
			  width: 200, 
			  height: 100, 
			  alignment: Alignment.center, 
			  child: Text( names[index], 
					  style: Theme.of(context).textTheme.headlineMedium, 
				  ), 
			  ); 
		  }, 
		  dividerBuilder: (BuildContext context, int index) { 
			  return new Container( 
				  width: 1.0, 
				  height: double.infinity, 
				  color: Colors.grey.shade300, 
			  )         
		  },  
		 hasSameHeader: (int a, int b) { 
			 return names[a].substring(0, 1) == names[b].substring(0, 1); 
		 }, 
	 ), 
 );
 ````  
