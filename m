Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB92C25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ3iqZmOPDz7jZ5rD1o3eblRIu35Sm7bJYCRwlSY7iQ=; b=bs0l4ghufU92H7t2oeTWbh81jH
	RzgkBYg9lTFtCfawdJXdH5SP/bBuXfNoOiQWEquw9dms7UOQr481kwrIXh/yUoiiakiUYIUSLG058
	fxR0q0hx7fTaJ+a+kkexztdWn3I9NKWeaFpSxVl8xwPWz9yMZSFCyrseDFqgWsY2L2OqdfjnCrDYZ
	scjeerQXuNs5ifqyRgorZDngUXWu25SXo9E+C+HuIV3+YhnJOJ0u3tvqjIKQ+J4bbd/YStdP5BYNY
	oXRbJ01gORw/cRNvLSZb4F/AEivdvp06VQhV4nCtTSOk6pofdsGOLy0DMbP5QZIDpP3sE9ZHecrCH
	h0Do/I8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsuG-000000001NX-0JBP
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 09:14:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsuD-000000001Lq-0Hwz
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 09:14:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9BBCBCE113A;
	Tue, 28 May 2024 09:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8D9C3277B;
	Tue, 28 May 2024 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716887640;
	bh=KC00Wpr6VzcOfVIazWUG8FnERV2lsxT3bhfs66npYx4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W5epKtuCcwziYPxLL8btr13eitdkoGtJnkYbRyP0grFQgQS/wDLop9M+R2MVff7DZ
	 mgHGO3jCjXXq8zlnz5dwUf+OwlAMu0C/Osym9dOkdQDnuManxTzlpvtmQFBvrl6ey5
	 U0LNU37cgB2CUP0p38IhjF4YpuxjQQECKAA+zziyI/qqhMfTd4xlB9wgHvmFpfO36z
	 UEHH4eIl4tj2H2jlIGf8uP2qZ0G2wZpGmfvkX+GSlO4J8TuvLoHcCRoldIMpM9nkah
	 S+GZmYCM68ekUus2M0lGl5f/0RtygpaKgI03GCkJjg/cOcbeDAvTwSKxUYOpf0cqEB
	 YWdhK/f/UvgPQ==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: <ath12k@lists.infradead.org>
Subject: Re: [PATCH v6 0/8] wifi: ath12k: Introduce device group abstraction
References: <20240527073723.2520319-1-quic_hprem@quicinc.com>
	<b7b8454c-47b3-8dd1-8756-ace8a54a0ee4@quicinc.com>
Date: Tue, 28 May 2024 12:13:58 +0300
In-Reply-To: <b7b8454c-47b3-8dd1-8756-ace8a54a0ee4@quicinc.com> (Harshitha
	Prem's message of "Tue, 28 May 2024 11:03:53 +0530")
Message-ID: <87cyp68fjd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_021405_491655_4ABFF22E 
X-CRM114-Status: GOOD (  18.05  )
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

Harshitha Prem <quic_hprem@quicinc.com> writes:

> On 5/27/2024 1:07 PM, Harshitha Prem wrote:
>> To support multi-link operation, multiple devices with different bands say
>> 2 GHz or 5 GHz or 6 GHz can be combined together as a group and provide
>> an abstraction to mac80211.
>> Device group abstraction - when there are multiple devices that are
>> connected by any means of communication interface between them, then these
>> devices can be combined together as a single group using a group id to form
>> a group abstraction. In ath12k driver, this abstraction would be named as
>> ath12k_hw_group (ag).
>> Please find below illustration of device group abstraction with two
>> devices.
>>                   Grouping of multiple devices (in future)
>> +------------------------------------------------------------------------+
>> |  +-------------------------------------+       +-------------------+   |
>> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
>> |  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
>> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
>> |  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
>> |  |         (Dual band device)          |       |                   |   |
>> |  +-------------------------------------+       +-------------------+   |
>> |                 ath12k_hw_group (ag) based on group id                 |
>> +------------------------------------------------------------------------+
>> Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
>> device 2 has one radio (6 GHz).
>> In existing code -
>>          device 1 will have two hardware abstractions hw1 (2 GHz) and hw2
>>          (5 GHz) will be registered separately to mac80211 as phy0 and phy1
>>          respectively. Similarly, device 2 will register its hw (6GHz) as
>>          phy2 to mac80211.
>> In future, with multi-link abstraction
>>          combination 1 - Different group id for device1 and device 2
>>                  Device 1 will create a single hardware abstraction hw1
>>                  (2 GHz and  5 GHz) and will be registered to mac80211 as
>>                  phy0. similarly, device 2 will register its hardware
>>                  (6 GHz) to mac80211 as phy1.
>>          combination 2 - Same group id for device1 and device 2
>>                  Both device details are combined together as a group, say
>>                  group1, with single hardware abstraction of radios 2 GHz,
>>                  5 GHz and 6 GHz band details and will be registered to
>>                  mac80211 as phy0.
>> Add base infrastructure changes to add device grouping abstraction
>> with
>> a single device.
>> This patch series brings the base code changes with following order:
>>          1. Refactor existing code which would facilitate in introducing
>>             device group abstraction.
>>          2. Create a device group abstraction during device probe.
>>          3. Start the device group only after QMI firmware ready event is
>>             received for all the devices that are combined in the group.
>>          4. Move the hardware abstractions (ath12k_hw - ah) from device
>>             (ath12k_base - ab) to device group abstraction (ag) as it would
>>             ease in having different combinations of group abstraction that
>>             can be registered to mac80211.
>> v6:
>>    - Addressed smatch error seen on "[PATCH v5 8/8] wifi: ath12k: move
>>      ath12k_hw from per soc to group"
>>    - Rebased to ToT
>> v5:
>>    - on "[PATCH 8/8] wifi: ath12k: move ath12k_hw from per soc to
>>      group", refactor the ath12k_mac_hw_allocate() api based on ag rather
>>      than ab and update hardware abstraction array size in ath12k_hw_group
>>      as ATH12K_GROUP_MAX_RADIO.
>>    - Rebased to ToT
>> v4:
>>    - Modified the cover letter
>> v3:
>>    - Removed depends-on tag of "wifi: ath12k: Refactor the hardware recovery
>>      procedures" as it is merged to ToT
>>    - Addressed the deadlock warning seen during rmmod.
>> v2:
>>   - Rebased to ToT
>> Karthikeyan Periyasamy (8):
>>    wifi: ath12k: Refactor core start api
>>    wifi: ath12k: Add helpers to get or set ath12k_hw
>>    wifi: ath12k: Add ath12k_get_num_hw api
>>    wifi: ath12k: Introduce QMI firmware ready flag
>>    wifi: ath12k: move ATH12K_FLAG_REGISTERED flag set to mac_register api
>>    wifi: ath12k: Introduce device group abstraction
>>    wifi: ath12k: refactor core start based on hardware group
>>    wifi: ath12k: move ath12k_hw from per device to group
>>   drivers/net/wireless/ath/ath12k/core.c | 431
>> +++++++++++++++++++++----
>>   drivers/net/wireless/ath/ath12k/core.h |  87 ++++-
>>   drivers/net/wireless/ath/ath12k/dp.c   |  19 +-
>>   drivers/net/wireless/ath/ath12k/dp.h   |   2 +-
>>   drivers/net/wireless/ath/ath12k/mac.c  | 117 ++++---
>>   drivers/net/wireless/ath/ath12k/mac.h  |   9 +-
>>   drivers/net/wireless/ath/ath12k/pci.c  |   2 +
>>   drivers/net/wireless/ath/ath12k/qmi.c  |  10 +-
>>   8 files changed, 544 insertions(+), 133 deletions(-)
>> base-commit: f8320064a28242448eeb9fece08abd865ea8a226
>
> Please ignore this series. Forgot to cc linux wireless. Will respin a
> new version.

Please hold. I have some comments for the patchset but I'm seeing odd
regressions in v6.10-rc1 and need to investigate that first.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

