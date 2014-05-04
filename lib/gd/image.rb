module GD
  class Image
    include Base

    class << self
      protected :new
      
      def import(filename, options = {})
        format = options.delete(:format)
        format = format.to_s.downcase if format
        raise ArgumentError, "Unsupported format '#{format}'" if format && !FORMATS.include?(format)
        format ||= format_from_filename(filename) || format_from_magic(File.binread(filename, 4))
        method = { PNG => :gdImageCreateFromPng, JPEG => :gdImageCreateFromJpeg, GIF => :gdImageCreateFromGif }[format]
        if ptr = File.open(filename, 'rb') { |f| GD::LIB.public_send(method, f) } and not ptr.null?
          ptr.free = GD::LIB['gdImageDestroy']
          struct = LIB::ImageStruct.new(ptr)
          if struct.trueColor.zero?
            IndexedColorImage.new(struct)
          else
            TrueColorImage.new(struct)
          end
        end
      end
    
      private
    
      def format_from_filename(filename)
        extension = File.extname(filename).downcase[1..-1]
        extension = JPEG if 'jpg' == extension
        extension if FORMATS.include?(extension)
      end
    
      def format_from_magic(data)
        case data
        when /\A\xFF\xD8/n then JPEG
        when /\A\x89PNG/n  then PNG
        when /\AGIF8/n     then GIF
        end
      end
      
    end
    
    def initialize(struct)
      raise ArgumentError, 'No struct given' unless struct
      @struct = struct
    end
    
    def true_color?
      not struct.trueColor.zero?
    end
    
    def width
      struct.sx
    end
    
    def height
      struct.sy
    end
      
  end
  
  class IndexedColorImage < Image
    private_class_method :import
  end
  
  class TrueColorImage < Image
    private_class_method :import
  end
end
