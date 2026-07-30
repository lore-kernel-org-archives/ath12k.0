Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674E7C531D0
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 06:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEb0MOs/8FE5mm4uvLgNppvWg6JqEKTTlkOk6lur7yY=; b=VJ/Bo/7Pza3FHYFIo4w/8U7/GE
	fVkA/yx+M+eNSIY/SrLeb5QV2it2qu//t+lxSeBnXXFX7oyBffbGu/jrhOBJDSaCLweIhazo8eWqT
	3qSmCAa5r2iLdJR79+dmAp3kIyi6TiyrmDtmzpL1OSbc78Em6OpsSwcI0Yi6PNiKexOrvZNXnteP2
	+yWV6jRqTG8Fm8fTuUeBU2Z0TTAW4kJoHzlouVOL8Xrap4aI33ET9eHnIJwqLe5waan06OhwvWgnT
	GC1Lm1xlFW4sn9oskRbMCyvkbB30qeFgolAQSiAxf9FquHyTvxScKrr14n4TtFUTRLA+zEdanj8wF
	CkvmSJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK5q-00000009aym-3mxK;
	Thu, 30 Jul 2026 06:18:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK5n-00000009avm-3caB
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 06:18:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U60l8A4138774
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 06:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EEb0MOs/8FE5mm4uvLgNppvWg6JqEKTTlkOk6lur7yY=; b=Zq9T4qG7l3qTdM51
	TgrTeecsAk8J3VVlcyb7CjE2mHHMEE71fQMduTYbMoQfa2/G6EoQgeayEblZ1Uf5
	9ICwe3PN59Jk/J64VFcy8mlH1nBk+KcqlTGQmwew+bHnnnv25mmXYQJFIe7gryAO
	f3SHI7qVILf1ER16SxZwalwFsaQMIvk8fuBnB6FwAshoaUVpgc4RAkKf5WYRG0VZ
	wamBdG3jj0WP3YMBPYRC5iOLLB1ez0nwbUp3zJaiJwQJOSKhyAfDW9LQoQyD9UHd
	1MBJxOYC/CNXKtUGyrmXN1LjlbY+PREhvQrgJuuPPf/6QtZsNH+T3Ymjsf91fddv
	Zp6pRA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr0yjg2fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 06:18:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2060798a91.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 23:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785392286; x=1785997086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEb0MOs/8FE5mm4uvLgNppvWg6JqEKTTlkOk6lur7yY=;
        b=kNSi0wIXewT+qJWq5KNeMMuoBaCXpPEWI+hwwttoSG91sOyZWlkPs1kL334jBViCZN
         LBLkiAy1TqZCf1FyLiVmbK+loXFBDaF9tovD601XlZcPxhzSjsY+k60HhWqlNcBB2hR7
         2lH7mOjcziCq6ivqe3mB9pMZPQo6JiPs53zo41t13HQHcKN4Do4/SclyRv35TGpCI1Jl
         eSIpl6vmLtmYMSkHYmZT3eIyi3g6Wfp924vFG7ZNvbv4vuuCMm/NdDQEFwrxU9M+lGB9
         upQsHvYPVD4ygT55YZpMQU5DD9CbF0ODxiozw5eV+0DZgM/AqV9E/3tXAYmc5eMFAue4
         FGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392286; x=1785997086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEb0MOs/8FE5mm4uvLgNppvWg6JqEKTTlkOk6lur7yY=;
        b=VzU7OpO66EzNkxWrDD0GdNHAnAycYscecqS15LJLtogxSFTbYk+GyGJ4weJe2qVS+8
         98Ah7TM4kwxjPc5SN8V4ZdhUCG4BHiqs6KI1kUXcJip/FU/cFOu2MfjuIroTeMHOdfWB
         MwZxXoJqy/GjZQji18pmRj5l4W4y7gApFd9PeRHcewT3kTePiCuHoKYkR3v11F7cUswK
         HZv0IupyHT25MeymYMNbp/HBPNCOnaa/VgN8gEkxBSW7I9Xxf1tlmS1pK8YrgFYWp5u6
         00KU394GsAk8yGD2QwdmrJ312Yq4ioDatpH96q9LX+DDMw5lzMnijgjY5UOFYjOrBNc4
         MOZQ==
X-Forwarded-Encrypted: i=1; AHgh+RodA6A4R77zHOX1HcJ9gD6QlY+Lp40dG9XnKMZ72I+NIOmItJ8VqvG5fZIZH8KI1YqGmhnPzTo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhfbVOpaH/nAY9S5FdvENEmpyJDNysyjQ5JSjHbknDXmzkCDwj
	TZCt5Pvkp+vDUbQC7lzuQmJgPg2HQ96xA+9pg27Dpur0+k+bvm62nIWToiUKTr5csaio2xI7U0j
	fujyjjc/ncnY/sGp6oeppeqmOaPxZ4F6S+fBkUCDteH3jIAGppsz8vRyShuQu44Im
X-Gm-Gg: AR+sD104ZP1Aq6RJ7IA433T20sQBHbGxZEph/vPcRruwXc2sP9Ry6JoEqIAh+yiYdHk
	jSDzMGsUep93Ak6YAiO3iYaB9dC2ctNdjWPg6yh7pJGRF/NpW2hGpM9aNZqLWVaoViRYp1TfjUg
	f6AIwnTmskR20G+0g4wtB7F/1OIaEvwQTOhFat8n6HMoWtP8T3T7C0vgD2GG+i+JbZGCc5CHRuR
	PWsOIyV4DJ/Mb0vbUDwZcd2Wc6ZVoUJyVVCUCd5Yzx2J01TVDevEIc+yz2yRQl8OtNcir0rUl52
	JzsT2HJw8UW50hNnlP9FB9p5IjibY2lLr4vjN0tUWgD8rDqpHzUPwi9iPlcazLA9qU4YjSL9aQd
	PR6kgvQtDRGCTEgGW6Vwlwoce7x3QsqL9Qmbq+N8YzxObTDAzLDQOVw==
X-Received: by 2002:a17:90b:540d:b0:38e:3a8:2374 with SMTP id 98e67ed59e1d1-38f9c031b2bmr1220174a91.30.1785392285903;
        Wed, 29 Jul 2026 23:18:05 -0700 (PDT)
X-Received: by 2002:a17:90b:540d:b0:38e:3a8:2374 with SMTP id 98e67ed59e1d1-38f9c031b2bmr1220145a91.30.1785392285119;
        Wed, 29 Jul 2026 23:18:05 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b928f09sm457254a91.2.2026.07.29.23.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:18:04 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:17:41 +0800
Subject: [PATCH ath-next 2/3] wifi: ath12k: clear chunk paddr and size in
 ath12k_qmi_free_target_mem_chunk()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-ath12k-align-qmi-memory-v1-2-0fef98dda614@oss.qualcomm.com>
References: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
In-Reply-To: <20260730-ath12k-align-qmi-memory-v1-0-0fef98dda614@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 6CJUKp4HSHp8d5-NzHmpVMJZIfg5a-Ag
X-Authority-Analysis: v=2.4 cv=QrRuG1yd c=1 sm=1 tr=0 ts=6a6aec9e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h1d0zKgE2UDthXC_IGMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfXwFdBbv6Bd0n/
 8iYX641PX3R4FapUrdG9u1+aVP38mKNTuE8+HeVGYqqkoAj/Dc3cA+ecczy6yn2w/vt0Ua61Y44
 rqRlYPi2se5D8ZZB4ojgLwdXYorYpRk=
X-Proofpoint-GUID: 6CJUKp4HSHp8d5-NzHmpVMJZIfg5a-Ag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0MiBTYWx0ZWRfX91WlsJhAlMD7
 Ez+RuD7gKmFuV3bz6kY6LecxF0OEfkpBfIv3jpJ097ajAndzGoqY2Iu76adYzebgDLm+8qW7gat
 bhDaFmcDKN3jhKK4n/hdBjqKfm+norqb0mRy5jmfGgmiiM4W9qAgJ3a6Y9yiPIWxOSay8SwKiSj
 PZGKN4bZoJJB8wcqKOSeWkjQs1oFSE8V6bt98GH+prBvNGfOJY9ljv02Rot5kVmmGljw+ZNs6i+
 49LwgChuo2aGr9877FedzT6srmgfrrZasFZe2QMyCTsR64Sel6MYmhNp0RyuiuTU2ZGXyOLGDoC
 5GV4tsokcOhLtkIyoigSyfAEx+wWUL6MNZ8QgTUV4YVS4HaflOt+axVv7bSGhblk4X739j9yzFj
 GgqzU1fN4+V43mwPXVckaVW81lXoh3ViRJDoXuXxK73Sadxmc5VG2n9so1BKUsXDbK+ThDSb1M6
 CAp9Ft4tjDwL0JuU+bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_231808_023530_2F3A8A2F 
X-CRM114-Status: GOOD (  14.80  )
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

paddr and size of a chunk are not cleared after the chunk is freed, which
is safe now since the code checks vaddr only and it is properly cleared
on free. However, leaving stale values can mislead diagnostics and future
maintenance. Clear both to reduce such risk, this also aligns with
ath12k_qmi_free_mlo_mem_chunk().

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index f96d847ac92f..03ec2057ca27 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2602,27 +2602,33 @@ static void ath12k_qmi_free_mlo_mem_chunk(struct ath12k_base *ab,
 static void ath12k_qmi_free_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
+	struct target_mem_chunk *chunk;
 	int i, mlo_idx;
 
 	for (i = 0, mlo_idx = 0; i < ab->qmi.mem_seg_count; i++) {
-		if (ab->qmi.target_mem[i].type == MLO_GLOBAL_MEM_REGION_TYPE) {
+		chunk = &ab->qmi.target_mem[i];
+
+		if (chunk->type == MLO_GLOBAL_MEM_REGION_TYPE) {
 			ath12k_qmi_free_mlo_mem_chunk(ab,
-						      &ab->qmi.target_mem[i],
+						      chunk,
 						      mlo_idx++);
 		} else {
 			if (test_bit(ATH12K_FLAG_FIXED_MEM_REGION, &ab->dev_flags) &&
-			    ab->qmi.target_mem[i].v.ioaddr) {
-				iounmap(ab->qmi.target_mem[i].v.ioaddr);
-				ab->qmi.target_mem[i].v.ioaddr = NULL;
+			    chunk->v.ioaddr) {
+				iounmap(chunk->v.ioaddr);
+				chunk->v.ioaddr = NULL;
 			} else {
-				if (!ab->qmi.target_mem[i].v.addr)
+				if (!chunk->v.addr)
 					continue;
 				dma_free_coherent(ab->dev,
-						  ab->qmi.target_mem[i].prev_size,
-						  ab->qmi.target_mem[i].v.addr,
-						  ab->qmi.target_mem[i].paddr);
-				ab->qmi.target_mem[i].v.addr = NULL;
+						  chunk->prev_size,
+						  chunk->v.addr,
+						  chunk->paddr);
+				chunk->v.addr = NULL;
 			}
+
+			chunk->paddr = 0;
+			chunk->size = 0;
 		}
 	}
 

-- 
2.25.1


