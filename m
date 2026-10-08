Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D7ECA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=; b=qh6md/YLLdKon8MKplGvNCUaba
	JVlx/iXfVPCZrXWxK3ku3W7KcZrjeC1r+xqL8YY8yJ+wzXkAt8VKDnrIb12/21xlo8QExvKozzGWt
	jC4EORwuW0Q/ylfsSj8EUZYVCfTiuYjZPqSzC+DkGTZvxkhQ3FO81FTKwvlDZ6/sj9rkapLAKAzwl
	sWSiTT8LGyIF0QWW7mjfIY0PqDR7AakpD5umG/Xecz2Zh59tuvHA0rziV/XsV9u3aiw4My2IaDQ3S
	+GJERDPJU7yju1xg01JGl/MJKtMRK9iABZ4ALXgN5xc1GZJM9vY1v5/4qlgKxRqMBPZ5ECPd+gBG1
	NNTWbi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJQ-000000046sE-076i;
	Thu, 08 Oct 2026 10:25:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJO-000000046qu-47yj
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=; b=UIjS9JmVdWurrQAuQcJ67YNyce
	Hs0J0KvDLNfwQkNO8hyI/nbg9rHLxcgBQ0UJR1Oq7FUvXirDF6LgyQ4zodsD3h6g1krIixxj/dOq0
	+E7LupYBvyq9TzZwejmEVzvRxq4PgJxEOIQ3QDJV6rzPGW64NCWLfd6vFQFwu0uuwKVDnSyAZ5r6I
	XreGUITnhgH+G225pNoFmmBPPO+f4f1GxGTVQe5Ut0PaaXwytkhHTzcArm0QusAh2vQDPGP+sY2k1
	87KtvQvmVb7yXWB4hY/CaVectxxlO1kNEMRQQ1mVNBrOQvYA3fzTFOmg95zh+QNOyYVJd13Qqcwtb
	XLtU0jCQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElJJ-0000000AHpB-2SoH
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:25:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K3G92189750
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=; b=WY6Pfn/0VtHVQSd4
	HSsygYMOlACdEpl2Yk8BtYF9QnbiDvPgFKV/3Wca1RoTJufr7kbGkGJ9lEnJaNm6
	w0LJP7QxQwEEPpDE2PwYjX2VLJzYIZhGR1cVNF+uM2aOEs3Cfw6dh+zuCI0hJAe2
	mzOtTT6K+GT0l3oIXqubsT12OaL+bJxGGv8QcpwAzijxPhHBbacO/CsixpxfbjMR
	3eYaj1IWUMnc5kZx0aXQGZL26X8cZdTvP0H9kXi3DwdWFhEBJCHdQTDcZ6mrLjsq
	25duVrjgV6toHkHAX+ATzi2sxddRZ2wttpYe1/+Rv9QAA63QR+FHqmSIDtAV/2JF
	BxMEgw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3add2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:25:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8d1e91c9so91657145ad.0
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455111; x=1792059911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=;
        b=PG1kb8pBg6ypUKqihB9tFw2ql0RgiMLB2GDb9e2sUXOyZqTuQxHw5XlrE6bBUFr1BC
         yhSeDRPXD3PnJZlvfYzrkjq52AqB1lbZkWS3GtxuftscWmcbb/vrdzdNYRcTJOuOWjww
         7pjfbLwPQ3V8HCgJdX3xwZLKQBbnNtp9OoftaaWNa1P6D9PXu+buAHiDlZuaSoL9FQ10
         6tJ1VjJoFN0wOg+8gY3ANLI1bQcT8/NXENaLtDNtzkt4X+yQBQtwlYxLxm1FJKCX61Hj
         W3EkDMLRjaPoCtHyglU6ZL1L1FilkqzGUJuM+l1tFGwKU6cUoprfXDEYE/V9KhQ78+g9
         +xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455111; x=1792059911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngNckdozDSqu9shJTPGYVZ5aTGzTKRVmfGVeYRVpnzw=;
        b=lRIWsbISrK0jrzMpGr1vwxEQDlaQEPnS+dtGcH+jtmgYn3dgCF4XPntHi/qmqa786x
         Na0ob2ol3Cq9egsQLGzL2AhOU/dT8yuI2e2od7hj7Nd7568SX924HUhw+aL0WR1jVnzj
         uHoywEiCdYM5BoVFthmOEoPO9hBPeKIgPNbhZ+93Hgk5i+pWq3mcroJo2pml8Us3laGb
         6DLMGMxxuF9Uzx5i7QJ6xssTVwwHMbQWJPz7LD/+GNAwu7vvcZZcRQ7leS7E8AIz20vB
         eGM/lEzFZfmxOJB0Mf74NzA56C+AwUWIN52x3AXH/sHrAssLf16b3d+dqk7JXF6KRVZf
         RMOg==
X-Forwarded-Encrypted: i=1; AKwUvBykpHLOpnFVlJGJT1lQHXsazwSeKZDOsw9p0++6pSxqw0R7+CsCoVq5vXR4ZDjvKS0gp6D7Fz4=@lists.infradead.org
X-Gm-Message-State: AFq9FYInA7gfSRerj5mEt6Qjo72xZuPm50ny9JeKq/Jb+H82Mtnuuoz+
	jftZqYjPR9T8PZ+5YyFkqqzXLKq0vvIIkq6sEjWOaW/UGMWUV+gRpStJs63FAIPapI5AT7FFeFj
	a+2g0+2HTk/FMQmZN02cii7OWdMG1kN3y/W3C/CgYgl0lwsxWfX8Gqv1LhSkHl/m8
X-Gm-Gg: AYBFou0nY1ui6fYRxKolzkjN+jKFl7EpN0kWfebCh62nOni5HsTyauXCYXE/S3MfEzv
	aSzkk15RO35/Z7Dtmcfd3syaJ+liOYus+UMB7qqSwG7YHM/bDjiUbjlXqiZ2ih2KyVgv5t4kcjN
	3DCYtHZUF1vcg2s9QBU3qTzzCWQH74RTaJXZTD6ah3Of1ZA2HG5ik9uVJ6jPO7nFlRlKDT50Pk7
	TJUnQ/qpfXMqCUUfTbyXuJ1fsGvqJXs/FKYc9i6THRCgHR0BAoTdbFvV4CKnXavgwQ1+I4y8fsX
	O7+maPNLmn9iXyQ4KpnOXbggm4n52dcTiv3zSOdcSO/UAqfkzaFVfFIG1S5Tu0RvfAYWP5/z0To
	RLJq8H4fiVFAY4tqgcxuqWdIY2OfLOQxaYFgDMLARC0bbH5dAmpTB2gYaWCm/Z6+V6Qwg4dwRvH
	zM2AAT1Kj56K1drsepVlWuow==
X-Received: by 2002:a17:903:2b0b:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2e6003c0633mr43801735ad.31.1791455111184;
        Thu, 08 Oct 2026 03:25:11 -0700 (PDT)
X-Received: by 2002:a17:903:2b0b:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2e6003c0633mr43801505ad.31.1791455110634;
        Thu, 08 Oct 2026 03:25:10 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:10 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:09 +0530
Subject: [PATCH ath-next 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-13-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac76f87 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HzkBA2_z9QidxsSae0AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXzPJ1BszVECgE
 m4NKKpHa+0a1XHxh8hFOZOBxXpGIxDtnXt1NOjx5TLuU5UZJ46s4I1OpGuFVHjB7lEd2ILM83HQ
 Pn3/YektWMj2esuKlxW2NVDrEX9JtKQ=
X-Proofpoint-GUID: xUObQFus95se061qCYRSdLacyUpSrHWp
X-Proofpoint-ORIG-GUID: xUObQFus95se061qCYRSdLacyUpSrHWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX0rILEFONOULf
 2xn64Wf+pfIMxYIZ8P9Z63DwM/YZ/+FAhtM57qB5nf0m9WV2eZwtM3RQsrjSWKYggYdvA6wyHUL
 +vhSCGvfB4qgJBIN1xeNuKCJQwSAkYAUdNXaJwkmWwY4oLjcJXDkzkrmZ6J6EAtTxsFZACyd4zu
 JyodZ6aE/hkPRSkqKtdFsN5+CW5hWRaHXqyBh9IROW4qIO93C/6GfB/p3FN3eiExJMPG4pnkxrj
 b48WLynIZMMASRHhWMy/+nsRKGmOuNrJevCUutke/CIn47cwc1eQA+UXRodm1AQHnfgi4zt7VYY
 au47vYu5X2L0uVFLjJ5KNDHvTkn2cTC9EmwjWgqO8dFb0qpDHNTRpEfl4xHSW0Xc0xDtIrNvmLt
 YJJH84R+rXBL7ZufZmOtxQ+mIvt7NgoOdiidg/KtnCBEaddHTzgQsCtdMgTi1hFRhcTPSpXVmvc
 5L6yFRqSc2jSDGENPvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112514_254777_4B87AF3B 
X-CRM114-Status: GOOD (  19.04  )
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

Use CMEM-specific write operations for Primary Page Table (PPT)
initialization on hybrid bus devices, which require special CMEM
access handling.

Propagate errors from CMEM writes during PPT initialization and
partner copy cache initialization. Abort MLO setup and perform
teardown if partner copy cache initialization fails.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  7 +++++--
 drivers/net/wireless/ath/ath12k/dp.c   | 30 ++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h   |  2 +-
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index cc1c31e216bb..e9caa9216f77 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1140,8 +1140,11 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < ag->num_devices; i++)
-		ath12k_dp_partner_cc_init(ag->ab[i]);
+	for (i = 0; i < ag->num_devices; i++) {
+		ret = ath12k_dp_partner_cc_init(ag->ab[i]);
+		if (ret)
+			goto err_mlo_teardown;
+	}
 
 	ret = ath12k_mac_mlo_ready(ag);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..6cf254b2d2a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1307,8 +1307,8 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 			       enum ath12k_dp_desc_type type)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
-	u32 cmem_base;
-	int i, start, end;
+	u32 cmem_base, val, addr;
+	int i, start, end, ret;
 
 	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
 
@@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	}
 
 	/* Write to PPT in CMEM */
-	for (i = start; i < end; i++)
-		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
-				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
+	for (i = start; i < end; i++) {
+		addr = cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
+		val = dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;
+
+		if (ab->hw_params->hybrid_bus_type) {
+			ret = ath12k_hif_cmem_write32(ab, addr, val);
+			if (ret)
+				return ret;
+		} else {
+			ath12k_hif_write32(ab, addr, val);
+		}
+	}
 
 	return 0;
 }
 
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab)
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < ag->num_devices; i++) {
 		if (ag->ab[i] == ab)
 			continue;
 
-		ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]), ATH12K_DP_RX_DESC);
+		ret = ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]),
+					  ATH12K_DP_RX_DESC);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 static u32 ath12k_dp_get_num_spt_pages(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index c53eac20b989..b3a00e7dbf56 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -731,7 +731,7 @@ ath12k_dp_rx_release_ring_size(const struct ath12k_dp_profile_params *p)
 }
 
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);

-- 
2.34.1


