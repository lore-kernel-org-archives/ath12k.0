Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3D9C4332F
	for <ath12k@archiver.kernel.org>; Fri, 25 Nov 2022 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJqz3VI2zVC/mAOyOHgADhPXbfbkHm9bHVu0rVFYy4k=; b=gg/SedT36y1h3l
	PKgy+UIK10txNMFa9Pa0xvhMUPzd1q3BKFZpU/FnmiBkGa8rU3b9ZWZL9slDHM5i6bGHFrjXNiolA
	Mfku4n0rIh4ClYRmMC+0iiSA9KQJoBtWh4hTbPRirpSctK8v/9+6rOes96YRUPngJ+0JATtVF1y1l
	F8EjttFuIEPl9oQY2t9mxEsXUNc6L8ckbPYngZYCSTlceihsvjDdJflB1XR1QprCkSLz1ZplCgOLa
	0TDMi9Hg1J7ITAWnSqaI77h8uszJxyfAbGAogkwzoUFHrhFi0VH96N0XQv1uQeWD/A17709/caOvU
	5com4SWrDp/sXMpbqGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWY1-00FuRu-Lg
	for ath12k@archiver.kernel.org; Fri, 25 Nov 2022 11:07:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWXc-00Ftz9-AU
	for ath12k@lists.infradead.org; Fri, 25 Nov 2022 11:06:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2B1AB82976
	for <ath12k@lists.infradead.org>; Fri, 25 Nov 2022 11:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EE9C433C1;
	Fri, 25 Nov 2022 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669374400;
	bh=VBJ0FDdCVqNKDtZqIQxJiumzJp90FsIpeDmAlcn94N4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QOQEJq5BBu5eCmcfLlTjAvoOflN7N0XMPpeCEa1UatpFfnYGExkrF0cNUUiM/iKOL
	 gbllaKonFZzDouy5HBTwvPZV60aTETozPtSL4XBhphfQfTMT+jG4eu5JnTgxA/+weu
	 BIf1ktTXM/z+kekF5h6tQu3aC8/B52AZpMuRi10NfUZMQTnlZcYz+bdVOVd4g9AkjI
	 KdIxm4ORbN2c1GCBN/hWXMT4bVoRAj3y85s9A8cJFYrFrgRHePIo4F4foz8xp5Dupu
	 CE6TOni+eC2bK3d8kujQvPCK4Zd5fE2ov8LWIRV7PCDUGgcilngm46IdZJdqWp4gBL
	 ADWB2wTX/ZLHg==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: Re: [PATCH v2 00/50] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
References: <20221116163902.24996-1-kvalo@kernel.org>
	<878rk49u7n.fsf@kernel.org>
Date: Fri, 25 Nov 2022 13:06:36 +0200
In-Reply-To: <878rk49u7n.fsf@kernel.org> (Kalle Valo's message of "Mon, 21 Nov
	2022 17:57:00 +0200")
Message-ID: <87k03j70oz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_030644_559686_A1A419BC 
X-CRM114-Status: GOOD (  13.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@kernel.org> writes:

> Kalle Valo <kvalo@kernel.org> writes:
>
>> ath12k is a new mac80211 driver for Qualcomm Wi-Fi 7 devices, first
>> supporting QCN9274 and WCN7850 PCI devices.  QCN9274 supports both AP
>> and station; WCN7850 supports only station mode. Monitor mode is not
>> (yet) supported. Only PCI bus devices are supported.
>>
>
> [...]
>
>> Unfortunately the firmware images are not yet available but they will be soon, the
>> plan is to publish them any day now.
>
> The firmware for WCN7850 hw2.0 is temporarily available here:
>
> https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850/hw2.0

Now QCN9274 hw2.0 firmware is also temporarily on the same repo:

https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/QCN9274/hw2.0

As the final big patch is too big to submit to the mailing list, here's
a link to the commit in my pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e9d30f354584f7094e56e6f91bf428f7c0981602

The idea is that I'll take this commit to ath-next branch and then queue
to v6.3.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
