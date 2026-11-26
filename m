Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C2606A684
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 02:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Wm20Cbq;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgyVSNcI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pd7qyZ7I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=; b=0Wm20CbqU8V0kq
	IyLuuxcZgQkinIxaXCgFWy7uTEqA5K5m0L2yRkdIP5PiHQepeiwucP2pQ/+kmPnzZ+Yfdn80R3atZ
	mKmH19Tf/AJGvUF1NtlBEsCVJv3dBrLREpjI5ZCb4eCCmxUy4/Cdikd5Z1uHMMPudH/IE0HOyQZDn
	XpVXlqikOq2wLeesVg8RJP+oKztT31pVw1qmOP/oGYkVq+xGThcEpT0Lv43HedL8hX+ZAgOJN/XRs
	aVUXSzaO5Iey2wpnuuTx+G0QjVCXFofHEhTiAyQE+6729QRlWVfsmlmmMF7t1c5dKDVkWFf08ebBi
	qSrXm/mcjg5o0FEUCyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtg-0000000Br24-1sRP;
	Thu, 26 Nov 2026 02:07:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOtc-0000000Br1A-3Ipl
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 02:07:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAsRW648260
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7s+V4BLd85h
	76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=; b=lgyVSNcIQgHh6RspzqQ89UQ2QQu
	XMfZY/52O7IjCqeJ27QMDvkyGSma42fEn8mQf9K6u2ygvsc5v12tyu3xNK9rC25s
	1MiVn4rYOShsyEEEPCwpK3ldWyQ4oubwLhZzzcRcPUdMyTOc17E19iMcZ1tJZ7Ik
	aPw595S+XMXwLkpInXOo63wScp813UK5a8xHv5Ab69I71uCxXnFRn/xJJ2gGFdxU
	URY9ttIkhniKatib+enng9ECoyjINuQRmw5D/pbWwmqWITBXoybYt2tBra5h614V
	p0fZJp+TCbQo0RLGsvCMNHrthCfRtXVVceg54yQO4S5eqJGjaOTg1pkyqTg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61aht9m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 02:07:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f08196b148so39047465ad.1
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 18:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658856; x=1796263656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=;
        b=Pd7qyZ7Igdt4v/ZwMQpHtpWefnWAqFT4tA682SllkOZFDYyeOlHQQ5xmpAAkB7a1XS
         MN0JQEoFG8XQN5EACwvz8Uxzr0c65rAGt+J+iGewBHPDDvHJNMlPm+nPcyDEW2JeVgN+
         QYfsOl87fe6zy9nIWP8y50xinwsMT1eRuYq7IW3C//sW/SikX88+BybD922coBLWp5nq
         9eu08tT/QBviZ6x7gSsLvLn0yLqrDfTx6edlIQnHXV0cIt+lNXW433I6ZrKz9ujKna24
         oXy1Q4uI7jsoUtmbF+CZzvUvcA21UZSlRQeRA4OI1f/KSggxtkNgFTKCrEF8S29jYIPP
         pcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658856; x=1796263656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7s+V4BLd85h76ihqq+nMlOQ0TvRPx9Tm9I94LPUS5R0=;
        b=L7lWwUd9QsmMgbGnYU5MdUDOMnAWkc5bA15jQarbMgXbEAzaMKrJnZNL/UmwUBw1j5
         XGnYbUy4/wgeQJ4km3VvzJiTqA4nqfCIpEcScE1T5+uQTa8czVnnieos0TdTifHxEqfU
         3EcbSQOitRfc5BJlyWAPdtPNSDvB80d89yW8Moph5rfuiiQqXqrTmcCjbaOQUI0O5XXj
         qhTtgAcKcBVTDSP2Ib05xbGD1+euQAdZMWs1dIN1Oj8a6bt8gGJsmYyHIpJ1WSXMPMDW
         zFu12Mby5LqiuVHO/VsFoLc8KuM8ozhI6BvfjG0yQp4jyWEXYXYPifsBfS4m8O72ucgs
         2Xhg==
X-Gm-Message-State: APuU4Z8/OzeFT3fImcburIAAOs+r6A1xkAM6KG8I6A3FTnb0wJsCx9Xr
	ynYCgNLqneKAICBu78RYy3czoJj9v2ZEMvM76Itc9UTWalTxmxlySk3N4guBrbxlUEzDuF3Qenf
	fX15fvNQAime0+14aqlSiHxvfBq9H8I76oSuzXYtdgX6ie6yneL4dqxHKrxEe3BI6
X-Gm-Gg: AZFdTZchHDZd7JzxCF+WGQISl0jkGRNFYZ3lu0Tq4iD/Zt238EPtIUcn2SoVqT1r7ZR
	GDW2i/OMpr4+DCm+6WcR6fbktHG03oUniPzZN2hTxGp2frZ96wRGr8BUUnJH7mcEZYgNHx4wsNI
	4vZ4ialK5oXPamAs3sgNRKQTzMbJVUEDbGawDXVNGeHzvKLdrgM7u0S8txFy9QOA89XxnO8kRG3
	sPF8C8dij07v6Vlg9uRFYGiAclPW+ckpuTlpFrK9U2rNFzoi7PhpejvTbrrQLABzJV7OL5o3Psq
	86ozz/f+5dAYSN2IObin1lX686JZieRw00e1p6t5anNDhLsWHs34X5wTJ+5aAAKKNXvpJcwZg9s
	xtLtL0cwuRsvTIW6lzUXO8zHx+/T7C2UBgUpAaQpmuNu5I7cSW7l6WT5rvrK6DJxWoBaNjJ0t05
	Bv9BzIYhjFUwc7VylZLyxkuOOiRehSTGuM8DPV
X-Received: by 2002:a17:90b:4d10:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b41c8d4860mr17941795a91.21.1795658855482;
        Wed, 25 Nov 2026 18:07:35 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:3ac:9176:e836 with SMTP id 98e67ed59e1d1-3b41c8d4860mr17941755a91.21.1795658854563;
        Wed, 25 Nov 2026 18:07:34 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:34 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 1/6] wifi: ath12k: encode MLD max simultaneous links as N-1
Date: Thu, 26 Nov 2026 10:07:22 +0800
Message-Id: <20261126020727.3273337-2-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HxVUa7w2h3rW1lOy4ci0XL6K0K9g6VS1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXxWWslrISKSUK
 Kutgzf0CG1pKlUo31rv6vunV9iOifDMiLpblklREsgWONtZA1uTekutR6BCiMKtvYkb+UwbFb6j
 NNeB6UwFPKF/VkVjRzmu6s4XFcIH+W4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXyyG4sh6qy/bm
 MP8G355S/hcKtlbChLuU1PiysL9pxoMlnhoxtrB5/b3Y5LJ5g7tMMKipp7JmNLe3z6SFB4KslMx
 g60xYinjY2c+wEhSojTneizJGhUZnQC3IlqdbIU0YHXtp3rjpu6cECr0MxV0n4RLPCxEYE6DLUS
 9tOV6tH1J98l+ACGOKFsTHG1kreB88gNzMkybOfNlySe5p9pFO+kvUccNMc3OY0hShUsX5Tg+Jk
 s0U9ZSMCufC2xIUYEVBs0H4NJ9EzBlgDm20qKNuP9zOB5POkbIIUcU+KazCj/86QgoFVApU16AS
 T5mIVaZosA2lkNyi2an80V9CvXuosCJHoD2NT41wu6mqNjxUgluSZeAQy2xY8LxC/vgWK+mO5ib
 Vnl22mXBNMj3gqjHBRntw5bL3lGbUNzOfDk1PCFEfqr+qM6CvUlUSQ/PfZkf8zhWI5joBOw94Jz
 rHdUFIz96JkjhBx3/zw==
X-Proofpoint-ORIG-GUID: HxVUa7w2h3rW1lOy4ci0XL6K0K9g6VS1
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b079468 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=G038fZ69IvUhEtWw0z4A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_180738_495152_9EBBD3BB 
X-CRM114-Status: GOOD (  14.34  )
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

Firmware reports Max Number Of Simultaneous Links in raw form, but MLD
Capabilities and Operations advertises this value as N-1 per
IEEE Std 802.11be-2024 Table 9-417n.

Normalize this in ath12k_wmi_tlv_mac_phy_caps_ext_parse() before
storing pdev->cap.mld_cap, so all users consume spec-encoded values.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..d1af43ede2ae 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5293,11 +5293,33 @@ static void ath12k_wmi_eht_caps_parse(struct ath12k_pdev *pdev, u32 band,
 	cap_band->eht_cap_info_internal = le32_to_cpu(cap_info_internal);
 }
 
+static u32 ath12k_wmi_get_spec_encoded_mld_cap(struct ath12k_base *ab, u32 mld_cap)
+{
+	struct ath12k_hw_group *ag = ath12k_ab_to_ag(ab);
+	u8 max_simul_links;
+
+	/*
+	 * Firmware reports Max Number Of Simultaneous Links as raw N while
+	 * IEEE 802.11be MLD Capabilities and Operations encodes it as N-1.
+	 */
+	max_simul_links = u32_get_bits(mld_cap, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (max_simul_links)
+		max_simul_links--;
+	else if (ag && ag->mlo_capable)
+		ath12k_warn(ab,
+			    "firmware reported invalid max simul links value 0 in mld_cap 0x%x\n",
+			    mld_cap);
+
+	return u32_replace_bits(mld_cap, max_simul_links,
+				IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+}
+
 static int
 ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 				      const struct ath12k_wmi_caps_ext_params *caps,
 				      struct ath12k_pdev *pdev)
 {
+	u32 mld_cap;
 	u32 bands;
 	int i;
 
@@ -5343,8 +5365,11 @@ ath12k_wmi_tlv_mac_phy_caps_ext_parse(struct ath12k_base *ab,
 					  caps->eht_cap_info_internal);
 	}
 
+	mld_cap = le32_to_cpu(caps->mld_capability);
+	mld_cap = ath12k_wmi_get_spec_encoded_mld_cap(ab, mld_cap);
+
 	pdev->cap.eml_cap = le32_to_cpu(caps->eml_capability);
-	pdev->cap.mld_cap = le32_to_cpu(caps->mld_capability);
+	pdev->cap.mld_cap = mld_cap;
 
 	return 0;
 }
-- 
2.25.1


