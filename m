Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36CDC47DB3
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sp58MFNplRMtGOTyXRmNOTSkRcJr7kVZ4bN9gj3Xdg8=; b=pI7irMWsjR1Ja+eulQFBon3Y/G
	Xml5vLTDEYpAt0+apMG/AooPyqiriBnrSFWfpH2Q/7lQbPJGII26LCcNXWH+nFnhQtDAzIZkLx1G9
	O8lJjMxbfrWIYVazFtkwcQ2UnC7jF1UIgOCImURNfsAmqs35nA6LXQLAGH9AloKE46tsw1qpejJ23
	QYC6yu9oLpqWsXpt+ca/AmdhrDQ87tmAFCe4ye29m7modh75f9LD+j28FVLhTMv7IeGYu8qDRRpAD
	mhSVeV99pyNrlRz8UKIAkiSQpyZjkPUsUkHapGN6EkV6UD8g4Cz2OcIOOPcT/EJipab4i0CFeOFiP
	4GPerA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsje-0000000BUVM-1WKj
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 12:33:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsjb-0000000BUV0-2a4K
	for ath12k@lists.infradead.org;
	Fri, 02 Feb 2024 12:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1A18622C2;
	Fri,  2 Feb 2024 12:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F39C433C7;
	Fri,  2 Feb 2024 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706877210;
	bh=HVpMJX4yaTYtWCWha9jRm5UBMt4O9QaOzbebi8cEGho=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=odsefLlCKl/Wt5Vc0vljRZBFkBmcm3TO8deQOLPEqcdW6etjyjxwKJg12OFops0QD
	 fkDPYBX8ZRCeYwyX8x1YRMghg3Jh84YnuYH3Z1H/FIGV7eihQCNGUy5SMT1bIJNTI/
	 /6ONzg8w11Lqz+/AP2sxjIOnAHNS13BGxKjbiRtvuZCL8lI6V61iuUCJz0YeSXX6KR
	 Ug+tu6QMXnL7b61LHcWpmrXjHfKDQ97Vo2Ru3eiLyAuyW4AxNWKoldP9CvJnBjneEQ
	 iwYsglhyatMCvknAMCCD14oWhv+VHpjAmM3ry/4FbjWvG4bqYO9u3MRLWmiKxtPvZZ
	 tKsFEmAWTLkYg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 01/13] wifi: ath12k: indicate NON MBSSID vdev by
 default
 during vdev start
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240129065724.2310207-2-quic_rajkbhag@quicinc.com>
References: <20240129065724.2310207-2-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sriram R <quic_srirrama@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170687720763.3214428.5130695458131576261.kvalo@kernel.org>
Date: Fri,  2 Feb 2024 12:33:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_043331_734383_E77B6089 
X-CRM114-Status: UNSURE (   9.46  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> When any VDEV is started, MBSSID flags are passed to firmware to
> indicate if its a MBSSID/EMA AP vdev. If the interface is not an AP
> or if the AP doesn't support MBSSID, the vdev needs to be brought up
> as a non MBSSID vdev. Set these flags as a non MBSSID AP by default
> which can be updated as and when MBSSID support is added in ath12k.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

13 patches applied to ath-next branch of ath.git, thanks.

6925eba532e1 wifi: ath12k: indicate NON MBSSID vdev by default during vdev start
9f06911998ca wifi: ath12k: fetch correct pdev id from WMI_SERVICE_READY_EXT_EVENTID
287033810990 wifi: ath12k: add support for peer meta data version
902700d55d4a wifi: ath12k: fix fetching MCBC flag for QCN9274
94e8235c679d wifi: ath12k: Add logic to write QRTR node id to scratch
664a1c96b297 wifi: ath12k: fix firmware assert during insmod in memory segment mode
f7019c2fcdf6 wifi: ath12k: split hal_ops to support RX TLVs word mask compaction
3cf1a9f7a1b2 wifi: ath12k: remove hal_desc_sz from hw params
419927ec8438 wifi: ath12k: subscribe required word mask from rx tlv
57c8b5c332e5 wifi: ath12k: add MAC id support in WBM error path
afeee629e72e wifi: ath12k: fix PCI read and write
af9bc78d14fb wifi: ath12k: Read board id to support split-PHY QCN9274
2d3a7384b9c8 wifi: ath12k: disable QMI PHY capability learn in split-phy QCN9274

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240129065724.2310207-2-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


