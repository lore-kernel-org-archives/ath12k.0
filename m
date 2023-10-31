Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E5CC4167B
	for <ath12k@archiver.kernel.org>; Tue, 31 Oct 2023 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40Q9kj4b++EkU74zc7ubRKgEtLJFcKtwvX0Pw+lbg/s=; b=RE6oQaKN/D8/96
	ew+sTIlY328W62hWaXRu89MDD0rwC2hcfeEBPRTF6KAnmgqqwi1xi+wkUU9r+lUyI9g+KwigcSugG
	MJtq+IlHhDCCJ8SVxrIrKP2OHGLWi77BaxpVIPTZ4xf7aYB8LdZQNMvdsEmygNMFsUSsGeTB/yoIT
	nPKJXKQc8McIcGsldRRs31+RwM635hnl+GsK5ao+p7g5VimArG4bep/4QnMeTuTt/JzCbLKNdNakT
	uOrdk9F1+PDoqoLPw06jfa7z6t3S7zQPrZJPjXsTQMg0/DWEty839sqDOFMJRLPMfv5ROOmLMh165
	UyKfCSCXbhP0vHyO/oQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxjRW-004iLl-36
	for ath12k@archiver.kernel.org;
	Tue, 31 Oct 2023 07:45:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxjRU-004iL9-0T
	for ath12k@lists.infradead.org;
	Tue, 31 Oct 2023 07:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACF66CE01C5;
	Tue, 31 Oct 2023 07:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865D6C433C7;
	Tue, 31 Oct 2023 07:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698738335;
	bh=NLwwmbwwqCvtjN1OuNUTkMJw4NZmW5mM/PG/LUZj3yQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Rfk3Xm2TAO9J0XEURs8VKXDgjneyf4OxmZpDmsMj+M9Y3x0+hfvqLXcAXqKL1ps06
	 U67INSuHVjYfeEjPSD4rmM/Xmz5vUIYDNigLLaTfXGCSOb5DBCOC9Dc9UeCT019G6W
	 C+KZ2PoPmVx5Mzt81CxsGL8SYxQD3BeyLKILRnKAazybnTTU8lOKZc4iwe/rBmwUKV
	 c259/yt60sBsgVNC/dYrf7a7UPLfQaXxA4zt8qt6dez8XG8FDBiDyvs00r6fbcERS+
	 bIkvnRd2ZodNuQFrK2YcJTbQh/21QwOnsa7/qAYK3XFzXvc894+Z1lC0xlzUs7p8+3
	 H/SnnQ9wr9+5g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: drop NULL pointer check in
 ath12k_update_per_peer_tx_stats()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231013074711.2202850-1-make_ruc2021@163.com>
References: <20231013074711.2202850-1-make_ruc2021@163.com>
To: Ma Ke <make_ruc2021@163.com>
Cc: quic_jjohnson@quicinc.com, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ma Ke <make_ruc2021@163.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169873833230.2137176.1125391865101568519.kvalo@kernel.org>
Date: Tue, 31 Oct 2023 07:45:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_004540_356125_96C9CE97 
X-CRM114-Status: UNSURE (   4.88  )
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

Ma Ke <make_ruc2021@163.com> wrote:

> Since 'user_stats' is a fixed-size array of 'struct htt_ppdu_user_stats'
> in 'struct htt_ppdu_stats', any of its member can't be NULL and so
> relevant check may be dropped.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

56d9854bd7c6 wifi: ath12k: drop NULL pointer check in ath12k_update_per_peer_tx_stats()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231013074711.2202850-1-make_ruc2021@163.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
