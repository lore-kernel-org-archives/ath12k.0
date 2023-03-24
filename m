Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F3C6FD1C
	for <ath12k@archiver.kernel.org>; Fri, 24 Mar 2023 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJfd/umyFNt3NQaW5KFcPnmbzV04FIAlYybbwmt5g3w=; b=YI0vlOTp/4Nid7
	vkKUBrlGeI4mRC4RPTjfyyOTOXRUw82iJ0ziq1UephEq8ePd3tvPe3n/hyMCq+bTF2jAI3X8CuZtp
	wqaxzrYpv3h97Wd9mJk3OnT7HoH3W+64c/W3OmY0Xn8lmPJfBIPIUlWHaVMtDiY+N9KbFYQzteDjS
	Ln1RwrFzydfG4iPwqe6BZvGeuDwl+u9be2TugrloySIts5jpYIiXnFRIxl+qmCJOnMHMKjo+DHfkG
	9/zK2SgLAoOtjO3Bp37qRjjDaEyzHOolGvvFMaHLMuhCGRd2tdc7DLze+FAJfv4AyO23v/SXa75BD
	4OsH1Mw9Drx9Dopab/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfiio-004hTF-1d
	for ath12k@archiver.kernel.org;
	Fri, 24 Mar 2023 14:48:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfiik-004hPn-2D
	for ath12k@lists.infradead.org;
	Fri, 24 Mar 2023 14:48:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A964ECE2401;
	Fri, 24 Mar 2023 14:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15072C4339B;
	Fri, 24 Mar 2023 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679669323;
	bh=fxpFTFNtK6KxsnmJvUbcE+rOKlYPFIvAHTBY4bVor9k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=q8RnldNCSKJJLBC08psJY2xH88COFrsN6K+uixAxREnaLR5UQ2zFg7iXkgd+zXg1k
	 dboolhorQ4+Mvt2gd0BlNItA3NfBeJJ0QY0avuu8l0ejtiENUucRPi9Y5q23iB8ZxF
	 yfKrPtBl6AVxxANIobfUvH8h23lLVRmZekYu5PnIa++6v/zK/SPZ8Rju/un/0PSwUH
	 +R1DnVCYMNV+/Ntnza9+AfcBoT/xHSOy0FpGz7xISOARffdSMvOs+jfjwJMqeUXyXq
	 IwbwOprvADwdRUz7wAtAQbxMpODn/VW7H/vVj/kYlCIFWqB9hYwVismFFgBmLjhP35
	 xrWWYxyw2X4hQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix packets are sent in native wifi mode
 while
 we set raw mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230320052427.12271-1-quic_aarasahu@quicinc.com>
References: <20230320052427.12271-1-quic_aarasahu@quicinc.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aaradhana Sahu <quic_aarasahu@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167966931995.27260.4748683209503916457.kvalo@kernel.org>
Date: Fri, 24 Mar 2023 14:48:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_074846_926558_06DCC355 
X-CRM114-Status: UNSURE (   7.68  )
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

Aaradhana Sahu <quic_aarasahu@quicinc.com> wrote:

> Currently, if we set raw mode as encap type, packets are sent
> in native wifi mode which is default mode. This is caused by
> no check being present for raw mode in ath12k_dp_tx_get_encap_type
> function, so it's always going in native wifi mode.
> 
> Fix, this issue by adding check condition for raw mode.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e93bbd65547e wifi: ath12k: fix packets are sent in native wifi mode while we set raw mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230320052427.12271-1-quic_aarasahu@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
