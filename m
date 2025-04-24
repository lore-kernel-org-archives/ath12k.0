Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE11C369AB
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 22:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BJGNY+N37BwzJNoiNkKD64Fb4HkDj4hP2mz10tVLLow=; b=r/MMwLyZiv/xbpvcErnC/PtkMO
	22Pp5SBDseMfSWtBxJqE2WDo+N6QzUyuZOCfTCoYvx8qTXdWJpoHBdJ6ApiFR6yUBw4ZWjlkbslQk
	SKEtyzQopifJ7ME7GU3uL7aBIENac4Uvz5iN1D9jyguAZoWVOLmEGQIH9CvQZ8AhhMd9qEvJL5UH5
	etDNwpzOUNbnL6VcZzFwhOn6fCneqmZ2rJcRMcMW2y/js1Lk/JIragB337msJCZAD+Qz6lhv/DSqo
	zg4MJWt7KD3BPANLuRa/sVwMH1QuehRxoJjNd6XceOO9tg6jLol+/jeFSJVNQ8HgCypCNcCN5ts8V
	JA+KFgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u84ph-0000000FTLC-1b4G;
	Thu, 24 Apr 2025 22:14:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u84pe-0000000FTKq-3fAp
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 22:14:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmogl008467
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 22:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BJGNY+N37BwzJNoiNkKD64Fb4HkDj4hP2mz
	10tVLLow=; b=FpcFaD2NHYFaWd5+r8RTeABUv5F4SgxUjKH82FxYnsCNnzHF47o
	NAiThHOQThY8P25tlk1Fvhe4Upiw9EV7ig4p1avwM0p9ED/MjNyYQUY+IBgPg1eH
	PcHl5UNHtj/x8ukA8eocPhI30BvASgqaREn8LWEbvVlcu/P/UorCtNr0+Wdr/kN5
	XM7Za7rcLqIdR37ACGiFWv8qD3UeI6ua8EcEaFxnllWGjzUSDYmyTUs4fSHpCmT4
	K0FkIXXW04raQ1kAaYQduZ8yDVr1lsjaudpiOS6OASYrVe5HB1nKYWwYVoN24Qvj
	yBa+lsWIPPcaZIskoRnSAjSOb5kjVy4UrFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3pyw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 22:14:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22c35bafdbdso21752925ad.1
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 15:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745532847; x=1746137647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJGNY+N37BwzJNoiNkKD64Fb4HkDj4hP2mz10tVLLow=;
        b=ZbyoNn+7aEEpTXMOfoJOGIsEI+C2I4feCyi6q2N1PZWV2FQv55BNk5Fh+JjVf/v85Z
         k4wzJe445Wt2urHpRKvUFxAMxsE0Uar/jnCw67NlO1pRvs1PuQcKaQCiybsi0Apljwe0
         uDDTit+a0+eURpbmHWns4A2TBeuogP/P0LQpNJDmgWPJNUKzwORuKBmeB/lPMGpZiPoT
         XMi1b1PgTJ9OPZOK8cPML771EHMrQOlBTVGCsyrrZeNYazz1cRTGQTpyRr67T4zA036a
         Kk1urOsN5pgQCLpLOI0dTxtWS/pkjBrGwaKelET+rqJ1Yli06UW9pQIKlR7Y9ecSALwc
         T3Dg==
X-Gm-Message-State: AOJu0YyUrAg4v9j5F85HNiGUsVMc+GAwBOIqVIGb8t0I2JCKsHMhV/EI
	MooJEvdlRQxP0risi+K3VG8thrtc1xzGELZZzzPyvrMnrAbRkRbzPGcYtLjH5dZGL9Qingm5xf5
	+MuSCcfrhPE7j7ADmRXAvq3Tomx/oD44arV/kZVzFTEU6ygTFv24uo+b/pa/iZRVRc3oc
X-Gm-Gg: ASbGncsPlT7hDbZAHmy9qomEb3vL+GeruPa6j2vOMfO1Z8SNcDq0xNAt4/UtS8ivek1
	ZuLvtnma00GL2lv46/sCgSQBamvQbGr8H2WWOa9xE4ydYHwiRrRU9cMxetUaHpjUk9QFOJaw7Wt
	DC8ymb6f+Ra1sTYVvGR/5Lu0JmVcWwGa4374CdNWEhAlMZVXiEB+dGSacuSOOoDwpv6wVAGcbbm
	GJXgel+kPDE82/NVBccAtqu2q29RJipm14XKyO/2kr5MrGHXsMHCEmMV6R9iKL/x+Fkhb+u2Gib
	D2qHt+H0VRNkwWLkMNHH9eAPGsAqvCq9Acra4ypseJIMXQp9YEy+nYRNDyfLFQ1tb+W8
X-Received: by 2002:a17:902:fc4c:b0:224:f12:3734 with SMTP id d9443c01a7336-22dbd424e7bmr12242785ad.30.1745532847527;
        Thu, 24 Apr 2025 15:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESRcc/Uvf/LaF9r4L5Ep+TXJTiltSLeQSlvIv4RohawNMNyB2iGdo6h7G7E+8eIVklz4ZcGA==
X-Received: by 2002:a17:902:fc4c:b0:224:f12:3734 with SMTP id d9443c01a7336-22dbd424e7bmr12242545ad.30.1745532847170;
        Thu, 24 Apr 2025 15:14:07 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76fcbsm18952305ad.16.2025.04.24.15.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 15:14:06 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: Prevent multicast duplication for dynamic VLAN
Date: Thu, 24 Apr 2025 15:14:04 -0700
Message-Id: <20250424221404.1262597-1-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BfRhh9OXR9npoEof8qUzl-umrz5e_jSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE1NyBTYWx0ZWRfX3W765qBE7D8Z vtgTMseBdAz5cJvB8tpCnojx4Lwzd5C7GxbrOT4wVbWEb2i7BgybEdC4099wX3cP2ZQxuHI3ZVx wMECm4P3epwyAKwbGKBdFAbE/0Y7X+HU5h/L/SONBdl2c9upSKX67z+SzZ73g3W9KyyDgH75gmX
 zvtJxHXiVMkX4SZRLGBkKfDPKgAeTwaTRoOD24j1u+uzWsWS/lge0q2i520Iu2MegZ/WxIRSrDG pxbFy/XnteSU7EwzHLokK7qJ89WoxxGN1WrHJOHT+FBiEE1ySb892B8Y2UTqY8NljNl94SvlvgS 1iibNYlr7cC+JxQ7prULmsmoO8XusjRcsSAhbkCGbWxKOzdt1s7EjuPcCrLl+khxFvcm/6WLb+K
 0kAtaQ2mpUJ512Wdsig7uaQ+0VO+p+jruoFISGL5r7TwgXrY73vtD7rfdsCPV6BJ83crtSc9
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680ab7b1 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=xW75EOlAb0IjOozs2BkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: BfRhh9OXR9npoEof8qUzl-umrz5e_jSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=948 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_151411_038572_7161F0D9 
X-CRM114-Status: GOOD (  14.63  )
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

Currently in ath12k_mac_op_tx(), all multicast frames are duplicated
and are assigned a mcbc_gsn. This is causing dynamic VLAN multicast
traffic to be dropped in hardware.

Prevent dynamic VLAN multicast traffic from being duplicated again in
the driver. Check if incoming packet is a dynamic VLAN packet and
avoid defaulting to multicast conditional.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>

---
v2:
 - rebase
 - minor changes in commit message to spell out abbreviations

---
 drivers/net/wireless/ath/ath12k/mac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d170bca72948..c5f07361c1ef 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7452,6 +7452,7 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
 	struct ath12k_peer *peer;
 	unsigned long links_map;
 	bool is_mcast = false;
+	bool is_dvlan = false;
 	struct ethhdr *eth;
 	bool is_prb_rsp;
 	u16 mcbc_gsn;
@@ -7517,7 +7518,14 @@ static void ath12k_mac_op_tx(struct ieee80211_hw *hw,
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
 		ret = ath12k_dp_tx(ar, arvif, skb, false, 0, is_mcast);
 		if (unlikely(ret)) {

base-commit: 75f90ba47b2cda7de7a7bc1d099172516f6f96fa
-- 
2.34.1


