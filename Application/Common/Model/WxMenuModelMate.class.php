<?php
namespace Common\Model;

use Vendor\Hiland\Utils\DataModel\ModelMate;

class WxMenuModelMate
{
    private static function getMate()
    {
        return new ModelMate('WxMenu');
    }

    public static function getRankedList()
    {
        $mate= self::getMate();
        $list = $mate->select('', 'rank desc');

        $result = array();
        foreach ($list as $item) {
            if ($item['pid'] == 0) {
                $result[] = $item;
                foreach ($list as $itemOther) {
                    if ($itemOther['pid'] == $item['id']) {
                        $result[] = $itemOther;
                    }
                }
            }
        }

        return $result;
    }
}