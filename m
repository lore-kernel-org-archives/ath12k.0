Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CE7C43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVuhi7J4Q2IGUBXUFL+C2F/k1v1kbFtd7h8qRD6g0Ys=; b=LKnzu6i5ibMbWaf9t53iG4q6mZ
	6Y6ol3UT0X3bs51+ilbJHNHiLzoaOfTWUzx8hhut2q5scPF2OlANMaeTeEdoDjArmlSnN8b9mamOS
	APIg2eshzVPsuBdtFU4DoHd+lLv8A1o9NsAdceuMe/eBExV09k6D6esNHDOUInI0bSRCu1AbeUuD/
	1+LBqeko5mSAjTow9M9poSU6bbtk99r5/JMuw1N3EdwmYdeyn3apXTtSi9l4vKSJpzmU92hVG85wI
	EBYPDHPyo2rkLIbhrEMjYjlam8Q1682ocBf251T+UZQU7uARmNmGHC1aZn61PsrkKBG4I9rUYaVcK
	tzCI1xGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRqF-0000000Fuyt-25MT;
	Tue, 30 Jun 2026 06:21:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRqC-0000000Fuxj-3sEg
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 06:21:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CZ2c1098056
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cVuhi7J4Q2I
	GUBXUFL+C2F/k1v1kbFtd7h8qRD6g0Ys=; b=NxiFvEiI2flI4xgaVP1z08et8eS
	6io0SzcplPWnXS4BPeV7PVdei0/xk8ih88Cr2b7Mi/D3KAq9QnneD4tOFkHlQANE
	CW0lIFkhhfljGxbZZO+v6aXDYQjWJFChZeCFaFWUkUA/jhtOgLTk7VcZjQ8Ykhc1
	A3OLyShHF9LYPA8PUlkAJdiTs5XvO4EqKXLKLFRrVsoB1g5NfOUhaAhCac4N2Ce6
	uXrdo6GeGu4BgU6YW21Hdp2do324fLWfSFSt61E8FYLkXyvqT3i+4sxYLFOZi/rq
	XcsPBR81PaIRqsvWGimCj9Ttgtp0FeHWKLYL3lkR2bAlNWsjtggNRJjg8qA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ct5kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 06:21:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca1f16e391so7084095ad.2
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782800463; x=1783405263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVuhi7J4Q2IGUBXUFL+C2F/k1v1kbFtd7h8qRD6g0Ys=;
        b=f+6EBuqwC42HXn2K3n43nHygB7XK7VWesbBPaJoGBx6GWjTrjRImVj49H0uZdsdGEw
         QKAIspednwtsFvG4hbX9TLuiLQAPRncrJ1QzErLy+cN9JxF/ujaqGtsDIV+7CFc3NDmP
         3gOaDusLFdbYn5Pd8WlmdZODEzZQv2d33NTlHONUn0rQnoq9dWb8L4ab8rM6Rz/xwcYZ
         m5DJncZY8d3Mh/2nRAXekIJDVCMysohlse1s0MdcDqFrDS3Pper4+uz543v4/wQHvymG
         7hF/PBene5tqlgPLmkqzrKc5CINRdricUvVssk5erh07yUPLNg2hppNL+k3UfrA0tqja
         lkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782800463; x=1783405263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cVuhi7J4Q2IGUBXUFL+C2F/k1v1kbFtd7h8qRD6g0Ys=;
        b=tLzD5poG4FlcR/wKAcncFN03CFhQAY2/16OltYTQYiByfzk9yDODX+Bnd2GpCNDufc
         AVc5Kb/TdcMkJBE11lfLgZF2fHaSxPb9E4Vl0yBw/hfC7ZQdlz1ihDUxKwf6bQrZg/ns
         fCehhkhzpPaJvnORUrggPYNJ72Rh2ggnqdiAIZIZqTV3iVVGkehadFafwPyStvA6aU2a
         59dH9E81M2WX1dTibcXoSVBsU0dmmDhTDmcsMGG3KsXgRkj0DU0xJR9dvkQoGMWvBq1H
         kbBXgeQIyuX5NTCDogKErACldUCfzvtA7s/EQI/9Py+ptyNd9sVytLGZrGqTMQyYTJI8
         M9tw==
X-Gm-Message-State: AOJu0YxgheET64yHzJFrVuEbxGs0khHNjukaDHBJdi2DxL7Gu2P1+I45
	UWU7bqY6dT28lzwSwopXVCrLKQDBkXoNERl0CVO7uE+EPfAAupexxOx+whOS4JHU1S3w4P0bzGn
	TnCoQLM7COz8qfDrJZSotbbJZKfxf0W+K/pqwC+6SeP6S1niKN4QMYY47e92rNQppMjE5w7yC
X-Gm-Gg: AfdE7clrZNWjc6KBNnd0snbX9IXWdNURgOwBaLRlbAoEkZGuBFmBbpSE1G6QNSaXeFh
	6TBk/ZOjlZZUq8YzHzEjnyY/YgI94BxwjT3S5EKNU54yE3sSu614jwewbqPIzliuvJIy6XWo8vA
	lNXqDGC8QyCEWvrLSZoWPml3abyBqa6Awx1lRYBBEyFzqAwVOgOdApEkpFDZOIKJs7Cggbu0PMg
	Tk4Ln3ddDa6C/MO6Ms4i7HDbOGaAzP56L2Vr3YXADGzUmfErQ24fQr28SEHX2mL6HmUgEsqxgdT
	DLGG85a/PewVw6uNK2tQ3O5cqdqKm1+YDpdKc58xbfmdCzm30ECKZAlD7MnibZmQy7uSIAi3Dry
	ofxCckcu1AafUiPvum/pVuk+1z/JBw1pCCPTjSZ69Wj/NoyDncFG3AtAW2MvzgfZCsgNqteEGgB
	S8NLWkq68DDU9ohxgORspZeqxrjRX9Ys/eJw==
X-Received: by 2002:a17:903:1c7:b0:2c0:ab82:6bb8 with SMTP id d9443c01a7336-2ca2d8a615fmr17660235ad.27.1782800462654;
        Mon, 29 Jun 2026 23:21:02 -0700 (PDT)
X-Received: by 2002:a17:903:1c7:b0:2c0:ab82:6bb8 with SMTP id d9443c01a7336-2ca2d8a615fmr17660095ad.27.1782800462171;
        Mon, 29 Jun 2026 23:21:02 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d0d22sm6413835ad.80.2026.06.29.23.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:21:01 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/3] wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region
Date: Tue, 30 Jun 2026 11:50:48 +0530
Message-Id: <20260630062048.1615178-4-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfX0jD1CA/CdAM0
 /iUw+G021WQ+7u0qB6XoI/q+SWBw8zVyhuA2ONhbWC3fa+hDdb+/8ksDb0bxClLdfKCuJ7+OthD
 tP517jwqmGVpH6DqmmMa7qYyOO70+7gIYhX9xew+dvRNMkm4oMk4xJV1mhcxN8MNVxSn8aNI1bV
 OQUyk+Mbch22nn1pJBXeHPEgUKYVhY4N1QikQ+Y9X9TJsQ0IcMfWn0LP7G6ONkXhyLM1sqVV98B
 +69jmDZpDh5DD4nnJ0Ur6bzON9LggI3HgV0AX2Uotffs1YU7wGFX0sTLdw/qyD3pqS1hRzxKaqG
 1YiKBaqo55uAyg9xuXYHM+3PevwDM8F//F+cUDDqq+fobBbC/BfBgY6Nrgm/G6OlS79tXuLwcNU
 tIXxhaHJOGMSNsHl1oOeAYwbzoWJb1dEh4ljLCx7Vig9FM1CVq/p1g6PwbKuqLTiDqo6feINMDZ
 n2w7QGkv3Q5RIqsd6Rg==
X-Proofpoint-ORIG-GUID: f0xmJFjX1MptisfV_7e0fZPM_ReyFhna
X-Proofpoint-GUID: f0xmJFjX1MptisfV_7e0fZPM_ReyFhna
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43604f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=o3RYbcsCsqBjKZiLPF4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MSBTYWx0ZWRfXy6xxD1M+7aHA
 OwYwp+L44GhlyDKnkFeM2fAfTV2lP1d0YQeqYhVhfQXY6uOGqgLft8faZO4FBc8muG7fbkCXvCC
 dFIcxKyww1vlih9u94Uce6FJZzBLzik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_232105_084839_ED57F758 
X-CRM114-Status: GOOD (  16.98  )
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

Currently, the Q6 region contains a read-only firmware region along with
the BDF_MEM_REGION_TYPE and HOST_DDR_REGION_TYPE memory areas. The firmware
expects these writable memory regions to be assigned after the Q6 read-only
section.

However, the ath12k driver currently allocates the HOST_DDR_REGION_TYPE
starting from the base of the Q6 region, which includes the read-only
firmware area. As a result, the allocated memory regions overlap with the
read-only section, causing the firmware to assert during QMI memory
allocation. The Q6 memory region layout is as follows:

		Q6 Reserved Memory
	+--------------------------------------+
	|                                      |
	|  Read-only Firmware Region           |
	|  (Q6 RO Region)                      |
	|                                      |
	+--------------------------------------+ <--- bdf_addr_offset
	|  Writable Memory Region              |
	|  (BDF + HOST_DDR allocations)        |
	|                                      |
	+--------------------------------------+

Fix this by allocating the required memory regions only after the end of
the read-only region in the Q6 address space. The bdf_addr_offset parameter
indicates where the writable region starts. Both HOST_DDR and BDF regions
are allocated sequentially after this offset, with each region placed
immediately after the previous one to avoid gaps and overlaps.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Fixes: 6757079c5890 ("wifi: ath12k: add support for fixed QMI firmware memory")
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 5bf045971c94..6d5063229221 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2746,8 +2746,8 @@ static const char *ath12k_qmi_get_mem_reg_name(int mem_type)
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct device_node *np = ab->dev->of_node;
+	size_t avail_rmem_size, offset = 0;
 	struct target_mem_chunk *chunk;
-	size_t avail_rmem_size;
 	struct resource res;
 	const char *rname;
 	int i, idx, ret;
@@ -2781,9 +2781,20 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			goto out;
 
 		avail_rmem_size = resource_size(&res);
-		if (chunk->type == BDF_MEM_REGION_TYPE) {
-			avail_rmem_size -= ab->hw_params->bdf_addr_offset;
-			res.start += ab->hw_params->bdf_addr_offset;
+		if (chunk->type == BDF_MEM_REGION_TYPE ||
+		    chunk->type == HOST_DDR_REGION_TYPE) {
+			if (ab->hw_params->bdf_addr_offset > avail_rmem_size ||
+			    offset > avail_rmem_size - ab->hw_params->bdf_addr_offset) {
+				ath12k_err(ab, "qmi mem offset overflow: bdf_offset=%u offset=%zu size=%zu\n",
+					   ab->hw_params->bdf_addr_offset, offset,
+					   avail_rmem_size);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			avail_rmem_size -= ab->hw_params->bdf_addr_offset + offset;
+			res.start += ab->hw_params->bdf_addr_offset + offset;
+			offset += chunk->size;
 		}
 
 		if (avail_rmem_size < chunk->size) {
-- 
2.34.1


