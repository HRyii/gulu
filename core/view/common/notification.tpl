{/* TODO: warning,info,danger */}
{present name="success"}
<div class="alert alert-success alert-dismissable">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    {$success['text']}
</div>
{/present}
