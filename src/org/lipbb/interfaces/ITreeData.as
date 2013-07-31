package org.lipbb.interfaces
{
	import mx.collections.ArrayCollection;

	public interface ITreeData
	{
		function get children():ArrayCollection;
		function set children(value:ArrayCollection):void;
	}
}