Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B012C282DE
	for <ath12k@archiver.kernel.org>; Mon, 10 Mar 2025 23:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kZorEsNh/qWSFIhYLEsw65VFgF7Utq5nKIYynGPWCSI=; b=PuRB+jP+CwdWD5YrEFN+wkdnfj
	4mpC7BW0GphGgJ+iP7zOlQu4ny+VxZxOKvskB/YW4ELiyf5dmrAdyc4mfy8eGyKwKY9l9eTW4dlqk
	L2qYdtx06S9A++Oin0/15OWV9q3+Fi4rTXsibw1N6W2SuoaWOMqZIoT/jn0b1MHDcA0VHUnp2rkd4
	q1AN9Hg9ylhEC7cEgrQMtUojX/HhioCSvtB24JWT0kEfdB5IIH7qaTR1m4qBp/5MnGxxQPJKvGrzP
	nYMFmaTr9yTGvzYV/Zlyn0hxrIOUy5ke++0fbLGW12uULwxttWcBh9i5bvxV8PHdIpOudSaPsw/O7
	ZG/zf38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trm7Y-00000004AFQ-0RWp
	for ath12k@archiver.kernel.org;
	Mon, 10 Mar 2025 23:01:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trm7U-00000004AER-2sb6
	for ath12k@lists.infradead.org;
	Mon, 10 Mar 2025 23:01:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ALQY7V007679
	for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 23:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kZorEsNh/qWSFIhYLEsw65VFgF7Utq5nKIY
	ynGPWCSI=; b=nIR7c+6LYVA885zM2Nlb7QHhOZbQJfFbh8c1nKhVngZt6PJtEuN
	TyHLi5YlsLdGgqfI13UZ4d/QEyecXXy9IPRDwjhG1oMuBCaz/g9zugNjgO9z+HsZ
	6sWM5mZHc7pVZg+YZYFu1ErMcaHUa3akiPjrZ2SP267qE21nJSw/JiXa2JhoQ8BE
	P6s4EH33W1+Jp7jNyVKJ5USI/f97Nd/yv+uTN0r1eh+d3LeOqYHTISoIB7Jm3Ahz
	7FHcuXfOfzO2hqn9U79Iq9rkxJY8yfJ/2Pe/9nk3Bk/GOJtlrKH+BiIevvUDyY+O
	ptecbhgEwTa7nScPTTW1JmfCQnOGIANjbcg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f1jxa9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 23:01:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240a96112fso148951515ad.2
        for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 16:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741647669; x=1742252469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZorEsNh/qWSFIhYLEsw65VFgF7Utq5nKIYynGPWCSI=;
        b=cyC5ICkwNGt0Ze6kjCo1EcgaMDNseHc8oGT7nMhrpukv2NbxgjeZQW+d1J2f72B4Ug
         fCb2DYGomNLIPH5+8nr9ubVIlaK5HXmeH93w3rgdL3snBCikFVZeRHxfOeiUriuHylGp
         HblUPr01yAUB4XrmzX7ttWZin2REvT4bIqite+gGuEZEDSmYTovPU8t4DaraBscnJuIK
         GSedvJWASZnHJkm7vx7Wwzyf7YtM50VCt4KXdlfl7oyHzkbslkLxFNEdcIVlqxYOWKbg
         KkDJ2jdhxTSQI3UVrevyVwjJvw6MBXkyDU5L2pGKLe09WiUccjjEOiOvZxPyAmo2XMMv
         8Oxg==
X-Gm-Message-State: AOJu0YyRffw0HmTc8DJBEZW9EmkPPIRgW/itfcaMZJUgmfAKDNB9E7yr
	0WsPFSkrOtjz2c06l446KSJQSgWqdWA8nVYBc+2hl1zjRR98rzIno79y/f5X1/BcoG0QVqvPzW5
	meLQp2tCv+Wv/hA1BpmUWvwM6vA9/eIN0QX7pSSHSVqQzuMR+YmkYPKfR8DRFg2/HsyVR
X-Gm-Gg: ASbGncuO9xZD509YNHzvv+FWvhRyOxO+8wbQIM/EvSqxfz/NpgkNp9sOt2WEqN3EJWZ
	HlRkZfEMRWgBE0iRWmKmt67d/tlq1uKF6tjQb4AYO2VxQnfTHIIBN6VRAxJANNLcLYamfCoA6E6
	U2B6yBsczMMl+UR0vCisCyjOQAstIxVOzDdddciJ9GgqRa2QUYsAgWGpkG9nWdYNbOeDIcy0q9Q
	BxlEZV9shLajMLzTgob3VF5Y7Ig6nwxxiPUC4ajg9rnDJXifxIQG0smyQKMcPUVg1ojSa/PJNso
	qmUtfMm4QhVwiHrZeyMiV+gmlvsumJEibQFON+8ab10ba6/39aGtiDHbgfs19UH7SoYWXHqX
X-Received: by 2002:a05:6a00:c8f:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-736aa9e0a95mr17814868b3a.9.1741647668698;
        Mon, 10 Mar 2025 16:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEbfaXDCrTsTjJcjzzDGbR0SIZGCtvh+f0MsKyA8IHVzO3u6apvFa/1hIvAlz1o7gF+gwBrw==
X-Received: by 2002:a05:6a00:c8f:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-736aa9e0a95mr17814842b3a.9.1741647668327;
        Mon, 10 Mar 2025 16:01:08 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736a80853d1sm7906959b3a.91.2025.03.10.16.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 16:01:07 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Prevent multicast duplication for dynamic VLAN
Date: Mon, 10 Mar 2025 16:01:05 -0700
Message-Id: <20250310230105.3534334-1-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctthk04i c=1 sm=1 tr=0 ts=67cf6f36 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=xW75EOlAb0IjOozs2BkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: uStrKoHNxNniqRd_mnBhisP_5pQ-Yo92
X-Proofpoint-GUID: uStrKoHNxNniqRd_mnBhisP_5pQ-Yo92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=791
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_160112_916890_D487E3CC 
X-CRM114-Status: GOOD (  14.74  )
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

Since dynamic VLAN traffic is software encrypted and encapsulated,
mac80211 handles the duplication on each link for MLO dynamic VLAN
multicast.

Currently in mac Tx op, all multicast frames are duplicated and are
assigned a mcbc_gsn. This is causing dynamic VLAN multicast traffic
to be dropped in HW.

Prevent dynamic VLAN multicast traffic from being duplicated again in
the driver. Check if incoming packet is a dynamic VLAN packet and
avoid defaulting to multicast conditional.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dfa05f0ee6c9..a7b8a7d2637a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7337,6 +7337,7 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 	struct ath12k_peer *peer;
 	unsigned long links_map;
 	bool is_mcast = false;
+	bool is_dvlan = false;
 	struct ethhdr *eth;
 	bool is_prb_rsp;
 	u16 mcbc_gsn;
@@ -7397,7 +7398,14 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 	if (vif->type == NL80211_IFTYPE_AP && vif->p2p)
 		ath12k_mac_add_p2p_noa_ie(ar, vif, skb, is_prb_rsp);
 
-	if (!vif->valid_links || !is_mcast ||
+	/* Checking if it is a DVLAN frame */
+	if (!test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ar->ab->dev_flags) &&
+	    !(skb_cb->flags & ATH12K_SKB_HW_80211_ENCAP) &&
+	    !(skb_cb->flags & ATH12K_SKB_CIPHER_SET) &&
+	    ieee80211_has_protected(hdr->frame_control))
+		is_dvlan = true;
+
+	if (!vif->valid_links || !is_mcast || is_dvlan ||
 	    test_bit(ATH12K_FLAG_RAW_MODE, &ar->ab->dev_flags)) {
 		ret = ath12k_dp_tx(ar, arvif, skb, false, 0);
 		if (unlikely(ret)) {

base-commit: 0e28ee106c46c95eb322833c17c33e3c231ccd0d
-- 
2.34.1


