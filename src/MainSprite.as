package 
{
	import flash.display.Bitmap;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class MainSprite extends Sprite
	{
		[Embed(source='./resources/bg.png')]
		private static var BG1:Class;
		
		[Embed(source='./resources/bg2x.png')]
		private static var BG2:Class;
		
		[Embed(source='./resources/kurage.png')]
		private static var KURAGE1:Class;
		
		[Embed(source='./resources/kurage2x.png')]
		private static var KURAGE2:Class;
		
		public function MainSprite()
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, function(e:Event):void {
				var bg:Image;
				var kurage:Image;
				var scale_factor:Number = Starling.current.contentScaleFactor;
				
				// ScaleFactorに応じた画像を読み込む
				if(scale_factor == 1) {
					bg = createImage(BG1, 1);
					kurage = createImage(KURAGE1, 1);
				} else if(scale_factor <= 2) {
					bg = createImage(BG2, 2);
					kurage = createImage(KURAGE2, 2);
				} else throw new Error("このサンプルは、ScaleFactorが2より大きい場合には対応していません");
				
				addChild(bg);
				
				kurage.x = 150;
				kurage.y = 200;
				addChild(kurage);				
			});
		}
		
		private function createImage(bitmap_class:Class, scale_factor:Number):Image {
			return new Image( Texture.fromBitmap(new bitmap_class(), true, false, scale_factor) ) ;
		}
		
	}
}