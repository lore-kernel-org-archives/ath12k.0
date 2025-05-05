Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E16C3ABBF
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 00:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHzx0ESzlWGZ1FNCOF6PfUaNw7Wynkjz8EuBFbnamZY=; b=3nbFC51yI5a7nN+pCa4dwiTi6+
	S/Y5nZMHQ0uI3SdICQ7UhAq34asj7M2TEhTUplj42W4MqIpXrlmqsmSVsVa8ruwuNs17OBaKdWWKD
	koqEoX5/Behforzq6hhFCpAejMoRvyv2lLLtZi40ZWN0ygbMZNKloqqghyvZUHARJ/n2Opxwi0/rl
	0dQaB7rbMudvwMcvGjCUHDUdcX844VVaIFoQvvpau3W6M/BXXUQEC932Bli2BvT2PLmlXVmX0jmlJ
	gh7HwvrQvI/m34iff95M75aUPk3Mq7FVEsPJw3T1H+MeyF19tahMnOXBwd+dgV7fYaCo2D1C/WPFy
	4JWGR1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6LT-00000009KoZ-40kC;
	Tue, 06 May 2025 00:39:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4RY-00000008oTg-2FIA
	for ath12k@lists.infradead.org;
	Mon, 05 May 2025 22:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3AD2CA4BB33;
	Mon,  5 May 2025 22:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87450C4CEE4;
	Mon,  5 May 2025 22:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484667;
	bh=GR4Lgf/aIjapp/01EHUzV6bYrz/37XW4chuuWbqaYDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KfZIG9ItxpFDjyIWGBj2sp+HO7y5qYRv2Xy8Q/sjbiLIdIgHNP58pwx+kScgyTE/W
	 nCkcAhFueVqUCYK0cHrlWLfBJY1vYTc1u8byjsMpWuBCPOyy2+KLuR8lIN8pRISz5x
	 TrIEFgUeBP47n5F/OVGJCHo1Dpb6p5/nyoAsEaorfJPAXyF0TMECZ3aGil9wkvroaQ
	 KKDjKvywfReHz4YvUTDQdpw6ctGlYQumgaU3yk7QH5w7d6QQMD4ChjZDf6n0i26Yf2
	 BJiDYshy5mrQ05CI1xpNnskwQ/e/Cx+Sk3/YzTkGY+0RzIDm2xokd0hLQ3DV1SCJyy
	 TRKe3Z7z/QNJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aaradhana Sahu <quic_aarasahu@quicinc.com>,
	Aditya Kumar Singh <quic_adisi@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 596/642] wifi: ath12k: Fetch regdb.bin file from board-2.bin
Date: Mon,  5 May 2025 18:13:32 -0400
Message-Id: <20250505221419.2672473-596-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_153748_713127_C67A973C 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Aaradhana Sahu <quic_aarasahu@quicinc.com>

[ Upstream commit 24f587572acf7509127dbdfcbf1b681ef84eeba0 ]

Currently, ath12k_core_fetch_regdb() finds regdb.bin file through
board id's but in board-2.bin file regdb.bin file is present with
default board id because of which regdb.bin is not fetched.

Add support to fetch regdb.bin file from board-2.bin through
default board id.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Reviewed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Link: https://patch.msgid.link/20250116032835.118397-1-quic_aarasahu@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index ffd173ff7b08c..d0aed4c56050d 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -173,7 +173,7 @@ EXPORT_SYMBOL(ath12k_core_resume);
 
 static int __ath12k_core_create_board_name(struct ath12k_base *ab, char *name,
 					   size_t name_len, bool with_variant,
-					   bool bus_type_mode)
+					   bool bus_type_mode, bool with_default)
 {
 	/* strlen(',variant=') + strlen(ab->qmi.target.bdf_ext) */
 	char variant[9 + ATH12K_QMI_BDF_EXT_STR_LENGTH] = { 0 };
@@ -204,7 +204,9 @@ static int __ath12k_core_create_board_name(struct ath12k_base *ab, char *name,
 			  "bus=%s,qmi-chip-id=%d,qmi-board-id=%d%s",
 			  ath12k_bus_str(ab->hif.bus),
 			  ab->qmi.target.chip_id,
-			  ab->qmi.target.board_id, variant);
+			  with_default ?
+			  ATH12K_BOARD_ID_DEFAULT : ab->qmi.target.board_id,
+			  variant);
 		break;
 	}
 
@@ -216,19 +218,19 @@ static int __ath12k_core_create_board_name(struct ath12k_base *ab, char *name,
 static int ath12k_core_create_board_name(struct ath12k_base *ab, char *name,
 					 size_t name_len)
 {
-	return __ath12k_core_create_board_name(ab, name, name_len, true, false);
+	return __ath12k_core_create_board_name(ab, name, name_len, true, false, false);
 }
 
 static int ath12k_core_create_fallback_board_name(struct ath12k_base *ab, char *name,
 						  size_t name_len)
 {
-	return __ath12k_core_create_board_name(ab, name, name_len, false, false);
+	return __ath12k_core_create_board_name(ab, name, name_len, false, false, true);
 }
 
 static int ath12k_core_create_bus_type_board_name(struct ath12k_base *ab, char *name,
 						  size_t name_len)
 {
-	return __ath12k_core_create_board_name(ab, name, name_len, false, true);
+	return __ath12k_core_create_board_name(ab, name, name_len, false, true, true);
 }
 
 const struct firmware *ath12k_core_firmware_request(struct ath12k_base *ab,
-- 
2.39.5


