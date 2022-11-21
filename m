Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3525CC43219
	for <ath12k@archiver.kernel.org>; Mon, 21 Nov 2022 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/+4ZyPsnQOCBgD3MonNrScufHKsQ0sfzD0CY/a4dPU=; b=YujmXrLb5OGu7D
	yC4QyUILKOdpA3cuZbIad29+SiyDuTXLW4mJfAL7AHszlfOwcC9EX2co6m3mGk1zpNDGAmvGcOOBw
	hwWJ6JoDGS/WGwSxjSN2aQhbyg7zeQwne/iAsJAWc2B7vYNraFKeovqGhrnUoJOKLf61sj1gpPvm+
	83SsMmFTaVhVEhRM4lCHy2plNxTUl29V1AnmSpuv89bbNHhhwsaf/6kaEyHoPdAl+oQzTnqf5p/xU
	fqxBPTAEyllOXHIvTHT36reTWKZhkPhlp0Fn6inUEcMSfy6F6s7bxWqaMd3nvteLctg2OiqXit7LS
	kmaSIewl5PXjLNbMJM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9AW-00FRzM-GG
	for ath12k@archiver.kernel.org; Mon, 21 Nov 2022 15:57:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9AT-00FRx4-HB
	for ath12k@lists.infradead.org; Mon, 21 Nov 2022 15:57:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2DADAB810DE
	for <ath12k@lists.infradead.org>; Mon, 21 Nov 2022 15:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47687C433D6;
	Mon, 21 Nov 2022 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669046226;
	bh=VA/Ub/T6G0dvtPxPA4A+MYTinZfP6nxhETy8kou7t98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YaC1Zo/DgdB1BbgNZg4N8EzqLIEOtU0kGlUuWA+1C6nbXMWG3EzgusaGnpvneXIi6
	 0E1Lv41oGZCcWrz2S5ol1RYzzvGdsBfZm12VKSUTPVuXggj9E75yIevYK5ePHJCb4N
	 9v7WeMjJjXmEa/y1qlUa4uTon4nGDc19FByJSrmnsTOvbS3WfHwGVfm97z0VuHAA0w
	 TROcfyDMLznkKhT2BRV0qIQAHkF6BliTsmN4nsguvoyJo5GG1RXVJXqfszhlkyLTFJ
	 RUjrPSfMiOc4byQQmg7didVKoFuLuPPSn7z5fzw2fRkuIlC/SNkF9Qkii6DO/1KZj+
	 YbBrnxlQBIdtQ==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: Re: [PATCH v2 00/50] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
In-Reply-To: <20221116163902.24996-1-kvalo@kernel.org> (Kalle Valo's message
	of "Wed, 16 Nov 2022 18:38:12 +0200")
References: <20221116163902.24996-1-kvalo@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Mon, 21 Nov 2022 17:57:00 +0200
Message-ID: <878rk49u7n.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_075709_736298_DF646EB7 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@kernel.org> writes:

> ath12k is a new mac80211 driver for Qualcomm Wi-Fi 7 devices, first
> supporting QCN9274 and WCN7850 PCI devices.  QCN9274 supports both AP
> and station; WCN7850 supports only station mode. Monitor mode is not
> (yet) supported. Only PCI bus devices are supported.
>

[...]

> Unfortunately the firmware images are not yet available but they will be soon, the
> plan is to publish them any day now.

The firmware for WCN7850 hw2.0 is temporarily available here:

https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850/hw2.0

Later I will create a proper place for ath12k firmware images. And
naturally submit them also to linux-firmware.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
