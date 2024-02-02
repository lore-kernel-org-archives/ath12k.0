Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8C4C47DB3
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iNzjEEfRgRNmn0nb3j5Aiajhsq98A4b+FldIZ5Si7E=; b=bkiP3aduIogmb63VSIB6BlN/nV
	hgbE0Vwz5IreQpRF/YRmMTp/HaNYSumtevGJ8QyP8p6MQoQRuIBvSOJMu8KNMGXp4u//aODAZuxrG
	HkIFs9L0aLgAT4Ig3X/5095CqJ/42jYMdtMprYMq+iVnvtGlt6az6LRwPwPQSBbjvOAzYTdhBq4R/
	AALYPS4Vd0GTHni18QmTTlDjeW8hHKZC94x/4t+Drs1reVMQ/H96+1JcYDBOfCUDAuDPwUr5tTngL
	UlwJag5/W9HqKr8Uyn8OtAiUJ3LrWvkYLjPlKPa5pLrYPenC375e7LIcoAH08DjY3DYn2lncyS39o
	/LtOOPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsoO-0000000BV4q-2GnK
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 12:38:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsoL-0000000BV4N-2xAx
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 12:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0FFBCE2A39;
	Fri,  2 Feb 2024 12:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D52C433C7;
	Fri,  2 Feb 2024 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706877502;
	bh=RfsTFe4NgUohvaiNqS8BwZubOvrLemzOg+tSA4xiw+Y=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ET/V61RpCR7OpcbaOeFrZ49qbnC+BV0ITqtWKUk6qxjOCAFhZe68J96QL2OYltfXy
	 9VXcZLyiuM3PNdgUJf+5+a1fTtiuCFYkuTZG3am/koyNlsBtt93PrO+P6ebza5QFNj
	 kj9BLxe/WU4WqIewpARaYME/WbOGjv0hf/3jBCJK9RJAHFFJPLInb0HtSPGXEaCNot
	 XrRg8XM74wMtsHrCdMGMVgyT+75HfCDDT1trk18YCFrEBdgphu/BK8YzDGbKt9GHwX
	 rJEdn7QxSxiMwiW7PX8agIj4aY1+980lLpvboaDdu3j2Boe71ptsJdq17Y/JsISM7K
	 TWXdgdlKbP5bg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] wifi: ath12k: add processing for TWT enable event
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240122085336.3985-2-quic_lingbok@quicinc.com>
References: <20240122085336.3985-2-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170687749992.3221346.6741528529227043525.kvalo@kernel.org>
Date: Fri,  2 Feb 2024 12:38:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_043825_960629_F1CE0CDB 
X-CRM114-Status: UNSURE (   7.99  )
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

> When ath12k send TWT enable command to firmware, firmware will return a TWT
> enable event to ath12k. Through the analysis of TWT enable event status, we
> can easily obtain the status of TWT enable command. It can be more
> convenient to debug TWT.
> 
> This patch works with WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

2f92b22beef7 wifi: ath12k: add processing for TWT enable event
ad2b29ad94c3 wifi: ath12k: add processing for TWT disable event

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240122085336.3985-2-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


