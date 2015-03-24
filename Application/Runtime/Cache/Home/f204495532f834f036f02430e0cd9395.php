<?php if (!defined('THINK_PATH')) exit();?>            <?php if(is_array($itemList)): $i = 0; $__LIST__ = $itemList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li class="item">
                <div class="main">
                    <div class="img">
                        <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>">
                            <img src="<?php echo attach(get_thumb($item['img'], '_b'), 'item');?>">
                        </a>
                    </div>
                    <h3 class="pname">
                        <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>"><?php echo ($item["title"]); ?></a>
                    </h3>
                    <p class="price">猫眼价：¥<?php echo ($item["price"]); ?></p>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>