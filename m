Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE308C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 06:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r2B+SEBRZM49En7lUIrzDje3vE8zXDCU9Jc5UdMhRfI=; b=TGmMoE9ptlYYRz3T1C9fg8zzq8
	x+rUQ78ajP6RZO7ubP6lQCxkvRbdrJjCozQx8OaaUauhiHxuEU0eiI629t0zQNKOuwl3IESSRLaPR
	9wrvJklSi8hDO5UDC+L/q1yp6V1XOW5tQM8sK3xlKI7ASPSdMpcMJuw5iCfo0dsV8qYdd2tl0t4dh
	PHdersFn6coAChJvEDAaZpfAlzuL23BhqqqeyN3T2QUxe6yt9eECSOBviHAtx36BkyMzH8qe6J5h3
	vgzEFK/mkZezGW7IoKQqXor1R6z+11M8ZlyANpa1s0b0mOU+CCZNeVbIImF6tt/QjXqRIXsbAgJev
	etgj3GQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5HZ-0000000DkRg-3n0C;
	Mon, 29 Jun 2026 06:15:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5HY-0000000DkRK-0CxO
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 06:15:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NGux1771372
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r2B+SEBRZM49En7lUIrzDje3vE8zXDCU9Jc
	5UdMhRfI=; b=OIxdtzs6HgI+UVVC5WyY75CCcqsCNU0KdWi6TSq+hA0C2KzbjHi
	G6IQ57zUXVRsC4Q1YjUXRbDy9sKL299gTYv4wWx1TJ0JQ5iPRO8WY1eQDuJtrb5p
	jlrNgt2St1rFEBnuo/o8kxPyR2Cl8HiiQjwiaCfjgaC1s0xEsdESXn5xjALYiLkK
	FgZfKnKVOu9ZHWq9NS9JEqxEPam305R2X7v2VeamPE9C+W+FbNFZxtAtN8KyY3jx
	HQs2BS8fJJ8t5YiVglCnct1T8vtQ/UkS9G41g48LaZWzdqTXz9F1CseZrd1MwVj8
	Htw3p29u+Pal8c2LNOAzptISZLJa/zLuz9A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumsy1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:15:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0a27ad86so6978950eec.0
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 23:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782713746; x=1783318546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r2B+SEBRZM49En7lUIrzDje3vE8zXDCU9Jc5UdMhRfI=;
        b=J74UYIysdUfiaxm64emh8YZ9+3DbkSJs0AcWvk+vUvUQJSx2j6kXndkrYlz40d9nL7
         rT/fKHhV6hDhzYo5SPE0bC9NUONWC1rDdZHbLK9Z4e3aGM+Q976Rd0YZ4Li8r6Ymigkh
         LYQM/PoDZOq1uhDFsyYgAFJNSm4O2GmFlLsPWzPwpqt4lMbnJQsVfZrngsIzZal5CZr2
         GbmMuyzKPkeRQ4s0JCyqi+tYV1fiZMpK6c/vo7b+oM3QrMOkEHHHIEHhYiepxbb+niHJ
         zcJk/K5EsFZAPO6jSrnGOmbYmHMcxFFs8YNW+pJJUpAs7/HuAZovR4Od3OuGp0/oi+IT
         gmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782713746; x=1783318546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2B+SEBRZM49En7lUIrzDje3vE8zXDCU9Jc5UdMhRfI=;
        b=cj4fGJUJ4lAQq4RUP7GnkAgDlAZdGXmAfg7FUCWqQ4Ng9Lyb1mqH3d6upSaiK7PN1p
         yKHBL41nIvYmjfVD5i703eOlUAzwB+StLZZPJ5X0N4DtdkepjIPlPRz7FlZBuLDj2k3g
         xsxlnwBCKe5RSe9jxNywluQMHbwjXrb0C73dG8pyAIw3uQALr0XmmcKX6vut1TmH4WfY
         0SZuTqV+1yZjyhZmVWZpcox60IVGL/QWFU79TF20ILgMWt+aUbdziSw9VlK1Vq+SPA/I
         zmOYaLhE7qMZgWQ3jDf3Skg5mAU0MBnBap6uy7PMtVbIduqXOCLp2T56ApKkHgwlGxk2
         Dh7A==
X-Gm-Message-State: AOJu0YwvUWa3JUF4Voqapn65N8K7DbK2x0Z/xcfe5LIgH7li8YTINpuo
	26UPgrLjj6f30/K4MzBFpDplZvweoJ9FJnda1ed/cIRdW5yQzLbJ0K2ICIfomwyysWJ0GDr0v33
	807RpEKxkNUM9w1DXJap+1iPygFqPfKPXDb/jTwIVf9Yf0Q/FTCt3Ri7iKCtpHkbf
X-Gm-Gg: AfdE7clXqA4T0cINPlDdSjKm3JF4fi8d+gqfU5VT8C0DiGc07qQtSTIe7jOwMCwl/8Z
	kqN448vMiVtAodD7Aa1++y76blgo9sZpJu8tCJAReIRrRIkhGboqPUY96URXIsWAsGaZIW4KQCY
	Nn1Fw24Itzib0HHj8TVrvfalbjPTG1P3Yfa6LhbfdEET4b0RXKzgw6eTkB3y4Fe/s04bhfL26F1
	zZCwd2CpGzhrSjj9JfQ44V5tWvK9IhHsSPIq2LehxzyU5x7CZ4JLAB/W45lTPE6vDIl3imskVkq
	1z06vWcSaVeR6Jr5pTnUzAWf6XF0Au4Vrh1Xg3IyIVUJ8igasOvIBUJpCsn8UJ+h72enM3N1dQw
	re6PnXuqNwlueqC6C2eWMjGAPpJXiLL/rfJrgFBZLcxdwyicDgS5A8pd/FOgRFoOpG/0=
X-Received: by 2002:a05:7300:8ca4:b0:30c:a942:c913 with SMTP id 5a478bee46e88-30ca942cad2mr8937507eec.13.1782713746433;
        Sun, 28 Jun 2026 23:15:46 -0700 (PDT)
X-Received: by 2002:a05:7300:8ca4:b0:30c:a942:c913 with SMTP id 5a478bee46e88-30ca942cad2mr8937479eec.13.1782713745832;
        Sun, 28 Jun 2026 23:15:45 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm44682520eec.4.2026.06.28.23.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:15:45 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next] wifi: ath12k: fix rx_mpdu_start layout for QCC2072
Date: Sun, 28 Jun 2026 23:15:28 -0700
Message-ID: <20260629061529.1993932-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1LuSkPmM2fLHYy5997ZmkikgtSJwLbQt
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a420d93 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lA1hHB6PSS1hPxJoZ9cA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 1LuSkPmM2fLHYy5997ZmkikgtSJwLbQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1MSBTYWx0ZWRfX9cH8QxFnsqSU
 qcw36Z58QTG0M7K+q50J5jOrzYyuprxOYz2FOCkmUu+CvDrs2Fz4+SZply5BWbjeq7t3rgmZk99
 OWWNW77xaY+Ga35c1uP0LG2s8uXyX9Db+HuIcwRCH73AR/Wf53FGSENMEWAzimZHLFVVMR1EkeF
 loNCbqMlm2hspUgUV97RmaMde+pEb/kqC5d9B/KDVZaPYy5aLZ5LLAhSi4nxQ5qoYTsLzeenpxk
 rr8Gx7TBbkrFoppNn1njzs8D9ZfJs0gpnBpC7Z0Al+FmO9vo1bGk+IptQkz59wSPb4ppTa/2vVi
 /62ekNp55nnfsYdCu7fSHMFqt5TE7s3amTMsw9Cj3CCJCVWLC1LHgAX+DrPlxWf5NaHUVHXko8s
 XSmZ4yKaJ2dvcNp77HVBYVm8v92wF+i5MxsU2tK8a1rN3dGL8RwDfED8nySSsnNt2ZqmPBrRZdr
 nsyfT6CmeiznwAksmEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1MSBTYWx0ZWRfXxawqq4lsouHF
 LOW1eInfpRUj8MV/k+gQCIU8LXp06ZwnIuGK44G7d7CmHf8lO5kJurt7/eZlh/wJn36iKsRpmRO
 3HIlGLx2TD0Zu0e+q9u6OMZtougJKRg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_231548_118361_FEC45502 
X-CRM114-Status: GOOD (  12.24  )
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

QCC2072's rx_mpdu_start TLV has a different field layout from QCN9274.
Reusing struct rx_mpdu_start_qcn9274 in hal_rx_desc_qcc2072 causes the
RX datapath to read the wrong offsets for info2, info4, pn[] and
phy_ppdu_id, producing corrupted sequence number, PN, ppdu_id and
mpdu-info flags (encrypted, fragment, addr2/addr4 valid).

Add a dedicated struct rx_mpdu_start_qcc2072 that matches the actual
hardware descriptor layout, and use it in hal_rx_desc_qcc2072.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00188-QCACOLSWPL_V1_TO_SILICONZ-1

Fixes: 28badc78142e ("wifi: ath12k: add HAL descriptor and ops for QCC2072")
Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 .../wireless/ath/ath12k/wifi7/hal_rx_desc.h   | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx_desc.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx_desc.h
index 0d19a9cbb68c..6d69851e529d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx_desc.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx_desc.h
@@ -140,6 +140,38 @@ struct rx_mpdu_start_qcn9274 {
 	__le32 res1;
 } __packed;
 
+struct rx_mpdu_start_qcc2072 {
+	__le32 info0;
+	__le32 info2;
+	__le32 reo_queue_desc_lo;
+	__le32 info1;
+	__le32 pn[4];
+	__le32 info4;
+	__le32 peer_meta_data;
+	__le16 ast_index;
+	__le16 sw_peer_id;
+	__le16 info3;
+	__le16 phy_ppdu_id;
+	__le32 info5;
+	__le32 info6;
+	__le16 frame_ctrl;
+	__le16 duration;
+	u8 addr1[ETH_ALEN];
+	u8 addr2[ETH_ALEN];
+	u8 addr3[ETH_ALEN];
+	__le16 seq_ctrl;
+	u8 addr4[ETH_ALEN];
+	__le16 qos_ctrl;
+	__le32 ht_ctrl;
+	__le32 info7;
+	__le32 res0;
+	__le32 res1;
+	__le32 res2;
+	__le32 info8;
+	__le32 res3;
+	__le32 res4;
+} __packed;
+
 #define QCN9274_MPDU_START_SELECT_MPDU_START_TAG			BIT(0)
 #define QCN9274_MPDU_START_SELECT_INFO0_REO_QUEUE_DESC_LO		BIT(1)
 #define QCN9274_MPDU_START_SELECT_INFO1_PN_31_0				BIT(2)
@@ -1492,7 +1524,7 @@ struct hal_rx_desc_qcc2072 {
 	struct rx_msdu_end_qcn9274 msdu_end;
 	u8 rx_padding0[RX_BE_PADDING0_BYTES];
 	__le32 mpdu_start_tag;
-	struct rx_mpdu_start_qcn9274 mpdu_start;
+	struct rx_mpdu_start_qcc2072 mpdu_start;
 	struct rx_pkt_hdr_tlv_qcc2072 pkt_hdr_tlv;
 	u8 msdu_payload[];
 };

base-commit: 1547a99cd8d8c1ab3e04dbd92b72b3b5f7cb85a9
-- 
2.34.1


