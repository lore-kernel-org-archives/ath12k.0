Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD588C44506
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=; b=A1x8c9YcuMdR5ZN9gYGQViYKRl
	ZGqy/pwkv5KaNhPJ+3OYBAb6lpE4izRp11PA6dtV2eTS7K/KOI3JfaOxoTHJvchQrMSqNUvc4E7U5
	8Wleaocz4wRlK0FZPV4quugfHXEpIOcoqrvXanheuRLO0+WINehmbK/7KN/xcV2/AuD2K6ybEB+iK
	F/HWP7WEK/CS6vfMXediMJm0p9Z+6aQDVhhjUe65C0ACawAhTDbmHutbDxvugNrcGQlWhv1YHcmpW
	3Dh34j/2s7KCDYt6tW8/RRXW19/4qtOYeR3jN6SO8Wz04QmKRiIBAACzBWbcfb7yAPt3GYGTzD//A
	nIY5ZcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7Z-00000008Pk4-2VCC;
	Mon, 13 Jul 2026 07:30:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7X-00000008PjM-3iEH
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:30:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O4hV649085
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=; b=CoYD1SzI1JUkh9Zd
	65qshYtmOFHNZWFbFjI49bv2qskeMaPvhgma26vC+wPhVcBWGj9ZG4CDtwCpVoA2
	cmaxljfv9RhYsr/a1/aBZS4G1M8rC9oYYtJk3mu0f5HmvmhsOEpHPKFXu5QRUrdn
	xJ/bg3oRltILyi5HSWwC/kWEdd4fmZjQYxNUadCBI+HUZJQQXfyBE+GvFKWVpwyi
	IXoxuRfCNIr/SleN45uf26fjVGyIwNNGKR3j/uiIRnsh+UGniET02/ehvAzukOiY
	nQV7qkQKM8rWE5EXEwiNVl/ulCBijjnypHDI0RN2Uc4udvpKAgZLcQ9uAkQ+tzMB
	2k62Rg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4v17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848d21bbb55so3130572b3a.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927831; x=1784532631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=;
        b=ZkxD6TVb48qQtF9vL0bQFOtr//oIF8JStjYKttvR6ssfiWOfAY0IUYYc4s4KGRzC5B
         z70K+vVkowtP65KBAl0sEvUcOihPIeMau6eBRo4brpOWx+6jRdJ6jenK70RaO+ZAiHs9
         /si4c/JuSnlMAN2jvkYUpPqNB+Xj78eAHbgkb7qRG6q5wCmpo03LZtNP/zTevUf9Pgx5
         w62nAS9dJOSjnWhINvp2CN2QWvf1QFvooL8mu+r3q8wfNIS9teFxJ7MeaXeUkzDCPNc5
         udty0oHIq2xej1MnYDkpaOBDzkyaDJX8Ai3WKk7A260P30dZYIR6X1YM2jq4skT8MNYp
         n83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927831; x=1784532631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRoN7bGojJCnIgc2vmQfLaoan0NtbsUh2lM4erLlpsk=;
        b=mK6EpvQSONd7dUWp9jZL+dl4hREFZxkk/W5yYAyF1wrSVBj5nYIzzqBRnsPMmxEVLH
         X8CSbTvD26fs6VwTX9jHK5Xr40s6thMkmRmXe4j0P4XcxfVlCH9qNyP3/Op/s7nmokYh
         oHvXBgNS1lja6J7uuZ5trJ3duh4y6thZh4UZQfP8jeO0kTjKA32r6UzOaXrc0ANm3XPU
         LUHXXt6SJZ+W9zfYBqlNBaaPjVLslaBr4ox0JUAj2nXakFFNOwhepjGDgI+sR65AHxfl
         GQ9966YNFSAw2NnbT6qpTTGELMs05USpmpMv2+7ni7J3v8uK21LDKTyJnsbOPKDxphpr
         84sA==
X-Forwarded-Encrypted: i=1; AHgh+Rpa+EnCbuWd1Uygo/+iDrIUiPRhLw3RvYkLCcnV/7jrI8VInV7kB5UKmfsucU7brJ9FodPV+/c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUgsf+2Y4DdYPzUqCiRCseZUV96tNDp1lZsK8cdMXzoWRw2/uU
	PdOqBL4zM0/AZyySHZFcYNF7n3VunbAeHk3Y3qG/dvBrOnuIfuGCA6xRbfIR5PT4SMG6imX9Jev
	pi93jA35m2eUAIFL0saGjNZtwnza+zl6EQmzzeJIsfvRvTp9T10ViARuOgfMbQTM7
X-Gm-Gg: AfdE7cmqRkAreSkdh6y6GZOqitvxFVPoj3NF2o16SZWENOIyCRdbWJib3M74w/FGvM5
	LS7uqqjC3c5YJ87nbU2Uh7hG6hDl7lTHKDqcXzPoeBMpCl4Aa742m3G5Br+6V0/iRW/0acTyp5T
	qqsiiu8Wq303CFq1kbQtIgGdXHPiMxMxHPSTy9ECKncARkPv5a006AN3V/a0EQvhF2P2VgpvnQ7
	YkUT8l+c68xMmKSvPkGNvuLM4UgOOgsEzi8HSVQQth3f+nSvNBsNgSeuWnmkaoro4zvXN1qh0pR
	63RV6apJtnLClDIwzQcvyqOifCrh6dhDP5TsPcT1pHLtiugORZNNmgnp5yMI/dxJGIrW2qEV56g
	9ztCg3rwNyVSJ1S35Q9WUFkVWrw1IP2GGB19CaRuE6Fhliaglx+xcdvQTbl0o8H+K
X-Received: by 2002:a05:6a00:2da5:b0:848:2f84:730 with SMTP id d2e1a72fcca58-848898e1844mr6789374b3a.67.1783927830703;
        Mon, 13 Jul 2026 00:30:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da5:b0:848:2f84:730 with SMTP id d2e1a72fcca58-848898e1844mr6789337b3a.67.1783927830213;
        Mon, 13 Jul 2026 00:30:30 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm7947252a12.19.2026.07.13.00.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:30:29 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:29:53 +0800
Subject: [PATCH ath-current v6 1/8] wifi: ath12k: fix out-of-bounds
 clear_bit in ath12k_mac_dp_peer_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v6-1-20f6f212e413@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX2dQEhpS8+1vL
 Mr3nCqRacrO/yVRoLQd/dxE9JY4m080HxWfjO5AHEuHPRGosJUJjWJPKfQh+z6uTi3oAmfv5BSX
 M4vTnKH4HZA4v7hUOHUAeCvdT5Cwf4Y=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a549417 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IU88uQVEuTzBCV0X16QA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 0jaEjEeNg2zfsVhYTzMFMBMxKbbvZYIi
X-Proofpoint-ORIG-GUID: 0jaEjEeNg2zfsVhYTzMFMBMxKbbvZYIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfXzduS6GkWmbn+
 v+N0L4XvYlK7g12jm4BRYhpCI3fO1kCYxKxy1bFCxsfUR+4XrXgJNKFPv+FzqLPfUZobBIJAQaB
 3m9Fx36zso+zZEQ/tEDtFPzaAzdakky2cPIh96Hld3VL0QiNeMiOCRj3Oro/LLipLaT80cYaunP
 5Y9YmV4v/6bEBD0Yd90CuRy6YK3FPGpXWs7EK1FwmbD4Wyx8Mk+bs9tPi08cij2Mel3YmrzN1b6
 olfz7WQTvAqlExO2c/GScsXTNM+Sll2rXAqmCV35s+K+ORiPVGVgj8Fmc6d5jkscg0qr6q3f621
 nLE3Z/r7dZ2T93f3VnKoy6LxSv0yMu2m3YDQrG9O7Y2bGj3JZjQJ9l712kjhJ/DxI9WCAJn0mQ8
 k3sHTY3vj+ptH87Ws+hgCS4GJ7F9f3ojUUy7Mfh4h7m24axVZOPiW/bsCHgNmX+/Pl5JYxkaGsU
 hJbYzt4p7RnXaDnjX4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003031_931967_AEA31CFD 
X-CRM114-Status: GOOD (  14.03  )
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


