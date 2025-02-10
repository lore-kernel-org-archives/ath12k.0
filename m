Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEDBC02198
	for <ath12k@archiver.kernel.org>; Mon, 10 Feb 2025 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YS0ZCnpU0032ewMQjAnzpro93E+rCTYfGMOjixjaM4E=; b=DlQIcHVVPwXTZI2N6B1OMhzPmV
	hQq4lze6jmUBScyyJ6bjpE0r50TZZ24Rb2Pl8ldyCEkniGJvH73+RMxaY9SCWU1/sEmLjegzCQBwO
	zzhbLwXa6uLPyxyoG8BBuRRuqZVdv3hf3JrQQdMbBfpQVGJbTEdx8WRJpO2WAlxG+7KGdGqyJBG7p
	7visaVv1OIjxl5SS/PzLRYKlXWcLIoBkKr2R76pR7ve9QmAd+6QpmzKvvpFcxhUr2gUbgLaoUm3Kr
	zDiaLDaLmzWU9cK6EcVLPPKplmSCA6u2vMKzDg4hvdsFltNcex5gYglU2mLGhocTk48cQmaDkSrK3
	QLBPUiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeB-00000001AX8-2N4I
	for ath12k@archiver.kernel.org;
	Mon, 10 Feb 2025 19:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYV9-00000000v2o-3iV1
	for ath12k@lists.infradead.org;
	Mon, 10 Feb 2025 18:27:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ABgA4r031880
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YS0ZCnpU003
	2ewMQjAnzpro93E+rCTYfGMOjixjaM4E=; b=ngL4R8SX4Hox42L9fRtmpEBk7Pw
	ew3bMpKK8K42VXh8+t766HoAtis1WN2ZDsWG7YwWLzWpWO9Btq9jQJA1jwgEAk5U
	cczpLuh+KHbdI0qoTUDgMdjc8v6n1ak8n/0AcbhwtvRWoMjUpYutmgfLyGN/9XEW
	/QAMKtQQiTyp6a07ze6ptDBjsk2P5nfSPBCHjrOfTy68RO3ALPHEGwSLI87YDquW
	TXxaRNT+a4gdX+W9Yf6fjI0mgqSO53D+igzOydHy2aXEITKYFV7Dj8a7Pao+Z1st
	9JEuTVIJODOfSfraZxAUtqNsTY3baGWZ8BtBK70QM/5mRsrqvXUAO9A58Sg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk12wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 18:27:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa636e5283so3223832a91.0
        for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 10:27:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212042; x=1739816842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS0ZCnpU0032ewMQjAnzpro93E+rCTYfGMOjixjaM4E=;
        b=H4mbzp9R1wH4pl/3ff4s/Zhpxp+nnhYTfDa5GsCq4TQfJw5HbDjmNlKZvZAHtsWa9P
         fDevTtEjogDKkD6WfYvbgznG8DqYN5WgQpIqkcWsWyArnBkJJjKvoVmIWURMhkhq9clL
         Nw3/QUBm6e03QnuSN4IaGqN48F2ZzSr2SSXP8rQkvG2+u1qYS/LsIaN5n2LOfINYilzs
         wTyFFLauSJffg2RBQKkWd4qD1vQCaXg8KjaSz/EDe9TfotUWG4DbI8CqYSQLCSGDHyFt
         YTeUqkhPuiLY8RJdfdRKeg/UONNAiUNAUH6xZYdeyfaz+PgrKlbDyvRu6SFyXHy7CQY1
         eSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX226Bz1+JhOi/dJWzYxkZnGl19h4iWNcJSnetGgcXIlAo+6ed8EQcS+stwtQ2owoaGaUo1LA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTXacjuZOacYbigZqEjaeZG4/QpnTlJsUGGBQoMpoVIUmEz8qa
	g93wcVSB+nTMN06MVUMwpJl3d7fGEjC3Zly+hGKKvn9vfwNHw/JgXiV42D7IYGr6R1TstIlalsV
	xgkw3R570wyXnxvh9CS/44MTdVTugIJmpXZa44OFJrmzLlwiuJ5ZU685QvyjO
X-Gm-Gg: ASbGncsal+zDtj7R4H88n8Pb6hdUNgGDkr0DqRlU4grgQHyawnxTryQ7++Pt8I6vDcc
	HCPAAVosRKjsL/30E6xCgNEvPHyMCHFantOPpBYjLCKfoeuuMJgV6fRa5r3nYHsLdB59xkZt44P
	LZ+gOeWt3mRmrnd3LLIBJF9tsDw9JFIWi877vvL3Bd7sjSCyQPO0lpWC+YNrH/Ss9Oif+OUx3uv
	f4nn+4LpdOiNkiMixcHIxPTiFSgi224CqrtelZGC9QMIQ+RX1Gnyfn4RXci6i8KR1rxI856IgwQ
	F9q4iBKW4D+Iobv8RWcEyiZsjuN+rajPXTsgpbO3OqZgdJPCQF2LRPGk6og4
X-Received: by 2002:a05:6a21:1394:b0:1ed:a4ae:3b80 with SMTP id adf61e73a8af0-1ee03a23e9dmr24386865637.6.1739212042041;
        Mon, 10 Feb 2025 10:27:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjy5laiiBdq36IQJpPuZtXJaWXF9jBvHkUSZ40R6JY7aV8/MptL4xA8ZePCFex81rCp7YnZw==
X-Received: by 2002:a05:6a21:1394:b0:1ed:a4ae:3b80 with SMTP id adf61e73a8af0-1ee03a23e9dmr24386805637.6.1739212041491;
        Mon, 10 Feb 2025 10:27:21 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae8e83sm7948372b3a.84.2025.02.10.10.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:27:21 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v4 1/5] wifi: ath11k: refactor transmitted arvif retrieval
Date: Mon, 10 Feb 2025 10:27:14 -0800
Message-Id: <20250210182718.408891-2-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
References: <20250210182718.408891-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X8KGfkW9l9nYLv_Y5v9QU6DY24x2NZ9c
X-Proofpoint-ORIG-GUID: X8KGfkW9l9nYLv_Y5v9QU6DY24x2NZ9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=935 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102723_932593_3EB21FEA 
X-CRM114-Status: GOOD (  19.67  )
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

Create a new function ath11k_mac_get_tx_arvif() to retrieve 'arvif'
for the transmitted interface of the MBSSID set. This will help
modifying the same code path to reflect mac80211 data structure
changes to support MLO. This also fixes an issue in
ath11k_mac_update_vif_chan() where tx_arvif is not reset to NULL
inside for loop during each iteration. Compile tested only.

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 53 +++++++++++++--------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 14ed53836589..466a314b938b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1529,6 +1529,14 @@ static int ath11k_mac_set_vif_params(struct ath11k_vif *arvif,
 	return ret;
 }
 
+static struct ath11k_vif *ath11k_mac_get_tx_arvif(struct ath11k_vif *arvif)
+{
+	if (arvif->vif->mbssid_tx_vif)
+		return ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
+
+	return NULL;
+}
+
 static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 {
 	struct ath11k_vif *tx_arvif;
@@ -1538,7 +1546,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
 	u32 params = 0;
 	u8 i = 0;
 
-	tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 
 	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
 							 tx_arvif->vif, 0);
@@ -1589,21 +1597,21 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *tx_arvif = arvif;
+	struct ath11k_vif *tx_arvif;
 	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
 	int ret;
 
-	if (vif->mbssid_tx_vif) {
-		tx_arvif = ath11k_vif_to_arvif(vif->mbssid_tx_vif);
-		if (tx_arvif != arvif) {
-			ar = tx_arvif->ar;
-			ab = ar->ab;
-			hw = ar->hw;
-			vif = tx_arvif->vif;
-		}
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (tx_arvif && tx_arvif != arvif) {
+		ar = tx_arvif->ar;
+		ab = ar->ab;
+		hw = ar->hw;
+		vif = tx_arvif->vif;
+	} else {
+		tx_arvif = arvif;
 	}
 
 	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
@@ -1674,7 +1682,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 				     struct ieee80211_bss_conf *info)
 {
 	struct ath11k *ar = arvif->ar;
-	struct ath11k_vif *tx_arvif = NULL;
+	struct ath11k_vif *tx_arvif;
 	int ret = 0;
 
 	lockdep_assert_held(&arvif->ar->conf_mutex);
@@ -1701,9 +1709,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
 
 	ether_addr_copy(arvif->bssid, info->bssid);
 
-	if (arvif->vif->mbssid_tx_vif)
-		tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
-
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 	ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 				 arvif->bssid,
 				 tx_arvif ? tx_arvif->bssid : NULL,
@@ -6385,23 +6391,20 @@ static int ath11k_mac_setup_vdev_params_mbssid(struct ath11k_vif *arvif,
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_vif *tx_arvif;
-	struct ieee80211_vif *tx_vif;
 
 	*tx_vdev_id = 0;
-	tx_vif = arvif->vif->mbssid_tx_vif;
-	if (!tx_vif) {
+	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
+	if (!tx_arvif) {
 		*flags = WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP;
 		return 0;
 	}
 
-	tx_arvif = ath11k_vif_to_arvif(tx_vif);
-
 	if (arvif->vif->bss_conf.nontransmitted) {
-		if (ar->hw->wiphy != ieee80211_vif_to_wdev(tx_vif)->wiphy)
+		if (ar->hw->wiphy != tx_arvif->ar->hw->wiphy)
 			return -EINVAL;
 
 		*flags = WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP;
-		*tx_vdev_id = ath11k_vif_to_arvif(tx_vif)->vdev_id;
+		*tx_vdev_id = tx_arvif->vdev_id;
 	} else if (tx_arvif == arvif) {
 		*flags = WMI_HOST_VDEV_FLAGS_TRANSMIT_AP;
 	} else {
@@ -7361,8 +7364,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			   int n_vifs)
 {
 	struct ath11k_base *ab = ar->ab;
-	struct ath11k_vif *arvif, *tx_arvif = NULL;
-	struct ieee80211_vif *mbssid_tx_vif;
+	struct ath11k_vif *arvif, *tx_arvif;
 	int ret;
 	int i;
 	bool monitor_vif = false;
@@ -7416,10 +7418,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 			ath11k_warn(ab, "failed to update bcn tmpl during csa: %d\n",
 				    ret);
 
-		mbssid_tx_vif = arvif->vif->mbssid_tx_vif;
-		if (mbssid_tx_vif)
-			tx_arvif = ath11k_vif_to_arvif(mbssid_tx_vif);
-
+		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
 		ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
 					 arvif->bssid,
 					 tx_arvif ? tx_arvif->bssid : NULL,
-- 
2.34.1


