Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED96D44171
	for <ath12k@archiver.kernel.org>; Wed, 20 Nov 2024 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqVJ+OecBBkkIAb+nWbiv1jacRahyYtdG53nRv8jITg=; b=aqJDj5jfegq/XkO5DgRxWYqdxm
	wp/yg6x0SDzhPa+EhtPNoff3UzSbiHOqKdFP5Pfn/KDt5MVDPmuUQpMKwpR59Nnh2GZqtCVG0AoQN
	iMasHN4T3jZBqaia5E3kAzSgzh9uTc7RW4Ui+fcvJMyvgPoP9Y+IAcKGRLWHxMdcd3kyyQo0cCEQU
	nFUJ+TSJM4jkZTedxpbLKEHLIgwT3Cg1QOFI0fLvYARJlpLXaKL5THq3orOvq+zAEf3pDOkj1qdOQ
	5xAptgoGgbjbl2A+zy29as8cQcO7zvR7AoquK/TIWtuDMF26zaPjpzRAXId5vhEgtPli1tyzewI5x
	X9O3E2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgqO-0000000EthX-0qGU
	for ath12k@archiver.kernel.org;
	Wed, 20 Nov 2024 09:17:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgpT-0000000EtUC-1nEd
	for ath12k@lists.infradead.org;
	Wed, 20 Nov 2024 09:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD1415C5983;
	Wed, 20 Nov 2024 09:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4ECC4CECD;
	Wed, 20 Nov 2024 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732094213;
	bh=+b+EtdsVyfRyamFdsTUaD3lRNWO/5YL/T7wVZtPHbTQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qN5h4Oyq57UZY2/wFedf8mXHYUttmdSun8mRsjwXEnAi0LIrcdv9RAFLe0FEAnh5F
	 CialJElowp06b+bLbpD/ekKb1Y79Pk7LYvJiSa/2Xh6lqAbtLcPJGG7kWDymGFWqrW
	 SWAky+p3XSTZsCwP7zfB2ETjKPmRLYEOjXxbNFipRSajVMWuhmBPyWx7MMIeGSZgUi
	 skrOOybzKL0q4/Jjjzb9wpTW3bgZN4W9/EteTpsry4GgrOziaPLHck5T9DL2SGHpCE
	 jtXlvBeDBGpvdQlMNqpculFYos1CHnqk+YybLBCwi6A0ZNLz/SFa/HSpSt4P27p4RV
	 +CnuxeYvaN1uA==
From: Kalle Valo <kvalo@kernel.org>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: Fix endianness issue in struct
 hal_tlv_64_hdr
References: <20241119164516.756478-1-quic_ppranees@quicinc.com>
Date: Wed, 20 Nov 2024 11:16:50 +0200
In-Reply-To: <20241119164516.756478-1-quic_ppranees@quicinc.com> (P.
	Praneesh's message of "Tue, 19 Nov 2024 22:15:16 +0530")
Message-ID: <87jzcyz2m5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_011655_508969_C4DCD718 
X-CRM114-Status: UNSURE (   8.77  )
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

> struct hal_tlv_64_hdr has a 64-bit member that should be in little-endian
> format, but the current definition uses host byte order. Fix this by
> changing the definition and updating the corresponding helper functions
> used for the byte order conversion.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

