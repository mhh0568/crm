package com.ma.crm.workbench.service.impl;

import com.ma.crm.base.constants.CrmExceptionEnum;
import com.ma.crm.base.exception.CrmException;
import com.ma.crm.base.utils.DateTimeUtil;
import com.ma.crm.base.utils.UUIDUtil;
import com.ma.crm.settings.bean.User;
import com.ma.crm.settings.mapper.UserMapper;
import com.ma.crm.workbench.bean.*;
import com.ma.crm.workbench.mapper.ContactActivityRelationMapper;
import com.ma.crm.workbench.mapper.*;
import com.ma.crm.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName: crm
 * @Package: com.ma.crm.workbench.service.impl
 * @Description: java类作用描述
 * @Author: 马贺辉
 * @CreateDate: 2020/11/21 21:46
 * @Version: 1.0
 * <p>
 * Copyright: Copyright (c) 2020
 */
@Service
public class ClueServiceImpl implements ClueService {

    @Autowired
    private ClueMapper clueMapper;

    @Autowired
    private ClueRemarkMapper clueRemarkMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ClueActivityRelationMapper clueActivityRelationMapper;

    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private CustomerMapper customerMapper;

    @Autowired
    private ContactsMapper contactsMapper;

    @Autowired
    private ContactsRemarkMapper contactsRemarkMapper;

    @Autowired
    private CustomerRemarkMapper customerRemarkMapper;

    @Autowired
    private ContactActivityRelationMapper contactActivityRelationMapper;

    @Autowired
    private TranMapper tranMapper;

    @Autowired
    private TranRemarkMapper tranRemarkMapper;

    @Autowired
    private TranHistoryMapper tranHistoryMapper;

    @Override
    public void saveClue(Clue clue) {

       clue.setCreateTime(DateTimeUtil.getSysTime());
       clue.setId(UUIDUtil.getUUID());
        int count = clueMapper.insertSelective(clue);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CLUE_INSERT_ERROR);
        }
    }

    @Override
    public List<Map<String, Object>> queryClue(Clue clue) {
        return clueMapper.queryClue(clue);
    }

    @Override
    public Map<String, String> queryClueById(String id) {
        return clueMapper.queryClueById(id);
    }

    @Override
    public void updateClue(Clue clue) {
        clue.setEditTime(DateTimeUtil.getSysTime());
        int count = clueMapper.updateByPrimaryKeySelective(clue);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CLUE_UPDATE_ERROR);
        }
    }

    @Override
    public void deleteClueById(String idstr) {
        String[] ids = idstr.split(",");
        for (String id : ids) {
            int count = clueMapper.deleteByPrimaryKey(id);
            if(count == 0){
                throw new CrmException(CrmExceptionEnum.CLUE_DELETE_ERROR);
            }

        }
    }

    @Override
    public Clue queryClueDetail(String id) {
        //根据主键查询线索信息
        Clue clue = clueMapper.selectByPrimaryKey(id);

        List<Activity> activities=new ArrayList<>();
        Example exampleRelation=new Example(ClueActivityRelation.class);
        Example.Criteria relationCriteria = exampleRelation.createCriteria();
        relationCriteria.andEqualTo("clueId",id);
        List<ClueActivityRelation> clueActivityRelations = clueActivityRelationMapper.selectByExample(exampleRelation);
        //遍历取出所有的activity的主键
        for (ClueActivityRelation clueActivityRelation : clueActivityRelations) {
            Activity activity = activityMapper.selectByPrimaryKey(clueActivityRelation.getActivityId());
            User user = userMapper.selectByPrimaryKey(activity.getOwner());
            activity.setUser(user);
            activities.add(activity);
        }
        clue.setUser(userMapper.selectByPrimaryKey(clue.getOwner()));
        clue.setActivities(activities);

        //根据线索中的外键查询用户信息
        User user = userMapper.selectByPrimaryKey(clue.getOwner());
        clue.setUser(user);
        //使用example 根据线索中的主键 查询所有线索备注的信息
        Example example=new Example(ClueRemark.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("clueId",clue.getId());
        List<ClueRemark> clueRemarks = clueRemarkMapper.selectByExample(example);
        clue.setClueRemarks(clueRemarks);
        return clue;
    }

    @Override
    public void saveClueRemark(ClueRemark clueRemark) {
        clueRemark.setId(UUIDUtil.getUUID());
        clueRemark.setCreateTime(DateTimeUtil.getSysTime());
        clueRemark.setEditFlag("0");
        int count = clueRemarkMapper.insertSelective(clueRemark);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CLUEREMARK_INSERT_ERROR);
        }
    }

    @Override
    public void updateClueRemark(ClueRemark clueRemark, User user) {
        clueRemark.setEditFlag("1");
        clueRemark.setEditBy(user.getName());
        clueRemark.setEditTime(DateTimeUtil.getSysTime());
        int count = clueRemarkMapper.updateByPrimaryKeySelective(clueRemark);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CLUEREMARK_UPDATE_ERROR);
        }
    }

    @Override
    public void deleteClueRemark(String id) {
        int count = clueRemarkMapper.deleteByPrimaryKey(id);
        if(count ==0){
            throw new CrmException(CrmExceptionEnum.CLUEREMARK_DELETE_ERROR);
        }
    }

    @Override
    public void deleteClueActivityRelation(ClueActivityRelation clueActivityRelation) {
        int count = clueActivityRelationMapper.delete(clueActivityRelation);
        if(count ==0){
            throw new CrmException(CrmExceptionEnum.CLUEACTIVITY_DELETE_ERROR);
        }

    }

    @Override
    public List<Activity> queryActivityById(String clueId,String name) {
        //先通过example查询出 所有对应的activityId
        Example example=new Example(ClueActivityRelation.class);
        example.createCriteria().andEqualTo("clueId",clueId);
        List<ClueActivityRelation> clueActivityRelations = clueActivityRelationMapper.selectByExample(example);
        //遍历所有clueActivityRelation 查询所有的activity
        List<String> activityIds=new ArrayList<>();
        for (ClueActivityRelation clueActivityRelation : clueActivityRelations) {
            activityIds.add(clueActivityRelation.getActivityId());
        }
            example=new Example(Activity.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andNotIn("id",activityIds);
        //模糊查询
        criteria.andLike("name","%"+name+"%");
        List<Activity> activities=activityMapper.selectByExample(example);
        for (Activity activity : activities) {
            User user = userMapper.selectByPrimaryKey(activity.getOwner());
            activity.setUser(user);
        }
        return activities;
    }

    @Override
    public List<Activity> queryBindActivity(ClueActivityRelation clueActivityRelation) {
        List<ClueActivityRelation> clueActivityRelations = clueActivityRelationMapper.select(clueActivityRelation);
        List<Activity> activities=new ArrayList<>();
        for (ClueActivityRelation activityRelation : clueActivityRelations) {
            Activity activity = activityMapper.selectByPrimaryKey(activityRelation.getActivityId());
            User user = userMapper.selectByPrimaryKey(activity.getOwner());
            activity.setUser(user);
            activities.add(activity);
        }
        return activities;
    }

    @Override
    public void addBindRelation(ClueActivityRelation clueActivityRelation, String activityIds) {
        String[] ids = activityIds.split(",");

        for (String activityId : ids) {
            clueActivityRelation.setId(UUIDUtil.getUUID());
            clueActivityRelation.setActivityId(activityId);
            int count = clueActivityRelationMapper.insertSelective(clueActivityRelation);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CLUEACTIVITY_INSERT_ERROR);
            }
        }
    }

    @Override
    public void saveConvertClue(Tran tran, String isCreateTransaction, String id,User user) {
        //1.先查询线索信息
        Clue clue = clueMapper.selectByPrimaryKey(id);
        //根据公司名称 判断客户是否存在
        Example example=new Example(Customer.class);
        example.createCriteria().andEqualTo("name",clue.getCompany());
        List<Customer> customers = customerMapper.selectByExample(example);
        Customer customer=null;
        if(customers.size()==0){
            customer = new Customer();
            customer.setId(UUIDUtil.getUUID());
            customer.setCreateTime(DateTimeUtil.getSysTime());
            customer.setCreateBy(user.getName());
            customer.setAddress(clue.getAddress());
            customer.setContactSummary(clue.getContactSummary());
            customer.setDescription(clue.getDescription());
            customer.setName(clue.getCompany());
            customer.setNextContactTime(clue.getNextContactTime());
            customer.setOwner(clue.getOwner());
            customer.setPhone(clue.getPhone());
            customer.setWebsite(clue.getWebsite());
            int count = customerMapper.insertSelective(customer);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
            }
        }else{
            customer=customers.get(0);
        }

        //客户备注
        example=new Example(ClueRemark.class);
        example.createCriteria().andEqualTo("clueId",clue.getId());
        List<ClueRemark> clueRemarks = clueRemarkMapper.selectByExample(example);
        CustomerRemark customerRemark=new CustomerRemark();
        for (ClueRemark clueRemark : clueRemarks) {
            customerRemark.setId(UUIDUtil.getUUID());
            customerRemark.setCreateBy(user.getName());
            customerRemark.setCreateTime(clueRemark.getCreateTime());
            customerRemark.setCustomerId(customer.getId());
            customerRemark.setNoteContent(clueRemark.getNoteContent());
            customerRemark.setEditFlag("0");
            int count = customerRemarkMapper.insertSelective(customerRemark);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
            }
        }



        //根据联系人姓名判断联系人是否存在
        example=new Example(Contacts.class);
        example.createCriteria().andEqualTo("fullname",clue.getFullname());
        List<Contacts> contacts = contactsMapper.selectByExample(example);
        Contacts contact=null;
        if(contacts.size()==0){
            contact = new Contacts();
            contact.setId(UUIDUtil.getUUID());
            contact.setAddress(clue.getAddress());
            contact.setAppellation(clue.getAppellation());
            contact.setContactSummary(clue.getContactSummary());
            contact.setCreateBy(user.getName());
            contact.setCreateTime(DateTimeUtil.getSysTime());
            contact.setCustomerId(customer.getId());
            contact.setDescription(clue.getDescription());
            contact.setEmail(clue.getEmail());
            contact.setFullname(clue.getFullname());
            contact.setJob(clue.getJob());
            contact.setMphone(clue.getMphone());
            contact.setNextContactTime(clue.getNextContactTime());
            contact.setOwner(clue.getOwner());
            contact.setSource(clue.getSource());
            int count = contactsMapper.insertSelective(contact);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
            }
        }else{
            contact = contacts.get(0);
        }

        //联系人备注
        ContactsRemark contactsRemark=new ContactsRemark();
        for (ClueRemark clueRemark : clueRemarks) {
            contactsRemark.setId(UUIDUtil.getUUID());
            contactsRemark.setCreateBy(user.getName());
            contactsRemark.setCreateTime(clueRemark.getCreateTime());
            contactsRemark.setContactsId(contact.getId());
            contactsRemark.setNoteContent(clueRemark.getNoteContent());
            contactsRemark.setEditFlag("0");
            int count = contactsRemarkMapper.insertSelective(contactsRemark);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
            }
        }

        //添加联系人和市场活动关联表
        example = new Example(ClueActivityRelation.class);
        example.createCriteria().andEqualTo("clueId",clue.getId());
        List<ClueActivityRelation> clueActivityRelations = clueActivityRelationMapper.selectByExample(example);
        ContactActivityRelation contactActivityRelation=new ContactActivityRelation();
        for (ClueActivityRelation clueActivityRelation : clueActivityRelations) {
            contactActivityRelation.setId(UUIDUtil.getUUID());
            contactActivityRelation.setActivityId(clueActivityRelation.getActivityId());
            contactActivityRelation.setContactsId(contact.getId());

            int count = contactActivityRelationMapper.insertSelective(contactActivityRelation);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
            }
        }
        if("1".equals(isCreateTransaction)){
            //创建交易
            tran.setId(UUIDUtil.getUUID());
            tran.setContactsId(contact.getId());
            tran.setContactSummary(clue.getContactSummary());
            tran.setCreateBy(user.getName());
            tran.setCreateTime(DateTimeUtil.getSysTime());
            tran.setCustomerId(customer.getId());
            tran.setDescription(clue.getDescription());
            tran.setNextContactTime(clue.getNextContactTime());
            tran.setOwner(clue.getOwner());
            tran.setSource(clue.getSource());
            int count = tranMapper.insertSelective(tran);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
            }

            //添加交易备注
            TranRemark tranRemark=new TranRemark();
            for (ClueRemark clueRemark : clueRemarks) {
                tranRemark.setId(UUIDUtil.getUUID());
                tranRemark.setCreateBy(user.getName());
                tranRemark.setCreateTime(clueRemark.getCreateTime());
                tranRemark.setTranId(tran.getId());
                tranRemark.setNoteContent(clueRemark.getNoteContent());
                tranRemark.setEditFlag("0");
                count = tranRemarkMapper.insertSelective(tranRemark);
                if(count==0){
                    throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
                }
            }

            //添加交易历史
            TranHistory tranHistory = new TranHistory();
            tranHistory.setCreateBy(user.getName());
            tranHistory.setCreateTime(tran.getCreateTime());
            tranHistory.setId(UUIDUtil.getUUID());
            tranHistory.setMoney(tran.getMoney());
            tranHistory.setExpectedDate(tran.getExpectedDate());
            tranHistory.setStage(tran.getStage());
            tranHistory.setTranId(tran.getId());
            count = tranHistoryMapper.insertSelective(tranHistory);
            if(count==0){
                throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
            }
        }

        //删除线索备注信息
        example = new Example(ClueRemark.class);
        example.createCriteria().andEqualTo("clueId",clue.getId());
        int count = clueRemarkMapper.deleteByExample(example);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
        }

        //删除线索和市场活动关联关系
        example = new Example(ClueActivityRelation.class);
        example.createCriteria().andEqualTo("clueId",clue.getId());
        count = clueActivityRelationMapper.deleteByExample(example);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
        }

        //删除线索
        example = new Example(Clue.class);
        example.createCriteria().andEqualTo("id",clue.getId());
        count = clueMapper.deleteByExample(example);
        if(count==0){
            throw new CrmException(CrmExceptionEnum.CLUECONVERT_ERROR);
        }

    }
}
