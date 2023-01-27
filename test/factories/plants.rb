FactoryBot.define do
  factory :corn_plant, class: Plant do
    sequence(:name) { |n| "Corn plant - TEST#{n.to_s.rjust(8, '0')}" }
    born_at { DateTime.new(2017, 6, 1) }
    variety { :zea_mays }
    specie_variety { { specie_variety_name: 'LG421' } }
    initial_shape { Charta.new_geometry('SRID=4326;MULTIPOLYGON(((-0.795813610326211 45.8205957862591,-0.796039968963344 45.8205828323007,-0.796285406116672 45.8205829853426,-0.796451232204462 45.8205975874953,-0.796639180256122 45.8206431168879,-0.79678079528628 45.8206784542921,-0.796972388676841 45.8207400331013,-0.797203376418586 45.820831360075,-0.79751032635519 45.8209575250831,-0.797508183685882 45.8209847089986,-0.797421195292796 45.8210811252536,-0.797339125554787 45.8211509582915,-0.79717729692529 45.8212538260653,-0.796981023449487 45.8213710618059,-0.796884608739417 45.8214342928924,-0.796741619325664 45.8215388818335,-0.796667559442296 45.8216078931083,-0.796609677762291 45.8216742811101,-0.796506706238385 45.8218366206638,-0.796448637836323 45.8219468807304,-0.796420800461729 45.8220194124411,-0.796379982292342 45.8221798015553,-0.796354098133948 45.822359807768,-0.79628180662272 45.8227833798389,-0.796205503794167 45.8231812812963,-0.79619830634836 45.8232694471843,-0.796204108153025 45.8233703201435,-0.796226457546871 45.8234634710852,-0.796288807752085 45.8235665176527,-0.796376938482634 45.8236807675673,-0.796587882761538 45.8239402184613,-0.796735284499057 45.8241139731345,-0.796427773642651 45.8241703243376,-0.795361631767107 45.8243684312051,-0.794610526286386 45.824509219059,-0.794564940198568 45.8244828611297,-0.794289578075544 45.8239404144451,-0.793812112941896 45.8231619747002,-0.79363030833737 45.8228811262426,-0.793433331998411 45.8225432815801,-0.793235013002678 45.8221230169453,-0.79304631956042 45.8217412277264,-0.792821551014374 45.8213111278754,-0.792689532008635 45.8210891058195,-0.793229924237788 45.8208686373126,-0.793376218682722 45.820840961487,-0.793476079904901 45.8208216421079,-0.793699717113796 45.8207647283451,-0.793883069844914 45.8207180611793,-0.794085637474176 45.8206775704671,-0.794281490309338 45.8206578988386,-0.79445801755721 45.8206476008046,-0.79513097566005 45.8206244957228,-0.795813610326211 45.8205957862591)))') }

    association :variant, factory: :corn_plant_variant

    after(:create) do |instance|
      create :product_reading,
             product: instance,
             indicator_name: :shape,
             indicator_datatype: :multi_polygon,
             multi_polygon_value: instance.initial_shape
    end

    after(:build) do |plant|
      plant.activity_production = create :corn_activity_production, started_on: plant.born_at&.to_date
    end
  end

  factory :plant, class: Plant do
    association :activity_production, factory: :activity_production
    sequence(:name) { |n| "Plant - TEST#{n.to_s.rjust(8, '0')}" }
    variety { :triticum }
    specie_variety { { specie_variety_name: 'Apache' } }
    initial_shape { Charta.new_geometry('SRID=4326;MULTIPOLYGON(((-0.795813610326211 45.8205957862591,-0.796039968963344 45.8205828323007,-0.796285406116672 45.8205829853426,-0.796451232204462 45.8205975874953,-0.796639180256122 45.8206431168879,-0.79678079528628 45.8206784542921,-0.796972388676841 45.8207400331013,-0.797203376418586 45.820831360075,-0.79751032635519 45.8209575250831,-0.797508183685882 45.8209847089986,-0.797421195292796 45.8210811252536,-0.797339125554787 45.8211509582915,-0.79717729692529 45.8212538260653,-0.796981023449487 45.8213710618059,-0.796884608739417 45.8214342928924,-0.796741619325664 45.8215388818335,-0.796667559442296 45.8216078931083,-0.796609677762291 45.8216742811101,-0.796506706238385 45.8218366206638,-0.796448637836323 45.8219468807304,-0.796420800461729 45.8220194124411,-0.796379982292342 45.8221798015553,-0.796354098133948 45.822359807768,-0.79628180662272 45.8227833798389,-0.796205503794167 45.8231812812963,-0.79619830634836 45.8232694471843,-0.796204108153025 45.8233703201435,-0.796226457546871 45.8234634710852,-0.796288807752085 45.8235665176527,-0.796376938482634 45.8236807675673,-0.796587882761538 45.8239402184613,-0.796735284499057 45.8241139731345,-0.796427773642651 45.8241703243376,-0.795361631767107 45.8243684312051,-0.794610526286386 45.824509219059,-0.794564940198568 45.8244828611297,-0.794289578075544 45.8239404144451,-0.793812112941896 45.8231619747002,-0.79363030833737 45.8228811262426,-0.793433331998411 45.8225432815801,-0.793235013002678 45.8221230169453,-0.79304631956042 45.8217412277264,-0.792821551014374 45.8213111278754,-0.792689532008635 45.8210891058195,-0.793229924237788 45.8208686373126,-0.793376218682722 45.820840961487,-0.793476079904901 45.8208216421079,-0.793699717113796 45.8207647283451,-0.793883069844914 45.8207180611793,-0.794085637474176 45.8206775704671,-0.794281490309338 45.8206578988386,-0.79445801755721 45.8206476008046,-0.79513097566005 45.8206244957228,-0.795813610326211 45.8205957862591)))') }

    association :variant, factory: :plant_variant

    after(:create) do |instance|
      create :product_reading,
             product: instance,
             indicator_name: :shape,
             indicator_datatype: :multi_polygon,
             multi_polygon_value: instance.initial_shape
    end
  end
end
