Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC5CC47258
	for <ath12k@archiver.kernel.org>; Tue, 23 Jan 2024 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCG2sHQpLrcwef0tfGODeonLN8MkZ7bpsULOgAGhI8k=; b=JlVHaRlZExaj7rj0zSCZ9ZFLGp
	XGjOGygRyTj9h3Q6BFo+o28yuATzXX/FhfR+jZ6hZVurjxndYDQm7/hUoFmiFDw1Z9DFYEimGJJzO
	VJa9XPkYXZlOSqEqZBUDJbPRbs+qAYEO/Htg5P4DJOySc6IaUw5KuLxEqyp+zu2eTaJDpP+rwLduV
	mvlddlGIWeyNsCFbHt6yUO/jizXY+hK7yrIRuTncRNDch5JlnVpaZby2I4GhloTCY1Wa2CBnIjZhg
	+DScq8PIrIlr1x/i2AUkvgCV/Eo8k+U2brLXMkhkudwsMXqYUPKIPTJoDipMMbZSujkWGCvAbU72k
	HLO36DmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSD9R-00FlIa-02
	for ath12k@archiver.kernel.org;
	Tue, 23 Jan 2024 09:33:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSD9O-00FlI1-2a
	for ath12k@lists.infradead.org;
	Tue, 23 Jan 2024 09:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 080DA61C11;
	Tue, 23 Jan 2024 09:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63E0C43390;
	Tue, 23 Jan 2024 09:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706002376;
	bh=HwDo0qMM5rmS7Ioy8zXu0yj4NxvXalYI+ptN1DCfQL8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gY2uuySA6EmCungLnDHpui2vUEf4nuZzbda3AW7Nc+45uYdkLRAWmLaCb3H09wlnw
	 Cbh7zMD6F9u1ZmM6DHep9Txu9j8rRdR5qxIVnCTEKUuhuh/ne5+vzoSuhc814ZFBLk
	 PeRrfmYHf4fVtknwls817JCBQmBsWQYUXfAt6VZiFrQQzxDHp47w9cTuaH9dXm5G6M
	 T/GDkqmB5Xa+5QGDVCePNUyNp6TYCG6drJFYa0Gx3RR7iF3fLoPwuAwsflWtVb+WN7
	 YAQvFZcpS/yHey+9Qcabb2xoVObz3/s87KgGzTBwnYsPzAFK9HBBlEBDsHZxoaCfwx
	 vQMxYX2HrGzSg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Fix issues in channel list update
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240117062628.8260-1-quic_srirrama@quicinc.com>
References: <20240117062628.8260-1-quic_srirrama@quicinc.com>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sriram R <quic_srirrama@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170600237376.3897582.9674673785656987739.kvalo@kernel.org>
Date: Tue, 23 Jan 2024 09:32:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_013258_911778_187E64E6 
X-CRM114-Status: GOOD (  18.56  )
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

Sriram R <quic_srirrama@quicinc.com> wrote:

> Currently, the logic used to select the 6 GHz band is incorrect,
> which may cause 6 GHz supported channels to not be updated properly.
> This is because the 6 GHz max frequency supported by the driver is
> being compared to the max frequency supported on the board. If in
> some cases, the 6 GHz max frequency supported on the board is less
> than the defined 6 GHz max frequency, all 6 GHz channels are disabled.
> To address this, compare the max frequency supported by the board to
> the defined 6 GHz minimum frequency by the driver.
> 
> Similarly, when a dual mac card supports both 6 GHz and 5 GHz radios,
> if the 5 GHz radio gets enumerated first before 6 GHz, the checks in
> ath12k_mac_setup_channels_rates() can cause the 5 GHz channels which
> were enabled earlier to get disabled when the 6 GHz channel list is
> updated. This is because the min 6 GHz frequency defined in the driver
> is 5945 MHz, which should be 5925 MHz since channel 2 is not considered
> currently, but the firmware can pass 5925 MHz as the minimum.
> Hence, update the min frequency supported by the driver to 5925 MHz.
> 
> In addition, ensure that the channel list update to firmware updates
> only the channels that the current radio (ar) supports rather than
> considering the wiphy support. This would be required when multiple pdevs
> are supported in a wiphy and they support different ranges of frequencies
> or bands as in single wiphy support.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

I did because it looks odd for me that these are capitalised (could be wrong though):

s/Min/min/
s/Max/max/

Jeff, what do you think about that the patch and my changes?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240117062628.8260-1-quic_srirrama@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


