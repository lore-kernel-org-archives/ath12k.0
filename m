Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3998C25B75
	for <ath12k@archiver.kernel.org>; Thu,  6 Jun 2024 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXT4hBNuxIvYzo7/WJVlFugcm0XGcs5B3iw3H8SUmzU=; b=lLC9wg8XkTB6Xh4ruEG05IkOL4
	UZeGRsQDdEPrOcSRHxiXuyw9Yxi5zkPriguDWWY748wJaCCom+iuMMr/HnK5FP1k0ZaySbJKkbm7o
	BdHG5yCDbhUG0BzqMXu0D/B9c/zHTS4YZOIDsY1Acva4f4AaJKLbCU5aVpBksRUjd/CnqBBm+MtkT
	+xAibAp6Ff1i+arGChWRbj4W1IFsigeHtw3rELtTBnZVNbt0QS+albUd0V5IXQLgzc7iTIfB+rQTd
	EMQKhx0126Rl9NLp/l3W2IinmFikjbaMLUbtAAGRc7JXXeGnF1RBtChMYOW6SNMOhwpCsywFsNMLe
	QZA3PUyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFFVZ-0000000AP9P-1vTd
	for ath12k@archiver.kernel.org;
	Thu, 06 Jun 2024 15:58:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFFVW-0000000AP8B-02ia
	for ath12k@lists.infradead.org;
	Thu, 06 Jun 2024 15:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA80161E03;
	Thu,  6 Jun 2024 15:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CB2C2BD10;
	Thu,  6 Jun 2024 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717689508;
	bh=x4LkoXUC1lOHnZKMT6+/MzqqhBtpIKox2EqW2nwl8is=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OyGGc5vVuONRSFWsNZqZrovUyE0LbotcGuztP85NBRVqCO/cKwOmGQaAFPXiCkgzY
	 4uBih+rKJgalL9l3xVE86jEq0buml/7+uCwQ1Sr4pHtRJpjqihum+vJxZMoWl+ATpQ
	 I5Uygk06eu2nIuvcJH09EUc5epqNIlTgsyLGZw+1KuBSYyVWsyhHozUuR/QLG7U/JR
	 +xY1FgP5yydnddVgILE7FAv+FvNCWWcKrrFUyn6taDg2647c8bFUEP64tBEf5zQdUM
	 sqblzaUv/b7oQjEfdlOgSXg4/9mbMrpdYOjviH3bHj2qBhDguPsSUKaju7pfJZFGpW
	 QVDwfV7dAqiSQ==
From: Kalle Valo <kvalo@kernel.org>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v8 6/8] wifi: ath12k: Introduce device group abstraction
References: <20240531180411.1149605-1-quic_hprem@quicinc.com>
	<20240531180411.1149605-7-quic_hprem@quicinc.com>
Date: Thu, 06 Jun 2024 18:58:25 +0300
In-Reply-To: <20240531180411.1149605-7-quic_hprem@quicinc.com> (Harshitha
	Prem's message of "Fri, 31 May 2024 23:34:09 +0530")
Message-ID: <87wmn2oyfy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_085830_120740_D491D2E9 
X-CRM114-Status: GOOD (  15.45  )
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

> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>
> Currently, single device is probed and once firmware is ready, the device
> is registered to mac80211. For multi-link operation, different bands of
> different devices or same device would be part of a single wiphy and for
> this, hardware device group abstraction would be helpful.
>
> Hardware device group abstraction - when there are multiple devices (with
> single radio or dual radio) that are connected by any means of interface
> for communicating between them, then these devices can be combined
> together as a single group using a group id to form a group abstraction
> and register to mac80211.
>
> The grouping information of multiple devices would be based on device tree
> during device probe. If no such information is available then a single
> device will be part of group abstraction and registered to mac80211 else
> multiple devices advertised in device tree are combined and then registered
> to mac80211.

BTW I'm not sure if Device Tree is the right approach to configure the
groups. For example, that would mean that systems not using DT would not
support MLO at all, right? And also it would not be very flexible to
change the group setup.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

