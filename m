Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4361E77188
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 19:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLp2qe5lCdxsJKglY6R8xTv1Wq1PcJbgViv7PM9UHAk=; b=T8kV18mZl1EALi644l4mAOwizI
	Nq9WtEKQGAf1ESoBt616rw4anTdGHtgyVXXlGXsYNZnoQ5U8d2CLjmABx/cifW90HNZ/FmpzMvLzc
	2JEVoi0hFABJkLyGADbz5oU1xQqog5WySuFJZvyNq7lQybbwS1264a7JZ53ukAcjTCz0aUk/HKUqh
	GixxqLWwFtUaWSH0Y/BlEGHHUKojJOMeW/nwTVsyqqiXvPkYUKpRaq4DJp92L4b5tMqm6mmMewxtZ
	xNoHlGVXl7c+3ZCUEo3cuVtrZ5WP8q77FwYBAm5tIg7a5J0NYz2ZhPzrkjNy34WTGgyxyttCkvOKd
	X72jE4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmss-00000009Zje-2TVR
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 19:47:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlmC-00000009RVI-0ICE
	for ath12k@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aLp2qe5lCdxsJKglY6R8xTv1Wq1PcJbgViv7PM9UHAk=; b=ocyuRnRJqwN0t+0l5D5D3GqNab
	DXYtaBySdY2qva2TMptvaPxQwmFAFFVAJ3vojwjA5d36tlraDI4s3cqTocMdTECza9hdnE9AAAf9g
	srSEVDxre4+u9PtpBMyqFKQJJIOek1hAuF2HlPfSg+i/gYV/sborQv9NXSUQ85b8EshOKEyQ3XTBN
	ozGwfrgr+YO3LAYupqZniEj+LCLx0ue/sSv4cq0uVb2LHhIjOneXH/TqjdSaxKDpOXLexOIwjyF8m
	Sy7fjvvOMA90kD9dOmdi3TCc1GvFII0VdIlHXMDEAcPCjdI56eEvFDnJln3tSqmU85YUoupzMrwO1
	pJ9e6+pg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlm9-0000000AYIx-028N
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 18:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7719BA41ACA;
	Tue, 14 Jan 2025 18:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059D4C4CEDD;
	Tue, 14 Jan 2025 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879787;
	bh=Tko+N3Fz0tu5dRw0EkJkvT2WNdyCin78QJz13mh47A8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NBkm/BIFvRWOP6hvQBCXsDMO3pjUWew/AtfOx/KlMOSgzoGrTQ9HdxK3jWB+y/2cY
	 efGbUqoTw+LzO3bv2Xv3j97xSNgn1dvALC76nPoDi74SbIp+N5nT64J1obZBngtc91
	 e7Uw9ArO6Lo7yrjk6X4Ngxo409BPtUZXouV/bNWMfGBhOsLypjNqV6dsCA2KJdhiTU
	 LmYQ+qQ+bRTbwjEJWtGJFPnCeilB3saoE888kxg/XXRrc8OdjEmTuvCLKvLQWBunTt
	 CUPwF2iL7nww1q5NDP0/pb6NxpG0Z5k05laha+Wuq8fHH2HOPzm2/FJ5C61e8uvlD3
	 Lfq/cZZZtggrQ==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath12k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] wifi: ath12k: relocate
 ath12k_mac_ieee80211_sta_bw_to_wmi()
References: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
	<20250110-fix_link_sta_bandwidth_update-v1-1-61b6f3ef2ea3@quicinc.com>
Date: Tue, 14 Jan 2025 20:36:24 +0200
In-Reply-To: <20250110-fix_link_sta_bandwidth_update-v1-1-61b6f3ef2ea3@quicinc.com>
	(Aditya Kumar Singh's message of "Fri, 10 Jan 2025 00:13:12 +0530")
Message-ID: <87zfjtnsyf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_183629_253024_A3B0AC90 
X-CRM114-Status: UNSURE (   6.49  )
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

> An upcoming change will invoke ath12k_mac_ieee80211_sta_bw_to_wmi() from a
> line located above its current definition. Hence, relocate it to above
> so that it can be invoked later on.
>
> No functionality changes. Compile tested only.
>
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

