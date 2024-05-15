function fn() {
  karate.configure('driver', { type: 'chrome' });

  return {
    // baseUrl: 'https://coffee-cart.app/'
    baseUrl: 'http://localhost:5173/'
  };
}