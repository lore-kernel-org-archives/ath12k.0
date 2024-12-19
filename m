Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE43E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZH6vQ4P7mgq0Cbm9nv8bBgckVIpriyyj/G10+1q6lQ=; b=oERMLbddZZqJEAFM2HnIAHwnah
	ezcElhs/uDAuJFu4/GBmbLXPT9d6b0TvutH3GplK02NVHZ0KbRNJJLaGCKHNvvclaw6UGwelZJ7vD
	fmUvLL0pdXoEfcGHMkXoMqanibAv8uHqeNrDTcP+ssaTfagLRrmqd4O3N6YRzdYKbTpftaafnEytP
	z+il+lsKolKobcQNZvnSATeOg9EQVKxGxL9CIl0DyXv2JUaASFr0XtiSf6jYP2JU8K+4iNM7FZJ5M
	woKiUCVkt6d2s07PDCC+iieNp9pxu0HA/SQFMvZlv/dZDwNlR5YXSrMoq1xjovWCJ2iGpTvZqU6JY
	4yFvGlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGYa-00000001w9G-3Ozr
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 13:27:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGYY-00000001w8P-03R9
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 13:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66C1B5C030F;
	Thu, 19 Dec 2024 13:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF174C4CECE;
	Thu, 19 Dec 2024 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734614829;
	bh=4U1rX2P9SnZIdU620uSlt8MpD5nd6cSqYravvEQbTDw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GN30SgdkvmOgMEnxZcNJQoSEVhiU9CBERI/byc/+Zn9wLMRVWaP4oDuoTmCVpIood
	 FGskKBEJFBR7s+CN4aEkLnpHs5di7qC6uJP7yZhnonC6zg/iGxstZLhvLMq5RE7D68
	 LLws/hx1YIsV288MndmjnirV/6RkN5aG8Y7yGkdFqPfEkEToyqKUwSOieMp9lohQvs
	 XAD9Q4D63ThkDdVlJUCW9IxbbQNWU6ETV3bdH1YepZu69nU3rbXsmHAZBPuZtFpXtr
	 BOcmdfvK8tbXBozYVeqYDmPqJKq3X+uuP4piL1d5xLdrHUnPvulgyRIGqnBY4cO6Ef
	 Uabyhp1n/GYwg==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath12k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] wifi: ath12k: rename CAC_RUNNING flag
References: <20241218-ath12k_mlo_dfs-v1-0-058e783bcfc7@quicinc.com>
	<20241218-ath12k_mlo_dfs-v1-1-058e783bcfc7@quicinc.com>
Date: Thu, 19 Dec 2024 15:27:06 +0200
In-Reply-To: <20241218-ath12k_mlo_dfs-v1-1-058e783bcfc7@quicinc.com> (Aditya
	Kumar Singh's message of "Wed, 18 Dec 2024 09:11:32 +0530")
Message-ID: <87ed23hkgl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_052710_094506_FA8C9512 
X-CRM114-Status: UNSURE (   6.22  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> Rename the flag ATH12K_CAC_RUNNING to ATH12K_FLAG_CAC_RUNNING to correct
> the naming inconsistency in the enum ath12k_dev_flags.
>
> No functionality changes.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

