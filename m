Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B477606A31A
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 02:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AQIIfyCI;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLwUyt+r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=khpiWHhH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vZAdjot7kyn4ieMPLUMNEq4Jit4LKlTnRhG4vJxE5P8=; b=AQIIfyCIM0X4jvnBl/klO0IAAL
	s65tx+jKCM2nE4+gDmfO3b+QV12HGCiXLF3l6U9/267pFC9T7/7oEiO6ktHOeKYj7RHXrnYVGgyjJ
	QDq+hCeAsH2838F0peSPSi79NsOfjVk7tfWW31iP7xbJaUUqlDddPk3W/Ae+INA8rJmVK4yurYFWT
	aojkTsWSfJYSi+pVl9PZvqepPGc054XT1EcVZwERgz+2Sv4D75nWBa7SIFyKZVZZkPOQYRAsS/a4h
	EIwHtByU4Q6H7HrUcZ/YAw0PiMyB1pF0MhiS2zlKpN6LTCQfvyu09JHdc4gtk8KSs+fSK6Qyv35Qz
	keQ8u7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFjY-00000008Bvq-1uET;
	Thu, 29 Oct 2026 02:19:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMFjV-00000008BvM-0pXO
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 02:19:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jTse3375729
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 02:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vZAdjot7kyn4ieMPLUMNEq
	4Jit4LKlTnRhG4vJxE5P8=; b=XLwUyt+r96ctxW9+/lYHeJhVHOvxyWSy5xYcGC
	81o6cYN1/R2XaGdBIELXXl32hz5QwHDYJRShKhhmMJO5tAgNGFzxQkzUlbP+LlMc
	e1F0en38f5XcgY6A4vKD82kjpqwhRzywHcAbYm+R6WguGLPJ8S/rFFETA6s+EF5z
	cgmZVOTXlGhRyds8Vlv+UYKE+9hJfNMTbqjl6pwZk3HXWOx3Tuv5l7otRV2RsBcP
	5mrHEJp2QMwsi23TUEstRxAwHrwus8WajoN5D+cWlLa1A/XHvJwOuRlEIIhhgx2i
	SSSVJXdyy1V68qZfw/W1YzZ2N+OhHbQVnOhlAl9Fljb5SnoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hktmp8g9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 02:19:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ba4757baso13611835ad.0
        for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 19:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793240350; x=1793845150; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vZAdjot7kyn4ieMPLUMNEq4Jit4LKlTnRhG4vJxE5P8=;
        b=khpiWHhHKQ3VaVHgBFhSKllNkhNQBkPevvooTNZbeI30zGWSdkBUUAeq7GVRYJC5Ps
         vN8ZWhWL1O20/TN1RnDaQzCo2TC3RwXx+R0g//sfpBxEZD1tRoUdaiJjI+Sm4I/K9chi
         JnSKWZjPNt2XX8CLIxU5GNxV+6lSAYjGRz1/5Ru0NDInnir3r1pF6xP/hY28tzPS2+Ar
         4xF6KxNdbHag2WNX7UiWqw7o4y5asPqd6AhqOJxeuRT3slO4vi5hDDJv/WThhkWGZnIl
         r9gaj5KQBEypVdb/nIyc9gx7xy5CQmTY0nXuLuIHxgyOAMNw4WdnBKnYSk+nEN0B9zrN
         P1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793240350; x=1793845150;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vZAdjot7kyn4ieMPLUMNEq4Jit4LKlTnRhG4vJxE5P8=;
        b=hzEXRkMSyM/7rozijSaiXhjDd2A7hegCmhvAS2Vhvq+Z6eF2KtwjcwcvCxqHCgW1Ym
         JYE7SgDbVkt4XjMlCqFDRSW4bJ328iTcjOS0put6LKk9KE9V8pKQM2mszWF8bBf9xC7N
         WmlKEIz1n4uKRv3c3YXMU2DJyrcYdqMGAu7W3ZfjmICwksAFzxxuU+b6klUvrrxkiCjH
         11wyiFO1oUGWE8OW1g5ym7LsSXnWaIf9u6bSU0QY5HIzY7Jex3q57B9Nu4FHJ/se0/lW
         Wd0PfDGJMaIv+NjO4ectjvocOj8nxmcTZBDWSbIGdKXHL/cDtLu0e/ngE6ZAAdhnCs8W
         2dIw==
X-Forwarded-Encrypted: i=1; AKwUvBzl2QMz0NqwVkOXAb1SfKaXM29UY6P7n6ygl4HIWpyMNLQZAvN9LZ/t6wQcQHjzBkGTlSzZ9Ug=@lists.infradead.org
X-Gm-Message-State: AFq9FYI9pxKPjpRFeFRBpcM68x43pdm8YYQFzcbakUq3fnqI3OVLQhWT
	fdFx1gbOgoyK3NX2S6Sg8dOetzHZXKTWgB1Q/wgRdyRKzLjZOImEGlzzDsNh9wuIj5m4I0ITtDc
	oSziy4e9nDM+3vA2n7pa1GFQsMvb3SbBJxwdLSyS0g4GbcInCJ6klQkyJ4XRUdV6dVZTTXZaZ
X-Gm-Gg: AYBFou3h6eiWTTpdv/UBA0YIia8210fO1e/hijphbpuO2WLKLmaEXmRJHk4Sqa2LhkB
	jHu/oiRBqX5CF3JBx//0GX8MOHSWHt1SbJ6b3aylQb3rqNY7XDhUrkjTIb6f0bAD5uc6fX2q/IL
	c4bU/LICfeiZvqASxECBPPp8l0CBQg7/YGVwKP3ulfGHI4AmUFUw1vu+U0Q0dqID3gbHKgc9CW7
	GgTGQdvsDbaWbxS1jrzPkUd64mkDdZsPHS+yl/tK/XBRtmmYIRZsSxGlxPWJJm6+2iDE6EauymX
	ZQlfK5osL8UL1YM+g849OI0JQ+a/mPajVYxIkmohfCLHQogWGWxSCxFo9GtQ64sNIpoMZXo1nDC
	njWJ1Y5R/JcB311f4j9pvWiYj5cCzMg0wv3SfPlsf5CT+uPmypP1rZwquuiT2sggIIvYTnHwhhd
	Cj3RG7/Q/1gduMn2PJgywfhA1IVVvJhQ==
X-Received: by 2002:a17:902:da85:b0:2e5:6158:b9c1 with SMTP id d9443c01a7336-2eb00468987mr37161385ad.47.1793240349607;
        Wed, 28 Oct 2026 19:19:09 -0700 (PDT)
X-Received: by 2002:a17:902:da85:b0:2e5:6158:b9c1 with SMTP id d9443c01a7336-2eb00468987mr37161195ad.47.1793240348983;
        Wed, 28 Oct 2026 19:19:08 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eaf77e70d5sm20571665ad.75.2026.10.28.19.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 19:19:08 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 10:18:42 +0800
Subject: [PATCH ath-current] wifi: ath12k: don't advertise EHT-MCS15 to
 firmware unless we support it
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ath12k-mcs15-v1-1-3bcfab101f00@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAGt4moC/33NTQ6CMBAF4KuQWVvClGLRlfcwLkp/pFFabaHRE
 O5u0zVxM8nLvPlmhaiD1RHO1QpBJxutdzngoQI5CnfXxKqcgTb0iA1tiZhHpA8yyYgd6bEfWtF
 x1mML+eQVtLGfwl0hN4lcQtBuhltejjbOPnzLq4Slsq8mJEi4FFpwFMwwevEx1u9FPKWfpjqP4
 iX6z6DZGAbDlFL8ZBq2Y2zb9gOaWB0eAAEAAA==
X-Change-ID: 20261023-ath12k-mcs15-818b3a574813
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Vladimir Petrzhikovskii <vladimir@dfb.sh>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX8WvyPIts9nvz
 pAq5VSXC1sT02bRd53SjBfb5Wg4+U6sEzOsO260rEaUa8K44c4VtHqUEGI5YiyFPXEJevFYNin6
 n7tpRMdupoyVVLaARrkWFwq67qmnb8Fee4FX/BQOCc/YuqaTXJO/Dt4Qhpa34sXvLsR9HbmOCJg
 nuoOs3KzE6Bgb++7VK3lcoNuSIkZLq7FH2qOSPyYlgpNJTvJ/GW80EZIQfk8AHOn5QWL6bYKOHK
 7jYFdrauKj6iOkFud4ngUukuhud9h+sFf7NX88c57mpEJNizoLC1AJ5hAjFHQiF1KrtiQrGnX8t
 E93X4BDtyzHWTbLlSHfYT7wwdwSDZ+Yg7/kI12s7auAP4kZNhX0n/zC135fvqwyBRH5waN9A9Od
 CLKTmnDID8qpJOBXMMxuI62OZG4tW6+SNT8F/IWgr2UCXwIYDSn5okaUpC0t1ygb/xJC/vWmrUp
 0RZB0zpxGKCLZpU+D2g==
X-Authority-Analysis: v=2.4 cv=crYOAF4i c=1 sm=1 tr=0 ts=6ae2ad1e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JOAUSjMvcfAEtdXySEUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwOCBTYWx0ZWRfX4mIq/FPZq4x6
 n+8o7H65dAViFwNLYCdxi6ZSrYj5MRHvehBQpuCpRV0kEPBRuwMczFSA1wE65iB/nwhgS8WjhQ+
 o41sM53G7RJ3wtACr6/STwh9X71/+mU=
X-Proofpoint-GUID: eegQ4b6Iryaw50JfCpl_T9D32V2Kh1rz
X-Proofpoint-ORIG-GUID: eegQ4b6Iryaw50JfCpl_T9D32V2Kh1rz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_191913_360672_3EFC782C 
X-CRM114-Status: GOOD (  13.53  )
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

ath12k_peer_assoc_h_eht() copies the peer's EHT PHY capabilities into
the WMI peer assoc command as is, including the EHT-MCS15 support bits.
Firmware rate control enables EHT-MCS15 for TX whenever those bits are
set, without checking whether the local PHY supports MCS15.

Currently WCN7850 firmware does not support EHT-MCS15 for TX and does
not advertise it in its own EHT PHY capabilities. When connected to an
AP that advertises MCS15 support, rate control may still select
EHT-MCS15, and every PPDU at that rate is aborted by the PHY before it
goes on the air. TX then stops for minutes while the association stays
up, and frames sit in the queue until the firmware releases them as aged.

Keep only the peer's MCS15 support bits that we also support ourselves
to fix it. Chips that support MCS15 are not affected.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 17bbb8aa74fd ("wifi: ath12k: prepare EHT peer assoc parameters")
Reported-by: Vladimir Petrzhikovskii <vladimir@dfb.sh>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222136
Tested-by: Vladimir Petrzhikovskii <vladimir@dfb.sh>
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 01f8c6572f65..8f37ec6af6d3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3366,6 +3366,7 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	u32 *rx_mcs, *tx_mcs;
 	u16 *eht_mcs_mask;
 	u8 max_nss = 0;
+	u8 mcs15;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
@@ -3416,6 +3417,16 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	memcpy(arg->peer_eht_cap_phy, eht_cap->eht_cap_elem.phy_cap_info,
 	       sizeof(eht_cap->eht_cap_elem.phy_cap_info));
 
+	/*
+	 * Firmware rate control enables EHT-MCS15 based only on the peer's
+	 * MCS15 support bits, so keep only the ones we support ourselves.
+	 */
+	mcs15 = u8_get_bits(eht_cap->eht_cap_elem.phy_cap_info[6] &
+			    own_eht_cap->eht_cap_elem.phy_cap_info[6],
+			    IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_MASK);
+	u8p_replace_bits(&((u8 *)arg->peer_eht_cap_phy)[6], mcs15,
+			 IEEE80211_EHT_PHY_CAP6_MCS15_SUPP_MASK);
+
 	rx_mcs = arg->peer_eht_rx_mcs_set;
 	tx_mcs = arg->peer_eht_tx_mcs_set;
 

---
base-commit: fab2e70afb13485ea4b198b204af33dd15b8132c
change-id: 20261023-ath12k-mcs15-818b3a574813

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


