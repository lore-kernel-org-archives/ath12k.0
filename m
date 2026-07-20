Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3B1C44524
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=; b=XXO0p4E/xOxEmp2MOaW1rxrZEf
	RCvlXZOclQgOT2MjeW0Tez+2N6ho04/4dx8FBQJh8Ko/EuNKBSZ5KPqOo2Gr+sZzF/I7Tgx00AfF9
	FYIdidtBIlE68xYXNpoPp0B9QyJP2bGoVcpRHPs0TnV9+z6tcsjYetkAcgxKLMWSo2y1zDW/To9SE
	m2KopoJbzY3yfUQF9/vpwhxuFl2XWx8/dcNc18WcTPEaaWISTql+37u/aHza4D3lynBTreSxou9cn
	6T6UtGXsTDTU4LD6+2pc8pnNtz4hmgYrD/2gSvv9cIUSgb9Mqp0gHgQ5wD0Xb/rXoaxuXT/66Fsj3
	euGMlnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhix-00000005zFO-0YCi;
	Mon, 20 Jul 2026 06:43:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhiu-00000005zE0-1yKw
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 06:43:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RYNk1616978
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=; b=iQG191W62psaUrZl
	6LcroeTmikfWHeUpy7OjMDpMax9N5bVs6MehlI5rN2yEOObCD6tSx/28X3StcHuC
	QsmOlOLB7JKj2jBFBfJrtAM7lSScVqY0ODWwX+BMiB8Tzla98OKKNMextHBWU0ne
	yzsIJ+BskXTLkSfLel+6M8IVUNsnerih45LDR1h0TaXwZp/mfwZe4vTOjabpP8Lv
	rdamhrb70mBoxMQwJLP+WFfjYLwCQ3nJCuM0iSso1QRM3fZzi+yssdRZG7yBJCbN
	ZuUHFkRGgsG6UpBuvqzg9TNRl2FybYQOwyF41yZEEArKZZ0zcVsUDgKlFiGxOy7v
	ql4Jww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnmsjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 06:43:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484ba00601so7784561b3a.1
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 23:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784529810; x=1785134610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=;
        b=P5mLD4uycXY6TB/+8HwrAfqpVStQTO/6V08nxqkXapMXoIGodix5UwHidsZA7jld3S
         oX6C3815d1a8lgmlx2oXzF0aOeyQvRYpYcEqNyzLBkHHy3SAPlnak1NvhaTlcaqR3RNX
         bxtiBOnCf81scTxfbMzJ8bpFt+LBZSVSDnjEWx7an0ZqbhPu42OH80D4VzuKZWSQLKij
         gRvnsh9xrUZ5Xc57IZxUKDgAw0zF11BlXr2Oa1KvO0aR3xXqRGgFdAsU0WxX9XHNtkCm
         AI9aT3f3xv4zH5oO2An0gVONVlk8paD2CtyHEDxQXuDkKBlEHnv2MQzxAc3Uk0BAVl4f
         OiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784529810; x=1785134610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=;
        b=YXda4SM/7Mo6O6zSDZv9jX0nRpQmNOG84wNzUNmWtHuT0dlW489q9sjCy643YZM89p
         2zC56y4rqmT1asKPzKkVEduNViK65qzECne7halFNac62CGmHr/ay60tx5O+X51RDhIs
         bRYQMQ/szyO8wYqsEFyR1T9kfSVYAht6KTNpOEL9UgQqKxUyC4oLzxoCTjeLhl0WRsO8
         qZ2exsN+717M61EAFmj596V39ZJ7gBUdUf/UKDEWTYbDGX7JZ84a1/ohoxyld2A0nSdg
         ES4JigTNgnxGCtbu9H9QEYrXyPX7+k0sAocwFj9sggyqSfwha2Y5dOdEZYHfIln52Ii/
         PG/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqpp1ouggxv0dMn5gt5fIAO3pPSeY69YWF3GOoMLeoe4nu3skuR4BppQBWjyLqQ8nNK7tho/Ls=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqD0W07rjVt9o28KwYrITx+Weq2YBxztXEACMl409iFsUmuFlx
	+nzAGsbFcwo3wGVT1ilky4EZMjY4mdiEVJR8Ac6v5MSWjLm6cmoYYm68W/SHHxoxKvd37qehkQ+
	oE1VtWzO//5YtLQbk7gIZarci/NJfyjmtR2tDfz6lKax5mHUQr/4OFM+/BXo+17x6
X-Gm-Gg: AfdE7ckQgd+JjfQFAm3wktZ5NylvM4GkJ+/NMAvQURa9q6F5BZt9GMxBknfF3u4Zj2J
	aY7QoXi6NYoj6KFb0u4HUOTx/bv191kBFHLuQT9o/jdvquQRFJkEFEp+hGGe01j4WMiaGsgnmpg
	yYo9T+ub91U/OZuuqZVHKFrSibsaD6QxwArfCqH0JxsAwPwvnTMRVTPsH+eqsP8uCfz2zkmNGfu
	WPWSr+fElSyiyBQax0963k0ifUAI4mkabExxZCvpFIh32kZ2/OxN2X4WKjc88C1X1NKDSYvU0JA
	/ZvSn/LiYmp5KklVcVHilwwMDWSYEYoKVf5HkjOQiCAunh5DalXq546DWU+xShPw7L+BbGNBQqL
	A78hdMfwjHi4fi5KNozN6zdfR/B0R4Xt2FdDHEPNpSoStIFTdOswagA==
X-Received: by 2002:a05:6a00:228e:b0:845:d6a5:716b with SMTP id d2e1a72fcca58-84c292736cdmr12076563b3a.23.1784529810439;
        Sun, 19 Jul 2026 23:43:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:845:d6a5:716b with SMTP id d2e1a72fcca58-84c292736cdmr12076544b3a.23.1784529809974;
        Sun, 19 Jul 2026 23:43:29 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c3793ec61sm3812097b3a.42.2026.07.19.23.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:43:29 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:43:22 +0800
Subject: [PATCH ath-current v2 1/8] wifi: ath12k: fix out-of-bounds
 clear_bit in ath12k_mac_dp_peer_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-ath12k-fw-allocated-ml-peer-id-v2-1-630632758a80@oss.qualcomm.com>
References: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
In-Reply-To: <20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 08i6RYkpv0eNpODuXW-SUvoaim3g9zOh
X-Proofpoint-ORIG-GUID: 08i6RYkpv0eNpODuXW-SUvoaim3g9zOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX6KsTEloMe5hS
 /fnkqmv5qFvzddvabJBYVACS7PdioDuATzRYjlCz3PcwRavySTw1+WpZ4UqgBRzOy+ITxCuQUGr
 ZtNRPf14+3rhNGovGKJ8m10ZyR1P7JutAtNGvyhNdnlfEvxEq4KQopuCM1grj3cPZ6tEyPvqKhX
 RPORvPtT7wC0Xu5CHolBmgl1xvhyDe/FM27fBfgeJZ8/Kj8fkjGjhpSMJmmlAxgI53fUM89w3Ty
 vEo2CWrMlQRL31mKcSaDinOkXb/OsgMYJSLRg8Fx1JfzTQoU1OfWgSfiBKgMp64XlOD1L/xTARg
 wBGgvvnMT1d0fAlSdjoqjjI2DXOjWySsImrw0/9hbJZOSArs/NVc5WtoRVK1oYtm9AX66IVGKWX
 jPw9ce/QtxJMH9FKukAHd4Qe8Dq/yCFppSmtDFcz3EEXMESAXFi8iec3EutMH+CXOZ6Wy7+OAJU
 EFXsD+t2LmomT0GRjAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA3MiBTYWx0ZWRfX31vwGgFzU0VK
 fVjw/AZXXdSvpWN5pxeaTgxPIPxMBOHWWozWDPkdl/pDUTdNAgIueaqx/8DFOpfcfOGhPuerufr
 JMNbQHoX13cYQjo2Zb4ZZMwNICxsO7g=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5dc393 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IU88uQVEuTzBCV0X16QA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_234332_628325_ABAA753C 
X-CRM114-Status: GOOD (  13.35  )
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

ath12k_mac_dp_peer_cleanup() clears the ML peer ID slot on the
free_ml_peer_id_map bitmap by indexing it with dp_peer->peer_id. That is
wrong: dp_peer->peer_id for an MLO peer always carries the
ATH12K_PEER_ML_ID_VALID bit (BIT(13)), so clear_bit() is invoked with
index >= 0x2000, which is far outside the bitmap of ATH12K_MAX_MLO_PEERS
(256) bits and corrupts memory adjacent to ah->free_ml_peer_id_map. The
intended bitmap entry also never gets cleared, so subsequent
ath12k_peer_ml_alloc() calls eventually run out of IDs.

The ID without the VALID bit is what ath12k_peer_ml_alloc() returned and
is stored in ahsta->ml_peer_id. Use that instead.

While there, also reset ahsta->ml_peer_id to ATH12K_MLO_PEER_ID_INVALID so
the bitmap and ahsta->ml_peer_id stay in sync;

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 490c134c1f29..b7eba8ea981b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1283,8 +1283,11 @@ void ath12k_mac_dp_peer_cleanup(struct ath12k_hw *ah)
 	spin_lock_bh(&dp_hw->peer_lock);
 	list_for_each_entry_safe(dp_peer, tmp, &dp_hw->dp_peers_list, list) {
 		if (dp_peer->is_mlo) {
+			struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(dp_peer->sta);
+
 			rcu_assign_pointer(dp_hw->dp_peers[dp_peer->peer_id], NULL);
-			clear_bit(dp_peer->peer_id, ah->free_ml_peer_id_map);
+			clear_bit(ahsta->ml_peer_id, ah->free_ml_peer_id_map);
+			ahsta->ml_peer_id = ATH12K_MLO_PEER_ID_INVALID;
 		}
 
 		list_move(&dp_peer->list, &peers);

-- 
2.25.1


