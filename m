Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC34C6FA8E
	for <ath12k@archiver.kernel.org>; Fri, 24 Feb 2023 10:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19ESwgYQKAwObur387yCgp3MyGdqYNAcsgH9DdCo5zw=; b=TRhc9Pl/+Vf6v2
	0mar1JjXcewbu0ASXww6Uxk3xyWpS0kwRkqf75Us43H8hqe1y338IHIJ4cg0+iOQvwCWC7kVBEoOC
	XoJKgxcLyvY21VJqWIUMGN9q9sl/zDoKjMs9yQMQ7/ixfdvT7ckJa947L/J05stv1OzbVN8TjMGS2
	aEYTHpQUaNqeQxVJFfN/aNkdhyeY4Uei2uvUalz7d3D5sh05MZrmUTrx/SQCOrtEaYyaP4upSFTu+
	SB0QbxpYHEyg4oQykJUg+thar5EbQXUiMw2A1tYFGU8pGYFCTnv0GGKE9i/ZGIBqYhK504BOCjZDA
	/yFZqM8/7UuaRql7DrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVFA-00203B-IY
	for ath12k@archiver.kernel.org; Fri, 24 Feb 2023 10:24:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVF3-002005-AC
	for ath12k@lists.infradead.org; Fri, 24 Feb 2023 10:23:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CD87EB81B2C
	for <ath12k@lists.infradead.org>; Fri, 24 Feb 2023 10:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D684AC433EF;
	Fri, 24 Feb 2023 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677234230;
	bh=P3K/dE6Hz+oGgt67Eu8N0sVORnlzLCrKHwFeN/XgUoM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fqb5yJfyslps0zydxUXMGobn3NfBAnfb3yI9/Y0mcT0tJNJd1ZfqPx1qDKam+crVY
	 RWgxwX4G6ufmq40KHV2sqOQL8ouTUlHi2xj21L0cvtUHcjNjZQA/nCs+pcELzVQgmg
	 +gRM0ZRTljQPDEV2k5om7/B5L+ZosTmn+pkO0Z0EB1/eG/kZh7bUolc176/yaN5OMz
	 VcbXvfdTVYlXfBdgLMuo7wzEyjUVngtT8tYJ2LmNOhRQcVUdNeOG1I32DqxUSY94Xs
	 V4fLRaEJ933U7oza9OK/ES2P6EO5hP9Le4SC7Gf2iEGAPKWRqJ8szJqMMhjewwj8aR
	 GoN7IsSJ+FL5Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: remove memset with byte count of 278528
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230222164014.860-1-kvalo@kernel.org>
References: <20230222164014.860-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167723422796.18267.2237295490310604820.kvalo@kernel.org>
Date: Fri, 24 Feb 2023 10:23:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_022353_566086_49B059ED 
X-CRM114-Status: UNSURE (   7.20  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Sparse warns:
> 
> drivers/net/wireless/ath/ath12k/dp.c:1471:15: warning: memset with byte count of 278528
> 
> There's no need to use memset() here, instead call dma_alloc_coherent() with __GFP_ZERO.
> 
> While at it, remove an extra line before the error handler.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

28013c356296 wifi: ath12k: remove memset with byte count of 278528

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230222164014.860-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
