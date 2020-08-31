class MP3Importer


    attr_accessor :path, :files

    def initialize(filepath)
        @path = filepath
    end

    

    def files
        new_files = []
        Dir.glob("#{@path}/*.mp3") {|file| 
        new_files << file}
        new_files.map {|file| 
        file.slice!("#{@path}" + "/") 
        file}
        return new_files
    end

    def import 
        self.files.each {|file| Song.new_by_filename(file)}
    end


    



end