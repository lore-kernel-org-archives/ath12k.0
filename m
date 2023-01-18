Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF6AC004D4
	for <ath12k@archiver.kernel.org>; Wed, 18 Jan 2023 06:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UI569wagwLnxxRLX60TJ/ygn/00jLlrYvsNFLBdnpJg=; b=RSiBks5vctu94r
	oL2Ovu/fZE8nC89A7yCcunmHssZ5zK5Fc7zsLo/Q9Dhw9zY4TfeLmK61xNNzczEdu5fg1fvLuO1qx
	FXvnxxaPQ8W+LO4FSXzbCtafGBivFCFfGjFhJnt3ffcVs/62Uu4IZ0PpFg5Geo8fSntBaRvW9FG/3
	CaKMuSA5szA3BGaOBJawegMJGAGEKCnY8CQzQQZ6MrRCkKTxC/TVsxTJax5H77Iskn+ZVAPOe9Y7u
	WzUHqKsGmFHALwPtVoN2EWoKLjqM3Tp7hi+NOr8uBF9dHbFUpCk90HMD1XWHzrnsmIsDbaF3eRhvN
	rXWc4caRJiPoGdUV+FCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI25M-00H7Dm-O3
	for ath12k@archiver.kernel.org; Wed, 18 Jan 2023 06:38:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI25K-00H7DA-9u
	for ath12k@lists.infradead.org; Wed, 18 Jan 2023 06:38:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF535616C9;
	Wed, 18 Jan 2023 06:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD53C433D2;
	Wed, 18 Jan 2023 06:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674023889;
	bh=sZu0lvoVCkS8gPjQX1ay7P2qeBFzV+Gmb3UiMDc51SM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=athbuIHBM7CpRurICTeuepoll6rm+Kds5KeXpfPStDFCHerKjiJ9L1zDlrlIZmHz6
	 FajpqFfrW/5r13Ay03F8IHipgkjc8te0XmknFwrqHVlRwo08mIio1rGJSOo+kgAenf
	 90ECiOt2YdgytaTKQPD2xChfE7xs08a41FSy0yASY2d65I/eI5qnc3kNWjESSDXsto
	 GxwzUrPsnyR0WdoRuP9/DhyNxIrWtsaG6m7vKpMRJ1tD7okMmkRN1n/5+8gzw1e+P8
	 aERIWs7ImFLTF4BvQeCKVxTeHmYYwu3MywOxIglVF1xLJIrprOqkxLp39AvkItbwOL
	 bIm7Ep5yXjoag==
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] wifi: ath12k: Fix uninitilized variable clang
 warnings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221221105529.19345-2-quic_tmariyap@quicinc.com>
References: <20221221105529.19345-2-quic_tmariyap@quicinc.com>
To: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167402388648.24104.6725503653020144748.kvalo@kernel.org>
Date: Wed, 18 Jan 2023 06:38:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_223810_429253_8CFA128C 
X-CRM114-Status: UNSURE (   6.39  )
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

Thiraviyam Mariyappan <quic_tmariyap@quicinc.com> wrote:

> Fix uninitilized variable warnings spotted during clang compilation.
> 
> Warnings:
> drivers/net/wireless/ath/ath12k/mac.c:1076:8: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
> drivers/net/wireless/ath/ath12k/dbring.c:272:7: warning: variable 'ring' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
> drivers/net/wireless/ath/ath12k/dp_rx.c:2690:34: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-03171-QCAHKSWPL_SILICONZ-1
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

d1335f0dc18f wifi: ath12k: Fix uninitilized variable clang warnings
b57f03200853 wifi: ath12k: hal_rx: Use memset_startat() for clearing queue descriptors
80166c42434c wifi: ath12k: dp_mon: Fix out of bounds clang warning
2ee25c257d17 wifi: ath12k: dp_mon: Fix uninitialized warning related to the pktlog

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221221105529.19345-2-quic_tmariyap@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
