Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2729C982C1
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 06:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yu/yUWW3DFWQfNHsE8kMQ/JkOFm8oKBvm0htLAQF9c=; b=jiKoHTnNIIbl95u40Gk6tJBuBT
	TcWJOyMmVCyq6yQ13Vpo3DbpaLAOZPQFX5oguEGRh+US2u/Pgg9QrLryQr7txqDJqyypksuRCOkDa
	0WLZFLnRFG+O+EPwxkapwaehknnZLA3uvLrbdU3z1T5vY5TpfLqNYccnezgu5V/jyUP8htJ3CBpxq
	orxmaIhkeA6c8Zw3Yo9SWs6Q985r+RTxn71gM8qkVKLtr9dO+WXbPXUGnzvFb+aF0pODN1Twp0SMO
	4mHiOeI1qYWVopvYTvk3lFml9xsK06U2ENzASXAkMa7pAPg5ZKzixwi4XkY6UK9kOiv09aIuqBEky
	on3uX/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikk-00000008RbP-1SkQ;
	Wed, 16 Sep 2026 06:04:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ikh-00000008RZW-45ZG
	for ath12k@lists.infradead.org;
	Wed, 16 Sep 2026 06:04:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNZLRn1408763
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/yu/yUWW3DF
	WQfNHsE8kMQ/JkOFm8oKBvm0htLAQF9c=; b=QXfvLZEUvQuxgaSgLUi0MRHu/Dd
	fac7LAQIwt5yky5xnLLR+0qqy783iOMtc2ej5xhlls501Y4X4YkVrBq/EuIR3DO/
	wuRnksdwU01xRiz50+1maV+Aymj0Rz5vvPSSjHbwFDH3puCJVdu93/o44c2xX4zv
	g+sS+mRtYakSVMQTK2oepRnMwt6fiYXbioM3pgtBySGD6Ucykwmvv9Lie41ca874
	QCykx4uoqGvpPLJf06BA52lAL/P3UeSDHbfNe/ENRjMWLG9hJ2WepDrDqwarnJCZ
	Bw3IE8yfCiL8vtRVqXiuatTbktS9mkMRYdj+TXY/m1iCvVsg3UAyu++cmkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftuh6yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 06:04:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so13307076a91.0
        for <ath12k@lists.infradead.org>; Tue, 15 Sep 2026 23:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789538654; x=1790143454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yu/yUWW3DFWQfNHsE8kMQ/JkOFm8oKBvm0htLAQF9c=;
        b=AbshSH0eN6xWpT4r2f+EBdprU4L4t83FXv6ngteKVjWj5LuHr2myg4Rf9flLPRNfp9
         n6PFM7Pzi+ZdOiLHv3rVSsfTeOJwN6EudcEkDdiG5qlKeWz4HDBZcyGE5XuBaXuPVV3C
         ddOblzTRaQZoj6DFaefvU9Owk1HBbBX+ytzl1KifyE0BdN6POY4ExkwyhezxYd0DRRLy
         +Q8zvYj/r5fQpv9v6a9Whz3ePwsuOSNrze3Mi+zpMa5EVkxbI1OTbJO2T8AKB51tKXgj
         Ud9th8f5u5E3UF4C3ZWd7rVqRs8aDtku6HhQ32egDWV9KBf6BCprqhbfxvT0OaZEjt/H
         w1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538654; x=1790143454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yu/yUWW3DFWQfNHsE8kMQ/JkOFm8oKBvm0htLAQF9c=;
        b=hLBdsqWb8tHQH1nxBezo/HR/sftLg0WwVrjjVIOnCCu6m5KlVH9cKpakslUEYt/l+1
         bvrqU9DyIWXyf3tr9SOIYSK+nSo4Q4asui75YZleeIkdVMmr3krvn63hbRiqxxhnlGd5
         0QvPC5kEzO2Z1b55meHDBMCn5lxdRMsHFYs5M50g5HvX2qQ44uazrh3xu9QU10LcxGUg
         CfYp3uvkLKqockm+EKmbNyBidOJiNSKVkIEbw7EXKLzk8a6D816BW5kqDJTCKVMRe3Zo
         9jL5OjqcMUc9iDWJPfYc/3JWXJMxg7jx55Va0huTEzIoUxsMAI4ZDgfG3XjovFX5VIN0
         X9LQ==
X-Gm-Message-State: AFuF++kmI189Hft3qjLeODx46WICdxBK1lMXPUrMyC8/laRQ5UG8r+LO
	dYCIE16oGaOPr003iHpHBVioWP5v1xd9Zz0U8S0GXNMq4yYEhsWJknykUx8cXbtQnt9sXaBYtlb
	mlENrfnneXyeyz4F8+goe2ZTD5vTnzpJ5Oaij8Xyo/B87Gg4dgu2PJSjmMnX6pmn1BLpDst0P
X-Gm-Gg: AYBFou0fPE77mkhO7QvuIudK5KOPK+M6N+tKy28pHm8wZ23RXKdEjgcQey7aJguI5PE
	R3W6xM570r5LwbAxy/ZMR+svLwA7tDbQR4aPfvf/CbkpNa8NP80mojg4V9BwazzUksizNsgnkXV
	kFtZQ7UVm4BeZ8rPyvvgOtFqsL8R1jes+K+Mgm/iFCZcrrz1IxlPzNftQ0aE+oz25eLqDfC8EST
	yr6S8wDljZvDn/yd6KiwfDH5REAVUw63C2XJpW+NPwDyLu6Wb4KzbaQP3N5TtLrLN4OGlHvwyiU
	WupP0qC45GoZl9QFTihUtrGMbfi1R4X3mE7m594fq3ClQSf2VmAwmtCklSHR0x/xQpKM2ZuNO23
	CcrQkeZQSkX2FKx2771SXanu06zbuaa0pZJ1KUUDpPvU7YVtL0ZZ8/p0+/nfYeTX9pre+SxjL4B
	ugHXRC4//hy6bhMg==
X-Received: by 2002:a17:90b:6d0:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-39e1e27ad18mr3382477a91.1.1789538653746;
        Tue, 15 Sep 2026 23:04:13 -0700 (PDT)
X-Received: by 2002:a17:90b:6d0:b0:39d:e213:9dd3 with SMTP id 98e67ed59e1d1-39e1e27ad18mr3382414a91.1.1789538653234;
        Tue, 15 Sep 2026 23:04:13 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a7a1csm2661491a91.15.2026.09.15.23.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:04:12 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 2/6] wifi: ath12k: free pending MSDUs on duplicate mon link descriptor
Date: Wed, 16 Sep 2026 14:03:21 +0800
Message-ID: <20260916060325.854-3-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfXw6SM8QfMbRWi
 1NSA2aF02hoAtdyNGJ9mJwhbh1KEnUIqpI4LOz/MOdDpjz3E82pJu9Pey5eAXtFdnOTXrjbr60z
 Ihfj0gdiTFnYJOPdiie3FMApn2l1RUIcSPqLjMc2WU57tHx+0aW2MvxcOE3qFb1SSI9FZLDjwTh
 Y4R0g94EhvHWdg8sHzLkuxxJtUbngb6PfK2FMyPweGtYoUB5Ozl97IOdcB/WjMgfaa+KwVN1x0X
 EQasNqIjcwpqeFOlFnodNUrMeBJuERosvx2u955WdxGzu/7O1hFXYF0yeM3JBQ1RYS0OxRj7ujM
 zk4FuEbyU6AUMUBNNxefEwCluQUS3FZ/AEKWcuuAQJU1FKa9PYLNj+tIZtutKKhyUEXv1o8dGnv
 oQmEDXEV3obp+EM8BlJ3tZW9wzwUlcCxm+0TwEzJOKEflY+FKitIlUrA6i6zByK/28Q2Kx5sMRS
 HkV8zznuNcrSZWaDk8w==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa315e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=RKeApao1t3Rrg6TELU0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA3NiBTYWx0ZWRfX5vmX4lvdJGnH
 9fGgq62ptpmxrT1ZLBFy9ZyeH2xFdqzTZTmTbr0LXMLF//DxuZ2o0QBIGbdXHusEZyh9rKuFk3F
 vLzHVgfA0vdAMvlAP9PIZEjVlPkV9lU=
X-Proofpoint-GUID: kVgkzGCtm7yctZ9XIM0zP9a2n7K3BwkW
X-Proofpoint-ORIG-GUID: kVgkzGCtm7yctZ9XIM0zP9a2n7K3BwkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_230416_134842_F7B2C33B 
X-CRM114-Status: GOOD (  12.00  )
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

ath12k_wifi7_dp_rx_mon_mpdu_pop() aborts processing when a duplicate
monitor link descriptor is detected.

Previous iterations may already have linked MSDUs onto *head_msdu
and detached the corresponding RX buffers from their descriptors.
Returning without completing or freeing the chain leaves those
skbs orphaned, resulting in a memory leak.

kmemleak reports these skbs in field testing:
  kmemleak_alloc()
  __netdev_alloc_skb()
  ath12k_dp_rx_bufs_replenish()
  ath12k_wifi7_dp_rx_mon_dest_process()

Free the accumulated MSDU chain before returning and clear
*head_msdu so callers observe a consistent state.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 72bfbf19b7da ("wifi: ath12k: add support to reap and process mon dest ring")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index ed6686746605..08f2fba3e680 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -2675,6 +2675,8 @@ ath12k_wifi7_dp_rx_mon_mpdu_pop(struct ath12k *ar, int mac_id,
 		if (pmon->mon_last_linkdesc_paddr == paddr) {
 			pmon->rx_mon_stats.dup_mon_linkdesc_cnt++;
 			spin_unlock_bh(&pmon->mon_lock);
+			kfree_skb_list(*head_msdu);
+			*head_msdu = NULL;
 			return rx_bufs_used;
 		}
 
-- 
2.34.1


