//float f = Float.valueOf(str).floatValue();
//Global variables
ArrayList<stars> Data = new ArrayList<stars>(); //array for data of file
int lineNum = 11;



void setup()
{
    size(800, 800);
    
    background(0);
    
    loadData("HabHYG15ly.csv");
    
    for(int i=0; i<Data.size(); i++)
    {
        stars disp = Data.get(i);
        println(disp);
    }//end for
}

void draw()
{
    int hab; 
    String displayname;
    float  distance;
    float  Xg;
    float  Yg;
    float  Zg;
    float  AbsMag;
  
  
  stroke(128,0,128);
  fill(0);
  
  float rx1=width-700,ry1=height-700,rx2=width-100,ry2=height-700;
  float cx1=width-700,cy1=height-700,cx2=width-700,cy2=height-100;
  
  line(rx1,ry1,rx2,ry2);
  line(cx1,cy1,cx2,cy2);
  
  float lineWidth = 600 / 39;
  for(int i=0 ; i< 39 ; i+=1) {
    float x = map(i, Xg, 13, 100, 600);
    float y = map(i, Yg, 20, 100, -600); //h for height line
    ellipse(x, y, 10, 10);
  }
  
  
}

// Function to load data from a table
void loadData(String table)
{
    Table t = loadTable(table);
    
    for(int i=0; i<t.getRowCount(); i++)
    {
        TableRow row = t.getRow(i);
        
        stars cur = new stars(row);
        
        Data.add(cur);
    }//end for
}//end loadData()

class stars
{
    int hab; 
    String displayname;
    float  distance;
    float  Xg;
    float  Yg;
    float  Zg;
    float  AbsMag;
    
    stars(TableRow col)
    {
        this.hab = col.getInt(2);
        this.displayname = col.getString(3);
        this.distance  = col.getFloat (12);
        this.Xg  = col.getFloat (13);
        this.Yg  = col.getFloat (14);
        this.Zg  = col.getFloat (15);
        this.AbsMag  = col.getFloat (16);
    }//end stars
    
    String toString()
    {
        return hab + "\t" + displayname + "\t" + distance + "\t" + Xg + "\t" + Yg + "\t" + Zg + "\t" + AbsMag;
    }//end toString
}//end population