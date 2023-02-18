export OldWorkflowID=$(aws cloudformation \
            list-exports --query "Exports[?Name==\`WorkflowID\`].Value" \
            --no-paginate --output text)
aws s3 rm "s3://udapeople-${OldWorkflowID}" --recursive
aws cloudformation delete-stack --stack-name "udapeople-backend-${OldWorkflowID}"
aws cloudformation delete-stack --stack-name "udapeople-frontend-${OldWorkflowID}"
aws cloudformation delete-stack --stack-name "InitialStack"