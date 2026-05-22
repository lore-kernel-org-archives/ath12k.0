Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEC4CD5BAC
	for <ath12k@archiver.kernel.org>; Fri, 22 May 2026 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n5rSxcitKGqRk5QxlpEsC9llgGvUZ1KFzU8I2bIAbY8=; b=UUdDfxVdJ5RWYwTeZA4pqZO801
	eJ6LtjI1CHvszZkfobu2JLa3N/nHGJ6U5yKqRH/q5KPmgRxSqJt6lzGPiZROqn7y07Mhl7/J61Rjl
	mUxQuW7jLZZESLUu2LU5HGBkVsBKubp3Ni8ildP2geF7qe2z051/iXm1R/VHJQXGjYoaD2aXMNhyw
	evH0oiLpCTvxOXiQ9gAvDZK1vrB9jEN5Ijf/VPvqsA/maIB0R6KEYb5Ro+xupzEqgF2JmxpoH12gL
	CpzEOKaoucdBAWbkI86uc/97YeESoGYW73SJjj5Ldc8mpYvkg/bKtcjDcEvRyuVAL4sog3Pr2vIVj
	oJoZj22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM1o-0000000AIzS-34ff;
	Fri, 22 May 2026 09:18:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM1k-0000000AIyc-2T4t
	for ath12k@lists.infradead.org;
	Fri, 22 May 2026 09:18:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UbBZ1960034
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 09:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=n5rSxcitKGqRk5QxlpEsC9llgGvUZ1KFzU8
	I2bIAbY8=; b=GklYV3AD5kZpJnLYjdfOzvKhdBFv2q7EY8FZEWVqODPyysP6Rji
	0KuLJ5UtDH65u7TV79Y/OeVu00wcQ+9z6hjQ6SVPH8VZuK6IflV+kOxNjoWcFc6O
	MKhkQqwBXt8D3UVPf0HZtDXTnZdN7M1uQvxRHTr4O6f9S7Ee/PTtzIBxFLbIPY68
	oAu4SJ70cZpco2c7Qxjmo8zmg6yuoO1HSMDTPXL1TRwyzb6gKiJ3wmnxcgFgrR/8
	7lpkZ5yDdfMUT0n0P9pMSuublSU8qdi616aXXSx2FELw6etf8F1Kf+SJcWf54yEK
	18RhwxRkrsaCiDpdJZnnK52FKMB+ML5zeSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxert9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 22 May 2026 09:18:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368b15eeb3bso14399201a91.2
        for <ath12k@lists.infradead.org>; Fri, 22 May 2026 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441522; x=1780046322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5rSxcitKGqRk5QxlpEsC9llgGvUZ1KFzU8I2bIAbY8=;
        b=Wt6242sSYiDBDjt7PIdKzNx5L/euw8WfSqRMM1x2SCU8E0vujOJYfBrkFJkobjcS7s
         2WgjvMwioStuzMHryBhHM/oOieE//YgnmHrNXNcT7a4cRkyytpMI3TTiUntmPk8yGM/X
         GBJZO/2LzPefEOqYZlGuiUwZ662rtfmMFudbfHt4wVAaNLO7WvjivoCIe8eghz+lKvZO
         ioM0BDSbgdtvwOHnwOOcuadncZDsfCZRGj7eYIQXpefg+JgMjQqpIdoE+MmziuX/LtIX
         UvOOKFjjxHGGD+Kd/sGNmjV4YWGuv8KYLg4wu8atVHIZ7WEVCo44foIxIEZuxgRhQcxs
         Dy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441522; x=1780046322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5rSxcitKGqRk5QxlpEsC9llgGvUZ1KFzU8I2bIAbY8=;
        b=T5fszWRM6Vy9c7Hlu/gzI/nbwVBcVkS7/tKDIHgaHgjVSrqAVD70RrDcJ05xXRTed/
         dNITX6XvyOlCfDn5SZ24jtgjrtPumF6UoYkaYRofSReLZkbR1QTYwZdOdXW8Jvah5lDz
         53rvej88LxCVyhE3M9pMQy3TZ7xEkzlRUpmvEBgjFtWBLCVTdBH3sIBtAfW9PoubuD2h
         3uQnBLzoPd6Opr6lL3i7kOYh/F3caQeHhwRA/IurB6ZmKdffdYqPSurtVkLptfkZq10b
         i8q23mL1D0ZTCCQ8oJpv+Pve8hCv1QTj624aVX/nFYdw9huFsdH4ARlzRgdLEdmKyw/A
         Z30g==
X-Gm-Message-State: AOJu0YyWzc3CLOL4yuaOb+R5bpvM3006mBDrrkbeIDneenpPytwfIUmZ
	7YQCaobcd1lvEkieb0SuFCfTReYo5Z/F7z1Qe4yKaCPPObYZTTw6FWJQfBP/06lTha4Ky7YFi10
	qcspti9iFqUZ/SZgoDx1pH3zltbVQjbYdQhwK8YpF4lxirKcDLhZ2/JuSTlY2BlvKKY88AayA
X-Gm-Gg: Acq92OHWDnElJskHw9PLMviUHA43k67pafwZa0b+GrTt2pLJFUUCYS5pwUsD50xq+XH
	eN21/eqmpkm4/hjCjyTKjWML83mMI+961SqGmWhvF6BIyXsdYpXmqbD/WUmA+4573w3yhutscdi
	B8eJ9WtVqP71CmgYbXbZk47NisaKd0OOHZ1sd7iZ6aTFpvNvm2K3jiiCKjxLRFHF+wu7gYypZbT
	FmtnjdLHyliGinD3DOSAE686J67O7nAT33kUWyWSGTDsp1jXrF2zuEW7L5hIR+k3mVBS/7wzoOH
	OHcKPDbguxf51VDB0zgTgdJVNZMsYeRM0U3aLLsN/VA1BEAztp/9xp+5avkQ5Of2yBOBEzWthMp
	YZqqIugOKR35F7PR9pxdCGqOTZdrEgOqj5+BsBhYjb22ZF1a+bNoeC897m3RfeBSUwIX/H8TW8y
	AFndLppTprzlmVghlz4bRv9LQdzEUo7HUbSbKEtzNojKLIydmnNZU=
X-Received: by 2002:a05:6a20:244c:b0:398:90e5:a9b9 with SMTP id adf61e73a8af0-3b328ec9e1fmr2808445637.27.1779441522238;
        Fri, 22 May 2026 02:18:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:244c:b0:398:90e5:a9b9 with SMTP id adf61e73a8af0-3b328ec9e1fmr2808401637.27.1779441521723;
        Fri, 22 May 2026 02:18:41 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85205616bdsm1017109a12.23.2026.05.22.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:18:41 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Prevent incorrect vif chanctx switch when handling multi-radio contexts
Date: Fri, 22 May 2026 14:48:28 +0530
Message-Id: <20260522091828.3199584-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MiBTYWx0ZWRfX/Lm+FNL1ejJN
 aQ1TAACujRdP6PNpNeFi1ryUIMn1WN6gag4GDmHYFucWvIEFTadmovfiOgYyuIzepEPb1VIcyOS
 r0BtPy2Sw1eiIrC1M12Aee9423H26N2up10LkDikjQ8+fZqAUU/iE/hTqf9OgOv5GkSBNGdKMPR
 A7XzHr/SXYgGM5CD2ZJ1B+/tZiJNabdhyCenO95h18H4AUyXs8iHx9ftV29lRkr00BtyQsLUelz
 WRUWDWouLJzS9UMPyDluA2a0T1NZ/G4gMOpGuMJZRmnOmotQhcDdosFC3h7rANTT2bCtJ2wT/Cx
 QhauPb8cTgiFDlSPNU1otfAhg4FQI+QJW+LOmqAZDGM6YvswmRncyRfGn9ySYBf5yJKp3RvSwNs
 Fwj3jci9s9h0RbYEBZVwVPoZEDpDrZgrEcOsaEgv6vfiK43qt5R8+59kCEwRwhtE3m0aTQouP/f
 m1CiBui2WsE9mtqypNA==
X-Proofpoint-GUID: XylBntJweBVPRSQDny_ftIyF7BY15VKS
X-Proofpoint-ORIG-GUID: XylBntJweBVPRSQDny_ftIyF7BY15VKS
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a101f73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=sbVaVZ47SkDDcbqKZWIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_021844_752803_24FC170B 
X-CRM114-Status: GOOD (  18.58  )
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

From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

When multiple links switch channel contexts around the same time, mac80211
may complete CSA for several links together and invoke
ath12k_mac_op_switch_vif_chanctx() with an array of vifs spanning more than
one underlying radio in a single-wiphy configuration.

The driver currently assumes that all entries in the vifs array belong to the
same radio and derives the radio context from the first element. On multi-radio
hardware, this can lead to incorrect vdev selection/updates and may corrupt
driver state when the number of vifs exceeds what a single radio supports.

Fix this by validating each vif's switch request and then processing vifs
grouped by their associated radio. For each vif, ensure the band does not
change across the switch and that both old/new channel contexts resolve to a
valid ath12k device. Reject attempts to move a vif between radios (not
supported for now) and return -EOPNOTSUPP to upper layers.

Then, iterate through the input vifs, collect all unprocessed entries that map
to the same radio, and invoke ath12k_mac_update_vif_chan() separately for each
radio group. This removes any reliance on mac80211 providing the array grouped
by radio or sharing old_ctx pointers across vifs.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Co-developed-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---

v2: Added Co-developed-by tag in the commit log.

 drivers/net/wireless/ath/ath12k/mac.c | 87 +++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 54081beb9a5f..5c8e25d40a98 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11476,6 +11476,9 @@ ath12k_mac_update_vif_chan(struct ath12k *ar,
 			continue;
 		}
 
+		if (WARN_ON(!arvif))
+			continue;
+
 		ath12k_dbg(ab, ATH12K_DBG_MAC,
 			   "mac chanctx switch vdev_id %i freq %u->%u width %d->%d\n",
 			   arvif->vdev_id,
@@ -12267,23 +12270,85 @@ ath12k_mac_op_switch_vif_chanctx(struct ieee80211_hw *hw,
 				 int n_vifs,
 				 enum ieee80211_chanctx_switch_mode mode)
 {
-	struct ath12k *ar;
+	struct ath12k *curr_ar, *new_ar, *group_ar;
+	struct ieee80211_vif_chanctx_switch *v;
+	int i, j, count = 0;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	ar = ath12k_get_ar_by_ctx(hw, vifs->old_ctx);
-	if (!ar)
-		return -EINVAL;
+	if (n_vifs == 0)
+		return 0;
 
-	/* Switching channels across radio is not allowed */
-	if (ar != ath12k_get_ar_by_ctx(hw, vifs->new_ctx))
-		return -EINVAL;
+	struct ath12k **ar_map __free(kfree) = kzalloc_objs(*ar_map, n_vifs);
 
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
-		   "mac chanctx switch n_vifs %d mode %d\n",
-		   n_vifs, mode);
-	ath12k_mac_update_vif_chan(ar, vifs, n_vifs);
+	if (!ar_map)
+		return -ENOMEM;
+
+	for (i = 0; i < n_vifs; i++) {
+		v = &vifs[i];
+
+		if (v->old_ctx->def.chan->band != v->new_ctx->def.chan->band) {
+			ath12k_generic_dbg(ATH12K_DBG_MAC,
+					   "mac chanctx switch band change not supported\n");
+			return -EOPNOTSUPP;
+		}
+
+		curr_ar = ath12k_get_ar_by_ctx(hw, v->old_ctx);
+		new_ar = ath12k_get_ar_by_ctx(hw, v->new_ctx);
+
+		if (!curr_ar || !new_ar) {
+			ath12k_generic_dbg(ATH12K_DBG_MAC,
+					   "unable to determine device for the passed channel ctx\n");
+			ath12k_generic_dbg(ATH12K_DBG_MAC,
+					   "Old freq %d MHz (device %s) to new freq %d MHz (device %s)\n",
+					   v->old_ctx->def.chan->center_freq,
+					   curr_ar ? "valid" : "invalid",
+					   v->new_ctx->def.chan->center_freq,
+					   new_ar ? "valid" : "invalid");
+			return -EINVAL;
+		}
 
+		/* Switching a vif between two radios is not allowed */
+		if (curr_ar != new_ar) {
+			ath12k_dbg(curr_ar->ab, ATH12K_DBG_MAC,
+				   "mac chanctx switch to another radio not supported\n");
+			return -EOPNOTSUPP;
+		}
+
+		ar_map[i] = curr_ar;
+	}
+
+	/* Group vifs by radio (ar) and process each group independently. */
+	bool *processed __free(kfree) = kzalloc_objs(*processed, n_vifs);
+
+	if (!processed)
+		return -ENOMEM;
+
+	struct ieee80211_vif_chanctx_switch *group_vifs __free(kfree) =
+						kzalloc_objs(*group_vifs, n_vifs);
+
+	if (!group_vifs)
+		return -ENOMEM;
+
+	for (i = 0; i < n_vifs; i++) {
+		if (processed[i])
+			continue;
+
+		group_ar = ar_map[i];
+
+		count = 0;
+		for (j = 0; j < n_vifs; j++) {
+			if (!processed[j] && ar_map[j] == group_ar) {
+				group_vifs[count++] = vifs[j];
+				processed[j] = true;
+			}
+		}
+
+		ath12k_dbg(group_ar->ab, ATH12K_DBG_MAC,
+			   "mac chanctx switch n_vifs %d mode %d\n",
+			   count, mode);
+		ath12k_mac_update_vif_chan(group_ar, group_vifs, count);
+	}
 	return 0;
 }
 EXPORT_SYMBOL(ath12k_mac_op_switch_vif_chanctx);

base-commit: 30d516006fa1f72f957c18c6171f5680dcdebfb0
-- 
2.34.1


