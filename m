Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A42CA101F
	for <ath12k@archiver.kernel.org>; Mon,  8 Sep 2025 01:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rrx/5RgS1f+GZ05XDctzozDGEviN6tc7NYb3BzDD0ng=; b=P83u4j6JE0GfU3JePbcWArxg5T
	5RRYEKZf2DeiQyu1Sx3O/7gzhYN6qUNrVlNSJss+nSo3GXPe7slkhwm0j30y9vpMC23sQ6UgiBFee
	5Cd+5v13RrVYWHr6NHbiKlfkSIjeRdJKoaW+6Nkgyby+ntof5Za9lyDrjWhlRR/jgBrcLQCe26jV5
	kGERgQXFqI6SZIp1+0gV0gvC8jqNI50pkwfIdJHF10w2mfFog6xaCUFOA/qV8aN5AcSMTq86muCIR
	aZQizNkQOLVg+6qMrQFOa9FNkCPyObkX+zNNOQV4n2kUKf3OuT0zUpI3eJsVIYmSolaXOo1saLf10
	rKcSj9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvR2v-0000000DsQt-0O9e;
	Mon, 08 Sep 2025 01:51:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvR2r-0000000DsOy-3qjQ
	for ath12k@lists.infradead.org;
	Mon, 08 Sep 2025 01:51:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NOoXR018353
	for <ath12k@lists.infradead.org>; Mon, 8 Sep 2025 01:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rrx/5RgS1f+GZ05XDctzozDGEviN6tc7NYb
	3BzDD0ng=; b=nPkKeZ/+N6M7TJS43xNiUwDoAU9ojji6wx1ArbpHU2C9yuJHWYp
	Xaav4bzkVdKjd92KfTmEOqfN40/lHX//pwN2h5CY279jkuOfv28zqa/CjRMsoca3
	aGgoCUHmysiHpsxrq0POCqniaoCx9GRSB7I8kLmOcc7AkmI3RK/lbHH8E/q0pbvh
	qK/Ob6f5hFRNOF4LjXcHuzkj/+Qg+YdZlxwmAejYDtcbWdrauMLw7XRRTNMsjWhR
	pQWiPOFA1WP9hfBoO3geOWw2U730cGm4mvRi+R8ZizoF7oLdVUZW2nlDIHdeKQb3
	6cYWvV4oB+jOJKf3YQobIX2BTNerXx3SfqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8aw4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Sep 2025 01:51:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329745d6960so3844721a91.0
        for <ath12k@lists.infradead.org>; Sun, 07 Sep 2025 18:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296308; x=1757901108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rrx/5RgS1f+GZ05XDctzozDGEviN6tc7NYb3BzDD0ng=;
        b=Tdnqc+T7brxFEdT2stfWdqDDwUxvBHjQZkdHR4IMxmcxCfr7M/HkCjl+ksyPDIBhdO
         nqIxEC4UyyuMh4cTOfg4zzM2x4ZHNb+TXk/jArnc9Pz4jnQ1Vr977yncqFmns08GEcu4
         /soKqOiHVkR9aSY/CjITb8lpvab6aEBOVkez9X3BKUf8/+AvWcxrxixMKMtV9hdTd2TI
         QE9U/IxzzaikYT3fa6wQwJHKTektzRymjqDeXiA0ee+7TVtQxAI3cga/efh3D7QDKYnz
         mMk6irlM68ALAdF9+VJYVNmwIhtFxv3CBwqBm+8SSoCDPp7IbfT2oXT9/vbyh3DJHYkx
         fF+Q==
X-Gm-Message-State: AOJu0Yzk9uiR4Jv8HsHCl14hQbG5h0oyOBqanZG9arEiHRsaPbY/eVM4
	Z0YhaHs9mY47subdlCEBLnnP6YwD+pq6XUlc433zu3x40CQ1vnPZQz1aJk5vLNaJ40O041Bj+c3
	blmkYnT1qmVkcHGLs4HhOVUiEMtF5NEqjzwBtQdyix0xEbaO5oCLpgSJfyLRny40I
X-Gm-Gg: ASbGncvv3PQYUkDMQaqZfO+zg2xUj+V0J/9rK17UQ8wSNPZkhDUnpd2LIrj8KAJD38+
	t/xTmeSQ5o9TMl5woVZnnsIXxzOwRU5sUQUT3MO9BLEvLbMScM3InijosM5mouXJeciHhlFalw+
	AEgQrsnO3/oXRJ0GoB+2vlF7zYvjvkNSI9wD6vMXQGfJ8Dcwapn7r6DkZ5gveF4j2M5zHYy+fTE
	4nyZtolU/+LfduqXdY+RE95XfQ7JJTACeb3p/A2muvq2tG4dkGIYzv0/uvZoBKYPgQV4JTgmHm0
	/7fyavR7i8SofB7uZHwoyZe8P0Map1qzgajuhK/AcNQkHQz2A+mBcDdF9lV4p02ANRawRUBjwup
	fs6QIN8k7GFhyv8oqv+v8ykg=
X-Received: by 2002:a17:90b:38d0:b0:32b:d183:facf with SMTP id 98e67ed59e1d1-32d43f76ba9mr7024656a91.28.1757296307547;
        Sun, 07 Sep 2025 18:51:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5nRDidvM463gKG+C+xMPrHa3szfL3WmBr/t6VEt4l6o0AtEY94nQNcmFlQKvdElZnhnqKbg==
X-Received: by 2002:a17:90b:38d0:b0:32b:d183:facf with SMTP id 98e67ed59e1d1-32d43f76ba9mr7024628a91.28.1757296307064;
        Sun, 07 Sep 2025 18:51:47 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b58d8ca8dsm14563309a91.7.2025.09.07.18.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 18:51:46 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: fix WMI TLV header misalignment
Date: Mon,  8 Sep 2025 09:51:39 +0800
Message-Id: <20250908015139.1301437-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX6BvUsvdo6ikb
 G0fr1LQ/kYpVLXsD+JDHvACQwt5DVI3rjHXXZEY9fuyPUJHKgg+Laa4s/MvBm0Cm8UTFDF1itYo
 6yvBsNGiLPGg+soqej4P63hWuYVH7Zn5jz5soXldbbzK67HY4zwJjP2N1OSz2YeMSuGGlnUB50r
 CkVhOg36AAvZcL1uWtXIc0455VBrYH3KxhozmU+UhHy5LDNF9bM+W6qJsmD9OQwaJ5rBcNmjPPe
 56DoQ+XBA91/Fsu9UwA6RsxRj3FV49PfLRv6zzG/tX8gIxWNngVfkK515Z3olYz6a4dKo4+qqck
 4oGXNgADcKvEvvv/6QAmPHwp9v9SECUnhRexUPQM4c9HhUxIOgtu3y6rUZDveDUIOHo6mrkXLh/
 Q8V1KZvC
X-Proofpoint-ORIG-GUID: aYx7TQ9YDJ1hnuOEGN2uAGSsxgUuOkJh
X-Proofpoint-GUID: aYx7TQ9YDJ1hnuOEGN2uAGSsxgUuOkJh
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be36b5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dYpq24IgevQlpX1txhoA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_185150_070596_C1405AB9 
X-CRM114-Status: GOOD (  14.33  )
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

When buf_len is not 4-byte aligned in ath12k_wmi_mgmt_send(), the
firmware asserts and triggers a recovery. The following error
messages are observed:

ath12k_pci 0004:01:00.0: failed to submit WMI_MGMT_TX_SEND_CMDID cmd
ath12k_pci 0004:01:00.0: failed to send mgmt frame: -108
ath12k_pci 0004:01:00.0: failed to tx mgmt frame, vdev_id 0 :-108
ath12k_pci 0004:01:00.0: waiting recovery start...

This issue was observed when running 'iw wlanx set power_save off/on'
in MLO station mode, which triggers the sending of an SMPS action frame
with a length of 27 bytes to the AP. To resolve the misalignment, use
buf_len_aligned instead of buf_len when constructing the WMI TLV header.

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 742ffeb48bce..29dadedefdd2 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -843,7 +843,7 @@ int ath12k_wmi_mgmt_send(struct ath12k_link_vif *arvif, u32 buf_id,
 	cmd->tx_params_valid = 0;
 
 	frame_tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
-	frame_tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, buf_len);
+	frame_tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, buf_len_aligned);
 
 	memcpy(frame_tlv->value, frame->data, buf_len);
 

base-commit: 27893dd6341b929f87d45fc4d65c5778179319dd
-- 
2.34.1


