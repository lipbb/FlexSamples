package org.lipbb.vo
{
	import mx.collections.ArrayCollection;
	
	import org.lipbb.interfaces.ITreeData;
	
	[Bindable]
	public class TreeItem implements ITreeData
	{
		public function TreeItem()
		{
		}
		
		public var ID:String;
		
		public var name:String;
		
		public var parent:String;
		
		private var _children:ArrayCollection;
		
		[Transient]
		public function get children():ArrayCollection
		{
			return _children;
		}
		
		public function set children(value:ArrayCollection):void
		{
			_children = value;
		}
		
		public function toString():String
		{
			var s:String = "{id:" + ID + ", name:" + name + ", parent:" + parent + ", children:[";
			var item:TreeItem;
			for each (item in _children) 
			{
				s += item.toString() + ", ";
			}
			if(item)
				s = s.substring(0, s.length - 2);
			s += "]}";
			
			return s;
		}
	}
}