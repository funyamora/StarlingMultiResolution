package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	
	import starling.core.Starling;
	
	public class StarlingMultiResolution extends Sprite
	{
		const STAGE_WIDTH:uint = 320;
		const STAGE_HEIGHT:uint = 480;
		
		public function StarlingMultiResolution()
		{
			super();
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// フルスクリーンの際の縦横幅を取得
			var screenWidth:int  = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			
			
			// ゲーム画面が縦横比を維持しつつ、スクリーンにフィットするようにViewportの縦横幅を算出する
			var viewport:Rectangle = new Rectangle();
			var stage_aspect_ratio:Number = STAGE_HEIGHT / STAGE_WIDTH;
			var screen_aspect_ration:Number = screenHeight / screenWidth;
			
			if(stage_aspect_ratio < screen_aspect_ration) {
				//ステージの縦横比に比べると縦長
				viewport.width = screenWidth;
				viewport.height = int( (screenWidth / STAGE_WIDTH) * STAGE_HEIGHT );
			} else if(stage_aspect_ratio > screen_aspect_ration) {
				//ステージの縦横比に比べると横長
				viewport.height = screenHeight;
				viewport.width = int( (screenHeight / STAGE_HEIGHT) * STAGE_WIDTH );
			} else {
				//ステージの縦横比と同じ
				viewport.width = screenWidth;
				viewport.height = screenHeight;
			}
			
			//ゲーム画面がセンタリングされるように位置調整
			viewport.x = int( (screenWidth - viewport.width) / 2);
			viewport.y = int( (screenHeight - viewport.height) / 2);
			
			
			var st:Starling = new Starling(MainSprite, stage, viewport);
			st.stage.stageWidth  = STAGE_WIDTH;
			st.stage.stageHeight = STAGE_HEIGHT;
			st.start();
		}
	}
}