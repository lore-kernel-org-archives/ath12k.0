Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7759DC4167B
	for <ath12k@archiver.kernel.org>; Thu, 30 Nov 2023 17:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0Nm8LRoxoafPjYtdgu+SYvYPz+nacFS/JBRU9nSy60=; b=NqPAnleMSp7daEZIkEpctWorC5
	2YWHD1e5ag+EWR2EVzGazPHq8jZnApp3bu4BuecvI+4SVuMTKCX0/gYaW15uo1SZxLanQNnzmmeuC
	fY61Ovam5n9tWbP9Tv4bEXJ7RucV+50Zjh3vVH3SGfRAAhyJnmiv3OdxQTbGOdOz4SB3JWGnkoyM8
	iOSrg13UZCqdfVVAsvUlUQDj2Pwl199wpWe3gxmGFbyzrNPPoMXsc/9ST+GCYlDmDBucJj044yamC
	aYPLwc+HBdrmt3VraOci5AlXWRhn2+QPEUxHT2kZbmQdkJAMCWJmLp8ChQ97/QovqE+81D8dDyIlG
	RGllAH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kug-00BVxy-0k
	for ath12k@archiver.kernel.org;
	Thu, 30 Nov 2023 17:33:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kuc-00BVxP-2y
	for ath12k@lists.infradead.org;
	Thu, 30 Nov 2023 17:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4DF85B8433E;
	Thu, 30 Nov 2023 17:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8230C433C7;
	Thu, 30 Nov 2023 17:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701365596;
	bh=t8uwdWXJ/C0JLH2QtDk8ksHVHtSvg4O875BSx0Lnepo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=U65o5Om96swNnsEc4VWBBVrKn+jJlHiJwetMhFbmNLXe21f81nW1mxyUmiOr8kuer
	 p2ZCdwAm1lUz5pBg11I5fkT5M6OdqRR100/Sn0pFOP4hmYQSaMKbuIsIOgdKJ6tpHI
	 mzDvskPaC8jO2bGjRVDlaKMv/isO2xNBT3WnEySjiMIDIE0huKngOIm95A1cck8JHT
	 vMz2Rihy+j1tyFTITKW4m6AqeBrHqu+GEt/6FAG/CePxwKVqPmt2uTkBa1xbQOAV5y
	 923yJJZQG5PSn1Tlx9uQ1lKNyhAR3bGUxAnH7nd19fGkrcNmDjHihju59hb+nQE40L
	 aLx32waVWA8jA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix the issue that the multicast/broadcast
 indicator is not read correctly for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231118134538.19545-1-quic_lingbok@quicinc.com>
References: <20231118134538.19545-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <lingbok@qti.qualcomm.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170136559355.1566939.2533583060106709722.kvalo@kernel.org>
Date: Thu, 30 Nov 2023 17:33:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_093319_130200_AA587682 
X-CRM114-Status: UNSURE (   7.30  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> We observe some packets are discarded in ieee80211_rx_handlers_result
> function for WCN7850. This is because the way to get multicast/broadcast
> indicator with RX_MSDU_END_INFO5_DA_IS_MCBC & info5 is incorrect. It should
> use RX_MSDU_END_INFO13_MCAST_BCAST & info13 to get multicast/broadcast
> indicator.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

ALWAYS run ath12k-check:

drivers/net/wireless/ath/ath12k/hal.c:892:16: warning: cast to restricted __le16
drivers/net/wireless/ath/ath12k/hal.c:892:16: warning: cast from restricted __le32

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231118134538.19545-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


