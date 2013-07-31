package org.lipbb.utils
{
	
	import mx.collections.ArrayCollection;
	
	import org.lipbb.interfaces.ITreeData;

	public class TreeDataCreator
	{
		public function TreeDataCreator()
		{
		}
		
		/**
		 * 将列表数据转化成树形结构(ArrayCollection).<br/>
		 * 根节点的父id应为null或者该节点本身id
		 *  
		 * @param source 源数据列表
		 * @param idField 每条数据的id字段名称，默认值 "id"
		 * @param parentField 数据的父id字段名称，默认值 "parent"
		 * @return 树形结构的ArrayCollection, 每项有children字段，存放子节点
		 * 
		 */
		public static function toTreeAC(source:ArrayCollection, idField:String = "id", parentField:String = "parent"):ArrayCollection
		{
			var temp:Array = source.source.slice();
			
			var ac:ArrayCollection = new ArrayCollection();
			var item:ITreeData;
			var i:int = 0;
			
			for each (item in temp) 
			{
				if(!item[parentField] || item[parentField] == item[idField])
				{
					temp.splice(i, 1);
					break;
				}
				i++;
			}
			
			ac.addItem(item);
			addChildren(item, temp, idField, parentField);
			
			return ac;
		}
		
		private static function addChildren(parent:ITreeData, source:Array, idField:String, parentField:String):void
		{
			var i:int = 0;
			parent.children = new ArrayCollection();
			
			for (i = 0; ;) 
			{
				if(i >= source.length)
					break;
				
				var item:ITreeData = source[i];
				if(item[parentField] == parent[idField])
				{
					parent.children.addItem(item);
					source.splice(i, 1);
				}
				else
				{
					i++;
				}
			}
			
			if(parent.children.length == 0)
			{
				parent.children = null; //叶节点(如果不设置为null，显示为没有子节点的枝干节点)
			}
			else
			{
				for each (var child:ITreeData in parent.children) 
				{
					addChildren(child, source, idField, parentField);
				}
			}
		}
	}
}