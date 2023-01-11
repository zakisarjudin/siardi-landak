<?php

function sidebar_menu()
{
    $db = db_connect();
    $user = auth()->user();
    if (!$user) return;


    $user_group = $user->getGroups()[0];

    // get menus
    $sql = "SELECT b.* FROM menu_accesses a JOIN menus b ON a.menu_id = b.menu_id WHERE a.group = '{$user_group}'";
    $query = $db->query($sql);
    $menus = $query->getResult();

    // looping menu id for search its sub menus
    $menu_ids = [];
    foreach ($menus as $menu) {
        array_push($menu_ids, $menu->menu_id);
    }
    $menu_ids = implode(",", $menu_ids);

    if (!$menu_ids) $menu_ids = 0;

    // get sub menus
    $sql = "SELECT * FROM sub_menus a WHERE a.menu_id IN ({$menu_ids})";
    $query = $db->query($sql);
    $sub_menus = $query->getResult();

    // generating html
    $html = <<<TEMPLATE
            <li class='menu-header small text-uppercase'>
                <span class='menu-header-text'>$user_group</span>
            </li>
            TEMPLATE;

    foreach ($menus as $menu) {
        $menu_route = count(explode("/", $menu->menu_route));
        $menu_url = $menu_route === 1 ?  base_url($user_group . "/" . $menu->menu_route) : base_url($menu->menu_route);
        $toggle = $menu_route === 1 ? "menu-toggle" : "";

        $html .= <<<TEMPLATE
                    <li class="menu-item">
                    <a href="$menu_url" class="menu-link $toggle">
                        <i class="menu-icon tf-icons $menu->menu_icon"></i>
                        <div data-i18n="$menu->menu_name">$menu->menu_name</div>
                    </a>
                    TEMPLATE;

        if ($menu_route === 1) {
            $html .= <<<TEMPLATE
                        <ul class="menu-sub">
                    TEMPLATE;
        }

        foreach ($sub_menus as $sub_menu) {
            if ($sub_menu->menu_id === $menu->menu_id) {
                $sub_menu_url = base_url($sub_menu->sub_menu_route);
                $html .= <<<TEMPLATE
                        <li class="menu-item">
                            <a href="$sub_menu_url" class="menu-link">
                                <div data-i18n="$sub_menu->sub_menu_name">$sub_menu->sub_menu_name</div>
                            </a>
                        </li>
                    TEMPLATE;
            }
        }

        if ($menu_route === 1) {
            $html .= <<<TEMPLATE
                        </ul>
                    TEMPLATE;
        }

        $html .= <<<TEMPLATE
                    </li> 
                    TEMPLATE;
    }

    return $html;
}

function user_group()
{
    $user = auth()->user();
    if (!$user) return;

    return $user->getGroups()[0];
}
