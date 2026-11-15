Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AE5606A31A
	for <ath12k@archiver.kernel.org>; Sun, 15 Nov 2026 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R2M2ml90;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvW5VKUK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kcZhxnqw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Mukmc2KG3wwjBYiMVEGVg0jgZRmS/vq1YC9YmvojPbY=; b=R2M2ml906xJrmexJHZDS48Er/2
	OAZzJwl6UqyK1ZmAt+33JmQEeQBv5D3WBlffS7FcpuoUhO+O02iuLpDN5XjZNC9G84ZV8ZK3xh8SC
	GXA/7pWJqcd3oS4fLQi/5iGxNfS0e2PuT/Y0cgtbkZYuF/09aFIbp6FAGFivGQcKOPFgMTCmwBGcs
	5Q+gWkUMPYW8HDwsPBQ9mZTV2RQZZ5nOEuAJyi0CsACmd3/OhvxRQzVX7UVN3weBgOgKXcvagRmRO
	/+68JOKTJOi75TqTwzLzCJ1ApvPjpAlVqRF0mUZTwqN3h4YfzK3m/WU+Zev4gB+yYfjigIRKDz8V3
	Lu6+zVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSW6w-0000000HHsN-020T;
	Sun, 15 Nov 2026 09:01:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSW6s-0000000HHrh-1x4m
	for ath12k@lists.infradead.org;
	Sun, 15 Nov 2026 09:01:15 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w6xI1763368
	for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 09:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mukmc2KG3wwjBYiMVEGVg0
	jgZRmS/vq1YC9YmvojPbY=; b=VvW5VKUKTbRKAq2oDpbbJ/yCgpAKp1dKw18Gpb
	ZzGQk+88wUqRQTdyzN8i0WDaADI6nzNNUE5yY3z1ULt/sKSGIglIZQEDDeW4X6D8
	+3hlwjK7wI9JW4k8cIsRp8pi4ab6w3fLdCGiIE9U2mXUWTPxlZcEf6D2ddWp75il
	X78hrfhuS8iBLsxlvgFKu/+EX0GWZSgSqWwS5cvoG/IVWwZl5Lyt/MRnvDswA5VW
	LKl6cA0Vy1DP9MX52w8ee+LwyI7fJ0xJwfmms0M7nNZgjiHLFwcLeA+Kf6OaFljp
	3lBJ00m08zHvNzO2Y7H8DskAvjfQoUw9P0ZJDGtc1DZ79tIQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqjrcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 09:01:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e0ee0db35so520529241.2
        for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 01:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794733272; x=1795338072; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mukmc2KG3wwjBYiMVEGVg0jgZRmS/vq1YC9YmvojPbY=;
        b=kcZhxnqw5yYt/3YahvRlrRiOQ180/3oWpy1ASKAkmcz1uR7KmS3g9L5P/PswP3tVzW
         0ojZ0Gtb32a3or83spEIGLK3CQmdN5GhOnhum0c9SUFc7VtsLOdU5Ra663YYDHP+Tl5q
         aRQaKNphbzRM+LDHWmaFWajHlJ6Pu5pASFZxoVKKiC401KDmi291QAk6wEGip1gvbnmS
         W2qQSxzn06Fl+8IXuliYpNy1VhXQXUgquj7MHmSQarQvOa76rEGhaApY4N6/MdW3ckeg
         gzBl6vFhwHMDv6snnmbmhaTsMgcmLMBVBu7DnDNJ53CaYO1uum0o3YBmi5/ufvP5F6EO
         pouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733272; x=1795338072;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mukmc2KG3wwjBYiMVEGVg0jgZRmS/vq1YC9YmvojPbY=;
        b=iax2xfyrSPd2WaX+9DEiPriy3PG0PxGkDSmcXcNMh24wLua1Tx8Lya16CYGnGMFLU8
         ndRSM4khaxsuqqdte1pRdbfRue5nCWOEK7IOyAA6gOBCmuk+YITtrC8hMBJMZakS405s
         +Fw/TXXFCuYgYRMoGcHfmdxO3g+tX24fqxeEjVL8VSuRCB1zAdfv6AVrEbYVfkLoQQK0
         +uVfW56n7zhl947Xf/jrSunQyhVJJnqSg8ukSlXAMH1n/BB2hkMDsNTb2tBjoXt+w/6t
         UbcEYOR3QdChplq0liiGQtOkf+iS1JlMvI4wy3+tHf7QPsLJaWlo2MvuDsPvssrSCRM3
         jJqg==
X-Forwarded-Encrypted: i=1; AL+hErHVK7+NQvv7MYY2BNkPf8AVTo8V+nS8S/gFZJwMKvY1EoL153y5VWiGoBNYQglNM/Dtqxx3qR8=@lists.infradead.org
X-Gm-Message-State: APuU4Z/vfnq7dgTGB2Zdgm+ZjzWWiElg/o6075xD/P2ISKBNGgIRBL0i
	SRbqwDariqJ8r4CoHsdz4E84EIhpf6q5Y5jizeK4mnVmUNAOuejB4JpZeKyznTzsWH9lNh6fJ25
	jW30Q5bHIBOvNDnjd5+hAHpHDK59D6dCff4UQqoTfnTpzir3xg8yGd565YAjZ8qiz
X-Gm-Gg: AYBFou1Wi5wBizYt04lLEUzTsmehtSfBAdj5uBhKCJBKAN6SNkIMhfXlIpvJIrAhFCt
	P8R/3/7qIgejtolkZgrHuPwIKzUATCSOrUhrQMfWAwT9TdGIMgzGHxDv3nsJer9ioZUIG6DS1xB
	d4o5ZXvycmIHxoj26trTUtR9hsuhpuYzu0+3Jqex+likTaffX8woTNWqFkWS8U1CztNHkb1r9In
	uRvHun7ZmL0T8n4rzkDFP+as4BkB0QcObMsodJlDq9CVHTgEX07DfuwHzslSB/AdXzGnPUgMwSH
	i0wdxt74b5NE+4vAmbjCenSnruwBTH6srEEGnYBfVbUo6e4/ApNTkitfZytDKJyl6mKDS9HGzGF
	tRqKV/FDxMmWdZvkbD8SFi/2Fm10Q01/S7fiuHWlxipSgJmMQ4vWE1yrlAvbZSg==
X-Received: by 2002:a05:6102:5ccb:b0:7cc:9a7:7b83 with SMTP id ada2fe7eead31-7d64d72ba7fmr2881214137.15.1794733272290;
        Sun, 15 Nov 2026 01:01:12 -0800 (PST)
X-Received: by 2002:a05:6102:5ccb:b0:7cc:9a7:7b83 with SMTP id ada2fe7eead31-7d64d72ba7fmr2881205137.15.1794733271660;
        Sun, 15 Nov 2026 01:01:11 -0800 (PST)
Received: from localhost ([93.66.91.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm81511375e9.1.2026.11.15.01.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:09 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:00:56 +0100
Subject: [PATCH ath-current v4] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-ath12k-fix-dma-mapping-for-reinject-packets-v4-1-27efef2890f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6XOzU7DMAwH8FeZcsZT80G37sR7IA6O665hNClJV
 oGmvjtWxYEDHCYulv7yx883VTgHLuq0u6nMSyghRQnuYadoxHhmCL1kZRrT6kY7wDpqc4EhfEA
 /IUw4zyGeYUgZMof4ylRhRrpwLWAYvXWEj0ik5OKcWfY27VnJIaBrzhyrepHmGEpN+XP7ZNHby
 Dd6uAtdNGjwnTu2DeujR/eUStm/X/GN0jTtpWzcYn4Qxt5HGCG6wdkWTdv3B/MHYf9BWCGcs0P
 H2npP3S/Euq5fULGnqsABAAA=
X-Change-ID: 20261014-ath12k-fix-dma-mapping-for-reinject-packets-2eab34ca5acc
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af974d9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=8zQ3sPA27H7dy4zktjPBAQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ElIqd8a8I0mOhK9pBAoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzNSBTYWx0ZWRfX4CmhhK1Zg2hP
 fL6uHFivmu0hsJ3qnpb67hEf6IZ8zcqNu+C++wBnDOIY241jBgcjNC8pjA7wdbc5OMRldmqkPre
 xmelwp/cSABKiGwb4xKdi2nYuvPHZH4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzNSBTYWx0ZWRfX/geb4C9UX1ib
 LX/QAm4IQJy0ju13KSU8uGYm7rhr9erKRMbHFph6r5uw+EunS+qNeIS7NBkA+TztTkf6igI5TAN
 1/Ra5cF8agBfmlCow17PKDtr6H7uuHb0dZRCecNREQrB9bzIwgintUdCiHWiea8hdVzAVJjKoRB
 g9wc/g4h50U9rHyfgSzmn+emKwW8EqgkeBqdYJNLkWOhiDBXkSbeA4u2I6j3h66GOwYmm28gqZH
 Foz57KWOJ1QvC2MeBhdSPOJzP5tTsy5wXd5/b5XNMqFiteMkBK57I+13tgS11eVE160cm00Oebp
 xBlgopYeJBrlHzQkR99khhtFxeEDXg4tmECvedhl0JXcxw6BLJfM6C7dMmoX/U2r0Tc5bPu415i
 XWLs3KRAuDif+oyKv8uxni3stCWMO5qk7UE7QXOGHoD3f14dik3c0V83PJ4EgDbrNOqLJkgy3ql
 qYd0sv+c7SQbZARP/NQ==
X-Proofpoint-GUID: oOspArd-MGVi5G8flNHI_K096FEmMUED
X-Proofpoint-ORIG-GUID: oOspArd-MGVi5G8flNHI_K096FEmMUED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_010114_633775_29722C59 
X-CRM114-Status: GOOD (  17.53  )
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

Defragmented MPDUs that are re-injected into the REO are mapped with
DMA_TO_DEVICE, but all the Rx reap and teardown paths unmap them with
DMA_FROM_DEVICE. The DMA API requires the unmap direction to match the
map direction, so this violates the contract.

The mapping actually spans both directions, since the host has written
the buffer before the REO reads it and the buffer is read back by the
host afterwards, so DMA_BIDIRECTIONAL is the correct choice.

Add a common ath12k_dp_unmap_rx_buf() helper that selects
DMA_BIDIRECTIONAL for re-injected buffers, identified by the existing
ath12k_skb_rxcb::is_frag flag, and DMA_FROM_DEVICE otherwise, then use it
in all the Rx reap and cleanup paths. Map and unmap the re-injected buffer
with DMA_BIDIRECTIONAL consistently.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 33322e3ef074 ("wifi: ath12k: change DMA direction while mapping reinjected packets")
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of ath-current branch in order to fix conflicts.
- Link to v3: https://lore.kernel.org/r/20261023-ath12k-fix-dma-mapping-for-reinject-packets-v3-1-443f9e13bbc9@oss.qualcomm.com

Changes in v3:
- Set ATH12K_SKB_RXCB()->paddr before err_unmap_dma condition in
  ath12k_wifi7_dp_rx_h_defrag_reo_reinject().
- Link to v2: https://lore.kernel.org/r/20261023-ath12k-fix-dma-mapping-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com

Changes in v2:
- Rely on ath12k_skb_rxcb is_frag field and drop reinjected one.
- Link to v1: https://lore.kernel.org/r/20261017-ath12k-fix-dma-mapping-for-reinject-packets-v1-1-b94860e18ba4@oss.qualcomm.com
---
 drivers/net/wireless/ath/ath12k/dp.c           |  6 ++---
 drivers/net/wireless/ath/ath12k/dp_mon.c       |  5 ++--
 drivers/net/wireless/ath/ath12k/dp_rx.c        |  3 +--
 drivers/net/wireless/ath/ath12k/dp_rx.h        | 11 ++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 17 +++---------
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  | 37 ++++++++------------------
 6 files changed, 31 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..5ef4cf8b9b39 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -5,6 +5,7 @@
  */
 
 #include "core.h"
+#include "dp_rx.h"
 #include "dp_tx.h"
 #include "hif.h"
 #include "hal.h"
@@ -1003,10 +1004,7 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
 					continue;
 
 				if (!ATH12K_SKB_RXCB(skb)->unmapped)
-					dma_unmap_single(ab->dev,
-							 ATH12K_SKB_RXCB(skb)->paddr,
-							 skb->len + skb_tailroom(skb),
-							 DMA_FROM_DEVICE);
+					ath12k_dp_unmap_rx_buf(dp, skb);
 				dev_kfree_skb_any(skb);
 			}
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index ae14e118fe36..3d9092ff9353 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -5,6 +5,7 @@
  */
 
 #include "dp_mon.h"
+#include "dp_rx.h"
 #include "debug.h"
 #include "dp_tx.h"
 #include "peer.h"
@@ -558,9 +559,7 @@ ath12k_dp_mon_parse_status_buf(struct ath12k_pdev_dp *dp_pdev,
 		return 0;
 	}
 
-	dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(msdu)->paddr,
-			 msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, msdu);
 
 	offset = packet_info->dma_length + ATH12K_MON_RX_DOT11_OFFSET;
 	if (ath12k_dp_pkt_set_pktlen(msdu, offset)) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 36be543b7c50..7853d215d81b 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -185,8 +185,7 @@ static int ath12k_dp_rxdma_mon_buf_ring_free(struct ath12k_base *ab,
 		/* TODO: Understand where internal driver does this dma_unmap
 		 * of rxdma_buffer.
 		 */
-		dma_unmap_single(ab->dev, ATH12K_SKB_RXCB(skb)->paddr,
-				 skb->len + skb_tailroom(skb), DMA_FROM_DEVICE);
+		ath12k_dp_unmap_rx_buf(ath12k_ab_to_dp(ab), skb);
 		dev_kfree_skb_any(skb);
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index 82700474548a..7e1f12c68316 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -187,6 +187,17 @@ void ath12k_dp_extract_rx_desc_data(struct ath12k_hal *hal,
 	hal->ops->extract_rx_desc_data(rx_info, rx_desc, ldesc);
 }
 
+static inline void ath12k_dp_unmap_rx_buf(struct ath12k_dp *dp,
+					  struct sk_buff *skb)
+{
+	struct ath12k_skb_rxcb *rxcb = ATH12K_SKB_RXCB(skb);
+	enum dma_data_direction dir;
+
+	dir = rxcb->is_frag ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
+	dma_unmap_single(dp->dev, rxcb->paddr, skb->len + skb_tailroom(skb),
+			 dir);
+}
+
 void ath12k_dp_rx_h_undecap(struct ath12k_pdev_dp *dp_pdev, struct sk_buff *msdu,
 			    enum hal_encrypt_type enctype,
 			    bool decrypted,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 1e29c13ad66d..2327ac05e073 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -2722,10 +2722,7 @@ ath12k_wifi7_dp_rx_mon_mpdu_pop(struct ath12k *ar, int mac_id,
 				drop_mpdu = true;
 			}
 			if (!rxcb->unmapped) {
-				dma_unmap_single(ar->ab->dev, rxcb->paddr,
-						 msdu->len +
-						 skb_tailroom(msdu),
-						 DMA_FROM_DEVICE);
+				ath12k_dp_unmap_rx_buf(dp, msdu);
 				rxcb->unmapped = 1;
 			}
 			if (drop_mpdu) {
@@ -3135,9 +3132,7 @@ ath12k_wifi7_dp_rx_reap_mon_status_ring(struct ath12k_base *ab, int mac_id,
 				idr_remove(&rx_ring->bufs_idr, buf_id);
 				spin_unlock_bh(&rx_ring->idr_lock);
 
-				dma_unmap_single(ab->dev, rxcb->paddr,
-						 skb->len + skb_tailroom(skb),
-						 DMA_FROM_DEVICE);
+				ath12k_dp_unmap_rx_buf(dp, skb);
 
 				dev_kfree_skb_any(skb);
 				pmon->buf_state = DP_MON_STATUS_REPLINISH;
@@ -3148,9 +3143,7 @@ ath12k_wifi7_dp_rx_reap_mon_status_ring(struct ath12k_base *ab, int mac_id,
 			idr_remove(&rx_ring->bufs_idr, buf_id);
 			spin_unlock_bh(&rx_ring->idr_lock);
 
-			dma_unmap_single(ab->dev, rxcb->paddr,
-					 skb->len + skb_tailroom(skb),
-					 DMA_FROM_DEVICE);
+			ath12k_dp_unmap_rx_buf(dp, skb);
 
 			if (ath12k_dp_pkt_set_pktlen(skb, RX_MON_STATUS_BUF_SIZE)) {
 				dev_kfree_skb_any(skb);
@@ -3292,9 +3285,7 @@ ath12k_wifi7_dp_mon_srng_process(struct ath12k_pdev_dp *pdev_dp, int *budget,
 		}
 
 		rxcb = ATH12K_SKB_RXCB(skb);
-		dma_unmap_single(ab->dev, rxcb->paddr,
-				 skb->len + skb_tailroom(skb),
-				 DMA_FROM_DEVICE);
+		ath12k_dp_unmap_rx_buf(dp, skb);
 
 		end_reason = u32_get_bits(info0, HAL_MON_DEST_INFO0_END_REASON);
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index a32c804403e8..f9abcd047a8a 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -741,11 +741,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 
 		list_add_tail(&desc_info->list, &rx_desc_used_list[device_id]);
 
-		rxcb = ATH12K_SKB_RXCB(msdu);
-		dma_unmap_single(partner_dp->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
-
+		ath12k_dp_unmap_rx_buf(partner_dp, msdu);
 		num_buffs_reaped[device_id]++;
 		dp->device_stats.reo_rx[ring_id][dp->device_id]++;
 
@@ -761,6 +757,7 @@ int ath12k_wifi7_dp_rx_process(struct ath12k_dp *dp, int ring_id,
 		msdu_info = &desc->rx_msdu_info;
 		mpdu_info = &desc->rx_mpdu_info;
 
+		rxcb = ATH12K_SKB_RXCB(msdu);
 		rxcb->is_first_msdu = !!(le32_to_cpu(msdu_info->info0) &
 					 RX_MSDU_DESC_INFO0_FIRST_MSDU_IN_MPDU);
 		rxcb->is_last_msdu = !!(le32_to_cpu(msdu_info->info0) &
@@ -906,10 +903,12 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 
 	buf_paddr = dma_map_single(dp->dev, defrag_skb->data,
 				   defrag_skb->len + skb_tailroom(defrag_skb),
-				   DMA_TO_DEVICE);
+				   DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dp->dev, buf_paddr))
 		return -ENOMEM;
 
+	ATH12K_SKB_RXCB(defrag_skb)->paddr = buf_paddr;
+
 	spin_lock_bh(&dp->rx_desc_lock);
 	desc_info = list_first_entry_or_null(&dp->rx_desc_free_list,
 					     struct ath12k_rx_desc_info,
@@ -927,8 +926,6 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	list_del(&desc_info->list);
 	spin_unlock_bh(&dp->rx_desc_lock);
 
-	ATH12K_SKB_RXCB(defrag_skb)->paddr = buf_paddr;
-
 	ath12k_wifi7_hal_rx_buf_addr_info_set(&msdu0->buf_addr_info, buf_paddr,
 					      desc_info->cookie,
 					      HAL_RX_BUF_RBM_SW3_BM);
@@ -995,8 +992,8 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
 	list_add_tail(&desc_info->list, &dp->rx_desc_free_list);
 	spin_unlock_bh(&dp->rx_desc_lock);
 err_unmap_dma:
-	dma_unmap_single(dp->dev, buf_paddr, defrag_skb->len + skb_tailroom(defrag_skb),
-			 DMA_TO_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, defrag_skb);
+
 	return ret;
 }
 
@@ -1298,7 +1295,6 @@ ath12k_wifi7_dp_process_rx_err_buf(struct ath12k_pdev_dp *dp_pdev,
 	struct ath12k_dp *dp = dp_pdev->dp;
 	struct ath12k_hal *hal = dp->hal;
 	struct sk_buff *msdu;
-	struct ath12k_skb_rxcb *rxcb;
 	struct hal_rx_desc_data rx_info;
 	struct hal_rx_desc *rx_desc;
 	u16 msdu_len;
@@ -1328,11 +1324,7 @@ ath12k_wifi7_dp_process_rx_err_buf(struct ath12k_pdev_dp *dp_pdev,
 	desc_info->skb = NULL;
 
 	list_add_tail(&desc_info->list, used_list);
-
-	rxcb = ATH12K_SKB_RXCB(msdu);
-	dma_unmap_single(dp->dev, rxcb->paddr,
-			 msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, msdu);
 
 	if (drop) {
 		dev_kfree_skb_any(msdu);
@@ -1379,7 +1371,6 @@ static int ath12k_dp_h_msdu_buffer_type(struct ath12k_dp *dp,
 					struct hal_reo_dest_ring *desc)
 {
 	struct ath12k_rx_desc_info *desc_info;
-	struct ath12k_skb_rxcb *rxcb;
 	struct sk_buff *msdu;
 	u64 desc_va;
 
@@ -1410,9 +1401,7 @@ static int ath12k_dp_h_msdu_buffer_type(struct ath12k_dp *dp,
 	msdu = desc_info->skb;
 	desc_info->skb = NULL;
 	list_add_tail(&desc_info->list, list);
-	rxcb = ATH12K_SKB_RXCB(msdu);
-	dma_unmap_single(dp->dev, rxcb->paddr, msdu->len + skb_tailroom(msdu),
-			 DMA_FROM_DEVICE);
+	ath12k_dp_unmap_rx_buf(dp, msdu);
 	dev_kfree_skb_any(msdu);
 
 	return 0;
@@ -1998,12 +1987,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		list_add_tail(&desc_info->list, &rx_desc_used_list[device_id]);
-
-		rxcb = ATH12K_SKB_RXCB(msdu);
-		dma_unmap_single(partner_dp->dev, rxcb->paddr,
-				 msdu->len + skb_tailroom(msdu),
-				 DMA_FROM_DEVICE);
-
+		ath12k_dp_unmap_rx_buf(partner_dp, msdu);
 		num_buffs_reaped[device_id]++;
 		total_num_buffs_reaped++;
 
@@ -2017,6 +2001,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 		}
 
 		msdu_data = (struct hal_rx_desc *)msdu->data;
+		rxcb = ATH12K_SKB_RXCB(msdu);
 		rxcb->err_rel_src = err_info.err_rel_src;
 		rxcb->err_code = err_info.err_code;
 		rxcb->is_first_msdu = err_info.first_msdu;

---
base-commit: b1ed5a45b994a6473ca1cf34f35a1bf87f1d8e2a
change-id: 20261014-ath12k-fix-dma-mapping-for-reinject-packets-2eab34ca5acc

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


