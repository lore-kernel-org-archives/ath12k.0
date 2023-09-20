Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013B6CE79D1
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDajP+m2kwf00gQPp1yC+XWyvzDeEAUuGMaQaANZ48I=; b=Sr90Olxn0EpZN7
	U9kDOzQ1d9oaQ5UIU6IXUXrlx++44Ss+Cfi/vwu1uXATZn2HYEyOKF4X2BK2Vn9SWtytD47o40Xkq
	A1emC4yI3u91LeQot2sFcTXDmKS/jvXjt6/67rvG50lffzys2Ik36qyRgiB/WDNt3S44PQLJF+fRJ
	9120/lutNAeApOIeWaRBrgfcuMGX1dCY19mlg8tSjZo42N5zE0TDwqkrfrTwU0oy8OlsAVXrobYJp
	aDmpYFHxN42MEe9+pyorg8pdYU7/DjcNrySLGIgUpYs/1ZC5sEC4erMUXj5aZzRDhiCali2uZBe7o
	GI2fOcEei5Fmy418+fvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixPc-003CfX-2L
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 13:38:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixPa-003Cex-18
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 13:38:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 55365CE1B24;
	Wed, 20 Sep 2023 13:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D35C433C8;
	Wed, 20 Sep 2023 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217114;
	bh=XauREkdUDckz8leh4QeQjsODnulH8uUzRvYFx3cwuv4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=VzCeMHxVM5XJimhQFHEEhmZ0PPfCAr4P8XqbawZLIpLZFHIG4SdGjFC8oeYEcvlqm
	 wsZJr/TW/RsS6iN/Us86qfBizt3riShY5walDgFYAGXG2qfxkDWbCsZpbZ765UNoFx
	 TPGxmkcCvkjmXVKjCfMN5fvHYi3i8M0UPGn+KVLg7F4jYT8P8TtLTrASey/2BIf3Ou
	 aIyJ7JfHmQzJtYwkZgDhAFupEGQDMoCZoH/oejBcG48+Ni3E5zNRV8UiTtTyYO16Dm
	 4bMxnS8dEqS4g3f2KU2AK0ddSIIdmAvwz5QPImx+gZGFNKOZrfEG2A6vkplZjDi+Rl
	 xUwWYQCG6Cw8Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix possible out-of-bound read in
 ath12k_htt_pull_ppdu_stats()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230901015602.45112-1-quic_bqiang@quicinc.com>
References: <20230901015602.45112-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169521711198.1118199.13181861616088470480.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 13:38:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_063838_610184_3A1091DB 
X-CRM114-Status: UNSURE (   9.75  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> len is extracted from HTT message and could be an unexpected value in
> case errors happen, so add validation before using to avoid possible
> out-of-bound read in the following message iteration and parsing.
> 
> The same issue also applies to ppdu_info->ppdu_stats.common.num_users,
> so validate it before using too.
> 
> These are found during code review.
> 
> Compile test only.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1bc44a505a22 wifi: ath12k: fix possible out-of-bound read in ath12k_htt_pull_ppdu_stats()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230901015602.45112-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
