package com.atguigu.gulimall.product.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.atguigu.common.utils.PageUtils;
import com.atguigu.common.utils.Query;

import com.atguigu.gulimall.product.dao.CategoryDao;
import com.atguigu.gulimall.product.entity.CategoryEntity;
import com.atguigu.gulimall.product.service.CategoryService;


@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryEntity> page = this.page(
                new Query<CategoryEntity>().getPage(params),
                new QueryWrapper<CategoryEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<CategoryEntity> listWithTree() {
        //1.查出所有分类
        List<CategoryEntity> list = list();
        //2.组装成父子关系
        //2.1 找到所有的一级分类
        List<CategoryEntity> plist = list.stream().filter((categoryEntity -> {
            //找到所有一级菜单节点
            return categoryEntity.getParentCid() == 0;
        })).map((menu) -> {
            //map映射，将找到的子菜单也装到对象中去
            menu.setChildren(getChildrens(menu, list));
            return menu;
        }).sorted((menu1, menu2) -> {
            //对象排序
            return menu1.getSort() - menu2.getSort();
        }).collect(Collectors.toList());
        return plist;
    }

    @Override
    public void removeMenuByIds(List<Long> asList) {
        //TODO 检查当前删除的菜单，是否被别的地方引用
        //现在先暂时删除（逻辑删除，showStatus改为0）
        baseMapper.deleteBatchIds(asList);
    }

    //递归函数，找到当前传入节点root下的所有子节点，all为全部数商品数据
    private List<CategoryEntity> getChildrens(CategoryEntity root, List<CategoryEntity> all) {
        List<CategoryEntity> children = all.stream().filter(categoryEntity -> {
            return categoryEntity.getParentCid() == root.getCatId();
        }).map(categoryEntity -> {
            categoryEntity.setChildren(getChildrens(categoryEntity, all));
            return categoryEntity;
        }).sorted((menu1, menu2) ->
                (menu1.getSort() == null ? 0 : menu1.getSort() - (menu2.getSort() == null ? 0 : menu2.getSort())))
                .collect(Collectors.toList());
        return children;
    }
}