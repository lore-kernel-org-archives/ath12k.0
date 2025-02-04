Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27AFC02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51f2EOU8rD4IqmdPJzdUmHNaP2sswXDBQc7pnwOJIpA=; b=aHZLpcqi9834TlU4LUbs+m7ltt
	KncoCp8RcvGpXG+Gc0M5A3gqIK+aMulBSR9HpVTjoSDGk+p0W7UgFCvQCrxuSg/TPpZ3nexLDsEz9
	PVkV6Jmcm0OZCAb7USmtbtOrXnKhK8ZZcgVciD76rOp2S+aWHmd8SB7prQeTPBlcNmEq+2O3P8lo5
	gYYfHSzKdpATS6nU2o4baH0+RovC76QZivULZphPAlg3FQwKqbcPmsPOTlsAdGCsjWv3EH311wexl
	1VdZXqYUJ12rESszC8Ym7+O58CliTpuWauoCuuTd+vzhwe8soQmqlDvwgHBKY1ChKac+HP3rcsW6J
	iNLXmVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMm-000000012Nb-1rA3
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 17:05:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMMk-000000012Li-1FLg
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 17:05:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514E1g1M032364
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 17:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51f2EOU8rD4IqmdPJzdUmHNaP2sswXDBQc7pnwOJIpA=; b=WOAtA+HVSHrlyoEh
	MjhpxA95iJw8CriT7YkCj9ECfD3Fn+jujKPN+OarSp+sJl1g219IJM8Lrs+O0Taj
	gsw6SZ+Hh1kcCGEUaEOPNtzVwVKopoKbHn2sbS2MuCpf7lP1Q+yPGzpShL3XcKEz
	LtG9OYizTWj5M/T+wZsoQf9h+TK/cHStS7ZeE0wcWA1VjTC2xYTuhncF7Zs8JHJN
	fm2dwNGA1sa4U0p9/Fei7Q9DzYj8fY1mFsE4ix0z+ISZAidbYWcloVdgOl1/Gga/
	R23T4+rM0yZmu4yK5rnj4csixKVhz3KRS9uQ+b450PHMk6cRlz8FzkyNFJbpzDM7
	E0329Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44km9wgf8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 17:05:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so10728425a91.1
        for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 09:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688736; x=1739293536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51f2EOU8rD4IqmdPJzdUmHNaP2sswXDBQc7pnwOJIpA=;
        b=JlKeXJq+kFX/9RYOSjBaS9FraK92jxARmAfNmVkAVKMgzN61+nvhg+L25xcQdNT04b
         mnMNHgAk5w95JBwHyzA93EoXNM8+PYLr+tujEh4NKsgScAlIm6TyUopvNUGUOXLmizeK
         E7L5BbMKaytj0ydSyI4kqe9a7xfkuo7HWSosNHi6wsJc9eUBDwTA9vuoFPUe/Z8zWiu/
         XyQFjS+Aru2q7mRf2jhBvArSeg0oq/cQ4KASBuQujhmKiN/Z7CcEavNctdmYXzPyUCJG
         ZwVaKObjr2HIc+xWO8pbwXarsHChevc9OSN5k+pVeMySYtTE5p08Tm6xkdOrqBNrPSMG
         93Pw==
X-Forwarded-Encrypted: i=1; AJvYcCX2mPfimccu81ey+qNaxdvfXAte5lIkeeq5r1X0/fPky5GGh1x2IH8wItCfoQ02ZC5NzgYbPww=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMF27qqD9Md1DozdBP1jtLmARYHsuP+NMX7cmPKAai7TYo0uAf
	jCz6h6PB5BcmGOm49R4KpPrfPqh/TM7g4zAu+/PhhL8zVH4Y+P/7HRMvemMjpa/Nair5E1nzdND
	TGbOrPWnu9uV7FUD9UEpYOxaAPvJmFgwJTlqYhI96gEwG6eBdCfSOgIJGFXDnV+qu1oTJ
X-Gm-Gg: ASbGncu8klg1cwEHPiKa7Sr+nbQRYVP9zmtML8UHGojTiOEezKpsFBfnpEXNSFuBWfE
	biZkYvqF6FOEtYqOs/e9NBuWRlm4mLtyHX4DSB6OC584M3CBq4wbXcCjvtJYs1/C1LVvcEjY2tm
	udH2e5t1zJg3orfb+SfGe4JQCd6bofyWBiRiFxh0TbTnPpTsh0egQPhtfE303K97WoJqcKmx3Ep
	GWp4H+Fr+4bEGk1y+qTaLzovM7VkK7pl4sxGfFuMIsWri1Zol73TsW8ETFpmzSUE6MDW4NXiPC5
	0lE73D13hJaLithbSeDJgDrsoeay/Q0x59YWsNrSHLef77RgDhu6ZoeLVbELwLMuJXd430QF2gI
	A3CVaRbI01oa7ScG+1C9399ueOfWEMQ==
X-Received: by 2002:a05:6a00:114d:b0:728:ecab:51e3 with SMTP id d2e1a72fcca58-72fd0c02f1emr36077591b3a.11.1738688736341;
        Tue, 04 Feb 2025 09:05:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG9Uiqc+7PlX1ZsIPR20CQZaNTTSfUWKtsKFXqKtj6fdi754GWLoojlhA+zlni6fNFJsLjxg==
X-Received: by 2002:a05:6a00:114d:b0:728:ecab:51e3 with SMTP id d2e1a72fcca58-72fd0c02f1emr36077504b3a.11.1738688735422;
        Tue, 04 Feb 2025 09:05:35 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:35 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:13 +0530
Subject: [PATCH v2 7/8] wifi: ath12k: allocate new links in
 change_vif_links()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-7-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: VO3HvqokaUQzZWWneOSu067pkHBWq3OK
X-Proofpoint-GUID: VO3HvqokaUQzZWWneOSu067pkHBWq3OK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_090538_348390_1E748D0D 
X-CRM114-Status: GOOD (  15.79  )
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

Currently, links in an interface are allocated during channel assignment
via assign_vif_chanctx(). Conversely, links are deleted during channel
unassignment via unassign_vif_chanctx(). However, deleting links during
channel unassignment does not comply with mac80211 link handling.
Therefore, this process should be managed within change_vif_links(). To
maintain symmetry, link addition should also be handled in
change_vif_links().

Hence, add changes to allocate link arvif in change_vif_links(). Creating
the link interface on firmware will still be done during channel
assignment.

And since link will be created but channel might not be assigned, there is
a need now to test is_created flag in ath12k_mac_mlo_get_vdev_args() before
accessing link_conf or else link bring up will fail.

A subsequent change will handle link removal part.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4f5bda45387ee16e1ab7a3c15a72252933f29129..9ac2f883cd5cc3ee5950fabdf6b89e5330171468 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3600,6 +3600,31 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       u16 old_links, u16 new_links,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
+	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
+	unsigned long to_add = ~old_links & new_links;
+	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	struct ath12k_link_vif *arvif;
+	u8 link_id;
+
+	lockdep_assert_wiphy(hw->wiphy);
+
+	ath12k_generic_dbg(ATH12K_DBG_MAC,
+			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
+			   vif->addr, old_links, new_links);
+
+	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
+		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
+		/* mac80211 wants to add link but driver already has the
+		 * link. This should not happen ideally.
+		 */
+		if (WARN_ON(arvif))
+			return -EINVAL;
+
+		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
+		if (WARN_ON(!arvif))
+			return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -8765,6 +8790,9 @@ ath12k_mac_mlo_get_vdev_args(struct ath12k_link_vif *arvif,
 		if (arvif == arvif_p)
 			continue;
 
+		if (!arvif_p->is_created)
+			continue;
+
 		link_conf = wiphy_dereference(ahvif->ah->hw->wiphy,
 					      ahvif->vif->link_conf[arvif_p->link_id]);
 

-- 
2.34.1


