int range, x, damage;

main()
{
	/* Start at top right corner */
	DriveToTopRight(); 

	/* main loop */
	while(1) 
	{	  
		damage = damage();

		/* If taking damage then go back up right */
		if(damage != damage())
		{
		  DriveToTopRight();
		}
		else
		{
			findEnemy();
		}
	}	
}

DriveToTopRight() 
{
  /* Dont go past bounds */
  while(loc_x() <= 950|| loc_y() <= 950)
  {
	  if(loc_x() >= 950 && loc_y() <= 950)
	  {
		  /* drive up */
		  drive(0,0);
		  drive(90,50);
	  }
	  else if(loc_x() <= 950 && loc_y() >= 950)
	  {
		  /* drive right */
		  drive(0,0);
		  drive(0,50);
	  }
	  else
	  {
		  /*drive diagonally*/
		  drive(45,100);
	  }
  }
} 

findEnemy()
{	
	/* see if enemy is found */
	if (scan(x,10) != 0)
	{
		/* Increment degrees of scan in var x*/
		x += 5-(scan(x-5,5) != 0) * 10;

		/* See if enemy is greater than 20 units away */
		if ((range=scan(x,10)) > 20)
		{
			cannon(x, range);
			
			/* Follow enemy if they are out of range */
			if (range > 250)
			{
				drive(x,100);
			}
			
			/* Stop moving if enemy is in range */
			else
			{
				drive(180-x,0);
			}
		}
		
		x-=20;
	}

	else
	{
		x+=20;
	}
}


