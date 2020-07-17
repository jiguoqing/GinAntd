import React, { useRef, useState } from "react";
import { FooterToolbar, PageContainer } from "@ant-design/pro-layout";
import ProTable from '@ant-design/pro-table'
import { Button, Divider, Input } from "antd";
import { PlusOutlined } from "@ant-design/icons";
import UpdateForm from "./components/UpdateForm";
import ResetForm from "./components/ResetForm";
import { queryRule } from "@/pages/ListTableList/service";

const PersonList = () => {

  const [ selectedRowsState, setSelectedRows ] = useState([]);
  const [ updateModalVisible, handleUpdateModalVisible ] = useState(false);
  const [ resetModalVisible, handleResetModalVisible ] = useState(false);

  const [ recordData, setRecordData ] = useState({});
  const actionRef = useRef();

  const columns = [
    {
      title: '姓名',
      dataIndex: 'name',
      rules: [
        {
          required: true,
          message: '姓名为必填项',
        },
      ],
    },
    {
      title: '描述',
      dataIndex: 'desc',
      valueType: 'textarea',
    },
    {
      title: '状态',
      dataIndex: 'status',
      hideInForm: true,
      valueEnum: {
        0: {
          text: '关闭',
          status: 'Default',
        },
        1: {
          text: '运行中',
          status: 'Processing',
        },
        2: {
          text: '已上线',
          status: 'Success',
        },
        3: {
          text: '异常',
          status: 'Error',
        },
      },
    },
    {
      title: '创建时间',
      dataIndex: 'created_at',
      sorter: true,
      valueType: 'dateTime',
      hideInForm: true,
      renderFormItem: (item, { defaultRender, ...rest }, form) => {
        const status = form.getFieldValue('status');

        if (`${status}` === '0') {
          return false;
        }

        if (`${status}` === '3') {
          return <Input {...rest} placeholder="请输入异常原因！" />;
        }

        return defaultRender(item);
      },
    },
    {
      title: '操作',
      dataIndex: 'option',
      valueType: 'option',
      render: (_, record) => (
        <>
          <a
            onClick={() => {
              handleUpdateModalVisible(true);
              setRecordData(record);
            }}
          >
            修改用户信息
          </a>
          <Divider type="vertical" />
          <a onClick={()=>{
            handleResetModalVisible(true);
            setRecordData(record);
          }}>重置密码</a>
        </>
      ),
    },
  ];

  return (
    <PageContainer>
      <ProTable
        headerTitle='查询结果列表'
        actionRef={actionRef}
        rowKey='key'
        toolBarRender={() => [
          <Button type="primary" onClick={
            () => {

            }
          }>
            <PlusOutlined /> 新建
          </Button>
        ]}
        request={(params, sorter, filter) => queryRule({ ...params, sorter, filter })}
        columns={columns}
        rowSelection={{
          onChange: (_, selectedRows) => setSelectedRows(selectedRows),
        }}
      />
      {selectedRowsState?.length > 0 && (
        <FooterToolbar
          extra={
            <div>
              已选择{' '}
              <a
                style={{
                  fontWeight: 600,
                }}
              >
                {selectedRowsState.length}
              </a>{' '}
              项&nbsp;&nbsp;
              <span>
                请点击 👉 按钮进行操作
              </span>
            </div>
          }
        >
          <Button
            onClick={async () => {
              // await handleRemove(selectedRowsState);
              setSelectedRows([]);
              actionRef.current?.reloadAndRest();
            }}
            danger
          >
            批量删除
          </Button>
        </FooterToolbar>
      )}

      { updateModalVisible && (
        <UpdateForm
          updateModalVisible={updateModalVisible}
          onCancel={()=>{
            handleUpdateModalVisible(false);
            setRecordData({});
          }}
          onSubmit={val=>{
            handleUpdateModalVisible(false);
            setRecordData({});
          }}
          values={recordData}
        />
      )}

      { resetModalVisible && (
        <ResetForm
          resetModalVisible={resetModalVisible}
          onCancel={()=>{
            handleResetModalVisible(false);
            setRecordData({});
          }}
          onSubmit={val=>{
            handleResetModalVisible(false);
            setRecordData({});
          }}
          values={recordData}
        />
      )}
    </PageContainer>
  );
}

export default PersonList;
