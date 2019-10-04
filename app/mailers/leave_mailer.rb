class LeaveMailer < ApplicationMailer

  def new_leave_request
    @user = params[:user]
    mail(to: @user.email, subject: 'New leave request has been submitted to your reporting head')
  end

  def new_leave_request_submitted
    @user = params[:user]
    @reporting_head = params[:reporting_head]
    mail(to: @reporting_head.email, subject: 'New leave request has been submitted for you approval', template_name: "new_leave_request_submitted" )
  end

  def modified_leave_request
    @user = params[:user]
    @reporting_head = params[:reporting_head]
    mail(to: @user.email, subject: 'Leave request has been successfully modified and resubmitted to your reporting head')
  end

  def cancelled_leave_request
    @user = params[:user]
    mail(to: @user.email, subject: 'Leave request has been successfully cancelled')
  end
end
