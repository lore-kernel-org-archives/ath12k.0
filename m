Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4173D0E6D1
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFkSNYrzwHBHmzYOasDsS6567z5AdnI+gjgGVWIVASI=; b=3DhxINMCOJDCYRU8Np+mpatMEv
	Sr27yz7Z6nNl2gtFtPAbDpnUoazBZKJOwDwDTUWOmfFqOt89XVoUn4RlBtvYMTO0RYEadflgwXwb8
	J6sPg2+KqsJ28c/CTE8ChN592cJ1A2RRz+tQzPBr0Yd/PFiS97ZfHpfrU1KqGC/gE97dKWJV0s8GQ
	O9YQQZhhTOw1raCC7Ts+a6qRIkqcROozlUj8BYTm0F9pU2zLg5NE4EIVde/ZEkVPe6J+PNOMl1myw
	7TlCl0ZQi78F2b8yocoGFOjEaM383aKyL8Bsj+xI+niMkDR3EMxwT3leZdXfADK5mQAalC7MvK1Pv
	0h/KHfkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oNu-00000006ehp-2Hq7
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 09:07:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oN9-00000006eWo-1Ptj
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 09:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3351C5C5B47;
	Mon, 21 Oct 2024 09:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94912C4CEC3;
	Mon, 21 Oct 2024 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729501602;
	bh=+ZMNc1CMzmELhjMB7j/skx2+yKwY4xJ6OUJftzt0FZA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=l2LO2f7CuDmW1chxODWB1XEmOgaTtTbOnvzYwSwMTRYvFNlPbhSYMidmE8Kbzfest
	 2qrf9PcLNYyKn0qTAmYqKw9f7qCE06P562Wt2SoV2hekNOd9+AZsbkBuMFhZDFXgR8
	 zaeWA+WWA2+IhkT8HzpJYInm26OtrxDQRpI8Inn8mA/668VSfU4CLjpnURsaYQAT4R
	 /yjKJ8ZFn6I1QMqZ3z8cOyxU8vQUFSwmIJB/tgsgm7H1tf8WiC+rXau24VgoPXHmun
	 iEu8W0lg5dN3DSLjW4ch47xsApsQqk+kInjGXec3J+AzeUqU5mgRLMCqvmNFibyy0l
	 P/TlCqlt9h6Ug==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  "Rob
 Herring" <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  "Conor Dooley" <conor+dt@kernel.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  "Bjorn Andersson" <andersson@kernel.org>,  Konrad
 Dybcio <konradybcio@kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 16/22] wifi: ath12k: convert tasklet to BH workqueue
 for CE interrupts
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
	<20241015182637.955753-17-quic_rajkbhag@quicinc.com>
Date: Mon, 21 Oct 2024 12:06:37 +0300
In-Reply-To: <20241015182637.955753-17-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Tue, 15 Oct 2024 23:56:31 +0530")
Message-ID: <877ca1q0yq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_020643_440543_367DD4ED 
X-CRM114-Status: UNSURE (   8.87  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> Currently in Ath12k, tasklet is used to handle the BH context of CE
> interrupts. However the tasklet is marked deprecated and has some
> design flaws. To replace tasklets, BH workqueue support has been
> added. BH workqueue behaves similarly to regular workqueues except
> that the queued work items are executed in the BH context.
>
> Hence, convert the tasklet to BH workqueue for handling CE interrupts
> in the BH context.
>
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

22 patches is a lot and I'm not going to look at this in detail, please
reduce your patchset size. 10-12 patches is recommended. For example,
this could be easily submitted separately.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

