Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2256FC27C4F
	for <ath12k@archiver.kernel.org>; Thu, 13 Jun 2024 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgowt+ZDYE1WOCmKPcWzmHRYzaHCwnMbUaLnVSlbfy8=; b=aHtr+DYW0VQNVEQ3w+qJRrjn3D
	oQar53j2oVM+eXjb6qny+uSiVsJDhuaMtyjLT3IPWsM4fwZwENLnsJ8yniB3pEcQQZx9DIjtOBW6Z
	54Ug+i7IhkbcaA9PG5TLOVJLCUSCOpdFLC9MF05RsV/gQ7NgSHreeh948q15+mNwGFwRtNXWahAYd
	ljSZBT8sy9182NSDExBn68TSNtXn0zFS5WMQWjMeJA2GHSH/j8E4YD/NwhMx9Sn7/CLjnGjuVBE3x
	u0R1NqaXJmIGoZrL7Sx/Ia0+fJAbSowqs/cQolX5CICpwOV6uTZFQ2RzH/mTc9T9X6AlpLBwbOQ2U
	R0DUZzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkXJ-0000000Gjvm-3ZDQ
	for ath12k@archiver.kernel.org;
	Thu, 13 Jun 2024 13:30:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkXG-0000000GjuQ-1kaS
	for ath12k@lists.infradead.org;
	Thu, 13 Jun 2024 13:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 556F96023F;
	Thu, 13 Jun 2024 13:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174CDC2BBFC;
	Thu, 13 Jun 2024 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718285437;
	bh=OEAhHd+pUhFkMT+aGEvAyJitpB0TMqS13pSWrHHwhao=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=eTm/+VA2ROb2ec3EV6ZCggZrv2b3mQfO9VRGY8x6Id6yzcXYxmraWpe6/sJCWoqHD
	 lraG6DgVyqPpDyqQN6p3f6gAuM3Rx2jrjRDqul7b8n5oaV/ug3XCS3ltOo07n5iSKD
	 PZLWoMi1Fz2v98IJmQ34AlabRFrAtNdvp3eLapDVgvkzoLDStK8hXYAa8nwxKZLLtb
	 7PG8Rcw65IG3Id0ei5Rqz0cAvNwdSwJV9CEaXbzIfGASdIJuddQM5xvZ+42oPjSHw8
	 Ukynh0yqzDFCnC+S6wmfam7Heoqs33QiGjCue4L6RkkFyV4GtkMi4UOvGA9rvPH9uG
	 9NUrmRR8ROkEw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Aaradhana Sahu <quic_aarasahu@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] ath12k: Factory test mode support
References: <20240611083427.881443-1-quic_aarasahu@quicinc.com>
	<cd77058f-7165-4342-893b-a59a3a18c3c5@quicinc.com>
Date: Thu, 13 Jun 2024 16:30:34 +0300
In-Reply-To: <cd77058f-7165-4342-893b-a59a3a18c3c5@quicinc.com> (Jeff
	Johnson's message of "Wed, 12 Jun 2024 09:51:32 -0700")
Message-ID: <875xudnf5x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_063038_612563_A3E1F0EF 
X-CRM114-Status: GOOD (  18.17  )
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

> On 6/11/2024 1:34 AM, Aaradhana Sahu wrote:
>
>> Device is booted in factory test mode for calibration.
>> The commands are sent from userspace application, which
>> is sent to firmware using wmi commands. Firmware sends
>> the response to driver as wmi events and driver sends
>> these events to the application via netlink message.
>> 
>> Also added changes related to correct pdev id access for
>> fw test cmd.
>> 
>> Aaradhana Sahu (3):
>>   wifi: ath: create common testmode_i.h file for ath drivers
>>   wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>   wifi: ath12k: add factory test mode support
>> 
>> Rajat Soni (1):
>>   wifi: ath12k: Fill pdev id for fw test cmd
>> 
>> ---
>> v3:
>>   -Rebased on latest ToT
>>   -Updated Tested-on Tag
>>   -Removed second parameter of ath12k_core_start()
>>   -Updated copyright
>> v2:
>>   -Rebased on latest ath ToT
>> ---
>> 
>>  drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>>  drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>>  drivers/net/wireless/ath/ath12k/core.c        |  22 +-
>>  drivers/net/wireless/ath/ath12k/core.h        |  13 +
>>  drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>>  drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>>  drivers/net/wireless/ath/ath12k/mac.c         |  15 +-
>>  drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>>  drivers/net/wireless/ath/ath12k/testmode.c    | 422 ++++++++++++++++++
>>  drivers/net/wireless/ath/ath12k/testmode.h    |  40 ++
>>  drivers/net/wireless/ath/ath12k/wmi.c         |  39 +-
>>  drivers/net/wireless/ath/ath12k/wmi.h         |  21 +
>>  .../wireless/ath/{ath11k => }/testmode_i.h    |  52 +--
>>  13 files changed, 634 insertions(+), 74 deletions(-)
>>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (53%)
>> 
>> 
>> base-commit: a116bf2be795eb1db75fa6a48aa85c397be001a6
>
> FYI this series is not applying cleanly in my tree for validation:
>
> Base: using specified base-commit a116bf2be795eb1db75fa6a48aa85c397be001a6
> Applying: wifi: ath: create common testmode_i.h file for ath drivers
> Using index info to reconstruct a base tree...
> Patch failed at 0001 wifi: ath: create common testmode_i.h file for ath drivers
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: drivers/net/wireless/ath/ath11k/testmode_i.h:4
> error: drivers/net/wireless/ath/ath11k/testmode_i.h: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
>
> I initially used b4, but tried again directly with git, and it failed for me 
> with both mechanisms.
> Kalle, do you have any issues with this series?

Also fails for me on top of commit a116bf2be795:

Applying: wifi: ath: create common testmode_i.h file for ath drivers
Using index info to reconstruct a base tree...
error: patch failed: drivers/net/wireless/ath/ath11k/testmode_i.h:4
error: drivers/net/wireless/ath/ath11k/testmode_i.h: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 wifi: ath: create common testmode_i.h file for ath drivers

Setting the patchset to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

