Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FD6C001DE
	for <ath12k@archiver.kernel.org>; Wed, 26 Jul 2023 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwuVv9/3Ud+LZcz4f/pMjYn3zSM11V2xWr2IG9kK9aU=; b=pa3++v2EleBL70
	rRs5AvONxtVEHyclZFzioCIitY3Tick+xxyI43zVDjdfuJ6ov7OfmuZRuRD0ekdw4oYON5/9nDVis
	vOmS1xc1JiLDmV/ckbYMfxRkf1uaLDWq5o0UnITZj1xOxZkT6vZBr/fGIcpDKbt3Vjfwcizwq4ydn
	myH3bSbczgJa9No68l82kpmxT8dRoK3jiNEVl5d99johBzrHrW+PHpsDziuozMUkaEtPnWCLMazo+
	vgYSdTxC/4Xsskq6UIL1Nbjbukb9H6TMDqnlYmnWFZIF6vPIH5eBJdKvQREXQe0frm5lqdRpNo0Oa
	KEdMb067Qyypmc+vOZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYkJ-009OMl-36
	for ath12k@archiver.kernel.org;
	Wed, 26 Jul 2023 07:15:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOYkG-009OLm-1b;
	Wed, 26 Jul 2023 07:15:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ECA6C6167E;
	Wed, 26 Jul 2023 07:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48132C433C9;
	Wed, 26 Jul 2023 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690355739;
	bh=t8DhHa/ZfFQ4O+NBAyFPpqKY1E9TvtW68eNEjkdnSDY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Zr4/t27NI3HvWm90vbM1O3JQr7yST05eFidX3B6R4HgZYT4gz4dLfYf7W3Q602k4E
	 SE7Y3+i9x/e2Ip3M5/gCsAVMAOMWORB7+jS1+iMfHSTYGtpoFU0BAwj/T0wkgLmSAG
	 WM7RbiqV6lanSmCSpD1+rvChWHm/exu02c5UZ8Mx/ejAs6IRWgPMZvKl/6EF5gatro
	 vnFpY9itefcg62HioZs0OKBt5AGhHITyvXqsV5Dgp934/XfncanqwT5ZV4qQygc1Yx
	 iYgXCQegfQd4pgniustsALLYMnZMKg7dCG3acEnhujaDn/RCaw/0R4Xn0AFsGnE2T4
	 HLdz79L4xYS2Q==
MIME-Version: 1.0
Subject: Re: MAINTAINERS: add Jeff as ath10k, ath11k and ath12k maintainer
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230725094248.3205486-1-kvalo@kernel.org>
References: <20230725094248.3205486-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169035573624.3467307.11100400634973948208.kvalo@kernel.org>
Date: Wed, 26 Jul 2023 07:15:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_001540_577480_A3DDB9E3 
X-CRM114-Status: UNSURE (   5.35  )
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

> Jeff will now start maintaining these drivers together with me.
> 
> Signed-off-by: Kalle Valo <kvalo@kernel.org>

Patch applied to wireless.git, thanks.

456b5e85d8a5 MAINTAINERS: add Jeff as ath10k, ath11k and ath12k maintainer

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230725094248.3205486-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
