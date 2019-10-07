import java.util.LinkedList;

public class LLStack<T> implements Stack<Upgrades> 
{
  private LinkedList<Upgrades> _stack;

  //constructor
  public LLStack() 
  {   
    _stack = new LinkedList<Upgrades>();
  }


  //means of insertion
  public void push( Upgrades s ) 
  {
    _stack.addFirst(s);
  }


  //means of viewing top element without removing
  public Upgrades peek( ) 
  {
    if (_stack.isEmpty()) {
      return null;
    }

    return _stack.getFirst();
  }


  //means of removal
  public Upgrades pop( )
  {
    if (_stack.isEmpty()) {
      return null;
    }

    return _stack.removeFirst();
  }


  //chk for emptiness
  public boolean isEmpty() 
  {
    return (_stack.size()==0);
  }
  
  public int size() {
    return _stack.size();
  } 
}