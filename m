Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26BACD11C2
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1wgevTtpRkvnYP3BfURK3i5RvAhyV4fidKjgBcb4rM=; b=hUPG8W9mVTRBk4dT12IJV6D5dG
	QD8bC81utEkqEiWVbIMB3ZuOxE0mCwfhBC5S7k9sGXO8EpvpnUh2XKPfsZI4zd4AqhjHFNTOlZYck
	E7By/KGcg074bZVefmd4Na3+0YaMCAOBnekMI7Bx/KJp6oMYm9KoTN3GErH8mCGvRPmIvkbZNgxyP
	n1PLFWB+zvcKzgPGNVb3IkQAxCxytN7yIrXc7WrevB9np6Yy3UpGEMVeGZGOqqrUSzqP17N/Fv7zV
	J4ZPOrVIG3TcS3HAJUVzq3hQXBExgoYNEXO0CFaYOiDQx+xN1IXsCvQDpAFV89zBBSaPHqCBYsrNY
	q2+s0fUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTqi-000000061bd-15Fp
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 09:02:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTqc-000000061aL-3DUC
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 09:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE92861BBA;
	Wed, 10 Apr 2024 09:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37ABAC433F1;
	Wed, 10 Apr 2024 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712739745;
	bh=BWIGtv/jtFuN/kcD1raMWNa1Vg9PxMfieRzFlD0RgUA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OgVp91lNYOWiLWekLEVfZ/V9In9eR7l4BiUAWXZzPkx8gbKadvHzD4rdY8+DGQA27
	 6WxqDDpVjX5hWXd3yJU1ibAUAbHUh5dpuqQhHgyriatDhi5f+vSFXC9Dwb+DajjOsK
	 KHmbhcGZE3AcvDTiNYA16a/wE3nf/r2f8VnPgvhw7d3snZ+lZV9g9zg1+lN+L0+umb
	 OcgoqNTKVkoUd0QEfnR/SkYtSriNzjvU8Lhe7tElnDnBdJvEHu96YrlEPRyU7n+Cgk
	 i8nU04Gi7XOvJfJwv3sVcNSHcWfRLe7xvr9kb9PHbiyGp9XgeiBpHWbgySHkbxauK6
	 4HDa6A5PPmnqg==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  Thiraviyam Mariyappan
 <quic_tmariyap@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: enable service flag for survey dump stats
References: <20240409175604.3299752-1-quic_kathirve@quicinc.com>
	<1e515bbc-0119-4114-b44e-d7a449b031f7@quicinc.com>
	<c47aa30f-cebb-4460-a78c-9a8df4f9e85e@quicinc.com>
Date: Wed, 10 Apr 2024 12:02:22 +0300
In-Reply-To: <c47aa30f-cebb-4460-a78c-9a8df4f9e85e@quicinc.com> (Karthikeyan
	Kathirvel's message of "Wed, 10 Apr 2024 14:20:05 +0530")
Message-ID: <87seztzj35.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_020226_929761_DBC748C5 
X-CRM114-Status: GOOD (  13.06  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> writes:

> On 4/10/2024 5:37 AM, Jeff Johnson wrote:
>> On 4/9/2024 10:56 AM, Karthikeyan Kathirvel wrote:
>>> From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
>>>
>>> The survey dump statistics does not display channel RX and TX time
>>> properly because the survey flag is not enabled in the firmware service
>>> flag.
>>>
>>> If firmware supports enable the service flag "bss_chan_info" in
>>> wmi_resource_config to fetch and print the stats for specific pdev.
>>>
>>> Enabling WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 does not have any impact
>>> on WCN7850 since this bit is not utilized by the WCN7850 firmware.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
>>> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
>>> ---
>>>   drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
>>>   drivers/net/wireless/ath/ath12k/wmi.h | 1 +
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
>>> index a5575ce9eed4..16504786735a 100644
>>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>>> @@ -3324,7 +3324,8 @@ ath12k_wmi_copy_resource_config(struct ath12k_wmi_resource_config_params *wmi_cf
>>>   	wmi_cfg->bpf_instruction_size = cpu_to_le32(tg_cfg->bpf_instruction_size);
>>>   	wmi_cfg->max_bssid_rx_filters = cpu_to_le32(tg_cfg->max_bssid_rx_filters);
>>>   	wmi_cfg->use_pdev_id = cpu_to_le32(tg_cfg->use_pdev_id);
>>> -	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config);
>>> +	wmi_cfg->flag1 = cpu_to_le32(tg_cfg->atf_config) |
>>> +				     WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
>> shouldn't that | operation be inside the ) ?
> Yes, will address in next version, thanks for the review Jeff

BTW ath12k-check should catch these kind of errors. Didn't it warn about
it or did you just skip running ath12k-check?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

