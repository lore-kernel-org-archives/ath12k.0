Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EC6C54F51
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 01:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=; b=r55EX9cgYjCjQa6ldKicSqXv2K
	yt0gNCD+Jtgk+4TBp9sM2jSuFeMSjVKu7W59KT0mpAgTQ/jWrmqwSAvtV2MScU6qySHEW80l6rSoa
	EUdO6B3tZtCHxgLzRu8dr6CmLJp00gWox9GTDWTNH5d0rX0FyUC/KAua2LMOUpu8Age3OJIS5Wcei
	Sa//uNIyPU+qwLpotxX7/nSGsMyTHYhxAIwF4FIIK53wvAzUHU6ckbEn/BycxYhrU03IFhoYhv4Gp
	b9E3YVrpmz+2H210aTjr4O07CLAsKs08eCINJk7LWH1MktHT9+M6exoS6Gh+InX4nfVPxl2QDIykx
	N7h7op9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjr-00000006YZH-1yJp;
	Wed, 29 Jul 2026 01:05:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjo-00000006YXK-2yGd
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 01:05:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL31DX3468869
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=; b=MoYixZJcNOUlMLG0
	qidxHT/azZIonZAFdAIexGA63m/Q7sNbsnT8fSexQCkWhthLONVU8GBfYI+6oy22
	G8mCHaRqw/7xczbSSbrb6l64nMjdIaD6Ztb5XF1txSsaGH7fIa7zc5OPHrHFSNoV
	2xALjOkJ7Grj1lALSEA7jSUsIe0KQ+rsBT4LPUPf/66FLGn1YgrKFNVQBMPX/o3Z
	1NzwrHBnB2LIsAELcrnPxRAChLl62lljCdK26BK5DIzh/CXsrf9hP8Z5GsHpqn+K
	FS0I895Gp8Dy8N6xOv/Q3jL8qGQPmjVq1XYPFrs+0fpCh3NhuzNq3q/ieRSG7u9p
	B199XQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0hjan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so8630125ad.3
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 18:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785287135; x=1785891935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=;
        b=J6nFfYH3lvs57+q8vMVUOqfGBMeqKtarqkgJpKNxMRne+CAGtvdEZU5A/Egx7ZDriI
         50KjeLinuh66K5zVfecNutj03MgtGLKB87MhTQeV0vQ57kP9RVBRXvLOvf8aCfLMkT/P
         09SPo01LS1GbTc553Qg17cjBCVNLsYMZ8NddhwZ+G3ZSep80pGxf3yOsKeHglQWdKrFM
         vBLrPo9fhjezO2UrLLHsvhHm02UZ24Mq/TWZoL9zF3nW19qRGq66nKzPsjZdcyhc7oue
         Az/WTcxeXE/YzWnOT9GyJtXwpm6HwpCQ/GldYJhiiye0DCIy+q6cBMJza1vM92tHvFxU
         9TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287135; x=1785891935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNT5GXQJAMiAcSilkiUxETqrPzWUif0/ef1SRCtWtiA=;
        b=rUhyqanh7xDfPeNEWIKvzTLCpTYPXW+j6YD4lm+TMbutC/ZauSKM7V/9t7Axfpj7ki
         pRpK+DBvDeP/CJA3qm6BH7Xat38xOFYQYYwmdYrOrQV3XNFSZfA8W3FiH067Xs88KFM8
         /JfO1MfIOEraB7bdXSIaQRkzDGhNqLtmUlfjcw42pqi9tjEI0nqFqF/UqJAkSCEyOmsC
         5oJ1IgvCYy/xHnsMWMEOAqHrSNTiHD8LO6PLYcCHHkWCy1xLu0TW1TU/SJNzUQo14IgI
         l1LhZw/KjywTq705wZogUxqAmTPBgpOgjlYHipzGQOyZv/3lwTMxeOSFSIVSu/+3eFhI
         KhDA==
X-Forwarded-Encrypted: i=1; AHgh+RoBFSVDgXtgyBJ1MEtdO63fyvpRCAYwXrstISelMkitVC0NqgwgmHCDCmLTfusyUohT9SsyfYs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzC2pBoH2A27KY8O+zYQI9XO3GWMpm8T7q/6/h63yhF9FerRtcY
	KQCcRSWpDDJ6ptR8ejJ6gcJ/bXI5cZAeijusKtUgXZzy8zqGsi4Ig0UhGSWnILAFx9NYKgK/hqi
	JJSDhU6uVgfmWtFFTdQjXI6Z6tYyNYZQPfVxbXMuYLcf/eqU64xw+q10sk0l/mM7CgSlVTn6p
X-Gm-Gg: AR+sD13Xwi6kbw2JBVzoTvMhCj74tesn0nr2adhgJe7urjL9QGCv8Tff9SVeCj7BUIa
	MSoWVoy5ZEearaLCZbzGrgj9sWupWZe/Kxv9pp5vPCV42KZ+TkgHfuiwHP09C890jz6FtHlcnpC
	e8QrTPYpJy/+yOQW7tlBCjnMIhWugHOUesnaeSBwgKxtdZ5DoqEi9MsBBU4khRAg9WiEcv/KByP
	Jmma0O+oNYit07phd+xnLtANNQmi6Il79vKattz+NvMv6gOTBrsa9HGKh/SiXr5u+78Utjas6Re
	y7o0n+GWvCIY75BrBYAfxZW89Km3xeDiG4qMO3LtjvB4aDnk+weBLU3WNjpXwP/8tm5br4bjyxS
	+ulsYm94XIk6T8h9UtNCnOQ364re4msWBsbu3NVpMKAeUYGHCtYsAbxo=
X-Received: by 2002:a17:903:1a0e:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d015c12a10mr59129565ad.13.1785287133935;
        Tue, 28 Jul 2026 18:05:33 -0700 (PDT)
X-Received: by 2002:a17:903:1a0e:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2d015c12a10mr59129255ad.13.1785287133453;
        Tue, 28 Jul 2026 18:05:33 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm3699381eec.9.2026.07.28.18.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:05:32 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:05:28 -0700
Subject: [PATCH ath-next 1/2] wifi: ath12k: fix stride mismatch in
 mac_phy_caps_parse()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-mac_phy_caps_parse-stride-mismatch-v1-1-27a9c1a3fbd0@oss.qualcomm.com>
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfXy8KFlJJwp5U2
 23kAelYZU/pQtRH4EJszC+5M/oMKNx4onPTGkn7z6A8+cYLKL4c88byd3b8f/p3hkfeOrVIpcCP
 0Wo6jxgS0a20qpWvT+SHHklK5++rdiZfXaZJVf5B/rAXg3Y/jKst3crZv0kPfQN89zoEZ2+Bgaq
 1aAiimUwAbHdBUJqsElhH9Io4tM/snLz0yRbxk7w4hUyiv5UKNa9lcF8kwH+8QRt+zrKABRD8ZS
 BiJy3q5tquAbNxqE2nJ7YlLa6ZlYihV46P0WmtWqdv5cP1rTZGKanyh+Bld51up+Dsj6hl/HfO0
 hMZEtHF5eQa+TOi2X8Bbj2ZPZV3CcEP6J51l3TirFzYUjjAdYN9zJdbf9Ssnjpu6mJ2WdCxB2fz
 QE3ymiXZWqAFMh/1s9AYq1UIjUGv1dl84798dbvGPE4mwbzSmQwAlB0hLQJEaqAWiRCLOSMiUO4
 nmbyT36ojlHVnUVKaPg==
X-Proofpoint-ORIG-GUID: QtyFhXVrzT2FHYVWEgesEqUq3X6oleK-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX7kOPma3aMIRE
 C5RyBtWErTbkuB73QELvA0/4dvG/0cdZ9q5TS+ZRZudEBD7EnzPT+Ow3k8HYgEfPK7Xkz5+7nRv
 /aaMshkzlvNEnKel476RykP4vcSr3J4=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a6951e0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TQlc2wDWUpY00yvoUuwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QtyFhXVrzT2FHYVWEgesEqUq3X6oleK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_180536_777677_2E42520B 
X-CRM114-Status: GOOD (  14.54  )
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

Currently, in ath12k_wmi_mac_phy_caps_parse(), kzalloc() sizes the
mac_phy_caps buffer as tot_phy_id * len, where len is clamped to
min(firmware_len, sizeof(struct ath12k_wmi_mac_phy_caps_params)). The
subsequent memcpy() destination advances by sizeof(full struct) per slot
via C pointer arithmetic, not by the clamped len. When firmware sends
short TLVs, the second and later slots are written past the end of the
allocation.

The reader in ath12k_pull_mac_phy_cap_svc_ready_ext() also indexes the
buffer with full-struct pointer arithmetic, so the allocation must match
that stride.

Fix by using kzalloc_objs(), which derives the element size from the
pointer type, making allocation size and pointer stride provably
consistent regardless of what len the firmware provides.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 672eae237ac6..d466baf5e90a 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4765,14 +4765,16 @@ static int ath12k_wmi_mac_phy_caps_parse(struct ath12k_base *soc,
 	if (svc_rdy_ext->n_mac_phy_caps >= svc_rdy_ext->tot_phy_id)
 		return -ENOBUFS;
 
-	len = min_t(u16, len, sizeof(struct ath12k_wmi_mac_phy_caps_params));
 	if (!svc_rdy_ext->n_mac_phy_caps) {
-		svc_rdy_ext->mac_phy_caps = kzalloc((svc_rdy_ext->tot_phy_id) * len,
-						    GFP_ATOMIC);
+		svc_rdy_ext->mac_phy_caps =
+			kzalloc_objs(*svc_rdy_ext->mac_phy_caps,
+				     svc_rdy_ext->tot_phy_id,
+				     GFP_ATOMIC);
 		if (!svc_rdy_ext->mac_phy_caps)
 			return -ENOMEM;
 	}
 
+	len = min_t(u16, len, sizeof(struct ath12k_wmi_mac_phy_caps_params));
 	memcpy(svc_rdy_ext->mac_phy_caps + svc_rdy_ext->n_mac_phy_caps, ptr, len);
 	svc_rdy_ext->n_mac_phy_caps++;
 	return 0;

-- 
2.43.0


