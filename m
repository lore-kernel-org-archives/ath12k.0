Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A91ECCF9F0
	for <ath12k@archiver.kernel.org>; Fri, 31 Oct 2025 03:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K95Ko3CGgptOLyfI80+QbvELENUisYEUnnFY8ZDOn74=; b=2TYGjTSB6Wu4vGNDZtP+y3lmYw
	vMuvbL2ypf2rz4cZgDsMmFox4M27Oi1C9WMJyTT5IOUei1OR2i40u2ZXugS5797yD1yrHkXtGX0ec
	FsDZxeTSwqZvlT3bbyDrSajZJYh+UIRbgPn49HHT/1fT8yeWJhgVWDZ+zoWNQJH98kk9Ok5QiJzIA
	/CLJ9SU2dNW/dCD/RUoB34JmTkjUDA2pobzdz9qGnlaTVgMCGF2n+DC0lH3gCR5SPAyQgLHinRIcM
	+Y3uGnZGxlel91sbf4Qyl4GTA1xvh2isk+nF3GJSBNWmun2ZcO4bqBVcCJKM/pHA06GffpPYfkhtS
	XxZjEQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfUg-00000005IwT-03VQ;
	Fri, 31 Oct 2025 03:08:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfUb-00000005Iuz-1hMG
	for ath12k@lists.infradead.org;
	Fri, 31 Oct 2025 03:07:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULCAi0872731
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 03:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K95Ko3CGgptOLyfI80+QbvELENUisYEUnnFY8ZDOn74=; b=J68eeW0AzovFztMF
	KzAQuXQ2lgeHlvgYNicAhEYOOHK8MDiMR1QAe4W8Z9OEb72PvgX/9PXeFoD0OB73
	mjP7vbeZpbqai89SYAW4J9/TENEx2eyaj0fh9h4leF3VEDJqdvglUjGOhu3z+cZg
	aB9EQORiVip+VuydK6egqfYJDUrQ/zRGEgVrgPFmciUIXA193UvfQD+V2aFE0GtL
	ql9kQ8RNRQRDSCL1RsrJxTPG23QJlho0i1QPqOXAmYKzLXg/fT7ri16wz424VMnB
	jELfq1q3yf9TQaAEKIpBzZilyc4qxlK+HdanSBO41u8t+dqaizvENpYOa52i/maf
	Lfzx3Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn0q14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Oct 2025 03:07:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6cdfcb112bso3067960a12.0
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 20:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761880076; x=1762484876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K95Ko3CGgptOLyfI80+QbvELENUisYEUnnFY8ZDOn74=;
        b=Cqj89LirMtojfxxMBDPnmN6r4lgv2yB3kpoEHpjtY3F84homF/MiUmE6etcLhQW+8c
         rchjtB3SaPuoKM0TBTWe1zow+WeQNHh0FbKE+CEicCYA/oDdtnATGxeOp0LStCewV6ZV
         A/wpBUaDZEsrpWYdsptVu92bS3cDA0k2bD73hA2D0VHqxxcf9iXS7sbTjAIDyh7URWra
         yDyfcKPI2T5BS1AGpigCgw/9o5YQPGhUK3IoHrU7O0BsPVDVqaD9a+Q51MYFUllav6UV
         yIxySv5sl/Y3bl/Dxadug1G1bhDRS0+qwxTTBb/4FU6/6QwuPOQ6b/BVVcPXQrZ8OdlN
         1GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761880076; x=1762484876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K95Ko3CGgptOLyfI80+QbvELENUisYEUnnFY8ZDOn74=;
        b=Lj1eTjHQ6Qtq1iya53tWKcGHWi8UZmePx9byKEgteLe91KiPkQ7JULynqCvqPGlFbJ
         TDdmaUpc38OgMO+LeogC2TbmBdlcddRtEFD4z75OelJKj9zXdxGwSyKnTuRDFkgvwfuP
         vkXDGT5j9cnsBbup0drRJ5HCVKRJ0L0Zk/67KQfDdeXs+s+ToOmOPazxhV1HlPYBcODC
         jfC5TzQ0ibtlU51YRK0pLgxZTwN80XEttWKIPHP71h4RYkgkqgppCKciO9VyYAmfvSyY
         JQzJNnxx/s4vaAlsErEYRwJiv0YJP8wWEg363aKowMC3cmQQCE03P5rnnJmMoVz1nAX6
         KCgA==
X-Gm-Message-State: AOJu0YwWMAJSLIB5f+Hphy5W0wTxgi61MPhTHX+nr1zStMMqugrui05X
	wVGk91Ftm1Xmdp1bflbEKEulMYe5nZ2MOeiRylKYGuLIoUTeZxjorfU2oTsLSMN7aywjPzR5hPw
	HHHJFbCEz19/5NoAdyo0TCFKhuFyUkBYbm+pLuIFgcB248Dk3OO2kwBMbPRtIeheS
X-Gm-Gg: ASbGnct3OBzRlRWpxG37hoOGlt6kHXRf4aWSiMrKHolGwSZ/fXMoyrtrLhL8B7phZXq
	h0qYEKAvcQKKkGRkUeEI6/Q7HQ6pECLzYzx1n2SF4QUCD8phYSsd5X7qajzDoDXKa1AnAwj/+C/
	3lTYXfn4RGDQgdt+9xGia38ZhHyOhnv/SCaISQf/lSciM8i2mm/uPS431XKjDI30KTB7DK0HMG6
	ShHMXRNjHPq37TpjvXeyBBobHnaXVktOFmp9SpvTPqmnGANDmF37xB73L0JvgB/Xs9q7mCgIdf0
	3p9uzjK+Q5UA+2mgfel39s0vUsfSSaXun+0ij9g/tygT3CI14Nt4VkF3YbeHPNAWbbgRtO59yQ7
	YoBpWcr8tT1/C36sX16WW++BNkeXa/uuaz+ibVpFHI4tc+HvTNPD0Ba3FcLN33y0tnx7T4iyxjh
	7oWctsUafIUMG3tAdlkkKqDfjevAw5Kws=
X-Received: by 2002:a05:6a20:2446:b0:343:6f53:e97 with SMTP id adf61e73a8af0-348cc8e377bmr2711644637.48.1761880076152;
        Thu, 30 Oct 2025 20:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUiCAhShpTI+lCmKGzYA1Uo+PVpMB6cFI0JJzik1O352ZEBS6coEhPZ8shA1KJp+QEzbjumA==
X-Received: by 2002:a05:6a20:2446:b0:343:6f53:e97 with SMTP id adf61e73a8af0-348cc8e377bmr2711602637.48.1761880075636;
        Thu, 30 Oct 2025 20:07:55 -0700 (PDT)
Received: from hu-mdharane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db0a2663sm372130b3a.48.2025.10.30.20.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:07:54 -0700 (PDT)
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 08:37:45 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: Make firmware stats reset
 caller-driven
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-beacon_stats-v1-1-f52fce7b03ac@qti.qualcomm.com>
References: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
In-Reply-To: <20251031-beacon_stats-v1-0-f52fce7b03ac@qti.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=6904280c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GELq1AYrxFz-Eafd698A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: OyzslcX97ZHmy6goY92__eyLPklmgyFb
X-Proofpoint-GUID: OyzslcX97ZHmy6goY92__eyLPklmgyFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNiBTYWx0ZWRfX6zdjAX/b9W7C
 8LpIBATqQzZx88aEk4vU3gxVa62tNlnKh115BE7HU6rkaemH/LIyZB/eINtKLLZb8IJ3DaB+9J+
 88Y7ctQbCNFBwCec3eQWAXw8cuZZQKlCV/uMbXPAl7zg1eEFL3DAget/1GZSxf4fnWPhBeQtsN1
 vDBnqtqqW0iJ+9r9H4hCCPwT/mNVq0DHJTflpfRbSLPE6O6ShPoQ9ooqoYN4iucQWRzYeKeDGlN
 3WocPSz5/ighyaiUb6X6CXhdRkqdNWYyNfWoP0uxtR7fAHvUOHuUYYnpQfls12tf59aA9rGCOzi
 DYxC/HUkvOoLvYvhh6agFh4ulE8ptlgWYnMkqlYrDpxhublLfNlXSXad+6LCXlRFvY7HXRuTHJW
 5a418XJympmvsghogUbpnfwerUJfGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_200757_813233_A41B488D 
X-CRM114-Status: GOOD (  16.77  )
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

Currently, ath12k_fw_stats_reset() is called in
ath12k_mac_get_fw_stats() before fetching the required stats from the
firmware. However, ath12k_open_bcn_stats() requests firmware stats for
each enabled BSS individually. Since the firmware stats are reset before
fetching, only the last BSS's data is displayed.

Also, in ath12k_mac_op_get_txpower(), ath12k_mac_op_sta_statistics(), and
ath12k_mac_op_link_sta_statistics(), after getting the stats from the
firmware, the reset function is not called until the next firmware
stats are requested or while unloading the module. Hence, the stats buffer
will not be freed until one of the above sequences is executed. However,
in ath12k_open_vdev_stats(), ath12k_open_bcn_stats() and
ath12k_open_pdev_stats(), firmware stats are reset after copying the
necessary data in ath12k_wmi_fw_stats_dump().

This leads to inconsistent usage of ath12k_fw_stats_reset() for
freeing the firmware stats.

Avoid these discrepancies by making it the caller's responsibility to
free the stats buffer, thereby removing the need to free the stats buffer
in ath12k_mac_get_fw_stats() and ath12k_wmi_fw_stats_dump().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c |  9 +++------
 drivers/net/wireless/ath/ath12k/mac.c     | 15 ++++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.c     |  2 --
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 15219429d4ed88c77941533b1ab4c9202ea9da57..d6a86f075d73b92504bef6939ddaa3baa9ce9c1d 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1286,6 +1286,7 @@ static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
 
 	ath12k_wmi_fw_stats_dump(ar, &ar->fw_stats, param.stats_id,
 				 buf);
+	ath12k_fw_stats_reset(ar);
 
 	file->private_data = no_free_ptr(buf);
 
@@ -1352,12 +1353,7 @@ static int ath12k_open_bcn_stats(struct inode *inode, struct file *file)
 
 	ath12k_wmi_fw_stats_dump(ar, &ar->fw_stats, param.stats_id,
 				 buf);
-	/* since beacon stats request is looped for all active VDEVs, saved fw
-	 * stats is not freed for each request until done for all active VDEVs
-	 */
-	spin_lock_bh(&ar->data_lock);
-	ath12k_fw_stats_bcn_free(&ar->fw_stats.bcn);
-	spin_unlock_bh(&ar->data_lock);
+	ath12k_fw_stats_reset(ar);
 
 	file->private_data = no_free_ptr(buf);
 
@@ -1418,6 +1414,7 @@ static int ath12k_open_pdev_stats(struct inode *inode, struct file *file)
 
 	ath12k_wmi_fw_stats_dump(ar, &ar->fw_stats, param.stats_id,
 				 buf);
+	ath12k_fw_stats_reset(ar);
 
 	file->private_data = no_free_ptr(buf);
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e79d457e3c03da372c57e4b2c7970d07c38d6008..11e0514eced8d74e5038ddde66848c7798c7390b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4954,8 +4954,6 @@ int ath12k_mac_get_fw_stats(struct ath12k *ar,
 	if (ah->state != ATH12K_HW_STATE_ON)
 		return -ENETDOWN;
 
-	ath12k_fw_stats_reset(ar);
-
 	reinit_completion(&ar->fw_stats_complete);
 	reinit_completion(&ar->fw_stats_done);
 
@@ -5053,6 +5051,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	ar->chan_tx_pwr = pdev->chan_tx_power / 2;
 	spin_unlock_bh(&ar->data_lock);
 	ar->last_tx_power_update = jiffies;
+	ath12k_fw_stats_reset(ar);
 
 send_tx_power:
 	*dbm = ar->chan_tx_pwr;
@@ -12828,14 +12827,18 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 
 	if (!signal &&
 	    ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
-	    !(ath12k_mac_get_fw_stats(ar, &params)))
+	    !(ath12k_mac_get_fw_stats(ar, &params))) {
 		signal = arsta->rssi_beacon;
+		ath12k_fw_stats_reset(ar);
+	}
 
 	params.stats_id = WMI_REQUEST_RSSI_PER_CHAIN_STAT;
 	if (!(sinfo->filled & BIT_ULL(NL80211_STA_INFO_CHAIN_SIGNAL)) &&
 	    ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
-	    !(ath12k_mac_get_fw_stats(ar, &params)))
+	    !(ath12k_mac_get_fw_stats(ar, &params))) {
 		ath12k_mac_put_chain_rssi(sinfo, arsta);
+		ath12k_fw_stats_reset(ar);
+	}
 
 	spin_lock_bh(&ar->data_lock);
 	noise_floor = ath12k_pdev_get_noise_floor(ar);
@@ -12919,8 +12922,10 @@ static void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 
 	if (!signal &&
 	    ahsta->ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
-	    !(ath12k_mac_get_fw_stats(ar, &params)))
+	    !(ath12k_mac_get_fw_stats(ar, &params))) {
 		signal = arsta->rssi_beacon;
+		ath12k_fw_stats_reset(ar);
+	}
 
 	if (signal) {
 		link_sinfo->signal =
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 5075d86df36ff5a7863bd9c4b379c61997b02618..f812da24b21e68893327d61fe0ff9deb222bd54b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -8089,8 +8089,6 @@ void ath12k_wmi_fw_stats_dump(struct ath12k *ar,
 		buf[len - 1] = 0;
 	else
 		buf[len] = 0;
-
-	ath12k_fw_stats_reset(ar);
 }
 
 static void

-- 
2.34.1


