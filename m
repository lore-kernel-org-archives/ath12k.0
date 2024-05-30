Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58221C25B74
	for <ath12k@archiver.kernel.org>; Thu, 30 May 2024 15:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUls0+Y/5ZlNM5ZNiN0yLJf6yQCTVsbE9w8n9/FU7xQ=; b=af6YBjuwADUE8xsE30FObnLSJh
	GKNrKfgSoHuNUnNFlUOdDsIUug+K3mCLxSiLrv5dM9bv4NftvJh8/jO19cMX1re1E2oM6IL5ssREY
	fQZ6p8WAXjE3N3zY1GsmCT/3uZirpR4h/apYn1fClA/TSROr0X51XdbMdkvHiSCN3B56Py41zDNKy
	nDp5mS6bC0cbSslMTg9Zi287Ki4L7c+ChRjrOY5wCWbxhj9SPisMkPgV83teJfrwgmYPxq/aKW2GY
	AGbHTmk4QrdrUOTMqhUlMS0X5L88ZsDlirl97up6ihtAmwBohMFC+ITjimy5ByjtkJkv9shjjxVn0
	KHJTzJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCi4U-00000007m4Y-034N
	for ath12k@archiver.kernel.org;
	Thu, 30 May 2024 15:52:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCi4Q-00000007m3v-2uZO
	for ath12k@lists.infradead.org;
	Thu, 30 May 2024 15:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CE6E9CE1801;
	Thu, 30 May 2024 15:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210FCC2BBFC;
	Thu, 30 May 2024 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717084320;
	bh=+t5wnf/lGU94va9o2dOM/f3oSHWw4legoug0aJRpUCc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jKM1TlauUiPBRYFl7lpoi9a3QAup1A+7Gn+tnKR5djhIVLA9eVW4CRZGZYDc1rkMN
	 OpeVIjh8eUf0+xJP1QEHJUWLJNAlPZA+0N6v4ymFG0vyrbPvtm84tVWMNg8vbylUbG
	 15B4uCytiC5mdOPZa54952hvyrM5eMPp/3fOg86WGbZnAVsrSCezKkQGpl7vUOGLYr
	 6tG9lN7bZT7K5r7zxGkqVnoEeJo2huUsO3NKwILd0gRLXcUIeO3X5ghntE9/lrsClG
	 luZ4AzkS7eu+nQ7vLEgJpDKRPLOK2UbbjGK/KrHsx5QhLafW065x3uc2SbUSGEZ8Zj
	 QTvmNNeOyoKmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: do not process consecutive RDDM event
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240529015357.9846-1-quic_bqiang@quicinc.com>
References: <20240529015357.9846-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171708431707.182911.18020118450282306541.kvalo@kernel.org>
Date: Thu, 30 May 2024 15:51:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_085203_053906_AB7B83D6 
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently we do reset for each RDDM event from MHI, however there are
> cases, see below log, that we get two or more consecutive events, and
> it is pointless to do reset for the subsequent ones. What's more, it
> makes reset process more likely to fail.
> 
> [  103.289864] mhi mhi0: System error detected
> [  103.289871] ath12k_pci 0000:03:00.0: mhi notify status reason MHI_CB_EE_RDDM
> [  103.293144] mhi mhi0: System error detected
> [  103.293150] ath12k_pci 0000:03:00.0: mhi notify status reason MHI_CB_EE_RDDM
> 
> Add a check to avoid reset again and again. This is done by tracking previous
> MHI status: if we receive a new RDDM event while the previous event is
> also the same, we treat it as duplicate and ignore it, because normally
> we should at least receive a MHI_CB_EE_MISSION_MODE event between them.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8233d2716570 wifi: ath12k: do not process consecutive RDDM event

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240529015357.9846-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


