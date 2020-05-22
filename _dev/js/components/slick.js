import $ from 'jquery';

export default class SlickSlider {
	static reset() {
		$('[data-slick]').not('.slick-initialized').each(function() {
			let self = $( this );
			if(self.data('count') === 1){
				return;
			}

			self.slick({
				prevArrow:"<i class=\"icon-arrow-left slick-prev slick-arrow\">",
				nextArrow:"<i class=\"icon-arrow-right slick-next slick-arrow\">",
				centerPadding: '0',
				accessibility: true,
				infinite: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				variableWidth: true,
				centerMode: true,
				autoplay: false,
				autoplaySpeed: self.attr('data-interval'),
				pauseOnHover: self.attr('data-pause') === 'hover' ? true : false,
				speed: 500
			});
		});
	}	
	
	init() {
		$('[data-slick]').not('.slick-initialized').each(function() {
			let self = $( this );
			if(self.data('count') === 1){
				return;
			}

			self.slick({
				prevArrow:"<i class=\"icon-arrow-left slick-prev slick-arrow\">",
				nextArrow:"<i class=\"icon-arrow-right slick-next slick-arrow\">",
				centerPadding: '0',
				accessibility: true,
				infinite: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				variableWidth: true,
				centerMode: true,
				autoplay: false,
				autoplaySpeed: self.attr('data-interval'),
				pauseOnHover: self.attr('data-pause') === 'hover' ? true : false,
				speed: 500
			});
		});
	}
}
