Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEC8E77180
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Lr5Z+zPzuZ++BA0lPOdN3beBwwQNr8LFKrdvWbDkTc=; b=abDOyAcNuqYtRjISGixSroF3jP
	7xlO0DuJe4owBtw4KMv/N5QLiP2wdbKiPhC0Q+wIBs1iZjq3h/WA3UGoYwemLM+ec1egg6ELfU/SK
	33Ww0KtxyN7XmkJbvpRZkEfAAWq9CvwhP0NcyrJw7iBtL58e68WtpKSWvzZdxED4uFCapnvn/WbCB
	7lL1RnYSTQahD0HTtV0rEqYWljz6ySG9kauzHKk7SGSj77tC/3K9kJaf4t/99x6bGFUQNRh3Tsm1I
	t0q6bUhZRNdipo0VOSHooaq6js6XLLCV1jvK4jG6esxobBBj3lCzHNhrs/x+5rYt6EukrQsLYLucK
	lnUlEaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkJZ-00000000d9R-1SQw
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 14:37:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkJW-00000000d8b-2FpB
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 14:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CBFBA4288C;
	Thu, 12 Dec 2024 14:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDFBC4CECE;
	Thu, 12 Dec 2024 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734014233;
	bh=TrXredXJ9ccEX/jcm5h1PIrzSODLA8qVGghS8P/vP8w=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=KD3BtImocCVUg9WQNu8x07m+fc0yEDMdGScK9wtvZxw+boHG/3awcBPhXzqN6el5c
	 6lYyGFQZg6/vVsUYbOChbkCEJLiaZFNtZdgCHX7PCZwMOS3K93vz3X2SXNvyKtbGfr
	 MnC+Qh0CbpX1Hk8ZtbUsW10kO7Y1XQhAivG8vQMyVUQyxwgzS5K/fx+r1X/7CXBQ2+
	 CWYco0brGPQkPbfCJqmTxvri+pKWuERkv/bx26KyW4NPHcJ8E4aOc187KUhvzylxs1
	 o/yuVeqYXPbO/0mYelrdsmnBM/ay5HtQlYkltSM5ecLoDcBwsxkSD/TnmM7+1jaKMU
	 nXQ07O3VwvZMg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix tx power,
 max reg power update to firmware
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240909073049.3423035-1-quic_santrame@quicinc.com>
References: <20240909073049.3423035-1-quic_santrame@quicinc.com>
To: Santhosh Ramesh <quic_santrame@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
 Santhosh Ramesh <quic_santrame@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173401423043.833118.7299649308958540993.kvalo@kernel.org>
Date: Thu, 12 Dec 2024 14:37:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_063714_641062_5C3D5B37 
X-CRM114-Status: UNSURE (   9.26  )
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

Santhosh Ramesh <quic_santrame@quicinc.com> wrote:

> From: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> 
> Currently, when the vdev start WMI cmd is sent from host, vdev related
> parameters such as max_reg_power, max_power, and max_antenna_gain are
> multiplied by 2 before being sent to the firmware. This is incorrect
> because the firmware uses 1 dBm steps for power calculations.
> 
> This leads to incorrect power values being used in the firmware and
> radio, potentially causing incorrect behavior.
> 
> Fix the update of max_reg_power, max_power, and max_antenna_gain values
> in the ath12k_mac_vdev_start_restart function, ensuring accurate
> power settings in the firmware by sending these values as-is,
> without multiplication.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> Signed-off-by: Santhosh Ramesh <quic_santrame@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240909073049.3423035-1-quic_santrame@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


