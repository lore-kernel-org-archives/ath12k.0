Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D24EEB64DC
	for <ath12k@archiver.kernel.org>; Mon,  3 Jul 2023 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WcriHUeEHgeaaP8KtP6r1fMrn+HKpgdEwLkNFTUxcmU=; b=KfIteIlXVdrxB6
	KlYHPhh3AQek25sHFuWt3OI81j6Bt9ZvcZFUzfqHbdez0CCo5wxdrmTjLabOcdfJkUaz/Ra4rf1yw
	Ff80MbxUHt2RpqoamVnierlbc6LtsmR0EkhVXZZYYxzsUkKiBNisEarZ1R9yAlJ7Ig4Ed+zTawAk9
	QiVVmZ/kRzvo40t4/lfeLYRcbEVEU6Kp32mcbxTJZsAi8yVeJyxxj7y3V7hL3nHszYEKDBMVYzOr6
	6ISb2zxXG2CAiA5IowCq5ptCNBF4slRLPMpMM8HTLmC/YvUvMwyf72MIrUTYcEKNUgiXmq7WzmJWd
	w5rGMoy77mYPOG+UqZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIoO-00AVPN-2X
	for ath12k@archiver.kernel.org;
	Mon, 03 Jul 2023 12:37:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIoL-00AVOY-26
	for ath12k@lists.infradead.org;
	Mon, 03 Jul 2023 12:37:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DC9F60F14;
	Mon,  3 Jul 2023 12:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FE7C433C7;
	Mon,  3 Jul 2023 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688387864;
	bh=xE8FXAxkc+98q1QU4W/ZwNlsV+CRuDU4Ozer4CAamV4=;
	h=From:To:Cc:Subject:Date:From;
	b=e4Gki4SKoeFIHNhBDdp43WTmmhs67Z90hx3Gbp5OxiIM+VxYZ2YNzjuTmulL+uTnS
	 hugfDCTyhZ3S0URDNTeT0ac9FNZ3aEAO1ib4xyhpZYGN8QzuQXTGzLXr+fkDPqmMjm
	 FtY/C//GWwKdwOL4A8u1UTmpo1NazAca9iigX940vapsLqrCKM+3pr8mMfNMERmMLw
	 Vuoax/l/WCVPLtogIR0OTtdSQkWTDWTKDPeKNPcOuMP6ZYi1WOP1DsqXGxLxMe1bZk
	 AqfgoG5yyr15uGKRWXcozsSpteqhqxpGGqqTjUclquoq9teD5dO9BtMnw3RMmkcAQY
	 rX298AQBd+jRA==
From: Arnd Bergmann <arnd@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	P Praneesh <quic_ppranees@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Karthik M <quic_karm@quicinc.com>,
	Aditya Kumar Singh <quic_adisi@quicinc.com>,
	Aishwarya R <quic_aisr@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ath12k: fix memcpy array overflow in ath12k_peer_assoc_h_he
Date: Mon,  3 Jul 2023 14:37:29 +0200
Message-Id: <20230703123737.3420464-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_053745_726295_37AF0A80 
X-CRM114-Status: GOOD (  11.59  )
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

From: Arnd Bergmann <arnd@arndb.de>

Two memory copies in this function copy from a short array into a longer one,
using the wrong size, which leads to an out-of-bounds access:

include/linux/fortify-string.h:592:4: error: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
                        __read_overflow2_field(q_size_field, size);
                        ^
include/linux/fortify-string.h:592:4: error: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
2 errors generated.

Fixes: d889913205cf7 ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f5ebebe806e0d..b8a8d33cc4187 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1637,9 +1637,9 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 	arg->peer_nss = min(sta->deflink.rx_nss, max_nss);
 
 	memcpy(&arg->peer_he_cap_macinfo, he_cap->he_cap_elem.mac_cap_info,
-	       sizeof(arg->peer_he_cap_macinfo));
+	       sizeof(he_cap->he_cap_elem.mac_cap_info));
 	memcpy(&arg->peer_he_cap_phyinfo, he_cap->he_cap_elem.phy_cap_info,
-	       sizeof(arg->peer_he_cap_phyinfo));
+	       sizeof(he_cap->he_cap_elem.phy_cap_info));
 	arg->peer_he_ops = vif->bss_conf.he_oper.params;
 
 	/* the top most byte is used to indicate BSS color info */
-- 
2.39.2


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
