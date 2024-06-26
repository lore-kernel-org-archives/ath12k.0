Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A19C3064D
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QH4Lt6/3FNqxL+c2s9xt/0nUW2LqnuT/llcvDvLItKE=; b=wYS0kooTAIzSSeIRNHEOhRqBuF
	1tGv83MFXnocGaiIhnRvrwJ0sPBMbIo/wNkwjVbbj5Mb0YqZuZoUqSymonN0TF65tTMBaaxnaw8PM
	g5KSBoGe9fRLsSoeeJJ0yc3Cu0PkPJSAuHxc84+zPU2YTD4Kj2B02IkBQMs29MFRtqupiMaWntunS
	S1nsTIJ28HhQSJQ3TEmX7uNeEPcNMP7F2DSNJ3ok1Dvuw8y+qWAOeXcvXt3WBHSOa1KHxlW2v2Tls
	DfhDOShOOb7dIqjYqF0WIVHTpaLbnGXFYEUefJrHl9DjrhXuaesCOjLfuPMVr32SuMJ8ZNgvBLSi7
	UZLFvfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUnH-00000007RYi-0Zha
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 15:42:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUnD-00000007RXQ-39r8
	for ath12k@lists.infradead.org;
	Wed, 26 Jun 2024 15:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E86C6CE2256;
	Wed, 26 Jun 2024 15:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270F5C116B1;
	Wed, 26 Jun 2024 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719416561;
	bh=dunIfLY+4WRNsvU6UNanCIkOKgAbPpLCv27myTPXqqw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HzJPmUq5yly+7rVr5TFSBN0ug/fF72MijF8hBtZ4AnyFQcy0NMSqeGmxRUtd8QgQ2
	 rjz0Uz2suCHIQvG3nLBIE2EuTIUy2xna3G5Z5jkJIRApsdmHslhU8oHurYB5eoFerI
	 Tb5dTapBaVJ2XQB7ADTOE6vWkbqTSfk5/XKvbAT5aONnvXbIVmivkG+l0O5zof3UGz
	 ZXZE5G3ucQGlVWtgvo4xTY7B9P7ocyz8jyExhOMuaE7D+574X9P76gCfxQy6R9wkXS
	 4D+qQtfsrTqYLYuIVpZfAB6xMD7tvfolk+fbMPORFz1GUNb6O0WVTQ75KSkykun4+k
	 oGWH7GKCzBI2A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix peer metadata parsing
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240624145418.2043461-1-quic_periyasa@quicinc.com>
References: <20240624145418.2043461-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171941655813.1568703.13556661762295389272.kvalo@kernel.org>
Date: Wed, 26 Jun 2024 15:42:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_084244_011979_E235A83D 
X-CRM114-Status: UNSURE (   6.32  )
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

> Currently, the Rx data path only supports parsing peer metadata of version
> zero. However, the QCN9274 platform configures the peer metadata version
> as V1B. When V1B peer metadata is parsed using the version zero logic,
> invalid data is populated, causing valid packets to be dropped. To address
> this issue, refactor the peer metadata version and add the version based
> parsing to populate the data from peer metadata correctly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 287033810990 ("wifi: ath12k: add support for peer meta data version")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1eeafd64c7b4 wifi: ath12k: fix peer metadata parsing

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240624145418.2043461-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


