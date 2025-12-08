Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E66D3B7DE
	for <ath12k@archiver.kernel.org>; Mon,  8 Dec 2025 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V2LuImD69vBgHSzkMExG2GJJ4r6pVKhCiiWXxSYDJBM=; b=PLlqYAcs/1IvMUlBcZ62UEwnFT
	vMF3+AWHyueTECd5vEgdZmb+VXk3hCzPHGQF5rXmdW5TovtYG5YxVjBLIf3Ez9g8nKE+MYJi4NaxL
	5822VnkVChfJAiMnXg5iVnk4xxE20LMAiZBHLNUfSE/u6M5c1oNFS5RIWIxLtG8iZMUexGWT3MMu4
	Ai+MxzfxVqzv81yDz7g39DokhK5eJZnT9S8u8kyme2Hliw+IcUDVnsW1+mwzr6nVJJbkENOqeWEKc
	Kw7IdmFH4YkAF5Xm9zyXvJ0MBDoQ8ryMQpi2QpqVX2bxaQwHHD8uhOT8tW6vMNzSPy3zD/OYWknP8
	5xr3rgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYXT-0000000CxIR-3KUk;
	Mon, 08 Dec 2025 10:32:19 +0000
Received: from mxout70.expurgate.net ([194.37.255.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYXQ-0000000CxHx-48oD
	for ath12k@lists.infradead.org;
	Mon, 08 Dec 2025 10:32:18 +0000
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=145192da8d=os@dev.tdt.de>)
	id 1vSYXL-00EEcV-7c; Mon, 08 Dec 2025 11:32:11 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <os@dev.tdt.de>)
	id 1vSYXJ-00DfeR-SF; Mon, 08 Dec 2025 11:32:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev.tdt.de;
	s=z1-selector1; t=1765189929;
	bh=V2LuImD69vBgHSzkMExG2GJJ4r6pVKhCiiWXxSYDJBM=;
	h=From:To:Cc:Subject:Date:From;
	b=NDJzF6ShOuTsWdFh433cFknxb8sDj2TU/2Z6Dr0zQUDR+uRxFpl5mz65hop2gavNo
	 gCASGNlPQ282V1shzC6B6zj9xoriIPaXVr9vgZP5gvM98OjpavNULE47iIKMH2o5Gr
	 0x6ZjonLMFBbZqXCMMUKQb5rDI4Sib3oBcfJN61sdTd2o63CuzLRWMI+gpzb2XkwA6
	 895zPZcCTUX3pDIWTHdjT1T/rI027hFmJVcwLfGObKuDhFq5R3U+wxcYzwPOs32laX
	 NFkgl0ixssUP2hmWmuSIRqz4m26/G3RAy5t6NFszYEvhPJ1xUoVnqsktn2mbb9LDV8
	 tPJX3oGiO8s2g==
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 5974F240040;
	Mon,  8 Dec 2025 11:32:09 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 53377240036;
	Mon,  8 Dec 2025 11:32:09 +0100 (CET)
Received: from osedlbauer1.dev.tdt.de (unknown [10.2.3.165])
	by mail.dev.tdt.de (Postfix) with ESMTPSA id 1FCAA215E8;
	Mon,  8 Dec 2025 11:32:05 +0100 (CET)
From: Oliver Sedlbauer <os@dev.tdt.de>
To: stable@vger.kernel.org
Cc: quic_rajkbhag@quicinc.com, Oliver Sedlbauer <os@dev.tdt.de>,
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "wifi: ath12k: Enable REO queue lookup table feature on QCN9274 hw2.0"
Date: Mon,  8 Dec 2025 11:31:52 +0100
Message-ID: <20251208103152.236840-1-os@dev.tdt.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1765189930-3B70406F-E4D17473/0/0
X-purgate: clean
X-purgate-type: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_023217_194333_2091210B 
X-CRM114-Status: GOOD (  10.56  )
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

This reverts commit 3b5e5185881edf4ee5a1af575e3aedac4a38a764.

The REO queue lookup table feature was enabled in 6.12.y due to an
upstream backport, but it causes severe RX performance degradation on
QCN9274 hw2.0 devices.

With this feature enabled, the vast majority of received packets are
dropped, reducing throughput drastically and making the device nearly
unusable.

Reverting this change restores full RX performance.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Fixes: 3b5e5185881e ("wifi: ath12k: Enable REO queue lookup table feature=
 on QCN9274 hw2.0")
Signed-off-by: Oliver Sedlbauer <os@dev.tdt.de>
---
Note:
This commit reverts a backport that was not a fix. The backported change
breaks previously working behavior on QCN9274 hw2.0 devices and should
not have been applied to the 6.12.y stable kernel.

 drivers/net/wireless/ath/ath12k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/=
ath/ath12k/hw.c
index 057ef2d282b2..e3eb22bb9e1c 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -1084,7 +1084,7 @@ static const struct ath12k_hw_params ath12k_hw_para=
ms[] =3D {
 		.download_calib =3D true,
 		.supports_suspend =3D false,
 		.tcl_ring_retry =3D true,
-		.reoq_lut_support =3D true,
+		.reoq_lut_support =3D false,
 		.supports_shadow_regs =3D false,
=20
 		.num_tcl_banks =3D 48,
--=20
2.39.5


