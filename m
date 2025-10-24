Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6FACCF9E0
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 00:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae7UoLdgspSb6jjEVxk41LPKz4Rzp1dN1ifdoLtkxkM=; b=kGP1s/q/m4kuYZePTi8wXTN/8C
	NMVdXN/mlDEupgfmZN7SYdQYg3+qzrU3KYX0I/ls46R10zjxZziSoYnNnzvfeFrcvbEvsI0DXbwbc
	jw5UZzaI70vUYUJ9FrqST0pjB7PfYfYx6i2yq6kaRcwwBiCnAtTO2fIVkLp3dl8YjI2T4CxeBcwCx
	nElbe5RIFmNsN7TsjMiEp6oZ+ojFBpZVrU/xURyv8dWX8t78Xrk0adsSuNRxbep/sGrEoW7sQsux8
	mTi885nRKgmgt7D8y9CqLeVPukn56STBzSuBczPhBKDpX5LVpsZoYigrf4w3vin18u09MnJJn1KCN
	vDSD5ZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Ww-00000007tSX-49Zp;
	Fri, 24 Oct 2025 00:19:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wt-00000007tQk-3aAc
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 00:19:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NGVnB3019075
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ae7UoLdgspS
	b6jjEVxk41LPKz4Rzp1dN1ifdoLtkxkM=; b=NbEtV5OcJ921klYrr7Ly4xINMk6
	7QKtJmMRiyvZ6DAuk/uov3fCaQy1UemwrcjhILqeLcleoIEckdNd348EfkxzGmma
	qGVR5ev+3n2ythMzITraZ3jX5dq2Ql/GoDmEXslrhYKU3/5Nzx9lt229Zp3nc+jY
	47+zwPk8g1XuYz2v6jsSwDagFiIHeNhEolIeYH0Ps7+/Qj7qYm8PcrKON/qJy2rU
	FcRyLh1+io1ls52Pwe3x8ufedail00ZCo4nrciovtZI6AeZE48rHLTq/QvvHoQwI
	EL1cn0pFPsxZcnPntHhOpj+Gij2UPDQNSpyjB6IqlFWrh3/xEJnMadANXow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qm8vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33baef12edaso1372062a91.0
        for <ath12k@lists.infradead.org>; Thu, 23 Oct 2025 17:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265178; x=1761869978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae7UoLdgspSb6jjEVxk41LPKz4Rzp1dN1ifdoLtkxkM=;
        b=Hu1kUQgmnG6FNGkF/42f3bvtKG65LYL5rDbwQbvQzv1s48expMAerpnw1bN7lxPgqo
         X2jlOEFWvSZLzRTknRHiq8JLM6nXZ/ER8Uyb4XWJsNJUImQa3vMHc0b0aeZMN1ePph6m
         UHVOFVA/DeDmyaGm8pimNnQ974+eiMmQ65hFlrbOz1HwBUuZ196YLMAG3AHODd9e0vbd
         zUlJ0318fk5E7cKtRQuTzUdGZaq7aacuzJ7oQRG8dIVvyhhpddRpuRinSi7fano6n3hW
         ZMlHpwKgHJKJF7IzaLFk+IKmTHmGNUXeqg2nfdRqxD8CJbT/OOJ5Bl6A/VJF5G/MLp5O
         yk1A==
X-Gm-Message-State: AOJu0YynBtS+iZGFq2blA9KeKNOi7wrXRn/cFlnBETZxda/naNrau9IQ
	chNSp5AWZVHUkM/E/MwNJxbsHAPxMhpp6YyLM9D0E54k2bXx4T2i21qe3c8heo1GA0/97oi5huH
	XXLm6u7Qd/T03pyddEtQInuFp8V550iq9Lv7veLtPUNkV6hn3ZzeVa2zxsXm60XpXZObv+9xS
X-Gm-Gg: ASbGncvnGIZfQ9qN7ETVEqRqiaOxmuj2rk/Mqn8pH6soBivJXvaoJKdiN52dFt1BdtL
	j8vDYFQRMNuUgiMrtdGqF33qvnaPRs8RDuV5cpgPIQxOyBV+0W3/G/KsYyi+394zQcYTtxMbV+F
	UStqJXsXbrRCkxK9IhPoXJ0/lO1KnhNWtBB0d/ixHVFdDNfrIAN35/GHT00w6rnSYbIyGc6znRL
	BlXDHyaiaJyN1x/g7C76ZlJx4IVAYL8uMgxYhql63zw8aNiJR8bajPTlzm+SGzUIRWTD7jYon3J
	gTedLf0Ik2qaf+ef6uMdGbN+enY9NUDEQTq9rFkcmfHw+8V30X1YAwNXIf4fNOLzb4+9ffvo8Fv
	Np8lhKSj9Ouo1sWhnSNfOXJW/TCWwyQFl1jzMXHLXJCRTjA10Fx9MQLE=
X-Received: by 2002:a17:90b:4f90:b0:32e:859:c79 with SMTP id 98e67ed59e1d1-33fd6430575mr418904a91.0.1761265178364;
        Thu, 23 Oct 2025 17:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENojITSb/gTAVTdxVDHRr1KdYYHla0xYunQvL5BL0qxlyD0HPm8esrXbGv70OU4ddp9nWcTw==
X-Received: by 2002:a17:90b:4f90:b0:32e:859:c79 with SMTP id 98e67ed59e1d1-33fd6430575mr418881a91.0.1761265177854;
        Thu, 23 Oct 2025 17:19:37 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb65b3sm3296264a12.8.2025.10.23.17.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:19:37 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next 4/6] wifi: ath12k: Add EHT fixed GI/LTF
Date: Thu, 23 Oct 2025 17:19:26 -0700
Message-Id: <20251024001928.257356-5-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
References: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX9NmI9gFCxsxM
 QTT0zknGcY1ECb7h+s7e5M3zotRhThfMvGtphvORJY4cK2VeI5BPoZRjxODw8B39uLy42WjQ0nG
 6uft520xLwkMiHhbBNcF7+Xg/jM4DsPPe3JEiUotztuPeS8M6QpAacff30XrScry+FqEEpMxlvI
 geJAZPygGDfzrJQ1NWnRnYQioeUVOSEgxaBMW8fhhq6r6p/xNpVxOFy0QIiqljsSs/3V0ot89cs
 C8b5Ao/OsiH1tMYs5R+2EAC4Rp218ykPZMbvVszHgQ+eUmY1L9ZoD7bZwkuiCR7j+M+IeqQCY7c
 PlogamxHArrKcJlgWYGSHvpiqeJbPzWKZg5ljF0nMfybugPW0+nGc74iDCHJyi3Tp/SDePd30Pz
 4m2wE9dX71benv8kK2Kwsc33KvYGDw==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fac61b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=hBW4dpCEVM4ugrTErwAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: HN66bREITTYCVPi_-Kj1Yrz_NIXm98qz
X-Proofpoint-ORIG-GUID: HN66bREITTYCVPi_-Kj1Yrz_NIXm98qz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_171939_892685_50350435 
X-CRM114-Status: GOOD (  16.66  )
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

Add EHT functionality to set fixed GI/LTF parameters.
Add new wmi vdev parameter id for EHT LTF

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 50 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eff1ec1eb4e0..732ddd78635d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12254,10 +12254,11 @@ ath12k_mac_get_single_legacy_rate(struct ath12k *ar,
 }
 
 static int
-ath12k_mac_set_fixed_rate_gi_ltf(struct ath12k_link_vif *arvif, u8 gi, u8 ltf)
+ath12k_mac_set_fixed_rate_gi_ltf(struct ath12k_link_vif *arvif, u8 gi, u8 ltf,
+				 u32 param)
 {
 	struct ath12k *ar = arvif->ar;
-	int param, ret;
+	int ret;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -12272,11 +12273,16 @@ ath12k_mac_set_fixed_rate_gi_ltf(struct ath12k_link_vif *arvif, u8 gi, u8 ltf)
 			    gi, ret);
 		return ret;
 	}
-	/* start from 1 */
-	if (ltf != 0xFF)
-		ltf += 1;
 
-	param = WMI_VDEV_PARAM_HE_LTF;
+	if (param == WMI_VDEV_PARAM_HE_LTF) {
+		/* HE values start from 1 */
+		if (ltf != 0xFF)
+			ltf += 1;
+	} else {
+		/* EHT values start from 5 */
+		if (ltf != 0xFF)
+			ltf += 4;
+	}
 
 	ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
 					    param, ltf);
@@ -12359,6 +12365,7 @@ static u32 ath12k_mac_nlgi_to_wmigi(enum nl80211_txrate_gi gi)
 static int ath12k_mac_set_rate_params(struct ath12k_link_vif *arvif,
 				      u32 rate, u8 nss, u8 sgi, u8 ldpc,
 				      u8 he_gi, u8 he_ltf, bool he_fixed_rate,
+				      u8 eht_gi, u8 eht_ltf,
 				      bool eht_fixed_rate)
 {
 	struct ieee80211_bss_conf *link_conf;
@@ -12385,8 +12392,9 @@ static int ath12k_mac_set_rate_params(struct ath12k_link_vif *arvif,
 		   "he_gi 0x%02x he_ltf 0x%02x he_fixed_rate %d\n", he_gi,
 		   he_ltf, he_fixed_rate);
 
-	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "eht_fixed_rate %d\n",
-		   eht_fixed_rate);
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "eht_gi 0x%02x eht_ltf 0x%02x eht_fixed_rate %d\n",
+		   eht_gi, eht_ltf, eht_fixed_rate);
 
 	if (!he_support && !eht_support) {
 		vdev_param = WMI_VDEV_PARAM_FIXED_RATE;
@@ -12417,9 +12425,26 @@ static int ath12k_mac_set_rate_params(struct ath12k_link_vif *arvif,
 		return ret;
 	}
 
+	if (eht_support) {
+		if (eht_fixed_rate)
+			ret = ath12k_mac_set_fixed_rate_gi_ltf(arvif, eht_gi, eht_ltf,
+							       WMI_VDEV_PARAM_EHT_LTF);
+		else
+			ret = ath12k_mac_set_auto_rate_gi_ltf(arvif, eht_gi, eht_ltf);
+
+		if (ret) {
+			ath12k_warn(ar->ab,
+				    "failed to set EHT LTF/GI params %d/%d: %d\n",
+				    eht_gi, eht_ltf, ret);
+			return ret;
+		}
+		gi_ltf_set = true;
+	}
+
 	if (he_support) {
 		if (he_fixed_rate)
-			ret = ath12k_mac_set_fixed_rate_gi_ltf(arvif, he_gi, he_ltf);
+			ret = ath12k_mac_set_fixed_rate_gi_ltf(arvif, he_gi, he_ltf,
+							       WMI_VDEV_PARAM_HE_LTF);
 		else
 			ret = ath12k_mac_set_auto_rate_gi_ltf(arvif, he_gi, he_ltf);
 		if (ret)
@@ -12621,6 +12646,7 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	const u16 *he_mcs_mask;
 	u8 he_ltf = 0;
 	u8 he_gi = 0;
+	u8 eht_ltf = 0, eht_gi = 0;
 	u32 rate;
 	u8 nss, mac_nss;
 	u8 sgi;
@@ -12656,6 +12682,9 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	he_gi = mask->control[band].he_gi;
 	he_ltf = mask->control[band].he_ltf;
 
+	eht_gi = mask->control[band].eht_gi;
+	eht_ltf = mask->control[band].eht_ltf;
+
 	/* mac80211 doesn't support sending a fixed HT/VHT MCS alone, rather it
 	 * requires passing at least one of used basic rates along with them.
 	 * Fixed rate setting across different preambles(legacy, HT, VHT) is
@@ -12754,7 +12783,8 @@ ath12k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 	}
 
 	ret = ath12k_mac_set_rate_params(arvif, rate, nss, sgi, ldpc, he_gi,
-					 he_ltf, he_fixed_rate, eht_fixed_rate);
+					 he_ltf, he_fixed_rate, eht_gi, eht_ltf,
+					 eht_fixed_rate);
 	if (ret) {
 		ath12k_warn(ar->ab, "failed to set rate params on vdev %i: %d\n",
 			    arvif->vdev_id, ret);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 01b2a865f103..3334fe32d412 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -1197,6 +1197,7 @@ enum wmi_tlv_vdev_param {
 	WMI_VDEV_PARAM_SET_HEMU_MODE,
 	WMI_VDEV_PARAM_HEOPS_0_31 = 0x8003,
 	WMI_VDEV_PARAM_SET_EHT_MU_MODE = 0x8005,
+	WMI_VDEV_PARAM_EHT_LTF,
 };
 
 enum wmi_tlv_peer_flags {
-- 
2.34.1


