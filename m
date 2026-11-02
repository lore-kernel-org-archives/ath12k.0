Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AE5606A32D
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NqOY/zss;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h36JKFC6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ei5/5mCv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EhwhSdlF3yFYJXucMT5j2zuOq9XHAhyaRCLARs3Gals=; b=NqOY/zss0CSDA5
	0NWUo06m7hxSu/jll4wgM6vp2cnqT7PbKxE0gQTCdODiklLF4Tjg2BsGXwG09QTTvHC14hSdygupz
	u0K24ArmKC1fs0h/NFyX2lhRZVbhR2OQcxhR3NI5Q2O+2ReQNNUzydWJKiGtdtaOERUjZP/yF5YXT
	pbTQknTonVETTVGtLndO4bDMkfu1TPNSNTCmjlpMUcqSi0ensa55H1HlVy6nm18UvZsnJj0S8tXOL
	YaO+rAICkTPLFLTkIBLPc0I6Hz+QKJAE2ztERJxcheqovxkl3genMyfzrdwvCWaGURm9DmkbcgbCm
	m+EUqdKuB1uuyU0ZlCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh5-0000000Fesc-2BWk;
	Mon, 02 Nov 2026 06:38:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNlh2-0000000FeqL-3fp8
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 06:38:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DKhW2433769
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 06:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EhwhSdlF3yFYJXucMT5j2zuOq9XHAhyaRCLARs3Gals=; b=h36JKFC64uIVfOLN
	7LWaJlBSUJpe2StFNqxFv5/zSHBVRXztoBISEhbcIwyXgZdcWqUkISnkW/AEvkt9
	JlG/Nd627QDAIxTgWIlvvr7KtgnxQAK42WiEKA6jmBTojMQ30qSr0H+4hzfdt3EM
	w9CzO+65a/49fxeVU0t6SQQZWZJCK8dt+zB+I9UZYAl1qFsxR/qPYeHt+ZFgK6Ef
	lIeaNWpNASUdn+jPy5hRQ/kECsYdx7UFpIpsNGI4EPChbUf3zwU323cHjSqIQZNs
	4AZJDSWGB4bjO9fFZNNc3A7PnVmftWVcKGQaFBpLV8wE6qUQbCvAZf9hLRUB70YP
	MWpe8A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60dgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 06:38:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2139240a91.3
        for <ath12k@lists.infradead.org>; Sun, 01 Nov 2026 22:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601535; x=1794206335; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhwhSdlF3yFYJXucMT5j2zuOq9XHAhyaRCLARs3Gals=;
        b=ei5/5mCvaj/78gsVswIfVHbHG6rmbjwc2b1UfaaMnh+dw1a7y3uO6NsD7XBTLTZVZx
         aUx9uystVzdEmejOt1MCEkW/nynO25cdBC6wsllbGbB/WbqXKqbQ7YQ0cilJaVIRXL9c
         xPWPX0jwBHfdVb/ltPYw/g844zuj9P+KD65wypJoul/EQ2V22TAk53AqBNN8jJdbqtB9
         sDfHiPetTxS0cxQ5xkHCg8inP7qoH6Fp4BCE1fx4v656P9HeJJ9w8oLlOf2/9HRCfTOH
         Vx61GQ2oEuQ6oZXJ6YQ7q9Dn6zdYl6w20fDDZgWqPVUOU4vsoOUrVpN4KkjqN+98NGtJ
         4lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601535; x=1794206335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EhwhSdlF3yFYJXucMT5j2zuOq9XHAhyaRCLARs3Gals=;
        b=WZ+ET3t4z2g2YpUfaWel2CHXqcmxGVDfD8jxMxgdeLpIHJOIV2L1+jCQszcD+yllBg
         PBjw/jQBjKLdgxdgcNGatwcvkI40chKcFPdbxm3p4T4HctmQFtVKv0puPjr9xCTvFShl
         cTzrX3i3CIJZPapXJBddnOFw5lfvfEMgIQmNL7IFtUgY3XAD2JpYMDkmqhDLtndjGU0d
         vAgCmQ5rTzKkrJRgQL9mSHaEBRY5B1Vqg2oadtE7I1CZ5S/5PfGH7dncjMwqP+5X7evx
         4UuSB0B/XB8jsZzreeSiw8ati6WyPHKttQrycua5AS3TguwudlNcgjdVf49tzE51oy8S
         ol7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHAyXPPXBiRlmAUIYUlqwkrWj2hWZe+BrX2/WKHpVcWIXJboNgupQyaZISS9gdQnDwC31mzn8=@lists.infradead.org
X-Gm-Message-State: APuU4Z9GQdeYcsUwzIiMXKnaH4OYP1wvyGB/0r/YkwZN6pVoGl5Bwz8N
	jNRXrBhKrTYX4hRq1QpOhtRl2foS5iGUfbPansC1FqQTkB566NUWT/QTtF8+Lx3NkWWyfXiFUPs
	nH1kLJGWyjHkPJnGTTvfIe5jFOyzPq2msPYdMf8DtMdYOJWksvteLQwzLAh61hc5+0mUXxUX21G
	0=
X-Gm-Gg: AYBFou1wtSWPeSNFrptfv1eBFVUMvDVTtEG1s/AHrdAfPMxuDzYxgQnWNPyoqqi+7OB
	ehrgKPLXq9OgSyAFgOuTKDNzT5hJLpBZerYPG4p7nBXNJ4o8zSA+UU0z3GspxZq0K10lbvxCn9l
	qSE6nAm2rXYZP/0GJvw3EE5YGiNvBGsR7HnSPJvkyDusJb5zoHlnG8g08Bku7xnaGjPKf6dg9W9
	ZAdvfpAOABQs1BQYKYH8Mo9k51gMo4zZnUB30QSBtI/0DWszd+9kWINxPhmrx7LVMnej65uDgT5
	KSImrJBI/Nmp+PXPtfMcOPj/KzbQEaNstRap+epANGspbAt7xCJf41XPpxuWkhkfOakMi1lup14
	YYzIVfOxOm94/9P4W1iPeVwiAuGmJDVL7fanWjkffq/extAefFGCyaFJbgTrCe6jNChGgtvvk+a
	PBP8zd3rSxrSt7PMC51GlOB/BtXLTY
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr7184115a91.40.1793601534635;
        Sun, 01 Nov 2026 22:38:54 -0800 (PST)
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr7184104a91.40.1793601533882;
        Sun, 01 Nov 2026 22:38:53 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm17313475a91.9.2026.11.01.22.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:38:53 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:38:13 +0800
Subject: [PATCH ath-next v4 04/11] wifi: ath12k: rename
 ath12k_dp_link_peer::hw_link_id to drv_link_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-ath12k-logical-link-id-v4-4-f4c7807c299b@oss.qualcomm.com>
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: TKq44hfynB5ykTKF_Qrc9njX4PwPQLJh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX5tUvtkhk5Fbb
 HfGXMgpF4OKs8G58cmahSNPfnZp511qHiZSVtvMKNL58uBUPfmstzh+NyL8iptvhKwfSibON6oR
 z5gtVnYMW3Wbecylmex/M+Oa5P0nbFU=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae82fff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NxgKQpyHIDudPh6FZjkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX/dawa4bFTl/6
 /BzSP60TiFV8afLJ9Rf2ZXAshFmWTqvpzekx5j8bpb+NXS+ob9fBOGu6n2h8Vg7hXh6JldlLjIu
 BZW14l0PF3LFqjtorX+PAhaSQCFszRptxwm7R5LyOXYr1/7gX4Ue56rVyjfGGZ9GxXllX1J3NCi
 uTAFsoBEmqtrHvObfHlLYPMtJWGnBg6vMTLwYnGkuzP+X6oaunRmb3RruII2Xprv5CZ2V60LmF+
 05v254RHHc3UwYcCwhR3JJxrOpyuJlEeayMebt5hnitRjhObD2Ikk2YGi2BOa+402VOQgdtNGx0
 20JeEgSYv1zXq81EPnNOONAbaoaUZVgXxdA71tYk0IHD+gvu13IMQd3Nc639t5i1o5ElG8uaI2Y
 8ih+L8BvEJInvhNHRghvUGFfqHV4XTa+tT3vsT8A5m9CauiwRk7LXJePQ3bN1tgMMhjJ4psVZUA
 LQx+9pzNWpdeVVV6+1Q==
X-Proofpoint-GUID: TKq44hfynB5ykTKF_Qrc9njX4PwPQLJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_223857_037165_D11EAB67 
X-CRM114-Status: GOOD (  17.94  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hw_link_id field of ath12k_dp_link_peer holds the driver link id of
the link peer. This is the hw_link_id for QCN9274, but for
WCN7850/QCC2072 it is the logical_link_id instead. The hw_link_id name
is therefore misleading for the latter.

Rename it to drv_link_id to reflect that it is the driver link id
regardless of how the underlying value is derived. No functional change
intended.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00068-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_peer.c | 10 +++++-----
 drivers/net/wireless/ath/ath12k/dp_peer.h |  7 ++++++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.c b/drivers/net/wireless/ath/ath12k/dp_peer.c
index 2826d6016ce8..f73dad49e42b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.c
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.c
@@ -544,9 +544,9 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 		dp_peer->peer_id = peer->peer_id;
 
 	peer->dp_peer = dp_peer;
-	peer->hw_link_id = hw_link_id;
+	peer->drv_link_id = hw_link_id;
 
-	dp_peer->link_id_map[peer->hw_link_id] = link_id;
+	dp_peer->link_id_map[peer->drv_link_id] = link_id;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -566,7 +566,7 @@ int ath12k_dp_link_peer_assign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_hw,
 		 * already present
 		 */
 		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-		if (temp_peer && temp_peer->hw_link_id != hw_link_id)
+		if (temp_peer && temp_peer->drv_link_id != hw_link_id)
 			ath12k_dp_link_peer_rhash_delete(dp, temp_peer);
 
 		ret = ath12k_dp_link_peer_rhash_add(dp, peer);
@@ -614,7 +614,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	spin_lock_bh(&dp_hw->peer_lock);
 
 	dp_peer = peer->dp_peer;
-	dp_peer->link_id_map[peer->hw_link_id] = 0;
+	dp_peer->link_id_map[peer->drv_link_id] = 0;
 
 	peerid_index = ath12k_dp_peer_get_peerid_index(dp, peer->peer_id);
 
@@ -629,7 +629,7 @@ void ath12k_dp_link_peer_unassign(struct ath12k_dp *dp, struct ath12k_dp_hw *dp_
 	if (dp->hw_params->support_hw_link_id) {
 		/* To handle roaming and split phy scenario */
 		temp_peer = ath12k_dp_link_peer_find_by_addr(dp, addr);
-		if (temp_peer && temp_peer->hw_link_id == hw_link_id)
+		if (temp_peer && temp_peer->drv_link_id == hw_link_id)
 			ath12k_dp_link_peer_rhash_delete(dp, peer);
 	} else {
 		ath12k_dp_link_peer_rhash_delete(dp, peer);
diff --git a/drivers/net/wireless/ath/ath12k/dp_peer.h b/drivers/net/wireless/ath/ath12k/dp_peer.h
index b9c94d6366fa..d2752b35ba0f 100644
--- a/drivers/net/wireless/ath/ath12k/dp_peer.h
+++ b/drivers/net/wireless/ath/ath12k/dp_peer.h
@@ -99,7 +99,12 @@ struct ath12k_dp_link_peer {
 	/* peer addr based rhashtable list pointer */
 	struct rhash_head rhash_addr;
 
-	u8 hw_link_id;
+	/*
+	 * Driver link id of this link peer. It is the hw_link_id for
+	 * QCN9274 and the logical_link_id for WCN7850/QCC2072. Only one
+	 * of them is used at a time.
+	 */
+	u8 drv_link_id;
 	u32 rx_tid_active_bitmask;
 
 	/* link stats */

-- 
2.25.1


