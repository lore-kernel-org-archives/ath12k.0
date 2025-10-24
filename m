Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901B8CCD1BF
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 00:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3yytTsCASaUNGDTYRZwoAUPXrxIYAiEFcB06UyRsUc=; b=UkRNPEuc0Rpna7AVAQLWOeIYCa
	JT/y3qb6pLwYui6ENQjT4/aZj1mTZcFVt9LjsMYr1b2UUVqskC4aCwRawYiLTAna9XwpeDaKk7T/y
	aR+KyThKDUzarkuILB+/dRY4DSnfLJuyK2Ts7WOZsDNLdUWW5kaDz+WnZggUSiyUpwixPy8sAFKiR
	2AqUZkR7ZvMuYGH90xYH/XCm79EpxV3h6zlD0LoX2qk3Ii9kPSnjH6TR24rTeSKK7QlekbjoBYzKa
	znbhNKoO1E9ZGQUAUMuy7Bla6/ozv6ohOwbqgKDAQwrT5ie7YIbOcNo+MQNFhw5si40ORoG7ST+2p
	ey1j7BIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wy-00000007tTQ-17xj;
	Fri, 24 Oct 2025 00:19:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wv-00000007tRD-3Jwp
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 00:19:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEe6GN005702
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d3yytTsCASa
	UNGDTYRZwoAUPXrxIYAiEFcB06UyRsUc=; b=FfvqXOB2sdLh3e9gsc/iFRqJokJ
	689ADtJGonjhIYqhDLP+J540KMT2h2pIg/aik1iDbBq6tGjVzPzd34weoH6KRxMw
	uZDeBiCEOa+sRK+BJv8U0NhktzYdNPkt43up7lZnKJkN27IoWPskhLqMBPYhmbO/
	U29Q0ovz665Mjw3DuZenTKLLkd2mjXnNIRCPWH7d9be561OYSfIr4Ik+4/hieg1Y
	/PCAJjl5xlW+PgUn7mBaW8BgVl0OEQ7F+zKUXJ1BdPpDf7pfRDNmqs+FuyTwDr+M
	RVyn9MbBYP2o15379/wE3hC7HKFAPB2sLGKi3CfVGwend6JE4FzPGRFCaqg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27ja74f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b557abaad02so2144187a12.3
        for <ath12k@lists.infradead.org>; Thu, 23 Oct 2025 17:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265179; x=1761869979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3yytTsCASaUNGDTYRZwoAUPXrxIYAiEFcB06UyRsUc=;
        b=ZGof8vdYtG6Jly+r9mOesNUhFXqWSJtUadNgMSg2HZkn8nOC8vA0PtdEuEBkUNPSv+
         lPAUUD7mmRECw4OinX8QDupMwi/duF5I0xJ2dMD3DeTE71lzhnat/xuaKiD4qacsYsL5
         76gYx5m3qZdlI7toe93kCTe/EIeMCZCNnuKAAIv6Ur+OEBdhuUNomHxGS5hLLb2NAYiQ
         bwY0qkV2YemaNlh4BgH6yKFYAJpuv/SCL1wIpsEb6Pmp/JI15NrYewCduJeGr6URKkUv
         Ice8jXO/N5nryeMZsBIv+2kmw4mqNPVcbhYJQgJ0zYsICVhjciZX9tEnmxVoma9ZUjy6
         4ZJw==
X-Gm-Message-State: AOJu0YybrEEnmbyE5tw80VCevIKh4cqnCHIyvlAKp7FstKAbvjQhLPOZ
	CfB2rNUt7B6xrkM/DLtK//yI0VXN8XXej4Wg0kCnok8DC9rfWiNLUHygTEmJcp6O4uk0I/NCCTv
	958GrsW6nuFU8m2UnbNPppo2kDndFSmGN8A6ETZ6KE8MSFS5Bx5my4DTwZTB3sZjDmEfQSgck
X-Gm-Gg: ASbGncsidLRUy3NuRnoVZhzILRXlpGS6swfeq9wAZcdWvKOLNZfRMmIgJk+f34w2HYU
	NPMZ6zk8dT94E0huYT84T96E8N6QeVh5OMAE6yuRug/aEXO6jQEXB5X+iuYha3f7pA7p5qQEzuh
	Oxy5H8fLNP/1wwbNzdcu7w7hvTdJXFE/PMegDTaj54zzWRF01G8XkIoKP4mrg6naGKOihLlmJkP
	A+CfU7AuzdGNxL0dum4lj/O7vRqVC+Nx7OOLYJkH+iNRsHm7h8CKYHJoafrCziP9N6IMEZE7bqF
	e63YFUIeIocKrTlcYoBc2RkoGdobZ9Jdt+2+eJiVXjtZVekWKjZpzjyawkDIZKMdFgoIyO6ugng
	JYJRGpB8KEcbNuBrEkaqd5NS81xUH+4IItVCguEeYqlk5jGUGoWlIdu0=
X-Received: by 2002:a05:6a21:3994:b0:334:a8b8:3ce5 with SMTP id adf61e73a8af0-334a8b83ee1mr36442972637.28.1761265179445;
        Thu, 23 Oct 2025 17:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGajz+6YoP2IqypLTEqv4/WvOOEj6rRfLIMcsUx82zfQ0WcQgjK8+EIgcjyJ6Nv9rTd2qtGQ==
X-Received: by 2002:a05:6a21:3994:b0:334:a8b8:3ce5 with SMTP id adf61e73a8af0-334a8b83ee1mr36442935637.28.1761265178778;
        Thu, 23 Oct 2025 17:19:38 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb65b3sm3296264a12.8.2025.10.23.17.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:19:38 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>,
        Aaradhana Sahu <quic_aarasahu@quicinc.com>
Subject: [PATCH ath-next 5/6] wifi: ath12k: add EHT rates to ath12k_mac_op_set_bitrate_mask()
Date: Thu, 23 Oct 2025 17:19:27 -0700
Message-Id: <20251024001928.257356-6-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
References: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX64uf+m2HhEvC
 G0/AMW7ma1Fkcx0nq7J4cwzUup7yiyBPb8tb2y3+Is0qHEeqzvjdLj6lJ6CUQVEPQb3sSM9LXEx
 laGtq/xSHdQ5xQMnersAwfvw13a8gtldp5IAoutnTqOgKHvywmp2+3VMimwLVmP2DsdHSvLk9ji
 NA6bM8/f+OWJCEfLsmFL3cVMQatpFV55P6cgczQD6GK+SbA70tWoJVADPWkgUaSxPh/LH0+nvSP
 dtWI31cKouUNI7gw9WXPerv1jOhBLXjDPGVowSWFyVFJsVLAk1gyKlKSt5U8090AuLfYsEPQgAp
 GnNRn+fetnuX5TpL1X1REnI675gz5b7pr7ZG/XH836gpiy1pKUI53bkb0YfeAlkHEpkI2fUpA4z
 81bFhEFt3+Hr2mTpSh7mTQqbv04K8Q==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fac61c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Xnj9w1_vVb6zP76ol7IA:9 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bviTmohFtIXIVH-4K0QOf14vyShjIJfn
X-Proofpoint-ORIG-GUID: bviTmohFtIXIVH-4K0QOf14vyShjIJfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_171941_952634_293770AB 
X-CRM114-Status: GOOD (  14.49  )
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

Extend ath12k_mac_op_set_bitrate_mask() to handle EHT rates.
Create and pass EHT mask containing MCS and NSS along with EHT GI and
LTF when calling ath12k_mac_set_rate_params()

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 55 +++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 732ddd78635d..31b0e641ce55 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12517,6 +12517,38 @@ ath12k_mac_he_mcs_range_present(struct ath12k *ar,
 	return true;
 }
 
+static bool
+ath12k_mac_eht_mcs_range_present(struct ath12k *ar,
+				 enum nl80211_band band,
+				 const struct cfg80211_bitrate_mask *mask)
+{
+	u16 eht_mcs;
+	int i;
+
+	for (i = 0; i < NL80211_EHT_NSS_MAX; i++) {
+		eht_mcs = mask->control[band].eht_mcs[i];
+
+		switch (eht_mcs) {
+		case 0:
+		case BIT(8) - 1:
+		case BIT(10) - 1:
+		case BIT(12) - 1:
+		case BIT(14) - 1:
+			break;
+		case BIT(15) - 1:
+		case BIT(16) - 1:
+		case BIT(16) - BIT(14) - 1:
+			if (i != 0)
+				return false;
+			break;
+		default:
+			return false;
+		}
+	}
+
+	return true;
+}
+
 static void ath12k_mac_set_bitrate_mask_iter(void *data,
 					     struct ieee80211_sta *sta)
 {
@@ -12644,6 +12676,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	const u8 *ht_mcs_mask;
 	const u16 *vht_mcs_mask;
 	const u16 *he_mcs_mask;
+	const u16 *eht_mcs_mask;
 	u8 he_ltf = 0;
 	u8 he_gi = 0;
 	u8 eht_ltf = 0, eht_gi = 0;
@@ -12671,6 +12704,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	ht_mcs_mask = mask->control[band].ht_mcs;
 	vht_mcs_mask = mask->control[band].vht_mcs;
 	he_mcs_mask = mask->control[band].he_mcs;
+	eht_mcs_mask = mask->control[band].eht_mcs;
 	ldpc = !!(ar->ht_cap_info & WMI_HT_CAP_LDPC);
 
 	sgi = mask->control[band].gi;
@@ -12722,9 +12756,10 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 			ath12k_warn(ar->ab,
 				    "failed to update fixed rate settings due to mcs/nss incompatibility\n");
 
-		mac_nss = max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
-			       ath12k_mac_max_vht_nss(vht_mcs_mask),
-			       ath12k_mac_max_he_nss(he_mcs_mask));
+		mac_nss = max(max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
+				   ath12k_mac_max_vht_nss(vht_mcs_mask),
+				   ath12k_mac_max_he_nss(he_mcs_mask)),
+			       ath12k_mac_max_eht_nss(eht_mcs_mask));
 		nss = min_t(u32, ar->num_tx_chains, mac_nss);
 
 		/* If multiple rates across different preambles are given
@@ -12772,6 +12807,20 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 			ret = -EINVAL;
 			goto out;
 		}
+
+		num_rates = ath12k_mac_bitrate_mask_num_eht_rates(ar, band,
+								  mask);
+		if (num_rates == 1)
+			eht_fixed_rate = true;
+
+		if (!ath12k_mac_eht_mcs_range_present(ar, band, mask) &&
+		    num_rates > 1) {
+			ath12k_warn(ar->ab,
+				    "Setting more than one EHT MCS Value in bitrate mask not supported\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
 		ieee80211_iterate_stations_mtx(hw,
 					       ath12k_mac_disable_peer_fixed_rate,
 					       arvif);
-- 
2.34.1


