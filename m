Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB04E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 13:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/aG/tIHUgnajHuluet7s51nQ74mmIaeBK/vZuoAl3U=; b=GmghTU1sWVlQU8w6cPKlylabvD
	aAgyOXobB26Xn4E4uwl+NufbrdciZFj+HUS1a65DQIT5Ih0J1Kiva4Tg8ULfQm4zgowyzDkVTS/Oi
	6tYlNxnlxoaXbwLGK/7vrutETO54j7jfZNIXjGVqZsz41XxCoj92b9q1262hd2HBlTOuxtjV4Hx6w
	H6j3dJuLSkUau7gO1ttpGISgncAxL5iZW+D8QgO1AjF9prZGI9dx1pu48jY5hu/6woaQP6FGTrD97
	0ouQP9i8BvZlAhVlM2Ua8kZAhgL7mXFIYui7r69juKd0o8K3BlZTYA9iKWFE+T/1YVTf+605R83CB
	lu8eK7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGTE-00000001vUP-3apy
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 13:21:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGTC-00000001vU2-3Ham
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 13:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B5C9A418AB;
	Thu, 19 Dec 2024 13:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6F1C4CECE;
	Thu, 19 Dec 2024 13:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734614497;
	bh=y1/zEPlqylwaDCsgVUz2dZoDtXxLoO9nh2PfUsMnM4A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=l3M6Ox9t/Epk3FPdg6VWSl+rTkxInzE2qRc4JczUObShSNN9i5VzGN0hCm1sEr73x
	 1ws+osEF1XbcqqfsQTCZRA9Hl9z6E0p9jv6xsW8ttE6Or/EuVJmMrKtQc5SKALaaqE
	 JPX19eIgm50UE/YO4d2QX3i5ydLtjUSYZlRwGVt4UGtCJyy042UpX/eKpdiVsel22o
	 d7ph7VLYW1ZXHLQVhO30hmFvbrhU37z/Q86qYJFKxBRUNGKK09FCJzlJD28tKKEOvL
	 +SgUV0GLIt+ZTKbFsTVGMEeEST0ym1CiVfskAcYXFbyU87ZOMyxuBs4exHspS8WaGx
	 EU792M2DsXVyg==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dinesh
 Karthikeyan <quic_dinek@quicinc.com>
Subject: Re: [PATCH 6/6] wifi: ath12k: Support Received FSE Stats
References: <20241217095216.1543923-1-quic_rdevanat@quicinc.com>
	<20241217095216.1543923-7-quic_rdevanat@quicinc.com>
Date: Thu, 19 Dec 2024 15:21:34 +0200
In-Reply-To: <20241217095216.1543923-7-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Tue, 17 Dec 2024 15:22:16 +0530")
Message-ID: <87r063hkpt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_052138_896843_0B1C4B37 
X-CRM114-Status: UNSURE (   6.32  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
>
> Add support to request received FSE stats from firmware through
> HTT stats type 28. These stats give software and hardware FSE
> stats such as cache entry count, full cache count, current and
> peak occupancy count, pending search counts, etc.

What does FSE mean? It would be nice to spell that out.

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

