Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B2DCE79DF
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TXXmwmchuCOhQP5JY5voGa0bI1Kkk/fz22BII5Ru80=; b=H98i9b/6eANI3/
	H0lU6tmYyZl53jXadgatARA7Iv7bh4Kurm6IxmNnz3ohiWQL5K9AD5c0eETJwk5cDOX7p0Hv6pGtQ
	NYi1bFVz6SeLPiN6GzQ5LGdQN00Jpp2MYX3eQUZnTXzF906kQsN/SbP5/Y6XrsO+1ZiwAw8mcFi04
	eTdRKjboF+OChaPoqXB4qfUFOqp33PvCqvEkkTlxVxHw0BVYXHeYGMuvhpfhHq7guPxp2VBHefZN9
	dvnNTzI5Klj5rjCm0ZO6F01kmZrhsppYfAr7FEDcPYPskJ1haosLF2yEB72hS5NUMdS6PkX5as5mv
	L0MkoeQZhknyT9g9U+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyZG-003QQA-0G
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 14:52:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyZD-003QPH-01
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 14:52:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3696861BA3;
	Wed, 20 Sep 2023 14:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CADFC433C7;
	Wed, 20 Sep 2023 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695221557;
	bh=5h6v16wWKhONz72yVfPnsD86/kim+Vey7bcx5sp9XPw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=H1BGfj0tjIThLBRbQg1ItMQ3Ju2K+XPPDe3C5H2KlmI88xRnwSjHZltwSGjWGQDTn
	 Hz+lKxfdNxKpN+fMYhTSOm/7uuiX0n5H4muLu3dtYhbiXDNytLCfSXTP0tTeZqfIB0
	 3Utoa4RnTSjOe50PQWHNtQ/W/mGaEgtO/2tC3oer65fgBtzbWMjaGVkieF1iiomoDr
	 nCqKQZwSmLd1yg4z0xr66clgZDgQlkB5KWtKCBVEHLiwaaKYTakZAIm2V1pzWTlou/
	 cV5s+YiBtBjlZd+7+bUFPMj4B8+oSLVlVt0ptF0jgwOFURs6wQ5duwOj4u3w37VZ7C
	 4krVl8Seq4tNw==
MIME-Version: 1.0
Subject: Re: [PATCH v2 wireless-next 7/9] wifi: ath12k: Remove unnecessary
 (void*)
 conversions
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230919045142.524226-1-yunchuan@nfschina.com>
References: <20230919045142.524226-1-yunchuan@nfschina.com>
To: Wu Yunchuan <yunchuan@nfschina.com>
Cc: quic_jjohnson@quicinc.com, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Wu Yunchuan <yunchuan@nfschina.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169522155403.1418260.5064455550425202498.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 14:52:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_075239_128838_19520D19 
X-CRM114-Status: UNSURE (   7.58  )
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

Wu Yunchuan <yunchuan@nfschina.com> wrote:

> No need cast (void*) to (struct hal_rx_ppdu_end_user_stats *),
> (struct ath12k_rx_desc_info *) or (struct hal_tx_msdu_ext_desc *).
> Change the prototype to remove the local variable.
> 
> Signed-off-by: Wu Yunchuan <yunchuan@nfschina.com>
> Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This added new warnings:

drivers/net/wireless/ath/ath12k/dp_mon.c:25: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath12k/dp_mon.c:26: line length of 95 exceeds 90 columns

I fixed them in the pending branch by renaming ppdu_end_user to stats and
moving rx_user_status to it's own line:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=5c0910fdf1d800f1aeb8ab3e860e61bebec0091b

No need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230919045142.524226-1-yunchuan@nfschina.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
