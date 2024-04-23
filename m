Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3723C4345F
	for <ath12k@archiver.kernel.org>; Tue, 23 Apr 2024 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrcylxegxcucDfApnfBlG21OgiN+IsNZhX+Cp8ZNhgI=; b=waG02Dt2oa+2jC+I5Y+NWQTAzD
	hq+JK/fFa1N1C5EdGE/x1Lz2DLSrwFo7piLPz/fTeP164cYwuaelNjl6Wv128zuospH5mbBYZrrm5
	67xQBjxmbupk2pWa+cupJDdPHgNvlvxHg7RGec0Tsuy0EREpYbze3gXL9//ACxbEZpzfq8HVavim6
	AwsrkLCdicSpWGEQOCXbX68sJ+dfwQJfDH9PtGVCtUk4S+Up5hmhidzHoAPg+SHppYwfkMQkDra8l
	hntBsu7ScXbiZeIkUWV67BGLjX200yuZDDctZ/i4SwGp4D6wk5HzPiNjo9qqHYeMle8C3F8TpFv8j
	JfPtcK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCcL-0000000GhEV-1icV
	for ath12k@archiver.kernel.org;
	Tue, 23 Apr 2024 09:39:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCcI-0000000GhDy-2yL0
	for ath12k@lists.infradead.org;
	Tue, 23 Apr 2024 09:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1521D60BED;
	Tue, 23 Apr 2024 09:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9753C116B1;
	Tue, 23 Apr 2024 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713865149;
	bh=NaTj27pMTZHoTQIdEq5WvNAK/WPhjv2zXs7+43AjdA8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PP4VvxCAfcKl9HyUynzFkR0jxhv53l2j4V6L4IGp4h4d8fF3/41kw3qrGBaH/ISc2
	 rymUNXZwCKFMNE5+xXJ37lwf7EUuMgY0YcfXF6dQU8DF4LaIwORJY9alv159tkE8c5
	 xaCyVKAcDRmnA55/homb5f8a1gY24fNuu8X/4OqMPPGdvjlysuMg3k5lHiMkgq/woU
	 MsoGkXsASdlP9SeYJqjY7oD+cqIu+ZGeZWHydGOcyFLNIWfDu5D9JA+meYrGXDNDvY
	 31u1gHEl9oUSYvHsNTujp9wkDyTxofOINcB6KpNRdu6VW41exy4j9nhhzjW5rzItam
	 Uvi128W2J3sOg==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/8] wifi: ath12k: Introduce device group abstraction
References: <20240420083750.1545670-1-quic_hprem@quicinc.com>
Date: Tue, 23 Apr 2024 12:39:07 +0300
In-Reply-To: <20240420083750.1545670-1-quic_hprem@quicinc.com> (Harshitha
	Prem's message of "Sat, 20 Apr 2024 14:07:42 +0530")
Message-ID: <878r14v2o4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_023910_882190_6B56DCE8 
X-CRM114-Status: GOOD (  20.14  )
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

> To support multi-link operation, multiple devices with different bands say
> 2 GHz or 5 GHz or 6 GHz can be combined together as a group and provide
> an abstraction to mac80211.
>
> Device group abstraction - when there are multiple devices that are
> connected by any means of communication interface between them, then these
> devices can be combined together as a single group using a group id to form
> a group abstraction. In ath12k driver, this abstraction would be named as
> ath12k_hw_group (ag).
>
> Please find below illustration of device group abstraction with two
> devices.
>
>                  Grouping of multiple devices (in future)
> +------------------------------------------------------------------------+
> |  +-------------------------------------+       +-------------------+   |
> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
> |  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
> |  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
> |  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
> |  |         (Dual band device)          |       |                   |   |
> |  +-------------------------------------+       +-------------------+   |
> |                 ath12k_hw_group (ag) based on group id                 |
> +------------------------------------------------------------------------+
>
> Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
> device 2 has one radio (6 GHz).
>
> In existing code -
>         device 1 will have two hardware abstractions hw1 (2 GHz) and hw2
>         (5 GHz) will be registered separately to mac80211 as phy0 and phy1
>         respectively. Similarly, device 2 will register its hw (6GHz) as
>         phy2 to mac80211.
>
> In future, with multi-link abstraction
>
>         combination 1 - Different group id for device1 and device 2
>                 Device 1 will create a single hardware abstraction hw1
>                 (2 GHz and  5 GHz) and will be registered to mac80211 as
>                 phy0. similarly, device 2 will register its hardware
>                 (6 GHz) to mac80211 as phy1.
>
>         combination 2 - Same group id for device1 and device 2
>                 Both device details are combined together as a group, say
>                 group1, with single hardware abstraction of radios 2 GHz,
>                 5 GHz and 6 GHz band details and will be registered to
>                 mac80211 as phy0.
>
> Add base infrastructure changes to add device grouping abstraction with
> a single device.
>
> This patch series brings the base code changes with following order:
>         1. Refactor existing code which would facilitate in introducing
>            device group abstraction.
>         2. Create a device group abstraction during device probe.
>         3. Start the device group only after QMI firmware ready event is
>            received for all the devices that are combined in the group.
>         4. Move the hardware abstractions (ath12k_hw - ah) from device
>            (ath12k_base - ab) to device group abstraction (ag) as it would
>            ease in having different combinations of group abstraction that
>            can be registered to mac80211.
>
>
> Depends-on:
>         [PATCH 0/3] wifi: ath12k: Refactor the hardware recovery
> procedures

Are you referring to this patchset:

https://patchwork.kernel.org/project/linux-wireless/list/?series=821155&state=*&order=date

That was sent three months ago and at least I couldn't find a newer
version. So I'll just drop this patchset for now without even looking at
it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

