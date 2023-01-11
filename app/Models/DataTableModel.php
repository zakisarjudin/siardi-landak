<?php

namespace App\Models;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\Model;

class DataTableModel extends Model
{
    protected $DBGroup = 'default';
    protected $table;
    protected $column_order;
    protected $column_search;
    protected $column_where;
    protected $order;
    protected $request;
    protected $db;
    protected $dt;

    public function __construct(RequestInterface $request, string $table = '', array $column_order = [], array $column_search = [], $column_where = [], array $order = ['menu_id' => 'ASC'])
    {
        parent::__construct();
        $this->db = db_connect();
        $this->request = $request;
        $this->table = $table;
        $this->column_order = $column_order;
        $this->column_search = $column_search;
        $this->column_where = $column_where;
        $this->order = $order;
        $this->dt = $this->db->table($this->table);
    }

    private function getDatatablesQuery()
    {
        $i = 0;
        foreach ($this->column_search as $item) {
            if (isset($this->request->getPost('search')['value'])) {
                if ($i === 0) {
                    $this->dt->groupStart();
                    $this->dt->like($item, $this->request->getPost('search')['value']);
                } else {
                    $this->dt->orLike($item, $this->request->getPost('search')['value']);
                }
                if (count($this->column_search) - 1 == $i)
                    $this->dt->groupEnd();
            }
            $i++;
        }

        if ($this->column_where) {
            $this->dt->where($this->column_where);
        }

        if ($this->request->getPost('order')) {
            $this->dt->orderBy($this->column_order[$this->request->getPost('order')['0']['column']], $this->request->getPost('order')['0']['dir']);
        } else if (isset($this->order)) {
            $orders = $this->order;
            if (count($orders) > 1) {
                foreach ($orders as $order) {
                    $this->dt->orderBy(key($order), $order[key($order)]);
                }
            } else {
                $this->dt->orderBy(key($orders), $orders[key($orders)]);
            }
        }
    }

    public function getDatatables()
    {
        $this->getDatatablesQuery();
        if ($this->request->getPost('length') != -1)
            $this->dt->limit($this->request->getPost('length'), $this->request->getPost('start'));
        $query = $this->dt->get();
        return $query->getResult();
    }

    public function countFiltered()
    {
        $this->getDatatablesQuery();
        return $this->dt->countAllResults();
    }

    public function countAll()
    {
        $tbl_storage = $this->db->table($this->table);
        return $tbl_storage->countAllResults();
    }

    public function sumAll($column)
    {
        $this->getDatatablesQuery();
        $this->dt->selectSum($column);
        return $this->dt->get()->getRow();
    }
}
