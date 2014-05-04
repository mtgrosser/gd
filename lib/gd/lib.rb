module GD
  
  module LIB
    extend Fiddle::Importer
  
    dlload case RbConfig::CONFIG['arch']
    when /darwin/ then 'libgd.dylib'
    when /mswin32/, /cygwin/ then 'bgd.dll'
    else
      'libgd.so.2'
    end

    extern 'void* gdImageCreateFromPng(void *)'
    extern 'void* gdImageCreateFromGif(void *)'
    extern 'void* gdImageCreateFromJpeg(void *)'
    extern 'void* gdImageDestroy(void *)'
    
    typedef_struct_gdImageStruct = [
      'unsigned char **pixels',
      'int sx',
      'int sy',
      'int colorsTotal',
      'int red[256]',
      'int green[256]',
      'int blue[256]',
      'int open[256]',
      'int transparent',
      'int* polyInts',
      'int polyAllocated',
      'void* brush',
      'void* tile',
      'int brushColorMap[256]',
      'int tileColorMap[256]',
      'int styleLength',
      'int stylePos',
      'int *style',
      'int interlace',
      'int thick',
      'int alpha[256]',
      'int trueColor',
      'int** tpixels',
      'int alphaBlendingFlag',
      'int saveAlphaFlag',
      # There should NEVER BE ACCESSOR MACROS FOR ITEMS BELOW HERE, so this
    	# part of the structure can be safely changed in new releases.
      'int AA',
      'int AA_color',
      'int AA_dont_blend',
      'int cx1',
      'int cy1',
      'int cx2',
      'int cy2',
      'unsigned int res_x',
      'unsigned int res_y',
      'int paletteQuantizationMethod',
      'int paletteQuantizationSpeed',
      'int paletteQuantizationMinQuality',
      'int paletteQuantizationMaxQuality'
    ]
    #  'gdInterpolationMethod interpolation_id',
    #  'interpolation_method interpolation'
    
    ImageStruct = struct(typedef_struct_gdImageStruct)
  end
end
