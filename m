Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A074CD11C2
	for <ath12k@archiver.kernel.org>; Fri,  5 Apr 2024 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnYz94ulA5muY5hrIgifDtzJK7d58YzVK53ZpYr6qTI=; b=TgdAMiXwYycLNWQWqGIifSbtWU
	2jMhdsi5U9RAkvJAq+xl9HeARWNfMGkXBIWekXrPOBJhTmpolACgAW6FLQGDgWPik9JBs5TBa0fZs
	1cpySNTNWnao8ZVdCAS93XCWJM5ITFmXLxNjz3owtSrV6Re8SH+WQ58eQ1AJPfUD6yPTA555O9ur9
	84Y29D1y5+/fjcty/eCCpo7NucsNTV09SE/Xg13FimTyy0/MaipRRI9uMbczW9kPnZQGNLTFV7rW/
	iglVrQQFpvgaaZZ6JCGshD43JIb4Tti8F1IQ/QJjgpia2Pca6+OD+zfzT6l1/GSuaKkBkn5woTvQC
	cV9xl1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjA1-000000075kg-40FP
	for ath12k@archiver.kernel.org;
	Fri, 05 Apr 2024 12:59:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj9y-000000075k4-2HCK
	for ath12k@lists.infradead.org;
	Fri, 05 Apr 2024 12:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D063561305;
	Fri,  5 Apr 2024 12:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50128C433C7;
	Fri,  5 Apr 2024 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712321949;
	bh=610LeHdimWGR5+0JH7yoL0R4SYnx1ueRNOi62as6phQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KY7fqoR88m1gfoaG9qVqzCbjhwMaWjyB5mF7ksXNFSNUpST3aWO1slDZfkW9pddLp
	 rSd/Lr0RHnU2ArmvDiPyUaISxS3zkx7s20OLqBCqLzjEhg1bErrDhGBoUMZ6ITQD2R
	 8Zo/eFgQQGy05NNbz6fOXaIKac0V8iehSkwFjDTVoXu7MXY+iaPzNS3+NuAxxfPiPv
	 2lEcpcLMlc8W1qm8CVJEJFC9uX2iERQBBWoGBF+KcTgNqc/kFHWkvbdoNTgFwQPtNC
	 dj0qkwhxrINxxonMyFztvP7yjmoZGPoLJWkmZmG6KlLse2zyq/V3WhA2JxekaX2sky
	 5u01FuqP90i4g==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  P
 Praneesh <quic_ppranees@quicinc.com>
Subject: Re: [PATCH 1/2] wifi: ath12k: fix BSS chan info request WMI command
References: <20240331183232.2158756-1-quic_kathirve@quicinc.com>
	<20240331183232.2158756-2-quic_kathirve@quicinc.com>
	<c4924128-817a-4026-93f3-acedfe70c858@quicinc.com>
	<6b08a911-1ebd-4bcd-bc18-56764ac83729@quicinc.com>
Date: Fri, 05 Apr 2024 15:59:06 +0300
In-Reply-To: <6b08a911-1ebd-4bcd-bc18-56764ac83729@quicinc.com> (Jeff
	Johnson's message of "Mon, 1 Apr 2024 09:12:10 -0700")
Message-ID: <87bk6o2cf9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_055910_743549_1479E9C1 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 4/1/2024 8:00 AM, Jeff Johnson wrote:
>
>> On 3/31/2024 11:32 AM, Karthikeyan Kathirvel wrote:
>>> From: P Praneesh <quic_ppranees@quicinc.com>
>>>
>>> Currently, the firmware returns incorrect pdev_id information in
>>> WMI_PDEV_BSS_CHAN_INFO_EVENTID, leading to incorrect filling of
>>> the pdev's survey information.
>>>
>>> To prevent this issue, when requesting BSS channel information
>>> through WMI_PDEV_BSS_CHAN_INFO_REQUEST_CMDID, firmware expects
>>> pdev_id as one of the arguments in this WMI command.
>>>
>>> Add pdev_id to the struct wmi_pdev_bss_chan_info_req_cmd and fill it
>>> during ath12k_wmi_pdev_bss_chan_info_request(). This resolves the
>>> issue of sending the correct pdev_id in WMI_PDEV_BSS_CHAN_INFO_EVENTID.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>>>
>> 
>> remove this blank line. Fixes tag should be together with S-o-b
>> 
>>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>>> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
>> 
>> 
> Kalle can fix this when he merges into pending

Did that now to both patches:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=8b2506bb2baa28a0e6ee5d4d71d7fca32e6da9d1

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=d24b046bfc8f7255f4bef964ea5d9fc976273301

I also fixed this:

ERROR: Commit id shorter than 12 digits: Fixes: d889913205 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Should be: Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

