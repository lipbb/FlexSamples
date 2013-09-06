package org.lipbb.utils {
import flash.geom.Point;

public class PolygonUtils {
    /**
     *  返回多边形面积
     * @param poly
     * @return
     *
     */
    public static function getArea(poly:Array):Number {
        var n:int = poly.length;
        var surface:Number = 0;
        for (var i:int = 0; i < n; i++) {
            var j:int = (i + 1) % n;
            surface += Point(poly[i]).x * Point(poly[j]).y;
            surface -= Point(poly[i]).y * Point(poly[j]).x;
        }
        surface = surface / 2;
        return surface;
    }

    public static function getArea2(poly:Array):Number {
        var area:Number = 0;
        if (poly.length > 2) {
            var sum:Number = 0;
            var len:Number = poly.length - 1;
            for (var i:int = 0; i < len; i++) {
                sum += (Point(poly[i]).x + Point(poly[i + 1]).x) * (Point(poly[i + 1]).y - Point(poly[i]).y);
            }
            sum += (Point(poly[i]).x + Point(poly[0]).x) * (Point(poly[0]).y - Point(poly[i]).y);

            area = Math.abs(sum) / 2;
        }
        return area;
    }

    public function PolygonUtils() {
    }

}
}
