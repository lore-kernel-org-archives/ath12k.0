Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C74AC07E97
	for <ath12k@archiver.kernel.org>; Fri,  1 Dec 2023 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QONFaCObi+57YVHH1P010FvvsTIvQNW0idS8qlgcTLg=; b=I0wftTEZE0LlkdfNGGbFEzzrZw
	gas4wt95qG29t9bbBMawUROLlV+/EGS6LNB/Lv+oRn5xgdZq+fvKADzJKyl5uOgUwFsQGdfY7AaCV
	wOw0s7AuUbK2kJdBFIINkM4G8+mY1tzBUalaR4uP1Gi/7Mnurd8KdCmN555XxEBlIwCxXVCYe09Pp
	BF3PLn1rHp1dID0lXWxgLE8qjM+7q6k3nVRnT1e20ljuruPpNPH2EtWF1G2ZMielSEEXYrl9b3I1B
	XnFmybHSmLBHDkacOUv31Pmsd1YLVmnB9HiLgkcSGUt8fcTREscUhluVAoui2uWF/OMIYmONBXat+
	fOpYraGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r961a-00E793-2N
	for ath12k@archiver.kernel.org;
	Fri, 01 Dec 2023 16:05:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r961X-00E788-2h
	for ath12k@lists.infradead.org;
	Fri, 01 Dec 2023 16:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88E46CE268D;
	Fri,  1 Dec 2023 16:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE27C433C8;
	Fri,  1 Dec 2023 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701446748;
	bh=nDl/aaAVTMBelGPOB6ViJvy/FJt4deD09PE/7R1bxFM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZUeujLybmuJFInTuwuYKDt2h3+Z1ytIBh3k9tNxmlPrxn23Jib8dZciNcHLQGn8HB
	 w/aoqL4LNzAefRd5ulTiq/uIcjkswukLtauHZcpEatm61msttJCkYNMRDHgJrU9TWi
	 UxTReEzxiNqaHpEou4zcXwcKAFh7rfLgJWh7C+MmHfIjo3MvGqlrOfk5yAdJy74wZU
	 oZsKaowZ0cFK/b4HXZJwEXSDucIu5uN7SZTgjXMTk9QSxyFVhPY/JD6qdpPVB9Ho4r
	 dbU2+rllrQMwnja4YwcDTv1MHrxjSKEPL3tKV61ri61pZDStaNVaq+uX6BPuAsMeot
	 cel/3dzgYWNqA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: Optimize the mac80211 hw data access
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231120235812.2602198-2-quic_periyasa@quicinc.com>
References: <20231120235812.2602198-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170144674601.2201420.17048744977292270118.kvalo@kernel.org>
Date: Fri,  1 Dec 2023 16:05:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_080552_103624_DFDE5B31 
X-CRM114-Status: UNSURE (   5.66  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Currently mac80211 hw data is accessed by convert the hw to radio (ar)
> structure and then radio to hw structure which is not necessary in some
> places where mac80211 hw data is already present. So in that kind of
> places avoid the conversion and directly access the mac80211 hw data.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

842addae0208 wifi: ath12k: Optimize the mac80211 hw data access
940b57fd0e77 wifi: ath12k: avoid repeated hw access from ar

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231120235812.2602198-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


