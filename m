Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95692E77197
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+jDJkuGCbKc9FTIk/pouco5ZZBY+Z4m/5ELneCUKjE=; b=FCps+JV1yceU4Kowanawdndq/B
	P1d+vysLZ1dNVOu30tJOmMjsacQwrsXgxB38mAKLVPofmr9G7Q112DQUnvhQ2tvEND+j4qKX6fD6j
	cTg5TNMBg6Ha415FAAQc19Ufk87N7bTm5AUzdFKSeu9HpganHNlQ9y4Oct/+57lIZfXXqHxhFmDP7
	4T3MgRKLUCuV48ElS3EDDlTjB7A0jVZdMV9s1+eAthRVDlT5aTkGsHxAvlEQlZiXcsVy2KH+/nmBR
	QjuwxTR4zHqYbvb5c2dIlUpJCzANEIllMrgP0TkgMgrblZBxrZYnXojiQq+3jtdMxKZLq1zPCTxKl
	n9B5ZPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVs3s-0000000BulN-1aDY
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 12:54:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVs3q-0000000Buks-2G6j
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 12:54:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B01015C5536;
	Thu,  9 Jan 2025 12:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2879EC4CED2;
	Thu,  9 Jan 2025 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736427293;
	bh=26DM3asp7g2ycXbnbmvs6ssdSgp7CdT28HMGdx8l0AY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cI+khn9dWVubDDxFNN7F27gzcX1E3aEZrt+2fAsAnu3juif7KyKyNcRTC2cYLJ08b
	 bNN8nz48qdx2FeaHF4M8v3xl+ncwJ5QitMb0G9PYLHimifIiou3kDypItt6sBAFJ+3
	 ctzmyT6FxGtnPdxEK+WW5QNcLFpmx9k+p5aq46tLGMtwixXbCY2aqELK0e+y4OM4mx
	 arW1Xa4n+HcHTU6dORqv/d373yoKCDHvC1FuDBybgXjMXNWdVnIIfn8SB0GWrSmI0r
	 w6pNWXpXOnLDx+/POrbiucH9Hx1oSlD2LqXNE4Csn9ZELUz8kUuvVOOJ93joV3Pylh
	 qs9usOwUzOPZQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Aditya Kumar Singh <quic_adisi@quicinc.com>,  Aaradhana Sahu
 <quic_aarasahu@quicinc.com>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 0/4] wifi: ath12k: Factory test mode support
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
	<d38ac7f6-3596-4336-bd9d-61e99f3b070c@quicinc.com>
	<b4852e3d-1f9a-40fe-9593-84d5812d25be@quicinc.com>
	<5f05898c-cc5c-4c31-891e-9d5cb9cf5bfa@oss.qualcomm.com>
Date: Thu, 09 Jan 2025 14:54:50 +0200
In-Reply-To: <5f05898c-cc5c-4c31-891e-9d5cb9cf5bfa@oss.qualcomm.com> (Jeff
	Johnson's message of "Wed, 8 Jan 2025 21:29:27 -0800")
Message-ID: <87tta8du5h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_045454_821556_74499C81 
X-CRM114-Status: GOOD (  17.07  )
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

Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:

> On 1/8/2025 8:55 PM, Aditya Kumar Singh wrote:
>
>> On 1/9/25 10:13, Aaradhana Sahu wrote:
>>>
>>>
>>> On 6/24/2024 3:23 PM, Aaradhana Sahu wrote:
>>>> Device is booted in factory test mode for calibration.
>>>> The commands are sent from userspace application, which
>>>> is sent to firmware using wmi commands. Firmware sends
>>>> the response to driver as wmi events and driver sends
>>>> these events to the application via netlink message.
>>>>
>>>> Also added changes related to correct pdev id access for
>>>> fw test cmd.
>>>>
>>>> Aaradhana Sahu (3):
>>>>    wifi: ath: create common testmode_i.h file for ath drivers
>>>>    wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>>>    wifi: ath12k: add factory test mode support
>>>>
>>>> Rajat Soni (1):
>>>>    wifi: ath12k: Fill pdev id for fw test cmd
>>>>
>>>> ---
>>>> v5:
>>>>    -Updated copyright
>>>>    -Fixed line length within 90 char
>>>> v4:
>>>>    -Rebased on latest ToT
>>>> v3:
>>>>    -Rebased on latest ToT
>>>>    -Updated Tested-on Tag
>>>>    -Removed second parameter of ath12k_core_start()
>>>>    -Updated copyright
>>>> v2:
>>>>    -Rebased on latest ath ToT
>>>> ---
>>>>
>>>>   drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>>>>   drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>>>>   drivers/net/wireless/ath/ath12k/core.c        |  22 +-
>>>>   drivers/net/wireless/ath/ath12k/core.h        |  13 +
>>>>   drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>>>>   drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>>>>   drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>>>>   drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>>>>   drivers/net/wireless/ath/ath12k/testmode.c    | 423 ++++++++++++++++++
>>>>   drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>>>>   drivers/net/wireless/ath/ath12k/wmi.c         |  39 +-
>>>>   drivers/net/wireless/ath/ath12k/wmi.h         |  21 +
>>>>   .../wireless/ath/{ath11k => }/testmode_i.h    |  54 +--
>>>>   13 files changed, 636 insertions(+), 75 deletions(-)
>>>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>>>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>>>>   rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
>>>>
>>>>
>>>> base-commit: cac9bfd02678adbcca9a7dce770609b9f7434d37
>>>
>>> Hi Kalle,
>>>
>>> Please let me know, if any thing is pending from the developer side, to merge this series into ath.git tree.
>> 
>> This series does not apply cleanly on latest tip. And base commit is 
>> around 6 months old. So may be you would want to rebase and send a new 
>> version?
>> 
>> Applying: wifi: ath: create common testmode_i.h file for ath drivers
>> Applying: wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>> Applying: wifi: ath12k: add factory test mode support
>> error: patch failed: drivers/net/wireless/ath/ath12k/Makefile:26
>> error: drivers/net/wireless/ath/ath12k/Makefile: patch does not apply
>> error: patch failed: drivers/net/wireless/ath/ath12k/core.c:42
>> error: drivers/net/wireless/ath/ath12k/core.c: patch does not apply
>> error: patch failed: drivers/net/wireless/ath/ath12k/core.h:209
>> error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
>> error: patch failed: drivers/net/wireless/ath/ath12k/debug.h:33
>> error: drivers/net/wireless/ath/ath12k/debug.h: patch does not apply
>> error: patch failed: drivers/net/wireless/ath/ath12k/mac.c:13
>> error: drivers/net/wireless/ath/ath12k/mac.c: patch does not apply
>> error: patch failed: drivers/net/wireless/ath/ath12k/wmi.c:7150
>> error: drivers/net/wireless/ath/ath12k/wmi.c: patch does not apply
>> Patch failed at 0003 wifi: ath12k: add factory test mode support
>> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>> When you have resolved this problem, run "git am --continue".
>> If you prefer to skip this patch, run "git am --skip" instead.
>> To restore the original branch and stop patching, run "git am --abort".
>> 
>> And since you'll be submitting in 2025, don't forget to update
>> copyrights.
>> 
>> 
>
> Make sure to review all the changes that Kalle made locally to the pending
> version and incorporate those.

BTW my changes are available in tag ath-pending-202407031443 and these
are the commit ids:

194fb8d58727 wifi: ath12k: Fill pdev id for fw test cmd
0ca2ecc31b40 wifi: ath12k: add factory test mode support
df17f461e7c3 wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
593b976359bf wifi: ath: create common testmode_i.h file for ath drivers

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

