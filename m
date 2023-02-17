Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE07C636D6
	for <ath12k@archiver.kernel.org>; Fri, 17 Feb 2023 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhJYsA6cuT6/CNcygeoZ3XHLzzcPT47MKP2HtrQSzdg=; b=O9HojBp5ecOVJE
	IWlwyIEW409SEjOE3dJx4cgPq9NxqE3K6PaitJDr3/ieEuIjk9CwG9APry5tSryhcxAdWP54K5RaQ
	5ZHqOl1BS6jOdS5nBO9xdfMu4dk7hKxB4rsVuEhAIbQVNpsvgzD61/MMyu0nav6gsFgqTm06uHl8+
	9alf3nY5hu3BscwZ7CmPtil/uS8NMmeoXj1IEOlixpQwjMgA5Fdgb1iJW38w8W/wkXgR27DFMfNIT
	r0XnEhu4Frr1LuNP1/5f0XAEicHAP+lo/tWtBPrBEXJMKplxQ1ywx/wpGX2F+1wf9Ej650C6HfGZb
	cJaE2TYd4yWeqTbu1WgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3Wk-00F2DK-D8
	for ath12k@archiver.kernel.org; Fri, 17 Feb 2023 16:24:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3Wh-00F2CW-3Q
	for ath12k@lists.infradead.org; Fri, 17 Feb 2023 16:24:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8877E61B9A;
	Fri, 17 Feb 2023 16:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEFBC433EF;
	Fri, 17 Feb 2023 16:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676651037;
	bh=qFslmSzBHq1AFgtu6b6trKJWgxNQcXfdeaGjKzspQjQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=pdJrv020MefvyaJULoXEM8dLdq3YxM5+3Dp+vb0I9W3dq9XWz0h1Y16dmS1ICAfLi
	 IJdilmpBtjSmWsxBcKjZJhTmzjEn3JQry8d3O3RRpxrEOjhqtPdkUOB4iszl4QFmGO
	 tWR30HwYQNUlvRf4WP5p8n1wEYzTU2OwTntN9mP6qrQaV2LFW+LY1ftnOlr4NE1onO
	 Zbma96q2u+qle4NNGIMHbGuXYUf4CaD2/R1/R2qgoW65IyyLZME0qKaqCWTIz7Umj6
	 xvRXbCHue1fhpmoGyuCGxlEvRcn9wC8dkxZiTq3kDxHjOF2aPQbJVl3pm0bnrihi//
	 bvxrxs9G711qA==
MIME-Version: 1.0
Subject: Re: [PATCH -next] wifi: ath10k: Remove the unused function
 shadow_dst_wr_ind_addr() and ath10k_ce_error_intr_enable()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230215014058.116775-1-yang.lee@linux.alibaba.com>
References: <20230215014058.116775-1-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167665103358.8263.4713649480781562258.kvalo@kernel.org>
Date: Fri, 17 Feb 2023 16:23:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_082359_217091_F68DEB21 
X-CRM114-Status: UNSURE (   7.96  )
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

Yang Li <yang.lee@linux.alibaba.com> wrote:

> The function shadow_dst_wr_ind_addr() and ath10k_ce_error_intr_enable()
> are defined in the ce.c file, the code calling them has been removed,
> so remove these unused functions.
> 
> Eliminate the following warnings:
> drivers/net/wireless/ath/ath10k/ce.c:80:19: warning: unused function 'shadow_dst_wr_ind_addr'
> drivers/net/wireless/ath/ath10k/ce.c:441:20: warning: unused function 'ath10k_ce_error_intr_enable'
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4063
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3c3ab8c9a296 wifi: ath10k: Remove the unused function shadow_dst_wr_ind_addr() and ath10k_ce_error_intr_enable()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230215014058.116775-1-yang.lee@linux.alibaba.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
