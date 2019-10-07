public class PriorityQueue {

  private ArrayList<Enemy> data;

  public PriorityQueue() {
    data = new ArrayList< Enemy >();
  }

  // Traverses through the whole list and adding to the spot proper spot in its priority rating
  public void add(Enemy d) {
    for (int i = 0; i < data.size(); i++) {
      if (d.getPriority() <= (data.get(i).getPriority()) ) {
        data.add(i, d);
        return;
      }
    }
    data.add(d);
  } //O(n)

  //checks the end of the ArrayList
  public Enemy get(int i) {
    return data.get(i);
  } //O(1)

  public Enemy pop() {
    return data.get(data.size() - 1); 
  }
  // removes from the back of the ArrayList
  public Enemy remove() {
    Enemy ret = data.get(data.size() - 1);
    data.remove(data.size() - 1);
    return ret;
  } //O(1)


  public boolean isEmpty() {
    return data.size() == 0;
  } //O(1)

  public int size() {
    return data.size();
  } //O(1)

//  public String toString() {
//    String ret = "[";
//    for (Enemy x : data) {
//      ret += x.getData() + ", ";
//    }
//    ret += "]";
//    return ret;
  } //O(1)