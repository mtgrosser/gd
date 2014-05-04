__END__

class Mem
  def test
    500.times do
      Dir['/Volumes/Media/Photos/2014/la palma 2014/resized/*.jpg'].map { |p| GD::Image.import(p) }
    end
  end
end