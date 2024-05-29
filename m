Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E2AC25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIjUTOjN1BJ97fJf8tmcLAQz5IizOtrXWaZYezw5Al4=; b=ERaXwa7w4uDvCazHtU/P5mp3z7
	9y+gRqu/IbV9zKzlXPWOvd2tHnu55N0SKwCAYkpKBVFlIBAvBUgMpqxPn1suNstIaKGwHkRWhl+9J
	o0BtCKTyvOC7V1r7KZwUxuaLcrJC9F13AjiSACULUNd2oFyPN3U2fpCEJV360mUjpwqpYW0goh+Jn
	yFRCjx8m+02QoFe0UPIVdFsX2+CjnmA5pU4hzVW2sJQYH6IrrWuPcIHrWXeIyYCAefLDtaU1NOr0y
	VwWdK/MGjMC04uyFhZVtkbZ+rvixUdIgo+7zBI5T+A57K1BITpPgEHAac3heTaOC5CZFZ8vwAekVV
	6hNN6j9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEC1-00000003EnT-2Do2
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 07:57:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEBz-00000003En1-0PpB
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 07:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 165E4623A4;
	Wed, 29 May 2024 07:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7178DC2BD10;
	Wed, 29 May 2024 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716969469;
	bh=tuhDNpVzo1xa35qGjlNusFwAWrauQt+AXDxakUkaKNs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JKqrJZ42EoDOCh0dv5zOo/M2sV5HF9ABzQr/fD9xn9/IOmsjy9d77N8ohi+1Y/811
	 HgoGVhXfLiDwaLceowPsxIbWuuZGHGwWq1jfxIeEDBOfoecsr0dCbdElKdW5HnLIln
	 Yit1trhvsxtKgvPwZOUOqElh/u+As5jgYppkC5/RKv8US/7CYHUrJstSGJVdS8FeB/
	 jKv33ssf7dg2oECrRIXnOYbrWvSnzawftRS0PI200G/7IYb6P5qfg5bA6wWDZ8bNjT
	 F7W27hAi3qY4KfzhCgM1WaXc2Gbaq1V5WwM0h2K5saABACpdtY3jh7Pa1ELCG6xQib
	 1I2/dgKm4raVA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Harshitha Prem
 <quic_hprem@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v7 0/8] wifi: ath12k: Introduce device group abstraction
References: <20240528063547.1400700-1-quic_hprem@quicinc.com>
	<396d645d-6f3b-4c1b-9d4b-d056fad36192@quicinc.com>
	<7b92a6cd-187d-4b6d-8cfb-af54365751fc@quicinc.com>
Date: Wed, 29 May 2024 10:57:46 +0300
In-Reply-To: <7b92a6cd-187d-4b6d-8cfb-af54365751fc@quicinc.com> (Baochen
	Qiang's message of "Wed, 29 May 2024 11:13:42 +0800")
Message-ID: <87fru16oed.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_005751_563277_0769914A 
X-CRM114-Status: GOOD (  18.10  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 5/29/2024 6:04 AM, Jeff Johnson wrote:
>> On 5/27/2024 11:35 PM, Harshitha Prem wrote:
>>> To support multi-link operation, multiple devices with different bands say
>>> 2 GHz or 5 GHz or 6 GHz can be combined together as a group and provide
>>> an abstraction to mac80211.
>>>
>>> Device group abstraction - when there are multiple devices that are
>>> connected by any means of communication interface between them, then these
>>> devices can be combined together as a single group using a group id to form
>>> a group abstraction. In ath12k driver, this abstraction would be named as
>>> ath12k_hw_group (ag).
>>>
>>> Please find below illustration of device group abstraction with two
>>> devices.
>>>
>>>                  Grouping of multiple devices (in future)
>>> +------------------------------------------------------------------------+
>>> |  +-------------------------------------+       +-------------------+   |
>>> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
>>> |  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
>>> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
>>> |  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
>>> |  |         (Dual band device)          |       |                   |   |
>>> |  +-------------------------------------+       +-------------------+   |
>>> |                 ath12k_hw_group (ag) based on group id                 |
>>> +------------------------------------------------------------------------+
>>>
>>> Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
>>> device 2 has one radio (6 GHz).
>>>
>>> In existing code -
>>>         device 1 will have two hardware abstractions hw1 (2 GHz) and hw2
>>>         (5 GHz) will be registered separately to mac80211 as phy0 and phy1
>>>         respectively. Similarly, device 2 will register its hw (6GHz) as
>>>         phy2 to mac80211.
>>>
>>> In future, with multi-link abstraction
>>>
>>>         combination 1 - Different group id for device1 and device 2
>>>                 Device 1 will create a single hardware abstraction hw1
>>>                 (2 GHz and  5 GHz) and will be registered to mac80211 as
>>>                 phy0. similarly, device 2 will register its hardware
>>>                 (6 GHz) to mac80211 as phy1.
>>>
>>>         combination 2 - Same group id for device1 and device 2
>>>                 Both device details are combined together as a group, say
>>>                 group1, with single hardware abstraction of radios 2 GHz,
>>>                 5 GHz and 6 GHz band details and will be registered to
>>>                 mac80211 as phy0.
>>>
>>> Add base infrastructure changes to add device grouping abstraction with
>>> a single device.
>>>
>>> This patch series brings the base code changes with following order:
>>>         1. Refactor existing code which would facilitate in introducing
>>>            device group abstraction.
>>>         2. Create a device group abstraction during device probe.
>>>         3. Start the device group only after QMI firmware ready event is
>>>            received for all the devices that are combined in the group.
>>>         4. Move the hardware abstractions (ath12k_hw - ah) from device
>>>            (ath12k_base - ab) to device group abstraction (ag) as it would
>>>            ease in having different combinations of group abstraction that
>>>            can be registered to mac80211.
>>>
>>> v7:
>>>    - Added linux-wireless mailer to cc.
>>>    - Removed Acked-by tag from "[PATCH v6 8/8]" as it has minor change.
>>>
>>> v6:
>>>   - Addressed smatch error seen on "[PATCH v5 8/8] wifi: ath12k: move
>>>     ath12k_hw from per soc to group"
>>>   - Rebased to ToT
>>> v5:
>>>   - on "[PATCH 8/8] wifi: ath12k: move ath12k_hw from per soc to
>>>     group", refactor the ath12k_mac_hw_allocate() api based on ag rather
>>>     than ab and update hardware abstraction array size in ath12k_hw_group
>>>     as ATH12K_GROUP_MAX_RADIO.
>>>   - Rebased to ToT
>>> v4:
>>>   - Modified the cover letter
>>> v3:
>>>   - Removed depends-on tag of "wifi: ath12k: Refactor the hardware recovery
>>>     procedures" as it is merged to ToT
>>>   - Addressed the deadlock warning seen during rmmod.
>>>
>>> v2:
>>>  - Rebased to ToT
>>>
>>> Karthikeyan Periyasamy (8):
>>>   wifi: ath12k: Refactor core start api
>>>   wifi: ath12k: Add helpers to get or set ath12k_hw
>>>   wifi: ath12k: Add ath12k_get_num_hw api
>>>   wifi: ath12k: Introduce QMI firmware ready flag
>>>   wifi: ath12k: move ATH12K_FLAG_REGISTERED flag set to mac_register api
>>>   wifi: ath12k: Introduce device group abstraction
>>>   wifi: ath12k: refactor core start based on hardware group
>>>   wifi: ath12k: move ath12k_hw from per device to group
>>>
>>>  drivers/net/wireless/ath/ath12k/core.c | 431 +++++++++++++++++++++----
>>>  drivers/net/wireless/ath/ath12k/core.h |  87 ++++-
>>>  drivers/net/wireless/ath/ath12k/dp.c   |  19 +-
>>>  drivers/net/wireless/ath/ath12k/dp.h   |   2 +-
>>>  drivers/net/wireless/ath/ath12k/mac.c  | 117 ++++---
>>>  drivers/net/wireless/ath/ath12k/mac.h  |   9 +-
>>>  drivers/net/wireless/ath/ath12k/pci.c  |   2 +
>>>  drivers/net/wireless/ath/ath12k/qmi.c  |  10 +-
>>>  8 files changed, 544 insertions(+), 133 deletions(-)
>>>
>>>
>>> base-commit: f8320064a28242448eeb9fece08abd865ea8a226
>> 
>> With this series I'm seeing a firmware crash upon resume from hibernation, but 
>> I'm not sure if it is the same intermittent crash I reported in another thread 
>> where firmware is not correctly handling a low physical memory address.
>> 
>> Baochen & Kalle, since this issue may be specific to my laptop, can you 
>> validate hibernation on your setups?
>
> I can also see a firmware crash upon resume. I am using
> ath-202405281746 as code base.

I also noticed that my WCN7850 resume tests were failing with an older
version of this patch. But I cannot provide more information as I'm
bisecting the v6.10-rc1 regression right now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

