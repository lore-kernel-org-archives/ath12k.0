Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C87C44514
	for <ath12k@archiver.kernel.org>; Thu, 16 Jul 2026 20:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kF7bftFdsC+xfi4UYuj1YcL+KJ3C8xM49atujae26nI=; b=HFNHGqWB5G0aXQjzwkEbF8e9pl
	V1+mk/skLxgCAHeLzOuydckqQ8hpuT1n0Nke8ip9EJJn09oVjEkwEFfxNQKzaVzXoFiordJLvh3Mo
	cCnAvmYV+o3ss1nxEy+udbhPdAIEPZAS25mcoLVmW3YbtSzf6RAA8qy8Bq9qnY+W5pL9SHoVWH/+t
	3sU4oEdJLjGZg7zqAAbS1NEOvkraKWxzg2JNqnAc94x830RmXjrM3VOZ74k1ITwm0+/WZOBhb71uz
	9GKWa+zrZZPa29yuRbjRC84F2R8iERaMMWeDSe2aw3MGtjUSLNyjK+KCLkA6isQbPzh1hXEUVEU5R
	Fh6lK8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSGl-00000000Uj9-2w1T;
	Thu, 16 Jul 2026 20:01:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkSGj-00000000Uij-0ISE
	for ath12k@lists.infradead.org;
	Thu, 16 Jul 2026 20:01:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GJoi1q3627057
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 20:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kF7bftFdsC+xfi4UYuj1Yc
	L+KJ3C8xM49atujae26nI=; b=CSLtmaBAOhNcuJBhNk1osU0Bq323mMk4H6tqm7
	Ro3WcqkIvG6nfgFSOsqB4cVG7M/9+Zf8U5D64dUNhTy33VlXjPO6ZERwv1df0OoD
	hlfoo/jWBqYEct7OMPWECeVCGLHmvUAk4mKstBthz4MfYfS46ZSh3+lCTT7mFc5B
	kdeUHEnbND0tYGXz3PYiC9zd2VXpz1v/n2epMVeFam/xqUHCnr4xxpQ2D+uGYQJe
	4TgOZ5Mwi3ZtdEXnYtzhNiof0YqY3r2XhV632Rb0ggVxNwnjBni7V4WPPnHYAry8
	Mp7tMMQtArpi1IFijf+sLCeNbqQnS77u/6znO3dPb9MvTjxw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv2skj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 20:01:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so10557864a12.1
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 13:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784232075; x=1784836875; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kF7bftFdsC+xfi4UYuj1YcL+KJ3C8xM49atujae26nI=;
        b=V86YhyIR4SP0ijDY4t1bniCnscjIHM+rtZbq1P1CRszwlgnU3RIf5rAU+l4EwWRSJ2
         QjXlza7XMqzhJsaobH5CmCKtlmzKyVl21b0RaR0uCkRW69fWsl48G54Pm2wrTIVCutad
         UZ8ZxgdTIGlmxCS1HUsiefOn44E1eyXSFkyEFqaPAgFCo+/eYCfvAodYRC5Yr3euKZ7x
         8q6Io7GZDyjsobDhJobcWifa5/x6JskTbBD6fJGnRAYJji2k6Fct5BwDwDwaLuP27VKI
         CMnNkLAHf83nnyiKX62UwS9IFcpFBvQNJM4AuKADebFVtSdEb+h+TLFXd9aMBFoLZa4L
         CAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784232075; x=1784836875;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kF7bftFdsC+xfi4UYuj1YcL+KJ3C8xM49atujae26nI=;
        b=C3E2r/r3bKWwdIK3A3gKOtugfeOOK9iv/PYjxliSIyxokC9SKsfJDr5VjSDjPsPn7U
         7ftNOih88+URXQrdkvjTbgimEY9KzKA2PNjK2yOZX7wK1n1FKkfTy5UhzzHiljRA1bgi
         oGWqfK4XF0D0d5hoQ1k95VDnr7GfnDKpVWmiDCGKMOfrQJphTY37Cjni82eO6HNvVfcw
         nIO+ZVAPTisI+Ail/APImlPlCEkjXETMfCm6SQcElgu/90wTKaB2CMv39ucE6uFBCjfg
         EuKQ+a8/hqCWyodrPy4RD6qEP9j3sgxXQdKLuXgKCjVdWuN5lzXJs/lJo+E7/ZNP2Mnk
         KKkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2vMl4f7VgGR0L3Nlcr7gt94skOo40u7rTIpTcmy3BAf/p3997hcSfnWNfh8JifI8BimVazn0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/R437Lqlnn6V94Xw/RlhjebyXuOZjAYGalX0uUmr03byMa/WL
	qjfpYo8/Xeg3bmDjcHYdwY2+b+rxV7JFTfIh3ST/nXIy8Jh20JoWSX3JyIee14IIKSkilG7FeLl
	D69craT+jQ4YKzOIwPcb1cGg/Q3O099i+SEBaz6HTelpNZa0sTtf8y07HhSYYLvrL
X-Gm-Gg: AfdE7cl/A6GEkyOhHlUdNWJTE8uUEGT4ZBj4HK8rRs8CaCW0q17313uKViv6PM6LRKL
	xMC4Raq/iEXuqV4azhzEqK++yLV5QvUpaXrhw+BSCvo7UBbMcG80wmWAsVPwka7X1u+oFT3xaq7
	iJjkYsn2pNxnRBOLuJZJfoCOzySJuRM8hPWPxWZyXTsGF8KQWjO4XDD+ZMORpIRJH298Ferj1cN
	P1w27ihtCHW5QjArQYahSRxcb9CHR2sipU0oRqxkhvm1u4t4eG38+subg4Q0DpghfjxVkugOg6y
	YaszY10KcucR+xZeWVWWcfjpQrSDdhONqVS82TzmzzyvivWbNW2fssFD9TbS7HKr83qBDRZPhYW
	FhGvzuRcwhtnElocMzrk7IbaXZsSkF88tGjwTRTlqu7d7oreGNUy8u98=
X-Received: by 2002:a05:6a21:7a8b:b0:3bc:5284:4859 with SMTP id adf61e73a8af0-3c356f78c6dmr13719899637.13.1784232074638;
        Thu, 16 Jul 2026 13:01:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a8b:b0:3bc:5284:4859 with SMTP id adf61e73a8af0-3c356f78c6dmr13719857637.13.1784232074126;
        Thu, 16 Jul 2026 13:01:14 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c10dcsm16283000eec.23.2026.07.16.13.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:01:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:01:11 -0700
Subject: [PATCH ath-next] wifi: ath12k: Avoid buffer overread in
 ath12k_wmi_op_rx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-ath12k_wmi_op_rx-overread-v1-1-327a4b1c2372@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIY4WWoC/43NTQ7CIBAF4KsY1tIw9Ad05T2MaQhMLdGWChVrm
 t5dwtpFN5O8vLxvVhLQWwzkfFiJx2iDdWMKcDwQ3avxjtSalAlnvGECKqrmHvij/Qy2dVPrF+o
 ieo/KUA1lJTpQogRG0n7y2Nkl21eSZnTEZSa31PQ2zM5/89MIud/hR6BApdQGa65A1nhxIRSvt
 3pqNwxFOhmPfDfIE9iI2jAuECSc/oDbtv0AqgkowiQBAAA=
X-Change-ID: 20260714-ath12k_wmi_op_rx-overread-c1347f1a7310
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDIwNCBTYWx0ZWRfXx+GjRHk2xmnv
 RSgCqFL9NdTaqWUT2o5ZVjC/lkSHUhBhVs2nNTBZILtrAxLDbZgGPSc+s6ycqVdWf9yofZSgiLj
 p5oi1ibhMyJGvJOpzJ69NfwGw3iDiecDKriDynhtVOLvGT/1HkPj8+LE1uHc7QZFtSs1KDY61E/
 q92Mj6NVPGQXvLmtchDjy/5+AMuCF4okI1pJXaUtI5zLi1d87BSlVq4bcFgrRCYBi1JE1dhGldJ
 yeak59SJJdQGQ3EQG4KhDXSWnS4pa3zPfmFsf5gOFh5KV5vfKp60PEb9kChs7Ks5SaUfcNk58+0
 IDCFZWbXYRdxWiZk3kg/sDGzbffqL0sah9sPvk/AkAP2qIiPjk7RUdMFre3sN6VkeQMuL1SRkr8
 eyTHKtzVdByBFPZ4t6gromCoGp2vLhn8sx2frj6T5Wa1KRgGhJG8nysuU5WXyvnWOKsFGGFjFhF
 7ayiFbzHkQ4FhQuUcow==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a59388b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xBO1L-jcD7jxJNTJFskA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 3WA1Yhc6zfAdDT0WaDYyu1CHak0Gr_Lf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDIwNCBTYWx0ZWRfX54L4yXm3l9cB
 01BirAXJz7PC5dDTZtl2dg1k50myXQHFSLG7Is0RC7IQKGtyO9tUou8+sABh1uAj8ZK4x09yOqG
 U7Qzeab1PKKvxLCImQX+JP7TTXHkNaA=
X-Proofpoint-ORIG-GUID: 3WA1Yhc6zfAdDT0WaDYyu1CHak0Gr_Lf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_07,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_130117_257690_01D9C60A 
X-CRM114-Status: GOOD (  12.80  )
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

Currently, in ath12k_wmi_op_rx(), the firmware buffer is read without
first verifying that the buffer has enough data to hold a header. This
could result in a buffer overread.

Update the logic to verify the buffer contains at least enough data to
hold a wmi_cmd_hdr before reading from the buffer.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ad739bffcf88..28b4dd397271 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -10280,12 +10280,12 @@ static void ath12k_wmi_op_rx(struct ath12k_base *ab, struct sk_buff *skb)
 	struct wmi_cmd_hdr *cmd_hdr;
 	enum wmi_tlv_event_id id;
 
-	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
-	id = le32_get_bits(cmd_hdr->cmd_id, WMI_CMD_HDR_CMD_ID);
-
-	if (!skb_pull(skb, sizeof(struct wmi_cmd_hdr)))
+	cmd_hdr = skb_pull_data(skb, sizeof(*cmd_hdr));
+	if (!cmd_hdr)
 		goto out;
 
+	id = le32_get_bits(cmd_hdr->cmd_id, WMI_CMD_HDR_CMD_ID);
+
 	switch (id) {
 		/* Process all the WMI events here */
 	case WMI_SERVICE_READY_EVENTID:

---
base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
change-id: 20260714-ath12k_wmi_op_rx-overread-c1347f1a7310


