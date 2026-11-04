Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBBC606D835
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 01:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qacdIwQL;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=af02gw/w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IM1EXRZe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YDVv49g5wGDYW/TBym1xJdEIpdUnM9Rdd3PxpMX4Lfc=; b=qacdIwQL6D2M3F
	naQaHyJEGqXP661uVGoULLpJHSNWmNVGH9yjS2anufUOqVumFDodCajY719RDxUi32ev6yBCUlUd1
	JdABltMecFM604yF3F6GSCagwsbFeWKg542QIxeb8XqLXcwjxNBl2nRYEPXnXXWuZ6EdLiECze6Sx
	E427Gyv6x1KEGTI98asXIybHyhcDdLQ21DoXUMYHHYz6+AUKn/AAqiDFoNsPxpP6iOmbSZdJLXiwx
	jf0IKOEGbi0rdpzH8W6ps7YSBNJYt1np06W4Sy9ycFnPSKygaEOLcPuoVQACBiMJE2J+kRRt4TO9B
	C0A2OxHTC0nNkKyDWcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWj-000000042tk-1SH7;
	Wed, 04 Nov 2026 01:10:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPWf-000000042qz-2jgL
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 01:10:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40ROPg809360
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 01:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDVv49g5wGDYW/TBym1xJdEIpdUnM9Rdd3PxpMX4Lfc=; b=af02gw/wUjXeLYGD
	H9qVGJJmul9JI+H6epG011kSXd1QEptcw/8uzFb+48xFc+prqWnUNJ6gv3tHBHoB
	zUOQQt5qgQ4Plv7nFZZwp7grY/hepLBXbzEUgWtDhyKxBgo1O8ErvY9ZjstEiTM9
	zeroM+r6QZn+ggFLJ9H0d4MTmSoOxaMhJQ/MZzltbK55dHtI4+dILSCHLzfTGP0W
	FiKwota60tMNgAR+MWNDeEcoPlkc3N5RNCKJak3S+YzKq3+SdJn+UsuUJg4QyIZc
	cVBtOp5QmdJQoJNSmHSOMWR5BLzYq9qtZbCMwsvBs2nW1KolWp+uhK8EYebNUruy
	CTVtgw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp9vqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 01:10:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a1e2485fdso261739eec.1
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 17:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754652; x=1794359452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDVv49g5wGDYW/TBym1xJdEIpdUnM9Rdd3PxpMX4Lfc=;
        b=IM1EXRZeB1Jr9fDHwnebey7swhB176ihOZCg+iJKRZNY82v0v/0b5FTvfkxJYq7oyh
         h3fLwEjIJy1WnKKQFy5TroguzlxM9hOcV9DqluNwIPdrWqCND2a6pQkzRgabo0ksISna
         dTzg0G5RrmJgLmZYT4775m7hFm823nCSY7OwZKanMnEC7NxMpD51TCMweGJpXiSfi5Ve
         2XnMKfcm1qwCvmJyeBnnsrzvP5ugOYrE1aya6G9ipXvC6PEMhllH7kfjMgxGK0RePJph
         OuNQduW7wks/6qFGu/hA3wwQqoIv6WTzKfLe1pchHa4Y+fBRYZMdBx6dO9lO/iksxWXK
         IAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754652; x=1794359452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDVv49g5wGDYW/TBym1xJdEIpdUnM9Rdd3PxpMX4Lfc=;
        b=jj63K1xYo+F6Dmx4jzs8EOZbizDNkO+n5ldoCtOKP6xjkf1CouSjwFORJsHynPgN13
         i74Z/MS+g977FhmEVP2DhxoHmfeUVbFMwf5f9H4BPDxePFnhUCqCaf75GK5NGD5FRy0l
         GeCSrkEr31Q1VGPWwXLZDfn23s2Y57n5/5211ISEXFOo/92hCT/GYN7YJwEIL0fOGTMr
         +CdUFtp2a3TbjZSeV3A70MURTQWp1XsyyszgzV9R2Itm7/iH76DVzDcbEwr4RDPDB2mX
         L+hlCyM/LbNlmUm3nvWHsKcd9JK53sReFk+Ud7cwI81Q74hP9nciUPlh4AxviqdHvlYi
         P3Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxi43cZgzdpms2BiQcm8Mtw3NWLajG6bxQLVFKeTjA6Pj2NL9RRETeqm2D4bbZd9hOpPcBGA6s=@lists.infradead.org
X-Gm-Message-State: APuU4Z9TTHLW2J/l39POmqNa2YTflsUBBbdTGp+G6K6k6RmJ+bQYgiBs
	vndJEU4U5/WLgCfYD9ESlBdfq/cKVcWsQNAT5sAOWMEVeIU5xyFDu76Yhx8xsu/XHMleziOr+O1
	G+rbO2ERPiRN6wJ5aQXJ943SskmHUAXPj92QKwoWozIOGhJbRx8G/vVqIJVCMXVY1
X-Gm-Gg: AYBFou2cumUKnvfBqArjBKslrXclmWQkRtIrboG6QQlLHD4Lf2vNB3y0YPeraybPEsg
	dnNWd42mDErfw3clGFZtu6VdDcxHDS/xjvMntloZRz0P2Tp3WqARCd4qD1ZrHaNCUiujWXkpD9g
	Emw9l2c+60pX1P9n7xLIHFFAzbo8YWB1t/iAhizJza04ZXvcvkQkFE/vazejwZnBW3PELvsDCz2
	vdR/lWTypnzn0j0geSWI2gVnMTA3LQ4H3d6VRA9t+IWxBx25OZ50d4zB1qFD9a8TDy9b58rXKoD
	BtclOkutne4R0w4z8eDXBb2QVbFBuuZqa+8xu3hf4RZfkMg8/FBR3GVWU8TZE6Gu1iX6jR6ww8d
	QCnSImpyxl94RZ+LYyhX2MJnzTfyJ1umGLW+5H1KHJsyXbUCInI4sa0QB7c7jtC0W3VB7QJ+fsH
	PVHWQKWgp6yZF493JEgKNeM7b/vLkg8l5bVRqN
X-Received: by 2002:a05:7301:152e:b0:366:83dd:4713 with SMTP id 5a478bee46e88-36a4249ba39mr19452033eec.30.1793754651585;
        Tue, 03 Nov 2026 17:10:51 -0800 (PST)
X-Received: by 2002:a05:7301:152e:b0:366:83dd:4713 with SMTP id 5a478bee46e88-36a4249ba39mr19452000eec.30.1793754651063;
        Tue, 03 Nov 2026 17:10:51 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:50 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:48 -0800
Subject: [PATCH ath-next v3 05/13] wifi: ath12k: ng: log successful RX TID
 queue updates
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-reo-cmd-b4-posting-v3-5-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX0jC/gwr/E4j9
 upy09WyB6yfwum6k6KWSA+nCx2aLywWEZ2/cNHnbOzRkoMIHv2opiAcDBAxNC5+v8piq0cQpAhm
 jVYUBHmnaWEz7/c7gjLcCPKzGJET5e6UlP5KsglFNlvW82/PbI7qgimszLZADiCWUvsj0ObTJwg
 /+ayVX08aep/px2muGz+1ymd1MrNq7YKWzqlY3X5Ms29f+uyp30ayKJRJkjzsobjokNaOjx3MSV
 5ypBZtFAqXU9PFodpZxaHOVZEAtdES78gTDhGTWBGMdiCin7fU9+KlpqaZdq3CqX08upVR/fiww
 Y28459BIO7pE/jNC92V8QGr8W5XPwLq+Nzt0fQ6KlVkp+IsCXcgiEMLm3E6cMLqEZ5mgS09OnlR
 IFiPeRJIx6tybU02D72uSeqA2IZWcGmBi22BryjkYnaVmo4I/mA7znPDMmyXRnJR60/1INlFB6t
 EgLns0zPrRsFb95CcVw==
X-Proofpoint-GUID: thH3hE_cOS7RErxcRgd2MUusv0kelPGo
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea861c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YHCRzYEaldKETWWiAM4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX4bgaOKNgOjhk
 cZd0FhdwizxBVGbvPbr7hU5ax0ofWE6ytR/Ln1rgqCYoNHbO2vSD2TzkMULtn2iQRq88AqQNHoZ
 4BJiZiqRikTAGfpIgq1R0WeMVFiLcSU=
X-Proofpoint-ORIG-GUID: thH3hE_cOS7RErxcRgd2MUusv0kelPGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_171054_023703_E0438596 
X-CRM114-Status: GOOD (  10.74  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Log the peer, TID, link ID and BA window after a REO update RX
queue command succeeds. The message helps verify the programmed RX
reorder state when debugging aggregation setup.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 379b33fc8029..7d196e85f280 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -233,6 +233,11 @@ int ath12k_wifi7_peer_rx_tid_reo_update(struct ath12k_dp *dp,
 
 	rx_tid->ba_win_sz = ba_win_sz;
 
+	ath12k_dbg(ab, ATH12K_DBG_DP_RX,
+		   "rx tid queue update successful for tid: %u, peer_id: %d, peer: %pM, link_id: %u ba_win_sz: %u\n",
+		   rx_tid->tid, peer->peer_id, peer->addr, peer->link_id,
+		   rx_tid->ba_win_sz);
+
 	return 0;
 }
 

-- 
2.43.0


