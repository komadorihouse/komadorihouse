class Author < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'おの たくや' },
    { id: 2, name: '小野 惇子' },
    { id: 3, name: 'Kinari' },
    { id: 4, name: 'ASA' },
    { id: 5, name: '円' },
    { id: 6, name: 'おの たくや/小野 惇子' },
    { id: 7, name: '小野 惇子/おの たくや' },
    { id: 8, name: '小野 惇子/Kinari' }
  ]
end