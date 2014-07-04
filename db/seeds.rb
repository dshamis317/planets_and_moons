Planet.create(
  {
    name: 'Earth',
    life: true,
    image_url: 'http://upload.wikimedia.org/wikipedia/commons/6/6f/Earth_Eastern_Hemisphere.jpg'
  }
)

Moon.create(
  {
    name: 'The Moon',
    image_url: 'http://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg',
    planet_id: 1
  }
)
