import React from "react";
import { Modal, Form, Input } from 'antd'

const FormItem = Form.Item;
const { TextArea } = Input;

const UpdateForm = props => {

  const [ form ] = Form.useForm();

  return (
    <Modal
      visible={props.updateModalVisible}
      title='修改用户信息'
      onCancel={()=>{
        props.onCancel();
      }}
      onOk={()=>{
        form.validateFields()
          .then(val=>{
            props.onSubmit(val)
          })
          // eslint-disable-next-line @typescript-eslint/no-unused-vars
          .catch(msg=>{})
      }}
    >
      <Form
        layout='horizontal'
        labelCol={
          {
            span: 4
          }
        }
        form={form}
        initialValues={{
          name: props.values.name
        }}
      >
        <FormItem
          label='姓名'
          name='name'
          rules={[
            {
              required: true,
              message: '请输入姓名',
            }
          ]}
        >
          <Input readOnly placeholder='请输入姓名' />
        </FormItem>

        <FormItem
          label='描述'
          name='desc'
          rules={[
            {
              required: true,
              message: '请输入描述',
            }
          ]}
        >
          <TextArea placeholder='请输入描述' />
        </FormItem>

        <FormItem
          label='手机号码'
          name='desc'
          rules={[
            {
              required: true,
              message: '请输入手机号码',
              min: 11
            }
          ]}
        >
          <Input placeholder='请输入手机号码' />
        </FormItem>
      </Form>
    </Modal>
  );
}
export default UpdateForm
