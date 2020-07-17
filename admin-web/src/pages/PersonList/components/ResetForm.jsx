import React from "react";
import { Modal, Form, Input } from 'antd'

const FormItem = Form.Item;
const { Password } = Input;

const ResetForm = props => {

  const [ form ] = Form.useForm();

  return (
    <Modal
      visible={props.resetModalVisible}
      title='重置密码'
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
          label='密码'
          name='password'
          rules={[
            {
              required: true,
              message: '请输入密码',
            }
          ]}
        >
          <Password placeholder='请输入密码' />
        </FormItem>

        <FormItem
          label='确认密码'
          name='password1'
          rules={[
            {
              required: true,
              message: '请输入确认密码'
            },
            ({ getFieldValue }) => ({
              validator(rule, value) {
                if (!value || getFieldValue('password') === value) {
                  return Promise.resolve();
                }
                return Promise.reject('The two passwords that you entered do not match!');
              },
            }),
          ]}
        >
          <Password placeholder='请输入确认密码' />
        </FormItem>
      </Form>
    </Modal>
  );
}
export default ResetForm
