Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54A3CD98F1
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 09:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+mj6EtGW47ilBuoLGajfTgpqNgNP9aC7yZx8Af2gl8=; b=pPMO2vRSp1feA/1v5PN+ccIC/W
	T5vopOiQfPySbysmtoHWeDDWgXEibfYldFFJIpAlWIWuxwzWGEItAJuwXYuUp2Hx/7GAsVNenhOZ7
	Dd3ix1kHnjeuiAA1KOGrQ7rz2wWJGwPL3dkEK0pBtdfGvju9gdOW2cpwWxhUQ1Cu3JvXkCFf9cfKQ
	K1SBqsW2jKKi1ORD4dPNGq3r/hoFMoKgWKDw5BZXcByprPsMpJnXrK4FjZvDUcHOFVh83PkjfIYhO
	pD8VI+TptPSg3LQV+fnaBhjMxjEfnGnAdQO7wTyIo82jKzCb3WsAjK+Ab6CfJMyBb/g4TxTAwyCWI
	XHse6OWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmZi-0000000GwxA-2M3G;
	Wed, 17 Jun 2026 09:28:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmZf-0000000GwwY-42RB
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 09:28:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H9PtSG2398380
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 09:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+mj6EtGW47ilBuoLGajfTgpqNgNP9aC7yZx8Af2gl8=; b=GE3RIJAguxvxb2dp
	6U/PxnPu/D6zPA/Y6hXt5WODPOjsJC1OGPH7i7Tc+9JkYJuy5oLxeEGg2jkCiqu/
	ZNVs0KRm+mgGWpGWp1uiGXYHlWlhl5slmrNrQK9KYafuInocVU5ls6xdbFBm560S
	CDEZ8rqVT7IMnAOVt3MpuuZMeMQr8aS7xiyUgxsIsGUAe3tYyf+9RzJ+d+l0vMq6
	JU1deYwFVx+qmVHwyFArID+OAWKpBECFyVCv6eDURPR2TYs2Zq8N/HUsUTXN/WPG
	sC0ZhQGkmkfJT7PWIpN6IM/Hb9k+J2nxC5Y0DijD5JPsDZ/XtFUPYPD9K7nWcGpC
	b+564w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef2ag7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 09:28:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6af282daaso18786875ad.3
        for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 02:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781688522; x=1782293322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+mj6EtGW47ilBuoLGajfTgpqNgNP9aC7yZx8Af2gl8=;
        b=XOlyEPeUoVgw3crHDlRWQLcAWZfhaZWARAsO3F46/nOA9wFtUU1rVCg3v9JMBURvbA
         oHZbBtDX+fhFSjMO76F5wo0ZWHH9SJG+U3IuLH9K11VMKTdeyIIRRz2JIwV5bVlfd9zo
         PifId5QdMlmCtO7O1CA3YiAJtiOXeJouuClsFS0zCZ5cl2s2bT8o/iDsw/kE5oxuUXDM
         fN+dmpj7XHuoa2AJAnlRCjRtF7+wpTnYVp+hdrVQnwZBfETjVZwuG74E8zMIjLbEN5Ry
         7GnqsWtrjnI9ELh+msx4VDqIQt8KENfRgTBasYMbOS15hGR+uedjIXDPcRu6w4D9rtaB
         VM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688522; x=1782293322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+mj6EtGW47ilBuoLGajfTgpqNgNP9aC7yZx8Af2gl8=;
        b=nQ19vyYEdFsijoO+TTr2B11tOYbPNyn8nVk9nzOJT+HiBTunKwb2Suxx6lx4t+czRE
         AI5YilsPJXlDsA29NkC2tJhAgRGovaI+bqGllSeB/Wq3zjsVDbWqb4k6z9SmdYpKSv9P
         /BwALzbU9uBPG2GT4xVykwZ76zxWcF/C+yiCqIFb9MAKvk0eYZ6SQZCZ8g0Ay/SxfMaX
         zihmwhl8N2LILrkjL03Fkv49oOZiSC1jh32KMgtVo0SBjG+Og7EiWncj8LiGHco8PQkr
         UtbQbWphoVMnePzpy1FFgflVxT8xnl47A838OYqfHczolh78195xRlPeb0XETsn6GdH7
         Ni6A==
X-Forwarded-Encrypted: i=1; AFNElJ8enF72LpUdW0vvyNoxXdHBEnZvzEQ6KjqueI5b/cjZnypaI/6OY9Pf2R44WuGZxJpimROo/ss=@lists.infradead.org
X-Gm-Message-State: AOJu0YxD/jKlArVA6gXSZhfK0yxBGT6XgUwrmCGPvOubXyivCgc7APNr
	R4jyamvjAYdswhoQ+mV6WzhD5dPXCSyPbjlFpYhYZb/m3+klCpylNs1RJIhC2PNJJCdnMtpBlZA
	FN/D2FlfNPzqGYzcd06JA5Nhv5K+32Um18/Yh3taqc/H5Uz9QtznaenpxwTetySNP
X-Gm-Gg: AfdE7ckaXuE+Jf0xzr3Fn2yXT4e8H7pO2sili1UgQNKUsLvPTdxzFzq2uaNib2XVD7X
	WwfBuBqqre+6ajFR34dddAS9JTr7HD/4uxlm4Us02jJeAMmu96d1HFIpP8Jf2q86dLpi4cJFiCj
	q/UHmiyVeUc0jWPXsCfDbETtcPy9qs/Ccd97X4ijBddEDDKoraFwvaXWV4iP2qwmGJGe2aSJ4bt
	HUtz4I/m35lBkqlN97fgxH1uxzZKG4df1sgk1eNqbtkt+N5HJGFJVx8By5ShnXTspSbPq7HZ33r
	mVQCjH651gvAJTPPZza6NFJLuP4K67ExbFgLIgLHhwO/5IZjRFhu3t8KP0mftbSVpyArBND6HTc
	qX1BfYz1i0LyYrsl8YzEsTu9HC3igmuT4N+S0aEjkare6rTBEZt7DT/SdgHt8w1PQ
X-Received: by 2002:a17:903:b86:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2c6bc0b77c4mr28187005ad.9.1781688521892;
        Wed, 17 Jun 2026 02:28:41 -0700 (PDT)
X-Received: by 2002:a17:903:b86:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2c6bc0b77c4mr28186825ad.9.1781688521449;
        Wed, 17 Jun 2026 02:28:41 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm157080445ad.55.2026.06.17.02.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:28:41 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:28:19 +0800
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix dp_link_peer dangling
 references on AP vdev rollback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ath12k-mlo-peer-delete-race-v1-1-ab3c4f455dfb@oss.qualcomm.com>
References: <20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com>
In-Reply-To: <20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a3268ca cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S8TJSIUMMvVyLKssZ70A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX/2CT8bP4iu+I
 CxkhpK8wNpyj+je94+pgwOavGUuu0D45q4IKJMEq7nCVu8/nDb78G6qHzXt9gBv+sgaP2+23tOG
 mj8un12A0Xsfi2EVzqUyMf8lltY5+7o=
X-Proofpoint-GUID: sbMoBFohtTCdVjv5kM2JO0mDxlT_Yv8D
X-Proofpoint-ORIG-GUID: sbMoBFohtTCdVjv5kM2JO0mDxlT_Yv8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfX5t7kkzK4xzPF
 FpWEYJSFkiIXfqWEo8tiJ/UEFSo65hep1vVsKY0cV+zWF54fdbYgxkvbm1kqnEQs8VTMd44QT1G
 6cmLSgX25PgBQ/NtK7K60045nujtJztypDCDlLwgUCVb1tJmrQDnV3lufZEGPilMY2zuDEkAMPo
 FnXcmIyVpnnDu73uEJogZyBf43IHFi/ktxEop3ORvg8L3W12zDoOJsvDQDmpFV28a8GcVe9tY7/
 PzDbw61qeURZMwvn9ZjzGsUvyO3H/eYuFEBsYxi0qqOBwJrMu65EC/4zcRen1cgCzjWous96zky
 87k8li1hUCqtJpSa5o87wpPZOLPgBILJG3RvlNFVSAevugoKAW/VfBE8Sn4dnHZIJ3yA3440fp7
 npW7ydpGW8XgDKER4KWjxvYjzX/4gsnfw3VR/r3A2X72GIzwgxTYIiKksDYI44mA+I5x0rGCmka
 FCDdKDhGtkOroJFltyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_022844_121575_704154FB 
X-CRM114-Status: GOOD (  14.40  )
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


