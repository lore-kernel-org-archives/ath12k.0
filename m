Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ED1C27C4F
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 17:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShcvxZcGH+6xlgEBw0Zbc7r8/Np4rQKFuegers1OEEY=; b=4D4Od0mkSDen2jycG9pJwvZcLQ
	CSuFmqBZNIO99JUz1v6BS494Oeyf8UvyGGVeYxR2VT8P4VUrO8T6Hlz3x/a2xgofIhb6I44xAB/6M
	+3hdhQnOhfAAc2nj+sBXfLVXzmHO+oBWzH1qwOgy8wI2ktzDMr3L+DDDAN77DVb16l4CFi5HHB9vx
	G7x0ggdA2L3twDxDiK/ZfVCS2qytptqh9I9hVUr/jmCJqSqvFsa9SXUNHSphCYTdxomuSeXUQhn0m
	UpqoFY4tJUVFPFKaTWe6+IZpRsMVs8TC54knzpGHc+/IOJsx+hbSeURvN5rXjka5fHj/AijXeK3jf
	B603UW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMW3v-00000007ha1-2Qjn
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 17:04:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMW3s-00000007hZY-1Qqs
	for ath12k@lists.infradead.org;
	Wed, 26 Jun 2024 17:04:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4559061986;
	Wed, 26 Jun 2024 17:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32165C116B1;
	Wed, 26 Jun 2024 17:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719421439;
	bh=O/JMJLqh89mNtl6LKLku7p7JoYjoNabBTBJGMNJ9xV8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pEjtRCcaVMK3g0o0DgpUtD2426dTbxm+qQJubHIWJFd4gKoJMseBiWG1fKAKAYKay
	 zl9g0U/+giszXpRRQBjrOLIl/9//hc0V5Oc3qICA4PmnFMfSJURKKoaEUjTAP5ZDFm
	 KZKvHM6UTw2PT5L4bTLQNU/UdNceNnujZwqZLoAf/rNFDdma9ZftqrLikm893T2J14
	 dnrtVbbEfIeErg9xAu10qKL/eptEV/MuNzZkD3u5M3VwTNCEakeYmipS3RhkVSSM46
	 VG8ei1wmzTH+bYrMZi1FNB32b2l6BrhJOm7ypzk+9Kgnv+xeFpK71ac3B2cxbjuyON
	 6NjuP+eZKB1qg==
From: Kalle Valo <kvalo@kernel.org>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] ath12k: Factory test mode support
References: <20240611083427.881443-1-quic_aarasahu@quicinc.com>
Date: Wed, 26 Jun 2024 20:03:56 +0300
In-Reply-To: <20240611083427.881443-1-quic_aarasahu@quicinc.com> (Aaradhana
	Sahu's message of "Tue, 11 Jun 2024 14:04:23 +0530")
Message-ID: <87v81vhc03.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_100400_475557_A8E76178 
X-CRM114-Status: UNSURE (   9.57  )
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

Aaradhana Sahu <quic_aarasahu@quicinc.com> writes:

> Device is booted in factory test mode for calibration.
> The commands are sent from userspace application, which
> is sent to firmware using wmi commands. Firmware sends
> the response to driver as wmi events and driver sends
> these events to the application via netlink message.
>
> Also added changes related to correct pdev id access for
> fw test cmd.
>
> Aaradhana Sahu (3):
>   wifi: ath: create common testmode_i.h file for ath drivers
>   wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>   wifi: ath12k: add factory test mode support
>
> Rajat Soni (1):
>   wifi: ath12k: Fill pdev id for fw test cmd

BTW these are now in pending branch, there were some conflict but a new warning
because of wow patches. No need to resend because of this, I'll fix the
warning later.

drivers/net/wireless/ath/ath12k/wow.c: In function 'ath12k_wow_op_resume':
drivers/net/wireless/ath/ath12k/wow.c:982:17: warning: enumeration value 'ATH12K_HW_STATE_TM' not handled in switch [-Wswitch]
  982 |                 switch (ah->state) {
      |                 ^~~~~~


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

