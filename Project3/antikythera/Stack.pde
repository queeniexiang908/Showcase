public interface Stack<P> 
{
    //Return true if this stack is empty, otherwise false.
    public boolean isEmpty();

    //Return top element of stack without popping it.
    public P peek();

    //Pop and return top element of stack.
    public P pop();

    //Push an element onto top of this stack.
    public void  push( P x );

}//end interface