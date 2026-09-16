Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E495C88E5C
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QyvUaaE8YMfvWBqrKhh9GFjtADA1d/bO5m6tOf1cEI=; b=tNCFvEA++FBnN3rQvRXUmaQ3v0
	lWLuLDc/NR8Id4xDkF/tj3+bwV+WLQXNcHZJ8WYOQB9eYrYN6qDe5ZznLslc62yhx3p4uUKngbJ6j
	wRsZ07S5w14vrsCqvuKmJfuUaPPMhG9CFu460ofIGzdsFj7ge4VgpwSati6y8IjVPFylQuDdAtTgI
	eK+RBmhnYx7CcbqSxvP27DLXE5eP3qdGpIefJDmPO45qd/3bhrO1BSnwXqmTY32Xsl9k/GxCEBLFw
	cGcQAYP1iSP2PKCX5SQa5WKRD4DVLBTuiByhE+mhHvC1CrUGIk/vqs506KWv24m9au0BTjhy8NaeD
	vgfimscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikq-00000008ReP-0F57;
	Wed, 16 Sep 2026 06:04:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikk-00000008RbQ-0u6g
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 06:04:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G5b9am050716
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4QyvUaaE8YM
	fvWBqrKhh9GFjtADA1d/bO5m6tOf1cEI=; b=SfI99rfZs96D1h4XSDvB2jSF09P
	vYILRCP/aVYjMZRRc1PhGSh9h1T+wIqRD+N+4FEsb/GDcWFT4wtOikOrCCQub1LA
	+6AFrncGA/8+jNq+nDz79EEJYcJiVWIRGG9Skp0Xz5xQ6E/aRxlCer/yLM9RnNQ7
	vKmYuyaOwsb+vSqNL0/BvLYlJ0J3ryX3QMWtz6E0ZO3zxVPKdX5i0qxJjEbvg/o+
	GdgCOAe4/Zu6fOnZa+MRSVgjG1SOXBBwqD7WKqgMLWv+HfajF8i6QPKJvPmXUFVU
	Egmd4uJb7/smrgAC43gAlhwwjkp4KZSKA+5lGUsIfnGVAzCR+RLv2+mPCuw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n631b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so12133180a91.1
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 23:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538657; x=1790143457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QyvUaaE8YMfvWBqrKhh9GFjtADA1d/bO5m6tOf1cEI=;
        b=ChuNhlqHoYlkDk70zqnx5km/Tb/k31VaQyQenLlYQ7W+Ecm66/Qy6HeSgGpTbqgJZv
         bHhMtqGPMXOo+d7UmvHmdhvvwvuwBN28+GW0DO+b8TFdFwCa0Txqt+C3TaxfgUBdjR4/
         Z4rjL3IsNPzFHU5fd04YpMPwgHlmUqRMIH5hD/PLNp143U6oGpSvsIEoDLbKCAbCxPHT
         91VOWXQDJXJRcZD7XFvVJawdHipxb3JByytf+Sriy2ZHp+BgFo2Fs+oxXaS9Az5DrEvw
         jdikswGzrafTyxnwJ+S8ZldH08Yww973zfw18brvMhSQsJbJoCiqJC8r3v2PqujWm+G/
         DB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538657; x=1790143457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QyvUaaE8YMfvWBqrKhh9GFjtADA1d/bO5m6tOf1cEI=;
        b=gj6/Rn/JVK9kQRY6mdq2590LddpoSqW8Uu/9sBeAv0Gb8tQnwuTMs4FFkDfAADmZ4X
         Ammjvgc8gbEHqBoEfzF0XKj/oId8PgHQBdqheg4KvDf3yK6osTDNhwirrMG9C5FZo/ld
         NZbRVCs8+ymSRocm/cxfs/HtIvRzWj8bY7yoE+Hz5udlYU8Nh++PgYmmtm7MibT9zgGl
         Cri6CxIWLbMJh7hx/AYINDV+jcoaCDirtpxrQF6k9LTz/jPYvFO6rArMy05XqqvRS9S9
         IJzlK7OX55sgShv+XKVtg07yWUDgRpbmOTE1ab1E6+aLngP+V7Y4PRK7xkvj53HWTfvv
         JF/Q==
X-Gm-Message-State: AFuF++kV+lyr1npv4du1b/Oj2Okadf47khx3Y1Uio7T1GcOF0ahGExmc
	u/2yjfHvu7oFGe7VHZ+640UDKHJ8ngfBSi1Wh45X5+bXbEd94YiqVok0+d3nFG9q4ZIWkIT/mMo
	10aI/EIqL8K0yFIH6Ujn/M8ploxpiq/sQw9GptsTyYOgmdtEQubycLM3Kn0g3ytdXAe1L3f6G
X-Gm-Gg: AYBFou3CDKN05pyAvQM5+TqvkrSNV3lyKDD4NiVUT5o7O1kbdDDb9B14ADn6SV4VKm/
	ctY29McLoGPxdSzqLUpstUlXc6MDdB5LjpnXoxBZEdrBsCQPdShUPhWzbK0Vdfn1XurLBKkaTRt
	ythzq0hlsmMktctfLDP085xzvFm3oPLVDUktx8rFzvmoVhpz73yPEjrd1MhORR2ESl5amYo00/Z
	5OZy8a5er9c1/AqtR+KX1GtPG4urSr1MAtzrdRsFUXVF6D2XjEoETmbnS6wYeM10bLtLE/a51Rf
	s43s/Z0M1Y4EfSz+ogl8cSMXoRrFUjGSBDTVf+uv2on/x6f7vevKvvVrMSsIEgk07UNYANTv6gk
	TtiHBsth1DVFp69K0XZ1RrwJPDe4ODNScTnh76ZXGZ7iI+2XxhQ9FLC3anJoK+UpeXSYz6woetv
	Z99B2gSjeGRv+xxQ==
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr3376447a91.0.1789538657062;
        Tue, 15 Sep 2026 23:04:17 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39e1df8d6b4mr3376388a91.0.1789538656621;
        Tue, 15 Sep 2026 23:04:16 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a7a1csm2661491a91.15.2026.09.15.23.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:16 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 4/6] wifi: ath12k: place dp_mon_mpdu on stack in mon dst reap loop
Date: Wed, 16 Sep 2026 14:03:23 +0800
Message-ID: <20260916060325.854-5-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa3161 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kt1foGEeEJUqbVQOj6kA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfXxbczbL9FiJW9
 njeNB5sgSL1b3M16wiOPzsVP1ZsUyBl2aCQZcvPcEQT9kopaPl+0LT9cwCFwPgjHZEzJCalPsZc
 G6KeOlj6RfQi9HcLrmjPx9+7iflavFqfk3anALm4XpM9hgT/1Ma1JhbbSDVcEUp3k5HxP1LHhe2
 /l5t8JlYmRxAFE/3jw6hq53TLeT9Ovtp5/VdAmqTxL8jOE+lY2MuqTDUI8UMPe5STrIVSqZT3Uz
 3xdRcTWFdUlDtdB4K/IyPnUTcl+b1ETaE09QOJv3boS/D1Hx7MknA9bhtDVC7Gs27h/krKLqbbP
 NYPZkGc/o3UX71wUi1OhlOGJlP0p9PgFuJobLXDARPvmcDGUa5vJcjFu2PhD0tBIsV7ISy+AdOS
 OwY3MurUbnvPps1qrsZSgJUeXzZtW3WmUplTSIJr59xeoT4GINJjycLEatjkuedQ+xXLipNcjsb
 alWcJguI9ptXNHWkt6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX9tTn08heIMgP
 ViajX3jLi5njq9WwBYXcXOesiEvs3GhKxzxDXzG5+iXnlgI2K4c+2zVE3YRuU7UyAWmTN3GvQLE
 11pqGZedk6TEmoLGlfh3UDM/f0AJuJk=
X-Proofpoint-GUID: Mo3C0An6WnZPTVBQ9Rl1MgicgjNYVnUq
X-Proofpoint-ORIG-GUID: Mo3C0An6WnZPTVBQ9Rl1MgicgjNYVnUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_230418_390555_675E1CBC 
X-CRM114-Status: GOOD (  15.55  )
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

ath12k_wifi7_dp_rx_mon_dest_process() allocates a dp_mon_mpdu with
kzalloc(GFP_ATOMIC) for each delivered MPDU. On allocation failure
it breaks out of the reap loop without calling
ath12k_hal_srng_dst_get_next_entry(), leaving the destination ring
tail pointer parked on the current entry -- the same entry will
be peek()ed on every subsequent NAPI schedule, stalling monitor
RX until the mon_dest_ring_stuck_cnt recovery path resyncs the
PPDU ID. The head_msdu chain accumulated for this iteration is
also orphaned since the break bypasses both the delivery and
the cleanup paths.

kmemleak reports these skbs in field testing:
  kmemleak_alloc()
  __netdev_alloc_skb()
  ath12k_dp_rx_bufs_replenish()
  ath12k_wifi7_dp_rx_mon_dest_process()

dp_mon_mpdu is used only within a single reap loop iteration and
is passed synchronously to ath12k_wifi7_dp_mon_rx_deliver(); the
callee does not retain the pointer. Place it on the stack instead
of using kzalloc(GFP_ATOMIC). This eliminates the allocation
failure path (and the ring stall it caused) and saves a
kzalloc/kfree pair per delivered MPDU.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 72bfbf19b7da ("wifi: ath12k: add support to reap and process mon dest ring")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 8fca777041d1..1e29c13ad66d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -2827,7 +2827,6 @@ ath12k_wifi7_dp_rx_mon_dest_process(struct ath12k *ar, int mac_id,
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
 	void *ring_entry, *mon_dst_srng;
-	struct dp_mon_mpdu *tmp_mpdu;
 	LIST_HEAD(rx_desc_used_list);
 	struct hal_srng *srng;
 
@@ -2893,18 +2892,16 @@ ath12k_wifi7_dp_rx_mon_dest_process(struct ath12k *ar, int mac_id,
 		}
 
 		if (head_msdu && tail_msdu) {
-			tmp_mpdu = kzalloc_obj(*tmp_mpdu, GFP_ATOMIC);
-			if (!tmp_mpdu)
-				break;
-
-			tmp_mpdu->head = head_msdu;
-			tmp_mpdu->tail = tail_msdu;
-			tmp_mpdu->err_bitmap = pmon->err_bitmap;
-			tmp_mpdu->decap_format = pmon->decap_format;
-			ath12k_wifi7_dp_mon_rx_deliver(&ar->dp, tmp_mpdu,
+			struct dp_mon_mpdu tmp_mpdu = {
+				.head = head_msdu,
+				.tail = tail_msdu,
+				.err_bitmap = pmon->err_bitmap,
+				.decap_format = pmon->decap_format,
+			};
+
+			ath12k_wifi7_dp_mon_rx_deliver(&ar->dp, &tmp_mpdu,
 						       &pmon->mon_ppdu_info, napi);
 			rx_mon_stats->dest_mpdu_done++;
-			kfree(tmp_mpdu);
 		}
 
 		ring_entry = ath12k_hal_srng_dst_get_next_entry(ar->ab,
-- 
2.34.1


