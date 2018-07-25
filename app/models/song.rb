class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  validates :artist_id, presence: true
  validates :genre_id, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
      self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(arr)
    # self.notes.content = []
    if arr != ''
      arr.each do |t|
      # binding.pry
        if t != ''
        self.notes << Note.find_or_create_by(content: t)
        end
      end
    else
      self.notes << "Give notes!"
    end
  end

  def note_contents
    arr = []
    self.notes.select do |c|
      if c != ""
        arr << c.content
      end
    end
    arr
  end

end
