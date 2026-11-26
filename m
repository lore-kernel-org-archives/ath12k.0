Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1342606A6A8
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XPUSweCp;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5fr5c1B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F/z1H9kT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=; b=XPUSweCpoZW4Pq
	odYSyCB7z3SXXCkfxP0dJ7TAprhw4MTUlTBZOm4YJ1XQc3VXGMd/w7srz7I1FDX7yxHZpexBvQR+7
	aLRFRD4c1pXKugni0zauMWqeWk1mK0abBC1pxKv2nQDodJn+WJtB8PwAde+w3nf2voOKD62gaHVql
	LHHrSZ/MYfT+niNeQyNZUoo9GapwsSAmFiK5mSU2mTQtST+RWD2pmC5MLo4n1WtC2QKyeEgCRsFBX
	/RwD1ggLmNf+5TrhUl9VtDMXSeo5GuOjuAfj5qbBugeAGndbjFFkHAg9lK5HqjRYxc0+UQnIf8lIL
	JeFfZp21d5P6Y4kOdZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVfB-0000000CX61-1Za4;
	Thu, 26 Nov 2026 09:21:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVf9-0000000CX38-0rTB
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 09:21:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8ohT73537775
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WnvVKxUOEbs
	BzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=; b=O5fr5c1B/l0K8y5cFs3KJrfBT0+
	uUAWKuI82Wn4qamkjhwMit9+hn6HvVoXz91FRwqOzxMLeOyTMvKy3qnX2WPRn8MG
	zUEr7kgXZTXhq9u4sMKiXaJmElq4BYtvfBCNSS5M4RMxYukplUQ2eNdI8yStT1DQ
	MbnXQ7J0r4HVmmKDRR+UUNCdo/WgSG/GxIYcBH2MQByybMQHf/7oHHdtMzeF01Z1
	tI5VgwvDA65p64QwSBNGYIodPUgogZLVq7gvnjrul0bNa/zKiKORhBs/qo8t5h+g
	ySPMmhDOMUjw/4pARVYw1w1f2JmbyYc+/qiKcX3kmAlqhLWj6l7LmYpcrJw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm8047h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 09:21:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b6463f95a4so5560007b3a.2
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 01:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684865; x=1796289665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=;
        b=F/z1H9kT61TokAbRqM33kKeoaHQYckFKd3dq2B5B45V7rFXvs0FYWmBnKN4qMbYXC5
         Cnij7PUddNJpm1AFbqZszG9pHKvXd9W4CsUGyzyenu1UX3eucWo4A5gjh/Y01Ogzi7lI
         22H00VdzeXUQQXtgeS05+ZiuoerxN36KbFCyn2U36oh8I1eG8+RgdySquLF1kNTTP166
         yK332X02JxZ/LVTCKcw3UsZEjQoYnZ85lbnDKk6T9LbJcWLGp35cc1VBNNUZzbiAPBC7
         9M8CJNCiy4QotinmEmhFcu9oyR+I41LCikXG4y7UfPelHsdYbtUgzVjVCmGW7cX0rVHJ
         Mtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684865; x=1796289665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=;
        b=Uqd5DLlU6wiiLHKeUtH8XjJSzkccHJ9DKH+HcIH/3QD68vT8y5sGZN3mHEm4FAWPhC
         gxrxPRq53CBoXys8KEGX3xZUAlVjgc294202NiQ7r48WCsHHhTk08g57l9pQuVXiTKwT
         hp9bRawD0qc6oYIYzsSWeJoh7n3PvaiR8vGd2nuhhYI5g+wy3wnhxtOKElhFL/PT7VIq
         i1SgpGfzfsMRqBnoRV/BvZ/KP6jMFcZkSUvXDzhwBUiiHLXOQCUcs3Gz8clFMeQ8mKq2
         ghKJv73m4bBTn1KN95g8KVazDgF2VdRHdSK9J0b7A9cHfzCgIQhvMGLqNPVFDd7JJXaX
         wZEQ==
X-Gm-Message-State: APuU4Z/1ySnvcXVjsOrmNIvyw7XIEvpeMc1GtDwfMpa1/PDVo+r7hjJF
	YYroUJieJxHD8+VDSuBkB1crVkGMQBR/Qe1BhnzKx3g531vpI34Lt2OHcDRENbF+2Pt/AbAkHzf
	MAaW/3M8Cfl3pjodl51o0FSaRC+lmcELl6MJYN+xtBqV/RBrXIuJnQk03rIITmZph
X-Gm-Gg: AZFdTZctaib9rWE7r2d/zVxp1rRAgRlnNd9r1AQ/imtePuoKG4OH5YFJqU3zALiEtjn
	pW2LjwGcbaBEHDzAugapWe4IuzT49Y/SFAqqzHGrC8S4/mJIIoRei9Wf6Y1I6ikrRxJ4MhegZYR
	kOaWkCiIvlT67Txx2C/xIVQAHY350INVSRxNEci5LtX8CbOVzGp3nqdZlrkXTcXS+ulNHKAse7g
	6BdGy6seSbl7e0wTcNCufWUBEHft2hasFsGzNMdMjfOO/LJSuflBMaAIZgrixJh7FvDYxhX7//K
	GKdP8obUSgerzD/kSYb2eYG1sDl3UUWx1nRLGtY51BrV9SFt5RsGH7HYjCofsAs4MhqT5vRajom
	P+gDuLpxxLxVNtfgitj0lZG1AgHuVvhPDEYJQEm81Rg596nuZ+B2lWH8tvUHDub6TUi2MgXRicR
	TP7+urOoNybgboque916fkgie/UKGy5LE=
X-Received: by 2002:a05:6a00:1f12:b0:8a0:3ed7:939e with SMTP id d2e1a72fcca58-8c87d80e2cbmr18038863b3a.60.1795684865214;
        Thu, 26 Nov 2026 01:21:05 -0800 (PST)
X-Received: by 2002:a05:6a00:1f12:b0:8a0:3ed7:939e with SMTP id d2e1a72fcca58-8c87d80e2cbmr18038837b3a.60.1795684864637;
        Thu, 26 Nov 2026 01:21:04 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:21:04 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 6/7] wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
Date: Thu, 26 Nov 2026 17:20:36 +0800
Message-Id: <20261126092037.462830-7-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FEqZDe5KmQuKiR1vXGEc6C27yq-2i4bb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXzN3oOK71dzxa
 2ba1Wl6eFym+Bqn/25SCd5nsFxzYUof+TsW9ykPznPcFdkCQm8rrlSpBaTA1JpJK5hWDQvgzTs5
 C8BtgJlCsVuFGK13JFnUzEUNPqPzts4=
X-Proofpoint-GUID: FEqZDe5KmQuKiR1vXGEc6C27yq-2i4bb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXwGsl53ifmf99
 wOhvsJVgAv8+sIcYZ83v8ch7OKHvDfKKftn3F03k45t1QV3Vzm5X2ZCm7dVnCgawAfGwrh4/ZDe
 7xMXt6A6irIw/p7OwzW+j/gPP3IGgC7gu5kxfOueKx9pxV2otMTnK7YHIA//gOZ0oNtBMtDr1GB
 ztVscJoNGTNviN5vhBcoI/WT+5Q3FpwiMKd1nlQyishkvneTWMdFKflZ03N57b2GKGQnWJAsY8h
 Ui1wIDSF5Vv86mB2igVa3bLQy+zFQQU5oSr1bqLVB6pBsMH0EoHrtARS/H1U09uNvvt7B0h7O/3
 7/G0RkCtTaAMC/77Oa3URhEDfZsX3HxVdQ+3xEuOERXz9+S4xpad07kZ/eUtg0xhVgOTBaiX6Qq
 jHDjZXQGrM3miSYMUsJWeoitIPthyKt+qcHDJ7g3j5QLHdoeyiHgd+ieLunb9mRZ7RVHij3ThA3
 IDEP4p0ZY1OulevWtIw==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b07fa02 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LZTIgfvDWzmdvsE2OGQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_012107_374391_BE744F75 
X-CRM114-Status: GOOD (  14.30  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath12k_mac_mlo_sta_set_link_active() fills the vdev_bitmap and
inactive_vdev_bitmap arrays of struct wmi_mlo_link_set_active_arg, and
both arrays are sized by WMI_MLO_VDEV_BITMAP_SZ. The bounds checks on
entry_idx, however, compared against WMI_MLO_LINK_NUM_SZ, which is the
size of link_num[].

Both constants are 2 today, so nothing changes at runtime. The check
still has to match the array it guards: if the constants ever diverge,
the wrong bound either rejects valid vdev IDs or allows writes past the
end of the bitmap arrays.

Use WMI_MLO_VDEV_BITMAP_SZ in both the active and the inactive vdev
checks.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e79a9e55c248..d50148fe761d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7616,7 +7616,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
 		entry_offset = vdev_id % 32;
-		if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+		if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 			ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 				    entry_idx, num_mlo_vdev, vdev_id);
 			return -EINVAL;
@@ -7636,7 +7636,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 			vdev_id = mlo_inactive_vdev_lst[vdev_idx];
 			entry_idx = vdev_id / 32;
 			entry_offset = vdev_id % 32;
-			if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+			if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 				ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 					    entry_idx, num_mlo_inactive_vdev, vdev_id);
 				return -EINVAL;
-- 
2.34.1


