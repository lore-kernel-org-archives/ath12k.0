Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2192C27C4F
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 18:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwZXgXR+5zDgIuQHDblAU1QQtWzzH9FZAMDcZ/INtrY=; b=v4leKoqxmBRtlKzBGmpwpIweWi
	FkBhckmTsF0GRRmndtBEzwgcJGyHHLArCjoZTTFGg78Dff3pvCBsiI7L+B/NPOEzKZtXX3NQZSPXF
	OEdHqBup1OUitvtCbmL7FdGEJkWspICtgPLSkzA/ickRN27U0+BR6x5Q8mJh7z9cI3pxIUFSmKOsv
	xmqMH+fl0deCOBOty434sI/0hXV1ygz3q6PTXq41PCWEoJuMR/nyu2OrKan51C2JRPivhYvzUWamq
	MisLuuxXfYCcUMFtvSb8eIsHwglyC3i4fmYJqvAfifwlqGt1J3gYlBZAKYXPufofALeML6g2X4+CZ
	YUX33WbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMXYR-00000007wQu-1VIH
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 18:39:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMXYN-00000007wQH-3oLK
	for ath12k@lists.infradead.org;
	Wed, 26 Jun 2024 18:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57A9B61CCB;
	Wed, 26 Jun 2024 18:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13143C116B1;
	Wed, 26 Jun 2024 18:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719427175;
	bh=MlvAd6iA55Y5PL1ah9HFBbBqP2U1yvHevg8uPBUv1x4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=untwMYFV8RNpIuqnQGZdceNnuAvmJt2CtTQ/otHkDnSLmEY8GdUDDzAnTMhOhM/zo
	 heShVoQhzrQVu1Gq93sxlasOgc7wVQOI4JfNn2z4OvGDsIBWh27RFl+ZnpyOBHFzHG
	 MmFKHaNiDuiLj3elwWKXli8+RyuongMqfFupNWduzTwlQdpz8/r4fKGJsp5WwGT8N1
	 zbbKa1zjBgeZxHyZKVd+2oVH3J3rAA6QvDaKj8tdZR6WkiCydPWXki+8u+nUpvV/mj
	 2y3a+aB63rLTtkmv9VJUzADuSQjziuNLZDLDqAplZhe4T6kvICXV4OoA/0nOcWI8eq
	 34/s9S77ZqnQg==
From: Kalle Valo <kvalo@kernel.org>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <stable@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Allow driver initialization for WoW
 unsupported devices
References: <20240626024257.709460-1-quic_ramess@quicinc.com>
Date: Wed, 26 Jun 2024 21:39:32 +0300
In-Reply-To: <20240626024257.709460-1-quic_ramess@quicinc.com> (Rameshkumar
	Sundaram's message of "Wed, 26 Jun 2024 08:12:57 +0530")
Message-ID: <87r0cjh7kr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_113936_080076_26BF2ED0 
X-CRM114-Status: UNSURE (   9.59  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:

> Currently during driver initialization, mac registration is allowed
> only for devices that advertise WMI_TLV_SERVICE_WOW, but QCN9274
> doesn't support WoW and hence mac registration is aborted and driver
> is de-initialized.

I changed the title and this paragraph to describe more that we are
fixing a regression here.

> Allow mac registration to proceed without WoW Support for devices
> that don't advertise WMI_TLV_SERVICE_WOW.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Cc: stable@vger.kernel.org
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")

Luckily commit 4a3c212eee0e is only in ath-next, and not in any other
tree yet, so no need to cc stable. We need to cc stable when the bug is
in any of the official releases (v6.10 etc). So I dropped it.

Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=dbe2f0503e5fa9394e6b4e4f442adae89cec4cc7

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

