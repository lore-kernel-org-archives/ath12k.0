Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8358F606AC94
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lDrV73wk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BZNvS6p0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZofF8Moh;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bviIE2bl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=lDrV73wkvH6cmw
	0HZS8Bx+w6ev2McHMGOg7cqwJtN56PRszGkSVccETU+yw/oA5Jvx637rSvwT/DaiC1LumkSHcKHfm
	CMqdZcpY6YyXX0vvMHoiagSjTqoBzzw+JGIYlezU/VXwg0apECnMLvzjSVsQkJvBJxZYXVV5U5pQ4
	2Mr6nS//bGGO8AvsY5JZUmjUiG+3UlwTdVGpZ06HzhiEYJoa9+4De0zjpM87dCs3nvK0qcvI9H4B8
	smiSt2llewrq0A20FxfHYFR9Z+YnPYusq+CAryzU0Pd58wozeVOiMn0b9PPL30iuIuBCAkX/FWziW
	EqdtTNq/h8vnXzVQgoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I7-0000000Fgfn-0rdo;
	Fri, 23 Oct 2026 07:02:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9I2-0000000FgYl-3mBO
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 07:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=BZNvS6p0VmlvCyVa9drxZO5eiF
	0oOBQ72uiKMlM4WERR9b50srrY3tj8Ryp6plc4Fs49MppRKyRdTNcYDlLiC/jD52iuDZjN5q9bNYV
	8UBSgbGuX6DMLllxwVAEWMPbcLPOw+4BxKg/uF7WMBvLvnmGrXAIQQvMw6NSDYprTwDIm/u4nvVsb
	dbkxZq8qijFlQTMIH03U/lnU58Lgtpa8288wYhlouZ6SSGXop7r2/CC7wLOWkWdU0S2DhuhP6vPXd
	ymUVxEnlTe7/hmF+IpzUSDbJuV9ZxemPecezJoZSEAJeb4EyF9dgDUEZFk62lawjd5G1J1gVOv0lT
	+gqgkZJA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Hn-00000008yDI-1hi8
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:02:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F7Ug425651
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=; b=ZofF8Mohc+USW1eI
	NDFrJvaaQSRAQsSPoHSy7cpknJ1bfuCth11Q0ARVxBr916UiFOSYxyLIywCyZS8c
	EExb1vL98f9mBJurk8W3rL57ammW8yryZRVgHFLwL90C/YHwz4rw3PeocYmh+cIF
	hrbcMPkVqKgo0EMJ2tFl0eZV7VO/VEj+h+/qGk7dfc4klK6KE1i+cjNhKCfAt/n9
	CgZ2mUC1FyeKmWPi1ZKLkBg4BdOsABv0IYfE+7S8dLJ692DDRJPuLgpNae64B5T8
	J50+bV5STkXSPKQyjh3uXpuUlGv3naULoEmaefn3ZYsiQq3/tneVE5zjv8g/NX0s
	T3aysg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms2bf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad98380ccfso904894a91.1
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738913; x=1793343713; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=bviIE2bl+nrq8E3oR2y72MobLajsa4LXCqcspMOY5Fo1G13hAU2MHgci4MGXWjNp7T
         fMR5QZf+6179WxNvPhmSxkpswVvphtjojbskbMHY5Poi6M1au0fQfsby3bPaLjaXuLQC
         UGSX0pQadtSTTfH38daOkIBV6/ixWbWFbo95D0zR2KeZdOOq0jdRANiQ5BLkC68QDHdm
         UmvPrncg/DYbj2dmAJPr46Gt52tAeIctopqMxK1uy3lRq8GJXXeTd9KEvHo3Cm/HNmpM
         HY5BbmTvsLrb7wFMWXNRagRgcTNMjWtSoQeljiGu5l0MaxFNO6n4oNfQRkcXY1fW+SIu
         zzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738913; x=1793343713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kUQdOW24c5jNgScPxlXh4VzOb4yzLmXbjVCRfz9C3I=;
        b=rl3h+SXbfgvLPHoF8yREcyKWJAZ85H4C18zfOn1Bu3kmpLZzluIUWmM6iFD+GdgALg
         vraprxFuh4A71syVKqIPlKGF9zzrNeiJ8pbAmVOeN+BpIVRlBk3X29/dBW6dDPHmRLDm
         IR6R4E3kLPJybArFWiRYeM1ozY70li6vVu3FvYKtX0cRurXWVV3vi8qKx/Z3M7h0f8U/
         4ULS1/KoQcInGsyAdASb4SMJhUUFiWg46Jm0moAafHv9o6NbCbi2Fxajiij1hHb/eYy5
         SieIdtcBkJVYVuZ8hJaHtW7u8dSYfQ2LqTz4IBQDS+NRitN5bck6kra6n+cVL+kOPfAw
         Kcyg==
X-Forwarded-Encrypted: i=1; AKwUvBwQdcQs+AonyqpTitbaCA2RWSJgafDVwWC/Ti6NoZAUqHQfG1Hwn1tO+a32URcR1rrJZODOiYc=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5EewBygXXdQ8VVo/iTwpP7BtdOEG1oRoQ1Km9pzkPHwqeJXj9
	3p2365o7YGUbxXx7bB3SUjmFpIVEScX47qMVm1TSgKEuGwo8yQc3hxPsCeH2+wwQ4EAc/CG4o00
	ewMtA+ZqvKIqhNtZDK34kbpT3cfO+HanBnr8bhLDmYXnaj4SDR/rMpmcj7N4M6ooT
X-Gm-Gg: AYBFou096Rp+D+oVVFqhSEmsGLF9wfoCKmFlzz4iEf4Sn0TadFqHOlhoW2gkdXMeryh
	NLJiLBS7mjoPTJdjnE9UfqZB2YALQ2Ak7ExPoDdN/ciPsU7owtZwStSGd7xwCd9fBALQf0tpxZa
	DsvODNRzucNnE8WWiBLjcBP5m+rft5qeV/x+202HSkqkzUWMKbaGqqp0sLLo3XYWrTEyDoPlc8Y
	LC3HjSdPbpv4wTMsLoK/UtdScahcEBBzKrMMhpPtWiJRtZbdOm9rXPISgD5nJ/dUxpGEr2Wgdzy
	5kpPacZDxX3vRN7Z36HF1EzmtxERohs0VMnL3b7TRii0cMbSXYZWzzSi9AKnkxYVcqts5K1rrJv
	wrFnEH0CR4i5vPHr+GZOOP1U/grQogfc0Fc8vsluOyTjJ3rEc2wwF3mLTbQSM5qsKzPi821f+S3
	AdJ/FVKIRW7tjS0Ym6UNPqig==
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1184632a91.37.1792738912778;
        Fri, 23 Oct 2026 00:01:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1184601a91.37.1792738912170;
        Fri, 23 Oct 2026 00:01:52 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:51 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:12 +0530
Subject: [PATCH ath-next v3 09/17] wifi: ath12k: add support for unified
 data-region memory allocation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-9-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXwwRa/nKqVl1A
 iBn2MtCDA7pGTutE7tSLUOGpPerXaAtc8itwuX4lrhiMtl0zF6tQlYU7KP7FnFwpMOzMdUGHrPi
 4isSiuXZ7lgGBtWEgmnBJygPl/Dks29sd1EZjPYj/MK8BwFMoSULKx9p0Jf9fEcy8/zE9+LA2Hv
 8caBeLSF5Odhd2yNpWsMc8aNyd4xlcrQt7ybuvSyCVBXpGEATNIigXFCDIpyZTso3DiYRoFTDLY
 V4gUSVB/jP/X0l+x384fDQcMpTdKLU0C9JTJxuGPcEODsWfVwpgKyzNo7L7Ts0bHcF1Pk3wur6m
 pVdl0z3s7fk+nRHKNzL9Z+ueoLcoQJrFy/Tol7efY9MQ9EyUwzJc1W+GWTlJrcTxEV6q8572vvi
 gvMivXmEqyzm4BOmw2i7Lh5ztnz3h+xCIxgZ4YFRQ0ERtFZ4o9wwXD1INpEfMVpiq/L/g6OAIO1
 seKQuG2/8EW9Nh8bjpQ==
X-Proofpoint-GUID: quZa1rsprB_VHZO6P5sK_WkiTZUHeH6E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8Edz/bTa/+rA
 y7gsBTCldF+wab4juHq7r6botiXHgTUwRdyC++N46hFY7rfoxiZ76Iwy4f0RtBI/B+qn3iWwedl
 +Tw37Xu+IzC/ex4iH0Souusn0pW+yqE=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb0661 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iclRB15sEzZHjfpwsoEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: quZa1rsprB_VHZO6P5sK_WkiTZUHeH6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_080204_358288_B1083E27 
X-CRM114-Status: GOOD (  20.67  )
X-Spam-Score: -0.9 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for devices such as QCN6432 that provide the M3 and
calibration memory through a unified data-region reserved-memory
node. The QCN6432 device tree continues to provide separate
q6-region and mlo-global-mem regions, while the memory types
mapped to M3 and calibration memory are allocated sequentially from
data-region.

Track the allocated space using an offset and allocate each required
memory chunk from the unified region.

If the data-region lookup does not return a reserved-memory region,
fall back to the existing per-memory-type allocation scheme using the
named memory regions such as q6-region, m3-dump, and q6-caldb.

Introduce a helper ath12k_qmi_map_target_mem() to initialize and map QMI
target memory chunks.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 83 +++++++++++++++++++++++++++++------
 1 file changed, 70 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 817bd820623d..cc488cfe2b2f 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2842,6 +2842,26 @@ static const char *ath12k_qmi_get_mem_reg_name(int mem_type)
 	}
 }
 
+static int ath12k_qmi_map_target_mem(struct ath12k_base *ab, int idx,
+				     phys_addr_t paddr, u32 size, u32 type)
+{
+	ab->qmi.target_mem[idx].paddr = paddr;
+
+	if (paddr) {
+		ab->qmi.target_mem[idx].v.ioaddr =
+			ioremap(ab->qmi.target_mem[idx].paddr, size);
+		if (!ab->qmi.target_mem[idx].v.ioaddr)
+			return -EIO;
+	} else {
+		ab->qmi.target_mem[idx].v.ioaddr = NULL;
+	}
+
+	ab->qmi.target_mem[idx].size = size;
+	ab->qmi.target_mem[idx].type = type;
+
+	return 0;
+}
+
 static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 {
 	struct device_node *np = ab->dev->of_node;
@@ -2851,6 +2871,48 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 	const char *rname;
 	int i, idx, ret;
 
+	ret = of_reserved_mem_region_to_resource_byname(np, "data-region", &res);
+	if (ret && ret != -ENODATA)
+		return ret;
+
+	if (!ret) {
+		avail_rmem_size = resource_size(&res);
+		for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
+			chunk = &ab->qmi.target_mem[i];
+
+			if (chunk->type == CALDB_MEM_REGION_TYPE) {
+				ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+								chunk->type);
+				if (ret)
+					goto out;
+
+				idx++;
+				continue;
+			}
+
+			if (offset > avail_rmem_size ||
+			    avail_rmem_size - offset < chunk->size) {
+				ath12k_err(ab, "failed to assign mem type %u req size %u avail size %zu\n",
+					   chunk->type, chunk->size,
+					   offset > avail_rmem_size ? 0 :
+					   avail_rmem_size - offset);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			ret = ath12k_qmi_map_target_mem(ab, idx, res.start + offset,
+							chunk->size, chunk->type);
+			if (ret)
+				goto out;
+
+			offset += chunk->size;
+			idx++;
+		}
+
+		ab->qmi.mem_seg_count = idx;
+		return 0;
+	}
+
 	for (i = 0, idx = 0; i < ab->qmi.mem_seg_count; i++) {
 		chunk = &ab->qmi.target_mem[i];
 		if (chunk->type == CALDB_MEM_REGION_TYPE) {
@@ -2860,10 +2922,11 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			 * Once cold boot calibration is enabled add support to
 			 * assign reserved memory from DT.
 			 */
-			ab->qmi.target_mem[idx].paddr = 0;
-			ab->qmi.target_mem[idx].v.ioaddr = NULL;
-			ab->qmi.target_mem[idx].size = chunk->size;
-			ab->qmi.target_mem[idx].type = chunk->type;
+			ret = ath12k_qmi_map_target_mem(ab, idx, 0, chunk->size,
+							chunk->type);
+			if (ret)
+				goto out;
+
 			idx++;
 			continue;
 		}
@@ -2904,16 +2967,10 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
 			goto out;
 		}
 
-		ab->qmi.target_mem[idx].paddr = res.start;
-		ab->qmi.target_mem[idx].v.ioaddr = ioremap(ab->qmi.target_mem[idx].paddr,
-							   chunk->size);
-		if (!ab->qmi.target_mem[idx].v.ioaddr) {
-			ret = -EIO;
+		ret = ath12k_qmi_map_target_mem(ab, idx, res.start, chunk->size,
+						chunk->type);
+		if (ret)
 			goto out;
-		}
-
-		ab->qmi.target_mem[idx].size = chunk->size;
-		ab->qmi.target_mem[idx].type = chunk->type;
 		idx++;
 	}
 	ab->qmi.mem_seg_count = idx;

-- 
2.34.1


