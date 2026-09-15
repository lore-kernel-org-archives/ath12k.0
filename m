Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE7FC88E73
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oa6Q/1/UwGnZVW8dCztoYeJ9PNBU4QT7E+kpBF0tFpo=; b=NoI6pHJg/M7PlkN4AadLCqvmJj
	maWKCg0rWQRrveBolqlkkZ9DiGAyI8J382Y49TZ98kIUFRvi7e5HynWrLmwtV4E4p6olaoaRPwkDC
	9DbpKyvDCbPq7NGAiQjgVq2e9YtxN3tmoTofso1Ioe1WI8rpnb0jgECI9U0/USyTjhOWF5Aojuyn7
	e53WpNZfTx4r0MABQBDsGPbldxr9rjdhubx22s7kmL1owyRn96iDf2nsa9dF2KWcWViHaFoZUzEw9
	HPRWk7VNidSyCk39uvMWswlklqDklJ7b6bXwd55rULMtWZ7jwc++yXkG06zxmo18nlWSxA+zz3415
	WACMqlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6O6y-00000005Ywx-1KfE;
	Tue, 15 Sep 2026 08:01:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6O6w-00000005YwH-15Rq
	for ath12k@lists.infradead.org;
	Tue, 15 Sep 2026 08:01:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zdmg3824086
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 08:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oa6Q/1/UwGnZVW8dCztoYeJ9PNBU4QT7E+k
	pBF0tFpo=; b=RlvxotWOOPfbWaRAe7We+XLV/vySKZlt/Yb6HuaV356x08piRM5
	rPsWdPt4SL9LIbvBe+Cm+EbP7FgzXXT8E57d1Nxw9gqYcyUL1foWKAuYmifSotg0
	cUIUmaQijfxEKXz0HkL7uIaVn+otwCdtywpyq176XTnnOCV19fPoeIKREqBU8sE/
	aJYx7s2p17CU9/OgGeZqbvO1MD+9b4kcea5l7vFyNpW81wAoPHpttmNckTWJ9inl
	kglU37ZIHuyLjGiFzaVVmbhkvWcUt2AFa8aKIaIyH9n8wlk8eyr7ugb3CA/r/jOd
	PZGtIqgTC9zzO2+iSNugFMSFFowifFzsN2Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41u87f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 08:01:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so8410527a91.1
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 01:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459308; x=1790064108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oa6Q/1/UwGnZVW8dCztoYeJ9PNBU4QT7E+kpBF0tFpo=;
        b=Q1SzRlVbedNTbuR1Q/Tz9IKhXE1TrMqA1IGDHy9HGBF5cEf0mBvkcyEcQS9QjHtuU5
         3823ddwoqzaTFEsIqgwNPxnUPx1901SzoBHYyrpykWB6xszlbb0S1ZO4p3JnvnILzhSg
         L0mwdGkhFq8+bdKXWjNbRWKGY0sdeGXpD00mUSCC7Qg5R+6IsoGv6UBMcc1k2nbFR/3w
         7njOFgeh7o/2SqmrDQjtEoRvH5UUCNK0d0/+daPmLbtEtt1XDYvc1bUK0vv3ckjxwV4T
         UVy8C4KDT1u0Ose5xkH6hnDxcmTI/sR6tAozE0GELRyJNjI5GIYW4quunV5cnRZ9vU1z
         t0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459308; x=1790064108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oa6Q/1/UwGnZVW8dCztoYeJ9PNBU4QT7E+kpBF0tFpo=;
        b=tbGua92CoyvPW4Ts+mHvoxfAwWWelr3Xr6nc5IhS6/uQj8ZtEy0GL12rKXMsPV/UlX
         0p5VUJjOfkycMLSLoPaxTX09VuuBfB80USIfuyyLr7ibBnc0IY5yHEnOv6kkxYxf7S45
         6hp81z4UzqURt9upKpvVWsFJ5Gox8jz1Xnc6PEmlAOX3FCTBkPMn/ORvQZSGREna7D7W
         Ep0NBiLMs4JnW4k1LYetM7jQjWXioefzES1tlnyS4nS1jHo+XCCthxB6cBZ7k6q/m3dU
         lCTcB5Pluv/+1mZzUo/syQpSQS1/X6T/wHCd1sQOOcz1TRmDuBkJ0Nwf8hHM+UommlN4
         v4pA==
X-Gm-Message-State: AFuF++kqsi26xHloMwg06fE7rSqalochEDlwGX1PX55Edaq/XXCT4GDg
	ziJlbUd3rWNAsPMb1BslcVk6gkwwjEKSVLQI3TiFkI9fld8guK0VbvlwVIB5UnCjhlctIPBQ7rg
	OAqiKcIZs7FH1L+eJl/vo+oGrQFoXJOesTEg2I7nnvHGq4ImQ+KIp9hshtVkeGzUy
X-Gm-Gg: AYBFou0ktuuUg6Fb0WqiiUaD6QDqFO0cIjTMMWTccvMHxY2kX3YGmiGXCMgCXM0rz3x
	LdKNahCsWzxtKFoXpsHnvaazZAnAt8P+xqGkQFwiPq+HACoSXsa3vMgKeEMO/VjORWbbft09m/u
	5de8cIcKXmmdV/R7gQJSBfdj5nFv7FoCXvYBxsx4VkUSkE/0+plPFgHx/rwfPAphd9AHKZnelW0
	P+pUvGkmF5VpB0TK/cb1r8x/o32uFTV1jMpWWStl2CFdpnjeYVx4nJbB2FqN01CnA7TrjNNfzpC
	y2Oo6qc6Pm7MNgyap7IO8NG9xO5JOgSGRMsAJ9MAGd/FLXJEdlLGFBR5SfxIk/WzNWxbqpARvEP
	1D9LZRagZNxfXjm+U4qTpHj0ngX9as29wRZpnXobc+6InbCru2WiAxa+0Md8=
X-Received: by 2002:a17:90b:390f:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39dec079f10mr11760374a91.14.1789459308475;
        Tue, 15 Sep 2026 01:01:48 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39dec079f10mr11760327a91.14.1789459307987;
        Tue, 15 Sep 2026 01:01:47 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfb8bd783sm1496368a91.1.2026.09.15.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:01:47 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: Fix failure to create ath12k_dp_peer on MLO reconnect
Date: Tue, 15 Sep 2026 16:00:53 +0800
Message-Id: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNCBTYWx0ZWRfXzOh6C/nGdi7s
 KQ3GW4J2aZSIbcpi1YC9jXH13FOkkgZVsYG+el5byurkvUgdffr0JqIbdqqWwKL+7ZzW6S84NCu
 6IlNFBkKQXcOmTsiwqaZOrQ2ksThLyib6jf3SW55d1bEjIa603tBVZ4Rhgj7Nh5aRsNX1HKTbmp
 bqMIitIDwjAmEZky81d0SdHQhA/CPYVO3uwYs4IYilnnuL5kEtb6Y1khuVXYjm7gPUGDHjKpZyL
 CBHnzihSD7GkKwu9fd96yx75EBIlDeLmQFgieWX86HZMnoN4pO0B2ursiM+bS+NxidKr+B7SKkc
 dIkp6QNwmxPqhaLjIl6xI/JkSqBBfb7dI3Pz/gFfm4sQzYwjpdgxnIsHexrcaKveWcTlimNq2nO
 rMgE9rkMfZLb+JXeIovMnSm4N6PG1Phohz3qxahXzY/sADmNHEjZWwGJ7i0beBzG/LdZP+sTTt3
 m+Ck8sNhlUz184O5VNg==
X-Proofpoint-GUID: B0YqGy2uYzolv8czY82kohNT-aTeOm_N
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8fb6d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=TNMgkEEFFvq8IQPbtLIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: B0YqGy2uYzolv8czY82kohNT-aTeOm_N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNCBTYWx0ZWRfX2Aebt6/c/4vd
 U7LMAw4SRJad73SLwOANRpiYgxI7VLU7oxGGKjxG8NMlPFTWVIPLSd2nis/+C6H9oEbDcIfBg5I
 OIw3k6amiNXAj72+rCpEptTWeVaoc0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_010150_321007_348CEEDF 
X-CRM114-Status: GOOD (  14.26  )
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

In ath12k_mac_op_sta_state(), when transitioning an MLO station from
IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
succeeds, on is_sta_assoc_link verification failure, it takes the
'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
the dp_peers_list.

On the next connection attempt, ath12k_dp_peer_create() finds the stale
entry and returns -EEXIST (-17):

    wlP4p1s0: failed to insert STA entry for the AP (error -17)

Fix it by changing 'goto exit' to 'goto free_unassign_link'.

Also, there is another error path in ath12k_mac_op_sta_state() that
jumps to peer_delete after ath12k_mac_assign_link_sta() succeeds, without
undoing the assignment through ath12k_mac_free_unassign_link_sta().
As a result, the link RCU pointer remains assigned and a stale bit is
left in ahsta->links_map, which can trigger the same -EEXIST failure
on subsequent reconnect attempts. Fix this by redirecting that error
path to free_unassign_link instead.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 0cd46d1f36ce ("wifi: ath12k: identify assoc link vif in station mode")
Fixes: ee16dcf573d5 ("wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..57861003c15b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7845,7 +7845,7 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 				ath12k_hw_warn(ah, "failed to verify assoc link setting with link id %u\n",
 					       link_id);
 				ret = -EINVAL;
-				goto exit;
+				goto free_unassign_link;
 			}
 
 			arsta->is_assoc_link = true;
@@ -7903,7 +7903,7 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 
 			if (old_state == IEEE80211_STA_NOTEXIST &&
 			    new_state == IEEE80211_STA_NONE)
-				goto peer_delete;
+				goto free_unassign_link;
 			else
 				goto exit;
 		}
@@ -7943,6 +7943,8 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
 	ret = 0;
 	goto exit;
 
+free_unassign_link:
+	ath12k_mac_free_unassign_link_sta(ah, ahsta, link_id);
 peer_delete:
 	ath12k_dp_peer_delete(&ah->dp_hw, sta->addr, sta);
 ml_peer_id_clear:

base-commit: 91b552fe898e2c46edb363390211fac47b329308
-- 
2.34.1


