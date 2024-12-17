Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51FDE77184
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynitLHa70W62om2nn4AOHqcOLVyR/oCHgID48MS5pEw=; b=JHZOCfg5qmakOsivjZLBw3XYfm
	rmdM2h1cyLDbzBMKd5u7hlq4paq9Qk1lDMCfliX5YFRAmiqp+h4DQQrKGlcCg3UoLhU4e1SNkdWi4
	cIPkW5uqt0wIMyhoWnKryM1hY9PXkA8qVDi6EgCoEcigoaTsGPOPTkZJeZdPHNblzJC4chU4NDY7K
	T2s150ZLNE2JwNfcocuakO7p5T17JsWWjk/4OOdyvxnTIdBhwe99dtlefv+z5ExGOZMobJ3pvJbZh
	+WRGL0Du/txr7w7yAkHeGAjHJSGJNX8gRc4sgsU9PaGDSJY9tt4G7HZ3iH1yB9ruovUFG7o7D4usr
	9HpTdTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdYA-0000000EfrX-1nKw
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:48:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdVf-0000000EfRT-43pO
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 346E75C5921;
	Tue, 17 Dec 2024 19:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43353C4CED3;
	Tue, 17 Dec 2024 19:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734464735;
	bh=GLX+xN2bnDAbGaktG0VLB+CLHBDWLkg0D6DmW0YwQLo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CI0U9e5+py7R3sAdV+lG2If2BVrIe9nAFuuQ7yBLwP8C3mH2Mw/LCxVjgbRpNfQwA
	 JBvwZE8Hb+4s9xDhKACn/oSzLYmyXzAyvF8tT3Ki4YhStkkF4Y1A+MmRUbTdpOMcEM
	 PsVNGIba9rl6YEcjzpgKSQyLKY79E9Ki9VT9aEZGfkYvLesFfeDaZ+RXySEqeZctyA
	 sS8BKsv2JrfFhRymyre/A+v/A7KyGPvCI1ms/rvSUvwXqmxmFRcfmh3ib/k5jgJlDX
	 FzCCXcUJ04nRns05Ly7vuF7Q+lDubgIAkCE1rbiCfrcsPPV3PmT6GNFFXrc7beiShi
	 snkLwFjtljNfw==
From: Kalle Valo <kvalo@kernel.org>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: Add support for parsing 64-bit TLVs
References: <20241217095058.2725755-1-quic_ppranees@quicinc.com>
Date: Tue, 17 Dec 2024 21:45:32 +0200
In-Reply-To: <20241217095058.2725755-1-quic_ppranees@quicinc.com> (P.
	Praneesh's message of "Tue, 17 Dec 2024 15:20:58 +0530")
Message-ID: <87h672ks9v.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_114536_043631_C0E8FE15 
X-CRM114-Status: UNSURE (   7.87  )
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

P Praneesh <quic_ppranees@quicinc.com> writes:

> There is mismatch between the format of monitor destination TLVs received
> and the expected format by the current implementation. The received TLVs
> are in 64-bit format, while the implementation is designed to handle
> 32-bit TLVs. This leads to incorrect parsing. Fix it by adding support
> for parsing 64-bit TLVs.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

