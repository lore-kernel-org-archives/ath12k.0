Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BECCA0EE4
	for <ath12k@archiver.kernel.org>; Fri, 15 Aug 2025 01:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2JJpNn1stvDlteeqX4h1Cq06+aEkFey/378SB+Go3s=; b=AKhzSi7JhqRpHFtaXrCNuQvXrE
	nNsFqzKHHp8lh8O4AgCL6svLxHgPdFi25ggbfM60A43AZoMVM0YDS+PoYsuOAaVx5+bPuAnnCLWeR
	rj7FPWg5Fyl3cPm3x2ExQUu1oweeOaQW7J540SJVITWnjRptF8Fx51ZkhsrSwCg5E7DxkhPCOugWE
	CQhiqSC7PjQwMqNNLYiYgbcg/L/vmAbs53f2B8eyXV5zDPsASORA9lrz+CjP/rPbnsspnFtR2t+My
	wvZhth7Kh7ZjOTntRT5Hsi/IclNZOOPXveQLa1xtHU+PlCf6p07Iuh+DnQAOJskbrgEnIBu1lSmHh
	d06WpdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVU-000000013UQ-36UD;
	Fri, 15 Aug 2025 01:45:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVR-000000013Sh-1qIG
	for ath12k@lists.infradead.org;
	Fri, 15 Aug 2025 01:45:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EIAO48011340
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f2JJpNn1stvDlteeqX4h1Cq06+aEkFey/378SB+Go3s=; b=M93puMouYWldia7v
	EGGfEOnkU6CZm+O1LhdzImwJn4mzZXeXy4wdHj64ihFoeVzxkLcISt/fmFFnKoUM
	o96Nr1JYaVHXX3glaEpkJ0U3WZnvioThOyLjoyn15F1/XoRFmRasElUdYqLlLm+9
	ZQQaBKsM3lyB9HjQJgNC5EFae/qBbfdXIL24RIMsLNzip97RH94XiZshcquLqxRH
	aiSGoxFRqcp9802s0pNkKHFbpGHuVQDXWAMAhpaj/JfohpCmGDIAqgPHJjzXud0s
	7w0ioKn0iVPZfGi+DKslCpwYvv5bmsnKGgE1CK4fOKqF/sBt/ssj9vPJvqu4FO7i
	7mAEMA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbmu3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32326e1f439so1524477a91.2
        for <ath12k@lists.infradead.org>; Thu, 14 Aug 2025 18:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755222318; x=1755827118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2JJpNn1stvDlteeqX4h1Cq06+aEkFey/378SB+Go3s=;
        b=eMD4bktS+fMrvVMeZxR97WZq+lsGNYpb95pRGDejfe0e2+BHwbwClNoYgj+I+sbmgB
         xxSr+f+noBmz0jWKjw8C0K8fmuHEcjKYmhtOszAVzc7vmaZwXarwANTPoOkMONVIidP8
         sCB2O0qzdqivuJu2pkTCAmQB5SUTdkd10cFDUF3YTucA7/Kih1zcSGh3xNO+JAEpnetI
         +IeZ/6FMnzzdPze0d3kIoByZmzroXiTlK6MVTXGXt60SVBlBt/HDKj1+iiq9XfZ2+286
         SMH/eFd+ikjsG+bDxVLyviKUwA5NQjRgSfS6nhzcHfPm+LFOyAYarSluLu2XWwhfkq16
         iclw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0ufz9z4PA51cSIyasuC9kN/NzRxlfhhZL7hcPiDYKYlLyb2gl3rr2FMRhy1oe0zqB0Pbmk0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKKshjBJAAL6UMgSkTwl+r0MnE77RJTKbOLzIUvcSLUT0lWo0N
	pj/R2DZsuP4uZZGh/aMqCS2GtX9uit3oEjDzQnNwxX7nftkGhUv5sfQRk5jpFrdlkHd8Zu6byhj
	pLTVQXxmFM8OURfmvFeaRj6ulFMr6exDxpTe+du1wpa2a5ebP/9liIsUkbx+RgHOF
X-Gm-Gg: ASbGncucFLcvHbbZ1ltBP7S4jdAGOgDwDhWUmrNIHxTCqLCpUGfHziYc/UMFSj/F2zI
	hsDW55GbUZRD2akjTTS6yPu+cm1CIW3fGHh7eT6wtLq9R+kRp0ZiVm/gS8x/ZjTVbBSVOrbF93j
	zj3JoekomKmoOGrsXw3gl9uNI1564tcw8Icw0NNwWYV6d/ZSb5/JVZM1FTNLQBl9wthkUx7xgTm
	atR46Xpby/F/oB36LyCieTUwUHPmhAjPca9OqNFw3wYTluU2lZOl7MrIq3blHyhrp4baixP7P7Z
	e08f0RFw7asDOm70exhfy3aT7+2z0mGW3Oqg5znTiSV2K13sEpt5fcXWDDxuXH8YUedCHBoibdb
	8aoeMQI4+CHfvd4K/
X-Received: by 2002:a17:90b:180d:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-3234216190bmr588162a91.25.1755222318012;
        Thu, 14 Aug 2025 18:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTATHglsejKDU1aURWUA2qjKt/Z9C08Zt0r1OWZF/vn9I1mLXPEpEoSQOPZtYki1JSB3Pf3w==
X-Received: by 2002:a17:90b:180d:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-3234216190bmr588123a91.25.1755222317407;
        Thu, 14 Aug 2025 18:45:17 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm20273a12.48.2025.08.14.18.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:45:17 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 09:44:56 +0800
Subject: [PATCH ath-next 1/3] wifi: ath11k: downgrade log level for CE
 buffer enqueue failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-1-f955ddc3ba7a@oss.qualcomm.com>
References: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
In-Reply-To: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689e912f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4avV6w9vhD41MOPHW_EA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX2Wb7qwQvSKVy
 rPTzFrHs+8ZJxSmi1ABDEcZRtcgbv7mdtiE6cxpXUQ/gOOhG42yLZB9yodeoRSL3OzggUDe3mRm
 rNQnqMvr+cFfgFfG8xqbe6J9nQ2HUZzlRONuIPG2yqN4cvw2kN/QLgVG5PcwIATvDr3RMaG6kFe
 l+STN8gVNMwZiur5iXwNE8OxnoGmcRDua3i5MknxSygVgdfI6tssF54afF54QK0wy4d2J5tNdsz
 JRfESWGosoHNBAcQAlMTX6lZHDhgZDwU8Jwdnd9RQatz3Yx6IwbGKJkIUD0xEMEJvS3chT1qwba
 NgelQZQ+vl08SS0MpbPykDyevCQsyjLXvyHe1Cz5+omhnlOO5i6WSkEXNQ8KNCVjPNvlr7/ZucA
 NGbt5onk
X-Proofpoint-ORIG-GUID: oJo8-deTwUzADHsIR_6084IaiTZMxJfv
X-Proofpoint-GUID: oJo8-deTwUzADHsIR_6084IaiTZMxJfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_184521_517165_57697F21 
X-CRM114-Status: GOOD (  13.00  )
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

There are two rings involved in the Copy Engine (CE) receive path
handling, the CE status (STS) ring and the CE destination (DST) ring.
Each time CE hardware needs to send an event (e.g. WMI event) to host,
CE hardware finds a buffer (to which the tail pointer (TP) points) in
DST ring and fills it with payload, then hardware fills meta data in
STS ring and fires interrupt to host. Please note the TP of DST ring is
expected to be advanced by CE hardware before interrupting host. While
handling the interrupt, host finds that DST ring buffers are used hence
increases rx_buf_needed to record the number of buffers to be replenished.
Note before that, host compares TP and head pointer (HP) of DST ring to
see if there is available space. Normally rx_buf_needed simply equals
available space. But sometimes CE hardware doesn't (for whatever reason)
update TP timely, making the comparison fails, then enqueue is cancelled
and a warning is logged:

	ath11k_pci 0000:02:00.0: failed to enqueue rx buf: -28

However even enqueue fails this time, rx_buf_needed still records the
numbers of needed buffers. Later when TP gets updated correctly, the
missing buffer will be eventually replenished. And there is no doubt on
the late update, it always comes (or lots of such warnings should be seen).

Since this won't cause any functional issue, downgrade logging level to
avoid misleading.

Compile tested only.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220269
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ce.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index c65fc9fb539ef10ba44f1c1d5571462b40fa098d..a7a163621b21067ba5a4f96131aafdccfbda3d03 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -354,7 +354,8 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 		ret = ath11k_ce_rx_buf_enqueue_pipe(pipe, skb, paddr);
 
 		if (ret) {
-			ath11k_warn(ab, "failed to enqueue rx buf: %d\n", ret);
+			ath11k_dbg(ab, ATH11K_DBG_CE, "failed to enqueue rx buf: %d\n",
+				   ret);
 			dma_unmap_single(ab->dev, paddr,
 					 skb->len + skb_tailroom(skb),
 					 DMA_FROM_DEVICE);

-- 
2.25.1


