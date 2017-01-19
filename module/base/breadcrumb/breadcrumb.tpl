{if condition="isset($breadcrumbs)"}
<ol class="breadcrumb">
    {foreach $breadcrumbs as $index => $breadcrumb}
        {if condition="isset($breadcrumbs[$index+1])"}
        <li><a href="{$breadcrumb['url']}">{$breadcrumb['text']}</a></li>
        {else /}
        <li><strong>{$breadcrumb['text']}</strong></li>
        {/if}
    {/foreach}
</ol>
{/if}
