package org.lipbb.controls.adg
{
	import flash.events.EventDispatcher;
	
	import mx.collections.IHierarchicalData;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	
	/**
	 *  use a flat array to create a tree.
	 * @author lipbb
	 * 
	 */
	public class CustomHierarchicalData extends EventDispatcher implements IHierarchicalData
	{
		public function CustomHierarchicalData(value:Array = null)
		{
			super();
			source = value;
		}

		private var idField:String = "id";
		
		private var parentField:String = "parent";
		
		private var _source:Array;

		public function get source():Array
		{
			return _source;
		}

		public function set source(value:Array):void
		{
			_source = value;
			
			var event:CollectionEvent = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
			event.kind = CollectionEventKind.RESET;
			dispatchEvent(event);
		}
		
		
		public function canHaveChildren(node:Object):Boolean
		{
			return getChildren(node).length > 0;
		}
		
		public function hasChildren(node:Object):Boolean
		{
			return getChildren(node).length > 0;
		}
		
		public function getChildren(node:Object):Object
		{
			var arr:Array = [];
			for each (var obj:Object in _source) 
			{
				if(obj[parentField] == node[idField] && obj[idField] != obj[parentField])
				{
					arr.push(obj);
				}
			}
			
			return arr;
		}
		
		public function getData(node:Object):Object
		{
			return node;
		}
		
		public function getRoot():Object
		{
			var result:Object;
			for each (var obj:Object in _source) 
			{
				if(!obj[parentField] || obj[idField] == obj[parentField])
				{
					result = obj;
				}
			}
			
			return result;
		}
	}
}