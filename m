Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0BEC5B572
	for <ath12k@archiver.kernel.org>; Tue, 18 Aug 2026 02:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s6Mh4rsBhYYdv8SvEYieORTXS4M4H8dESnuK4qRW0IE=; b=oys8SS35Hx1DZfJ6p/8TXJ3MmX
	ZLw60WKj5/2KyOljIGnYSuKvbjrc8kS2FQpLMa8m7Cn9WSNPPxyIiHMPsrK1z9EXgdAtX2EjrVnbL
	/rIKWHlS2LfbmjOjtDacQx80K4qVee0kVv4gbRjbVCT3YKTJOsWcNuMUjmt/slqWTFwzrnyrE/T5X
	gINovFxFtn74ibj21d9I8Hh0b9E8o3LRK7we6RPxEgBmh2MCkN+nbf1nu62XTWE+NUJsAVRLv5wvC
	jV2/pKDMfzMINGIak/jbuhMFPv2+qvmLYrcOJuTizLK3ZIxtF3Z6p2CkVtr3BV1pI3OTevp0kLvlV
	fC+96WNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9BF-000000074tm-2QF1;
	Tue, 18 Aug 2026 02:03:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9BC-000000074tO-4BQA
	for ath12k@lists.infradead.org;
	Tue, 18 Aug 2026 02:03:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkuD03465225
	for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 02:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s6Mh4rsBhYYdv8SvEYieOR
	TXS4M4H8dESnuK4qRW0IE=; b=HIsLnpV7+dSjTg8vid7P8o8ut5RdHRHPKDkF58
	HZlIQfQDyXTcz5DuQeidLT/ub2yzXHvN33Rvv2Wr1jYRuKebkH1CnkciMJRUoRab
	vRnsEMWhGic77eO+g93c0iZvEPOo0oS6pPXezdg7vg2A6P0VxIHVbvM9w/7bksw/
	KwK+OMkigT48D7HHemFMKfE1r8u4JQthFTIGZCD929hGyTy6kibLYvwp3owHiku+
	Yqsyj6UAzO1y67zZkLP5nbXwb2DKM5KqiHA2SSnq/7zWZI9gmDpu3XnqmUUTkk7e
	h8YfL3dR3gq1wwfLXtJEkwtca8sRywZn57mjNw9mn9WaxjOw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611a200-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 02:03:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so95681105ad.1
        for <ath12k@lists.infradead.org>; Mon, 17 Aug 2026 19:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787018632; x=1787623432; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s6Mh4rsBhYYdv8SvEYieORTXS4M4H8dESnuK4qRW0IE=;
        b=gnPDlkX2sM4Mesuoemx2gJzxY5mIMXFod5AEuAivdMuLlRNIqqdQ5htrXIikU5H1Zi
         NkwUBvLdGRJiU1GsHM4sPhm8pi+hZ9V/5j+ixpe3CrdTCGusXcXqK8erBrQAO+HK1OOj
         SEnMnXwmYEmGNp7QrSz2JvjXuiL9Tgl4wMk8yROn6/OSbIByilxfgoN70lB/frg6OEnp
         iaDaAKlIt85lL2OS6EqPRZ3MhDb19PJjpiErYkjeocqSRRkwCmdbN1GhG4WzfVJ/5L/q
         OvInUOqUSilpNxfCw4fzEznRhd7wgqB7ycyniL2HHQVKMQsY/GhJwKCI1FdTTa3A+eBq
         rfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787018632; x=1787623432;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s6Mh4rsBhYYdv8SvEYieORTXS4M4H8dESnuK4qRW0IE=;
        b=Ld/LkYVkyTr9BcCrxzSMiHMxDtMikQUIAPAGwcNwJtP+GjzjZpdD5Bv4Ad1xXpMXrq
         O6Vttx5g5Zc65/FdjC3blwnLsLq4PAWPvQAlhiequOpVfJxqQAIyyF3tYAbswtoE4DQL
         tYjP0lC6EHGOcrGibsAh4COQJf26gDNqBK+qiM/nAHC/Bo81j/FRU6c4vfhYoxLQ0z6X
         XIwnTvYTnE0fSHv1ZIQpuDkab12ao3S8rtf1cjs16nisyFtFOEbO4lzUD8KyXk0eDXlL
         ijC5qKh336IPyV8BMxs29eEHSqFgldsygvdSvP9GKcUVIoxySEaltsKLsGGCQBXzGjIV
         1JMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYyFd6tpa3+4wd1npwS/kDYry2i1FYfYwb4R83GGbkFSNzvmXSUByRmHlrdBV+5szR3bByihM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYyFI3k9hQLp9F+1+ter66ao7IakkldgPqTLh78fjV4I4r08cy
	0nzXdFKA8zIrfeC3qZxykSsJxjeg5Bca4G390M2GKPfLQC0pWL43TxiefjtS54ofT17z0yVeRD1
	EoPfiooaxNMzKawdomidm5/r3W7PISuvJpRR+e96tUnVphoUtMIse9FEBifSJv8zB
X-Gm-Gg: AR+sD11CfcyeWJMGn4v0FA3vtWIxOwhsAuPkuYh0EdrygPopMzEyFud4as8Sts+o5Xx
	TPM+QKpEYqveIuS5LzF8JjrCYVMj9Pewbuue4DAEKTBoyri82kKcqLGYmGrNEf3O6c6ilgfUdC1
	KH984LmFSNJyvLBn9SANd7K6Swz6NKHZvti6lHCuKJvKtlUtdmrfTiqQ2GRw7HUPtNoK8/o8WR8
	ZUIwDndftjD6OqkuhopGkVtt6oaxT9Y0PyhnKet1W4baIaGMqgbzfEXTtgFw15ehUAo5sR+l8rc
	+B8TopnjD1hiH26xvq1LBCp7s0KPBtf2MQD5AZkyGZbr0+cSMFOupnJ3Uv2H0e8BKt4XdYIyUZA
	a7fIEP8y1+EUn/oG9Hp+j8RXeK9YhidmpZ+BQEvw1d/mKOH/Qkk8Obw==
X-Received: by 2002:a17:902:d4cf:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d3b080bb30mr299376405ad.3.1787018632485;
        Mon, 17 Aug 2026 19:03:52 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d3b080bb30mr299375655ad.3.1787018631901;
        Mon, 17 Aug 2026 19:03:51 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ef83d6sm8768185ad.78.2026.08.17.19.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:03:51 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:03:41 +0800
Subject: [PATCH ath-next] wifi: ath12k: fix truncated TX buffer DMA address
 in MSDU ext descriptor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ath12k-truncated-tx-dma-addr-v1-1-ead978969371@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHy9g2oC/43NQQ6CMBAF0KuQrh3CtFTQlfcwLkqnSKOAtqXBE
 O5uw8qFiW4m+fmZ9xfmjbPGs2O2MGei9XYcUsBdxnSnhqsBSykzXvB9USOCCh3yGwQ3DVoFQxB
 moF6BInIg20NJ9aGihhNLxMOZ1s4bf2bpEwYzB3ZJTWd9GN1r24249f9NRASEupWCk5IoJJ5G7
 /PnpO567Ps8nc2P/NMUP0yeTE2lImyElkX1xVzX9Q2+RU7cLQEAAA==
X-Change-ID: 20260811-ath12k-truncated-tx-dma-addr-5f94d897db2d
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 1L1njZwrNh45KF8AutukW3JfvQSgrtVq
X-Proofpoint-ORIG-GUID: 1L1njZwrNh45KF8AutukW3JfvQSgrtVq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAxMiBTYWx0ZWRfX5ox+rbYHRW8i
 yAPvFGNdfFcHw6MWN9DcjgKEUe2Fb3GH/zKTbeTx/uZEHqSr2AuEMct8xDVEs5y4l2wgArC8FhI
 0TAkIGlmlxdYVLGc5iA8ldtOMxAynH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAxMiBTYWx0ZWRfX2sHBMH5j+KcC
 FRHc9DkpgYgTpVLepb3uYmtQh+6bi0KWwIIUhsjY5WyDVuAI0yywCU1vYQxVlieis/JLLiCTr6p
 kj7q2Z/kv2qqWTpLuUajMxIBZl+idRZR6pXdsE2c8RqNT/7NFmNcJeLLLfYoZf3Qk56Fl+ARvrz
 QBOFHFY2R2a3R+gGhcNwK70IWzpoEpkWeGQxN4xcK5j0cwKck9CkADd53hWuqkgiTAlSsEatgLi
 uXEp4A5pxAkjQibgSDlvyepAp/Oi0s4OXMptbxyS9I5I+tdvcf/jsQVEqBW8sLlAcO7RsJOs02i
 U48Kab4DUq+1BPcAaJUIiHbiDVxgxur27hn/rNuleZFvS9L+kZ5CEx9ZbUn2s06GqArdSo0fxPZ
 sSUuLwyV8HRoYk4dJHRdgccvz/BiMEoYVFvHXkSXaRGKFgjfmVY4hZGgZsg5eZ3t8cXxdQpw/1F
 nJVjFQ33+Aq/1XPQAIQ==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83bd89 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KTYYIFTkhO9gwAdvEP8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_190355_297950_F27F699D 
X-CRM114-Status: GOOD (  13.46  )
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

ath12k_wifi7_hal_tx_cmd_ext_desc_setup() programs the low 32 bits of the
TX buffer physical address into HAL_TX_MSDU_EXT_INFO0_BUF_PTR_LO but
hardcodes the high bits field HAL_TX_MSDU_EXT_INFO1_BUF_PTR_HI to 0x0.

dma_addr_t is 64-bit on platforms with CONFIG_ARCH_DMA_ADDR_T_64BIT, so
whenever a TX buffer is mapped above the 4 GB boundary the upper bits of
paddr are dropped and the firmware is handed a truncated address,
leading to potential TX failures.

Write the upper bits of paddr into BUF_PTR_HI to fix this issue.

Issue found during code review, compile tested only.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index d2749de44553..87edfcd3672d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -20,7 +20,7 @@ ath12k_wifi7_hal_tx_cmd_ext_desc_setup(struct ath12k_base *ab,
 {
 	tcl_ext_cmd->info0 = le32_encode_bits(ti->paddr,
 					      HAL_TX_MSDU_EXT_INFO0_BUF_PTR_LO);
-	tcl_ext_cmd->info1 = le32_encode_bits(0x0,
+	tcl_ext_cmd->info1 = le32_encode_bits((u64)ti->paddr >> HAL_ADDR_MSB_REG_SHIFT,
 					      HAL_TX_MSDU_EXT_INFO1_BUF_PTR_HI) |
 			       le32_encode_bits(ti->data_len,
 						HAL_TX_MSDU_EXT_INFO1_BUF_LEN);

---
base-commit: 4fa10e991f77b4c929d1959900a6ed422b9e2ac5
change-id: 20260811-ath12k-truncated-tx-dma-addr-5f94d897db2d

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


