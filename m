Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F67C83F17
	for <ath12k@archiver.kernel.org>; Mon, 21 Jul 2025 02:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PlESFODkg2/n6CKXRrQsrvcrzkq/qeENX4SwJDn1k5I=; b=WUC0AAFCrn9hWl1EBabubexUSH
	1hgjMYbYDxGVtqfeiYxUgCthItxL5Xy2LPcQNaEjT7cJaRJ6bDgsVzNLt67mVujA9pIBtLVylabNY
	U5KnOQ3EeYQ024Nv64yoJ4vSP/EhV/Lv/sTEA9OIrK+i8a5ZkQ6R923hZZEUfYjjClJJKibXXoqOr
	SgIr9cls2MS/aEpQ7Lhx3Xkl3lsgjkGM9bhcQjDmLlQzTupjxxOftsBc88+X0mdDxI4eYXG8qKssL
	dVBaGWFE6ZiDCNUpNrWISgG907h0O6VcuzlZemdQ4q7fv55XxcPq49jxL51wA/LYX7edoJrYtyDZL
	sglFKbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgHF-0000000G0DN-0utQ;
	Mon, 21 Jul 2025 02:29:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgFv-0000000Fzw1-1ZRf
	for ath12k@lists.infradead.org;
	Mon, 21 Jul 2025 02:27:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KNe15m009461
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 02:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PlESFODkg2/n6CKXRrQsrv
	crzkq/qeENX4SwJDn1k5I=; b=l8rmCEky0qziIw6wiRSH/cB8ooDGWljJGzSlJR
	codoLzGXOc3wsk/e2fr7KlFpdW9LZxiQthLCw2BNc47KsOdm9WufbZGT7vxzQzST
	tVQR4WC5pmEY9Sc6LcqQ4EORIqap5ve9m5Fs0U0j5uTdbQWV8lw8mAcmWFBv0be0
	vawCT/mgQbSYYTWzyCyJ+2TFvYHzkH0/+McRS6Zg7w5Aznrpin0ZPA2f0lwiJA0c
	aJh3S4mNnEeJw0ft6jU0yqv3P3CrN+96rYIInhiB1grhSH6JlKOON++2vWv7K9Fa
	VBJV+zgcw4Ju9JSGVLzB02AH7NYq503h5ZyYlvl+HnhDYv/Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q3513-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Jul 2025 02:27:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3ba7659210so2813991a12.2
        for <ath12k@lists.infradead.org>; Sun, 20 Jul 2025 19:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753064872; x=1753669672;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlESFODkg2/n6CKXRrQsrvcrzkq/qeENX4SwJDn1k5I=;
        b=aW7iXm9RO+fkx02W9mag5batB3ObsHV7FWQz7ZujSfP6M2etVXPB+h5UzTBiUkTAX8
         3nKElFG5pXOnX3bvf5O8yhWlfOwvO1v4zdtUYd51fGz5hs4kmlyGCwplw4m/lTI2/YF+
         DFAGp3gT8kwIMbGVHfkXhGiD++juHDXtlCe5bOT2OfmiUvPWcJCn11WBRNFY0WeHlBdJ
         CC9U0t5ZaaaUTmFR93vUOWzDN0ZYZfsKCxtfNbxAjIWyjeGNHeimsn2AUqo0t8ivcE7T
         w/yRuibRvUugkCHt2P98dSb1+2LaXcSfPVfIIhXL9LwoFUPbEju6OgKt6+waIVFfymMn
         +l2w==
X-Forwarded-Encrypted: i=1; AJvYcCVD71m9xXSBvXwqs31ipzqcBhgcydBD7m9klI5veVgf+EKnSfdPFpiE/tmoJ6lolAeLml+VWIU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBJpapBUcIBirf+2N+ZmoWaUaXWlT5oPylgFpQAxmTd36IVaGI
	qgq0qpzb/RZjal1OjcazW5Yk+80J16XErMg2732Dkm97wV/qGGnJkCKFI9rueUgy5nEmvAFt1In
	Ssb7sK7E6N+GRNO5rwd7tP4LtA72ykTwcC6DLszy32N4JCesAdoRbv1+WnzY4sL5cFwDkcdGrLv
	M=
X-Gm-Gg: ASbGncsutFgLmCSJEudJvEO8EKnI972fpOybIVmvbYZdASW9Ww7RlPymr57l+byI9Pg
	+cB9ffL0b34kpgelYmDx1OtXqvEd4XR+FnYQGcyC+QPKMy2Wk9lDgLj2awrpWGL/qhH2Uce5OVF
	xK5xvY+NNnjZsP92bH6tMXYY/JYnTgZy6CmPRVyaNy3k6w2nk10MUa/v5HBGeRfsqbKHFvU/uUz
	0nrj/0Fe2ulDqqKxWpjgAeLYtp9N4W2iMKyC+neXlaH8Wc3dl2ZuYb0zZsleM2vrZkXLLmra/vV
	CuHnuSmAz2tEqj94a7vqUByqrKIaTlNoEkjiP9Y1tuOtPDoBIJyKNnmdTxk9Nlr1lHO4/G4f9KB
	EET8PxoGY5yC1lfgoag==
X-Received: by 2002:a17:902:e751:b0:235:225d:3098 with SMTP id d9443c01a7336-23e257706f7mr297068745ad.46.1753064871997;
        Sun, 20 Jul 2025 19:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdLbfWV0WIH6gdMWFXAbj48U52Qby9ezjzObx5YEv+xoAivqbUdo2qXTW8a4OuwKQNGg5T9g==
X-Received: by 2002:a17:902:e751:b0:235:225d:3098 with SMTP id d9443c01a7336-23e257706f7mr297068425ad.46.1753064871552;
        Sun, 20 Jul 2025 19:27:51 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4cedsm47541335ad.120.2025.07.20.19.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 19:27:51 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 10:27:26 +0800
Subject: [PATCH ath-next] wifi: ath12k: bring DFS support back for WCN7850
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-ath12k-dfs-v1-1-065c31454f91@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI2lfWgC/22NzQ6CMBCEX4Xs2SVsI3+efA/DobSLNArVLhIM6
 bvbcPYyyWRmvtlBODgWuGQ7BF6dOD8nQ6cMzKjnO6OzyYMqVFnU1KBeRlIPtINgo861MkPftpW
 FNHgFHtx2wG6QejjztkCXktHJ4sP3eFnpyP8BV0LCigtLpu6rsuerF8nfH/00fpryJNDFGH8Ci
 w+OtQAAAA==
X-Change-ID: 20250718-ath12k-dfs-82472cfb996d
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Mihai Moldovan <ionic@ionic.de>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDAxOSBTYWx0ZWRfX9hgSmD6lIDku
 vQ03kgYq3/NLfUIHHDzX0XYdJGvtdwQINaW8uHsUNMuWCBveKDpz3w3jxfxBl5zuzarinuHscnt
 ns5OmmOTTYV0EJ4L12UOS1VFxmdSqZi+oezVjULRd9Kt/M4lhFKCrAQU4ZCXnR1gF9BozYotd2u
 zqkT3o9s9JWgb7tc7P+QKiCa0pS+YeGAMQs/XxyLDbNOSu0FH6QsjDS9J3EmYkCDu7BRFgBBcZh
 9QNo/eW3uCeJj3pgMMpnyN5RdMaUN4GiBxyAr6cyShcZ6ybB1oroCDc6yD7o9h4GntTnO/lse5v
 Xw7PBJWXg6LQSSUYHK/wysidvW/DMTNzSEN2g/XbfpWJ0HmQKXAF+2A3nY8VC7YRkx2pyzcbIFM
 oRhcDU8c3zi74fgUeeQUewfICKaW6InD5ebHOQeDijb4I69lL/vU2XGjx3tUQXnov766J5Df
X-Proofpoint-ORIG-GUID: LdJ7y2hpEh5bINPzd4R1fNsmR8B1pqeX
X-Proofpoint-GUID: LdJ7y2hpEh5bINPzd4R1fNsmR8B1pqeX
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687da5a9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=La950oh4TLMd4KyFD9QA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_192755_549616_9E32DA96 
X-CRM114-Status: GOOD (  17.65  )
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

Due to the restrict in MAC80211 that DFS (Dynamic Frequency Selection)
can't be enabled on multiple channels, commit 176f3009ae59 ("wifi: ath12k:
support 2 channels for single pdev device") removes DFS support in order
to support 2 channels concurrently, making AP mode not working on DFS
channels [1].

Revert portions of that commit to bring DFS back, and add a new
combination to support 2-channels concurrency. This is valid because the
MAC80211 restrict works on each individual combination, but does not care
about them as a whole, as far as DFS is concerned.

This change applies to WCN7850 only, other chips are not affected.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 176f3009ae59 ("wifi: ath12k: support 2 channels for single pdev device")
Reported-by: Mihai Moldovan <ionic@ionic.de>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220346 # 1
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 47 ++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index bf612079b8bdae18a043913dbfe1ff7cbd9eaa34..97d8b4e287fc361516e93c7d32436f07e4728896 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -13364,16 +13364,12 @@ ath12k_mac_setup_radio_iface_comb(struct ath12k *ar,
 	comb[0].beacon_int_infra_match = true;
 	comb[0].beacon_int_min_gcd = 100;
 
-	if (ar->ab->hw_params->single_pdev_only) {
-		comb[0].num_different_channels = 2;
-	} else {
-		comb[0].num_different_channels = 1;
-		comb[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
-						BIT(NL80211_CHAN_WIDTH_20) |
-						BIT(NL80211_CHAN_WIDTH_40) |
-						BIT(NL80211_CHAN_WIDTH_80) |
-						BIT(NL80211_CHAN_WIDTH_160);
-	}
+	comb[0].num_different_channels = 1;
+	comb[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
+				      BIT(NL80211_CHAN_WIDTH_20) |
+				      BIT(NL80211_CHAN_WIDTH_40) |
+				      BIT(NL80211_CHAN_WIDTH_80) |
+				      BIT(NL80211_CHAN_WIDTH_160);
 
 	return 0;
 }
@@ -13456,25 +13452,42 @@ static int ath12k_mac_setup_iface_combinations(struct ath12k_hw *ah)
 	struct ieee80211_iface_combination *combinations, *comb;
 	struct wiphy *wiphy = ah->hw->wiphy;
 	struct wiphy_radio *radio;
+	int n_combinations = 1;
 	struct ath12k *ar;
 	int i, ret;
 
-	combinations = kzalloc(sizeof(*combinations), GFP_KERNEL);
-	if (!combinations)
-		return -ENOMEM;
-
 	if (ah->num_radio == 1) {
-		ret = ath12k_mac_setup_radio_iface_comb(&ah->radio[0],
-							combinations);
+		ar = &ah->radio[0];
+
+		if (ar->ab->hw_params->single_pdev_only)
+			n_combinations = 2;
+
+		combinations = kcalloc(n_combinations, sizeof(*combinations),
+				       GFP_KERNEL);
+		if (!combinations)
+			return -ENOMEM;
+
+		ret = ath12k_mac_setup_radio_iface_comb(ar, combinations);
 		if (ret) {
 			ath12k_hw_warn(ah, "failed to setup radio interface combinations for one radio: %d",
 				       ret);
 			goto err_free_combinations;
 		}
 
+		if (ar->ab->hw_params->single_pdev_only) {
+			comb = combinations + 1;
+			memcpy(comb, combinations, sizeof(*comb));
+			comb->num_different_channels = 2;
+			comb->radar_detect_widths = 0;
+		}
+
 		goto out;
 	}
 
+	combinations = kcalloc(n_combinations, sizeof(*combinations), GFP_KERNEL);
+	if (!combinations)
+		return -ENOMEM;
+
 	/* there are multiple radios */
 
 	radio = kcalloc(ah->num_radio, sizeof(*radio), GFP_KERNEL);
@@ -13517,7 +13530,7 @@ static int ath12k_mac_setup_iface_combinations(struct ath12k_hw *ah)
 
 out:
 	wiphy->iface_combinations = combinations;
-	wiphy->n_iface_combinations = 1;
+	wiphy->n_iface_combinations = n_combinations;
 
 	return 0;
 

---
base-commit: 5a1ad8faaa165028dfcce650e20868c8fb7148cb
change-id: 20250718-ath12k-dfs-82472cfb996d

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


