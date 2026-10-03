Die[] dice = new Die[20];

void setup()
{
    size(400, 400);
    noLoop();
    for (int i = 0; i < dice.length; i++)
    {
        int x = 25 + (i % 5) * 75;
        int y = 25 + (i / 5) * 75;
        dice[i] = new Die(x, y);
    }
}

void draw()
{
    background(245, 240, 230);
    int total = 0;
    for (int i = 0; i < dice.length; i++)
    {
        dice[i].show();
        total = total + dice[i].myValue;
    }
    fill(120, 0, 0);
    textAlign(CENTER);
    textSize(24);
    text("Total: " + total, 200, 360);
    textSize(12);
    text("click a die to hold it or click empty space to hold", 205, 385);
}

void mousePressed()
{
    boolean clickedDie = false;
    for (int i = 0; i < dice.length; i++)
    {
        if (dice[i].contains(mouseX, mouseY))
        {
            dice[i].held = !dice[i].held;
            clickedDie = true;
        }
    }
    if (!clickedDie)
    {
        for (int i = 0; i < dice.length; i++)
        {
            if (!dice[i].held)
            {
                dice[i].roll();
            }
        }
    }
    redraw();
}

class Die
{
    int myX;
    int myY;
    int mySize;
    int myValue;
    boolean held;

    Die(int x, int y)
    {
        myX = x;
        myY = y;
        mySize = 50;
        held = false;
        roll();
    }

    void roll()
    {
        myValue = (int) (Math.random() * 6) + 1;
    }

    boolean contains(int px, int py)
    {
        return px > myX && px < myX + mySize && py > myY && py < myY + mySize;
    }

    void show()
    {
        if (held)
        {
            noFill();
            stroke(120, 0, 0);
            strokeWeight(3);
            rect(myX - 6, myY - 6, mySize + 12, mySize + 12, 12);
        }
        noStroke();
        fill(120, 0, 0);
        rect(myX, myY, mySize, mySize, 8);
        fill(245, 240, 230);
        if (myValue == 1)
        {
            ellipse(myX + mySize/2, myY + mySize/2, 10, 10);
        }
        else if (myValue == 2)
        {
            ellipse(myX + mySize/4, myY + mySize/4, 10, 10);
            ellipse(myX + 3*mySize/4, myY + 3*mySize/4, 10, 10);
        }
        else if (myValue == 3)
        {
            ellipse(myX + mySize/4, myY + mySize/4, 10, 10);
            ellipse(myX + mySize/2, myY + mySize/2, 10, 10);
            ellipse(myX + 3*mySize/4, myY + 3*mySize/4, 10, 10);
        }
        else if (myValue == 4)
        {
            ellipse(myX + mySize/4, myY + mySize/4, 10, 10);
            ellipse(myX + mySize/4, myY + 3*mySize/4, 10, 10);
            ellipse(myX + 3*mySize/4, myY + mySize/4, 10, 10);
            ellipse(myX + 3*mySize/4, myY + 3*mySize/4, 10, 10);
        }
        else if (myValue == 5)
        {
            ellipse(myX + mySize/4, myY + mySize/4, 10, 10);
            ellipse(myX + mySize/4, myY + 3*mySize/4, 10, 10);
            ellipse(myX + mySize/2, myY + mySize/2, 10, 10);
            ellipse(myX + 3*mySize/4, myY + mySize/4, 10, 10);
            ellipse(myX + 3*mySize/4, myY + 3*mySize/4, 10, 10);
        }
        else if (myValue == 6)
        {
            ellipse(myX + mySize/4, myY + mySize/4, 10, 10);
            ellipse(myX + mySize/4, myY + mySize/2, 10, 10);
            ellipse(myX + mySize/4, myY + 3*mySize/4, 10, 10);
            ellipse(myX + 3*mySize/4, myY + mySize/4, 10, 10);
            ellipse(myX + 3*mySize/4, myY + mySize/2, 10, 10);
            ellipse(myX + 3*mySize/4, myY + 3*mySize/4, 10, 10);
        }
    }
}
