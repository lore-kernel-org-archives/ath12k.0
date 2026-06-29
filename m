Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4382C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+mj6EtGW47ilBuoLGajfTgpqNgNP9aC7yZx8Af2gl8=; b=vrq/xa470gFvh5+ni7aFP9bMOb
	8Oy8TV3SnckUaOuVZziKfLSIfzGhHQSQaZr4dtHoIeCUwkylRvq6UwJv7NvuLKHlpF45ggroEyMOi
	V78usAK7mo8RlYDz5qpo1JW4Azr3mO7LfTdvKLfbV9EwfOkTsIcj8bkTyX7F6BssFd3GcFH4KE1Rq
	Jvv8DCbyr9ni0fbpZpm8CLgzzmBh6iwpbBKqxFKDYpo2QuY3tP+XqkXDkEJPruCAvNwnD75Q+7JHw
	LYiPJXl0glBmnjzFiHltnc+V3U/cBkmsLUxkEmVLlyYuCAwUXJSVMHp3yR/jetxBKiOjQrC+8WV6H
	jJ0gICGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5zs-0000000DpRd-27bV;
	Mon, 29 Jun 2026 07:01:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5zq-0000000DpR3-0vll
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 07:01:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qveN2076267
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+mj6EtGW47ilBuoLGajfTgpqNgNP9aC7yZx8Af2gl8=; b=nJNTmC7E6jZhFhE8
	QglFQKDgppWXHa52JQTQe/BcX9Zh5YJ123qAeXCBXgqQsagQCCXyjv6sNLcmysLB
	/PkF0ekE4lSuqdrKGmymUQyVHViPXssBKANelhZOkcMR2ThNXGR3MlSLEURbjrgQ
	x09yS26u4enbRjOnP8lvKzbw4qh/F5uHFqgbrXM1EATZnJuwuUwlyoW1R8y+V3Tx
	ARUQfuZJiw7juBSNzS8NUP1Ug1/WPfYjqgOJ1BL2alEBUHVApco3EeasIUEn8I9B
	LZ4m0rRDLD6gFXRxPG3HCLAyqpaP+VgLiQsByO2udE1K3vDjnhOhj58zVmtMWdZR
	tgwnsQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7g26d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:01:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fd8d36025so727742a91.2
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 00:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782716493; x=1783321293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+mj6EtGW47ilBuoLGajfTgpqNgNP9aC7yZx8Af2gl8=;
        b=Y56tgvnr2b5spFeE7svNOyFB7SNY3zR0gZbVlO/sa5/gUiaMHWvTgEHIMq7G8ZG2Cb
         Oh3Av/qFzcc/aGjZGONu7fWaTvItvWptkuaNvhY/y1umUVj8oAgZTMYwFhAf7mt+b0a4
         vm/PJF8HRNlm/x5ZkP7YGKrl9D69D5Y+Qht/3A6VcgUGzyeQXxShdotHJkolQLUw9I7+
         fyP3s4HmX39BXOxl2qMHlU8o5KFIG3Fz/n/qH46ICZAKGO8TeK1aVXE9E4MP2op3Umlf
         ZPsvz1+Q2ekWewri0/stvntPW2MiFWmvf+YHV2trBv2iQlegIBGgyNkFlAqolnHUrqGE
         OB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716493; x=1783321293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+mj6EtGW47ilBuoLGajfTgpqNgNP9aC7yZx8Af2gl8=;
        b=ABUokFt8frQie69jQMI/9oooCnDg7Ac8/o3YxKXA8CMISc1UKBzi3vzGs9LtycMr5S
         a6axTLb6/E1jY8onff7UlRhjY/ygNvBlUZXEs8CKBBL2pNT5rgyBtY6p2BU5EKjUVyZP
         5ANy6xnxF5eqx9nJmqY5YEC71hxWqo7bYd52P4gFtSA3jatJ4SCxiHoPS/ZQcPF64aac
         k17z+ptjcOm+amRUMdjT7cqCVRgBld/W6nq9L60HbB7ez1Nj1/ICqbPfWA9/VUhYjWO6
         6bnjMQsfbO5tpBikPPJQZqGHXjcnsuvUs88F4BD+Oki4VjKR7y5/LRItWVurWCtLOcCT
         0nag==
X-Forwarded-Encrypted: i=1; AHgh+RojfQ65j5hBCEUSrMXZHR5Z6vLi0iYQaRn7Dwiq5NZKlp1k9aM/tmKzpmwAyx8hVf7d5Sn+YJA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqlPJTqA6W4ohL8dFqGdrn2VUF07cPNm0OD2A8KwZBm0X9XPrt
	H94karrA2efLrZEACQPuxGHskYkN88uSBJir1X+0IrQ3L7pQpOzHOOUNEZsYoX8pOO/CslT9cQu
	XuJN5hkwJn8NHAXb4ACNjSJSeCXmT8mW67x0r6U+IpRL7rBsmDwMX01BcwjRw8x95a7rzF0ShFc
	s=
X-Gm-Gg: AfdE7ck4+EsiwejUi953kX3dY2C076BHKO1HLmYKMmfATZ0XJj5nQm9R5eI1C3lO1F6
	RHnyU5HHHVFvLCyTL3yWAEJTtTmsWOexAB2vjemPRHglzQGUO04ZLReUBX/BvIPFvqFn2Zi6UXF
	8Eu/v5rspXmixJed65FaUxVRBQABtfm9trkRa8My7/j0jraUX9FKDNPu3/6EssSp7GHoGAIh7uZ
	6EvswsgW9rtZev3g6EcA2/U75fWoWYVoeVwGx1BruSu8YQ3oPJTB0786nsRD6u2EWilYwcY8Z1j
	sntzQirZ61AyUMctSZhkJh9w1GX8iVx9EKncrMID4ORhpLpn/sX2LlyFO0qxQlSTg14CPp+EMgp
	XNv3zO0vi1T5meuaPDdlgxXsfNd1Nx6SgbFrmobfgi6HVpVfj3ba7nmEQWcEr87Sh
X-Received: by 2002:a17:90b:5287:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-37f9cdff81amr7272539a91.26.1782716492899;
        Mon, 29 Jun 2026 00:01:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:37f:9cdf:f0ab with SMTP id 98e67ed59e1d1-37f9cdff81amr7272513a91.26.1782716492431;
        Mon, 29 Jun 2026 00:01:32 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e2048ffdbsm5276706a91.17.2026.06.29.00.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:01:32 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:01:17 +0800
Subject: [PATCH ath-next v2 1/2] wifi: ath12k: fix dp_link_peer dangling
 references on AP vdev rollback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ath12k-mlo-peer-delete-race-v2-1-362b25590d19@oss.qualcomm.com>
References: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
In-Reply-To: <20260629-ath12k-mlo-peer-delete-race-v2-0-362b25590d19@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1OCBTYWx0ZWRfX5OVxZbQsKgxa
 kDc+3dcmjOUSmtvEzwMR2ZjPoWq02APn2wzawXJS9Jgp8+rAhHUmk/DP3ttLHDbC8XGNdwoR3zr
 Kb0VAkAftYSR3r+500lW8R9lIVgVHJI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1OCBTYWx0ZWRfX+jrXPUy1It0j
 +hvaM2q4grbRJ1qkwi3NRpKX1RFz1x3uy/CxkpXnn1Heozk5QTOjBA43rPS+kIrL6m1RhgMpGpc
 DXQUYl/QllfFtfGodLv6xx9GcjX+9O1nNmQhxZExdDw7obMWLtVdaLz7RpdOZuCRd1jqoU3cHm3
 RmShhAEs6X9jpqJ1ekA3g+lPUFe5gF6hzLz2Pe0R3RoEKKKBmiaTHVVb+DQpA58LD8luwdzOTIK
 /VNirTN3v3k1haXSU6ron0HIWjt4KWVxegERBnRF79lZ+JHoq4fD31cfWHBHyQdn9K0mL0C3ltl
 xKZxsdo3ky4Z3lipUiqR1wFCh5fxSLgnTTpxVKKvE52mbLLJGSyd86K9qZGF34ISgFZHmRNejPG
 jJo63696Mm8ExHOGOLsWiezh6v9lpy+zEnxfS0uZSXsQfl8PGKU/rGLl24fnGCqncZwZX0XCg08
 ZbkPfV9cx8RGLN9slJQ==
X-Proofpoint-ORIG-GUID: R3G_Umjq6_QNF1zEBo8HfdY-VFxoy7Oh
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42184d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S8TJSIUMMvVyLKssZ70A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: R3G_Umjq6_QNF1zEBo8HfdY-VFxoy7Oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_000134_268406_BC61DD79 
X-CRM114-Status: GOOD (  14.85  )
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

ath12k_mac_vdev_create() for an AP vdev creates the bss self-peer via
ath12k_peer_create(), which finishes by calling
ath12k_dp_link_peer_assign() to publish the dp_link_peer in the
dp_hw->dp_peers[peerid_index] RCU table, in the dp_peer's
link_peers[] array, and in the per-addr rhashtable.

If a step after ath12k_peer_create() fails the function jumps to
err_peer_del, which open-codes a WMI peer_delete and waits for the
unmap / delete_resp events. The wait_for_peer_delete_done() path
relies on ath12k_dp_link_peer_unmap_event() freeing the dp_link_peer
when the unmap arrives, but err_peer_del never calls
ath12k_dp_link_peer_unassign() first. The published references in
the dp_hw RCU table, dp_peer->link_peers[] and the rhashtable are
left pointing at the dp_link_peer that unmap_event then frees,
producing dangling pointers and use-after-free on subsequent
lookups.

Replace the open-coded sequence with a call to ath12k_peer_delete(),
which already does ath12k_dp_link_peer_unassign() before sending the
WMI command. This drops the published references before the
dp_link_peer is freed, in the same order as the normal teardown path
in ath12k_mac_remove_link_interface().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 5525f12fa671 ("wifi: ath12k: Attach and detach ath12k_dp_link_peer to ath12k_dp_peer")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index af354bef5c0d..2e5a075191ae 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10564,22 +10564,8 @@ int ath12k_mac_vdev_create(struct ath12k *ar, struct ath12k_link_vif *arvif)
 
 err_peer_del:
 	if (ahvif->vdev_type == WMI_VDEV_TYPE_AP) {
-		reinit_completion(&ar->peer_delete_done);
-
-		ret = ath12k_wmi_send_peer_delete_cmd(ar, arvif->bssid,
-						      arvif->vdev_id);
-		if (ret) {
-			ath12k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
-				    arvif->vdev_id, arvif->bssid);
-			goto err_dp_peer_del;
-		}
-
-		ret = ath12k_wait_for_peer_delete_done(ar, arvif->vdev_id,
-						       arvif->bssid);
-		if (ret)
-			goto err_dp_peer_del;
-
-		ar->num_peers--;
+		/* ignore return value: propagate the original error */
+		ath12k_peer_delete(ar, arvif->vdev_id, arvif->bssid);
 	}
 
 err_dp_peer_del:

-- 
2.25.1


