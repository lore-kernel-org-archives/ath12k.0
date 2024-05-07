Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141C1C25B4F
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 15:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbVhgnXyZc7Ri41FwmzIm61qkzNm/aUHfTBcFoH3OCU=; b=BEVO+7O62fgPV5TsT0shl3qGiG
	y1qPX5Yr74BwELvlnkoWL1V+PBFVjveL2bEsAroDWgn0IUOOMfKLD/fU0dYvRrRzz452jMExDfYSA
	0oGeNKCiRxvgdqkt8ks/bX0Sxfd4IlHnHl0/GsTa1vWVrxnBRBiYxzWtNUHkvN/2kkA6AEWeosAxh
	VjMGNpYRVBmXYrFTlVDHIeaiJIIWMGB+gUnr8gBXO+FnYiKF7EU1uTLEcM2yHXajHz9MfJnvK0AoS
	VeskMJlu20Fw90KuYwt6Z0Yvjlctk9EaPKfvukFAddXercmwfYT+XWH114Gp3QVL/nYzVb9tIDLs6
	HHAxAFpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MwV-0000000Bm4r-3F1p
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 15:41:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4MwT-0000000Bm3g-0X8S
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 15:41:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3824F617FE;
	Tue,  7 May 2024 15:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244A0C2BBFC;
	Tue,  7 May 2024 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715096479;
	bh=aE+kaQPAah4Dcjpm1i07io+My5mBVg5XQ5w7U/wMEDA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aCpWWx52W0k+cS0jciM7Sbxn1e7alWt5CQgZdTfRQmOst0/yfIgc2wBjMdmYm1+Ny
	 8WmMBu5f810pi8opESxsmDqD+La4I2j6RNWt06GwdbjQfED3DiWmaTJVLcOgOA29Nz
	 0tx5itsNGPFMvoMhErEUfbsMSPAhn0SkS8Ra18b2ZWfo91pXI+iehhzAfSyoF3EZpj
	 Kz+9QxeEmFyrdeboCf17v9uat0LWKkXbX+mIYjmp5OfPr7qPig++mfpcMY5gxGe8sN
	 97kSkfS7C/qaYaZFClUSzgWSmoMhNAcGlN7T3cFpH96eMVdNfAcM0SwegoBSNzsfr5
	 Zs/+G+lsRzJDg==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 0/8] wifi: ath12k: Introduce device group abstraction
References: <20240507045702.2858954-1-quic_hprem@quicinc.com>
Date: Tue, 07 May 2024 18:41:17 +0300
In-Reply-To: <20240507045702.2858954-1-quic_hprem@quicinc.com> (Harshitha
	Prem's message of "Tue, 7 May 2024 10:26:54 +0530")
Message-ID: <87bk5hmxya.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_084121_281281_14EC1446 
X-CRM114-Status: GOOD (  21.33  )
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
> v4:
>   - Modified the cover letter
> v3:
>   - Removed depends-on tag of "wifi: ath12k: Refactor the hardware recovery
>     procedures" as it is merged to ToT
>   - Addressed the deadlock warning seen during rmmod.

Thanks, after a quick test I don't see the warning anymore.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

