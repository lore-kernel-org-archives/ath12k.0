Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15B606A325
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LbMqgRqB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtPt5SP8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b1OJepCW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=; b=LbMqgRqBR2BuZd
	Mkx+V/CSZH0LXQfQhgMzcIoL30ummSz7nsq6YtK3n3ku+fgvnvCrTRTP8b48IbI3rjU+RgpIJEHCS
	982vX8MtvL7C8zfOgyojCQhqoU9viH8Kuysq4uDjneZa/4YhSbJBcFKkSkx6ltcvBPUZ38bUEnNGp
	S41VL//plOmWCCi+rJrE/rkp8SdmgpB5uvAhoDXYQ/XWmzz7PgDu9V0fWAAmErQtnixDDKaCQp5sN
	JqppK18njdwDMPuAS6ugKSM+isB1QV+wzqPAK5sakFRyK13IgyYSfT50NfBaHMj9VkYb6n0BcpPpR
	MNByQK0sjnTqTd004f2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqM-00000007ZNt-1X2i;
	Wed, 18 Nov 2026 02:56:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqH-00000007ZHY-3yvh
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:56:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UtUO3371421
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=85SmBv0V8+7
	ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=; b=LtPt5SP88+Km7da/ttHAxJQoZcL
	naplkyj0WrQ+JEPvPgfLZu5336u2oFIe3CGEU4b80/3lzsRMbIRlR7vzMQWFb9Df
	8hZj1k5d10udrzbSb8YChYPZELZVl/XymdNlNl0zGnYrfsWnEgbnaGOt0dJfdfzC
	/OKFvGqvTWtbzCa99OTqkJoy5Ij0lZ1kGUmpiwlm/y+O0cKA0yax0NizAI6zE0nz
	Fhy/PkDFtfF7vBugQxaqxIE7/fdNCIbY+tys6Gx3uLpzdN+dsraBnrVgwFhpw1RH
	SV/fK8fJ3pdLrB/XhwsX0mjXH3zpUN/vIVSPjalcywja9JrSLAJHD6zPnsQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8ru1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb5375cd68so4874795ad.0
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970573; x=1795575373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=;
        b=b1OJepCWrJEFdSax4MBSziC3TgiWI6BaJIZPjlRsynHgXU/RZWp3nD07XLKkpD8tJv
         Y8KeN4HSDlRjBdb50ezyXCcUpfLSsBp3BXIQJvr1FcN/m9yrVo8xdfoxoKmif8+ftzsk
         nRrJs66Pxnoax+9N2CFN0jVmEH01eTlV1+SbajbgyF+aFoMebwnXvzCDqYr/kQnKue84
         luKsWh1yT5wpbQI4oZBT1SiIC3MRp295L78P1oc4c5vA2MeD7CtP5oSMv18RNF4HBoj2
         bXyenVOQXQznLN20Vk7HyXckax8GAIXrSWzahfMijRB/RXfbHbaLFq/LDevBHHjiL5eK
         ijvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970573; x=1795575373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=;
        b=wqDyHRCp+wpnAttBefDwtNrklNw8Ep+FT41FoqILdlCvflKI7b9xyWGHAs3Wi3hNd4
         XzJf3YY3WJE+o0OLH68LSlfbbfCQ8qY+gnMZb2ft/FqZML0kCorrR2kvneFqZ4H20TAB
         0OmLajGjLo7xZFo+CI8bIeowURi/YjXAs39gRv25dlKffqZPBdS/JMo9MZLalyCGBUYF
         unDe3oEOrB1+Ooo0qE6wI57C2dZc8hN/6Tq1zOC1Kga/0inr080+YoclzqH7oyRuBskT
         E5oJXX3gZ+XxjkOhu8uIZYXrolFgGoZpsNqIViySOBfXvz7l9AtkUfj99Vhmo6uBihQ9
         Kx7Q==
X-Gm-Message-State: APuU4Z9IwTiH8/u+LthcnJFJCM+Pd4EFWFsPj2m8YBGCSSDX0ukCh1iA
	VWl4BbtSKQKBeedBaKxX5V6TztR1MoqAFKmnlae3KOeJBs1Jq62uiv/h6cnta6NRTBlvQ9wmU6z
	66v2vJGqT7QfZ5hJ4AlJlwUFtz5EBKtVi3ZETtHxgfeSzePLyKlXHDYwBW+PDrjJe
X-Gm-Gg: AZFdTZf8Y/wvafV0TNX7/EJr/tMOSx7c+iyE3sok7dXfTrhRSNGB6ORTPbWp6TrKXDW
	S5faWTjqX/A+/pRxiT+gfQ+dThU6fr6Bc2hIlzxnrMJt51xcrufPKaI0+XN9KzsxrRRMbgVG+6/
	ooWeS9apgxOkEbyeP6oqAcRqt2ugcWXjoUwXpsfU4QPej8Mq4KYfBcnRC7cBkakptk0kOfpuIyf
	jzLI3eyXiflhOWmwsgByeTTt1cjCH5iqE07xjV99jvNOh31dhk0jExZDhM7YO2N+tQoX/S2qH97
	hVDPSNCe1pUPNsBC5Ia5lYWYa1c8GH3QuquXDsUwCb1O/0FE5AG8/jVjhnT60z+U+agoxB/8E77
	6ugukr9loOftsLhELzmkJvx4+hpNe2Exf5W2ceq1CO3jmsJ7E6rXOQx9UngRRs00DH9/xLpW/eb
	37CTYas3j0nXvZTNpZAps5hTGEoWOsYYQ=
X-Received: by 2002:a17:902:f70b:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eff7100e1bmr12651855ad.7.1794970572821;
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
X-Received: by 2002:a17:902:f70b:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eff7100e1bmr12651685ad.7.1794970572382;
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 6/7] wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
Date: Wed, 18 Nov 2026 10:55:19 +0800
Message-Id: <20261118025520.39269-7-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd13cd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LZTIgfvDWzmdvsE2OGQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: odtOebXZCwNnhaFsEDXKXE7uE8ZkcFo-
X-Proofpoint-ORIG-GUID: odtOebXZCwNnhaFsEDXKXE7uE8ZkcFo-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX9aLXvjWKa8bR
 8JwNVCE4NRzoV4HQzcjardU+O9D9ZRnu0x8696gICBS/jKC2qqjW7I5NQT19bw+4Bg1T1LJaWmj
 n0fyVmaft0pq9T546N8UZ3wOZmHIAwSj+Z1geGWEnlVX7NwJeddf4VTDQtFz5DhCRY1xx193pCM
 vSihTPXIN/Lw1IkyJSsm4c0pe7zBlK3ppmzdxh10t+c+evNrbHyCDNSn4iUudk2rzmo0WvWw1Pg
 jz2n7iEiiqWc6eFJhSkK6Z7xuFmZiNKUIIH3wsEkNIgHz/TMuXkAkgI9grRes1jLG0HzxfWzG7v
 X6XrSZJ2Nep+wuu74eFJ9x/28Iksd4onJKH7Gg5UVRPQFUjBHAo140HsB+++F0etyv3PL92+Gte
 mvTyd1W3uZMDNe4v1ZG/7/12UCTV1QJEdKHGXxk9l/OSXjjDpTR+hosMr3zo/Zj5S991ms49+x1
 fC53I1gjMXtUW6d3Ugw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfXwySaJIaVeE0z
 twVHjB1dMMEH+1+gSpAdNiK1MxCvUvyQ9bC4VN0869bhCvcWt7O83lrb56NdX+qD+TDxNhqBuqm
 nBi3wwfo1L+FlPjgPBlT9BZxOdJJqGY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_185614_037999_1CFB4F7E 
X-CRM114-Status: GOOD (  14.31  )
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
index f57d4ef413e8..dfb0f6e678ac 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7605,7 +7605,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
 		entry_offset = vdev_id % 32;
-		if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+		if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 			ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 				    entry_idx, num_mlo_vdev, vdev_id);
 			return -EINVAL;
@@ -7625,7 +7625,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
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


