Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C795606A89F
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWIr/gDv;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hEW0v9VG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=czqCWXeY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=; b=OWIr/gDvvjOrly
	BCc36eXavrtvujmXVBrsKEMzz4/M1KvJS3mg7d7HHfBPNLBzeAIFpayvkxqHodNbGadGYG3XH1ICw
	MHowCQcaFlOA3aJ6+paU8caR3CneKLFbt6XvodiWbci5X2rrbB4/1pUSX1xh2B7hZmKfmUm0Ge6LF
	i42UZ7fagh6puyh61TS3MNAhkFP9QOn41xwbghspaSoJZWZR2ouaTC39Ne43IAThEUWjxLeZkN+dO
	CBb31NId//xIB3GLyQQHvjz2CD33JdcXx3f/ECzNfPMXzTkS8TGGrOj5rRMBBsPVv2Mff5QNr7i3P
	8VVWHBuGIj6TIsiXD41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqG-00000007ZFq-0Sjk;
	Wed, 18 Nov 2026 02:56:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVqE-00000007ZDt-0DeT
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:56:11 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UvCZ1988846
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/BdE95b0vsH
	0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=; b=hEW0v9VGQpu+MBWyXf8NJMRTZBc
	A25iPaJyTQgMxLkkiyyRcjq59JDVD5rYaBR/1GA4joAhvLfBh9enbXdDkr8rei4M
	YiVuZeRKrhVD0E4rQzgDnrBnm4dwYfODzOB3aHZsWagJf+BwZd6gMnsO5OcXCTDs
	Zdog3QdRmyCe+gS48t/jz0TuJ6PRDppNrXg6dG75hocqSCDKJ16pI3MSqv2ESp97
	cxvjPGRJrJJKbvgM0rxhwWa2nS/TjZ4rgy5igbYbksWwRGK5XrNxPnd+kYEjQ+QI
	DBsHsfmSF6752nysufCIfe40WhhU4Zrto9KmBQekLO+TtzvC+B8jVT5xiTw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8guhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:56:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea71803effso4361925ad.3
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970568; x=1795575368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=;
        b=czqCWXeYFYzIzEMTYUXb5zj8hz77j1jtbKkLAXhIvGStSIYCG+MVuu36vfToYUc6Uf
         fo8RU79C8K0P7/Dg89yNcLMgLvyCNrfcRCZ92xwR9E9I6svaiIntUfef25pktJVbOxxC
         lpYKdTXG4vOL7Rhm3/kYSJ5IlYalxeR4ZTQ9DDe8DE39QhSthxaAuHuspJT3Zh3Z0f8o
         DD3WiRiBWSYeo6792fJ6i2eY+GEQjckvYRl+tVq8+xVEw555zsntZehTemp+uFXWzrfe
         ssTcO6cy6b/0mSyVxw8lun2l7KoyruLIOa60R3kA8ZR5xBl+5A2ieFPGrrCFSPB7jvOP
         3YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970568; x=1795575368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BdE95b0vsH0P2ZevFNIECUO9aKI8fNqcDSUB1tbLiE=;
        b=gszIsKiMpYJ+W0hFzi4CmUNB53q1YGkJdtvKExdjw+k7cgZ0oSQmc9oqk9IqZ91ISL
         1eOtrVnZsZAG7deHoKYDUbaypyqhvsT+f2oHYuthcYOrcsbpI5bmoBVn00Q4oiOG3Cok
         ahUFaU+yI+Sn6BQFBA5VblFPDNvQEjGbvQ1JgTNan2B7SY+mD+54al7lbfUzzDkrG/HX
         2+NN8J2PfZO29X7AFVW3Y+CoAZAM5opvkA0W+f+uA1AiVkvZ5gX2E6cxIseyTr12IsmQ
         ZuBwfDsc1rqsaoKp/RSvGqD6XKM6ioJn14BYPzwHvsWP+DMTo4h/R7nCr3ondwPK3ygT
         oTWg==
X-Gm-Message-State: APuU4Z8p3l7LhSg21zDdDHk9uJU3uXZThmgzJlXavgKIhjAIV7CA6brn
	hGGbslvheWxwiNxnwqsOqcllKtF1G6tzv3z7W6faZUQxYfVr/WqkAi9JDx/rlbeTAyQp8CFs2cO
	MjmhVsydQ3IDUlzOI46oientBapvgizH9EYi2aKvjU65MO8OG0tTW0GpCIb3P8ssqd/1szmOAWs
	8=
X-Gm-Gg: AZFdTZeGEoeMXerFe3mBc6IudC4Vhc52Kaff9KVgIOqM2BIL6JV4qYvZKQpEAkt46nl
	2V7ORk2q+Rk7vwTbhxqX6dPGgQRyOq1f8svnEivymtoWY90iPE6NBtmUCwhc/6dJup9ZmOcX+XL
	xU0GiQWhJlq8LIvrlq4jm+u9AJHZhGHq8ax3DlpBdILVrj0K8fRqkTy2JBxfzGvXUw/06hyqRig
	5lspVjuGpNnUT4UxDscdisouM9hZrBo82YMJrFZpBgRGiyHlBwEk+e5zIbTa/foTqYp8Gz9VeC2
	byl9JYAE+0EdnXRVoIoeA+DJ/DYHn62f/Aq4Lh+CF9cfjuppXjkWJlZPp/MYImqqXObNdgudzl4
	Mv9g0SHjYZYbjch4gLALXryEltWrzWleaql+6fwDDgtHOtTJTONVY2iRMsIZnw0oz8wB+d7HveS
	53o8dAJtgfVaf37z+9yX8dK2PL4oEXrTc=
X-Received: by 2002:a17:903:184:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eff72f4e6fmr11288575ad.16.1794970568007;
        Tue, 17 Nov 2026 18:56:08 -0800 (PST)
X-Received: by 2002:a17:903:184:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2eff72f4e6fmr11288395ad.16.1794970567552;
        Tue, 17 Nov 2026 18:56:07 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:07 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 4/7] wifi: ath12k: skip links without channel context in ath12k_mac_get_vif_up()
Date: Wed, 18 Nov 2026 10:55:17 +0800
Message-Id: <20261118025520.39269-5-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4Q7tRfpHJG3GMVlWmjPlef3RnqIWxm3c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX765efC60xFLj
 ukpqO0KPSyRMkG8RuYDUZXu40ivon8xZsgkFkGDgOK74IOMrzLChlvECn11L01TuQozit4mgCsR
 wNSI2l9cwfmQLhhq6aR0inG85L97bWw=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd13c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=gfZQdUK8Rj-w2-3WJ4IA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfXytU3QwdnUvwx
 45AU55jRgyYxGSDzZXx6Pam51/bGrLsVQyiGT7fNm4cAXh7meNZFk0xlSLEWUx0gh2xhv5N8JXD
 IFpYQrlEnGIZoJ4iAcVrvKkJ0TBzqA1YmBQy+gRN84HgajQFMPbzrxrkDPP2FKWUej7ekhZsZK0
 0iDxP8a4nl1aU1cZqlwo82ZFNLIpfyaPKM6owJEl79hNPCsFnXkk7kiU2BT3bRMgCLn/5s+D8e2
 jhQPm6HitzDVrNl0LUv+kpiDBm9XMbkbKjEWQDC5d0rNY8fLdnx6G/ZCqoy0yPxNox1HNMsFtnB
 ix5NjwC0rJhnXwU9XyAKtAeoEL+HVsO3H0N+LtWwL8P6dUjXkYdvNZqlp5MMJ6lG7pHLBVIrX6b
 3SCMaG4KHQJhQgXLnnsWZ6ECBEIUi5b7FeFByrvt8/D9pGU8bnG6xt4zG2t/dxypEUghBANnalN
 CBcG8x635c+hc13Cz6w==
X-Proofpoint-ORIG-GUID: 4Q7tRfpHJG3GMVlWmjPlef3RnqIWxm3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_185610_211790_DD662F2B 
X-CRM114-Status: GOOD (  14.60  )
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

Active-link deactivation releases the channel context of a link while its
vdev stays up in firmware. ath12k_mac_get_vif_up() returns the first vdev
that is up, and that vdev is used to derive the target pdev. It could pick
such a deactivated link, and ath12k_mac_get_target_pdev_id_from_vif() would
then find no channel for it.

Skip links without a channel context in ath12k_mac_get_vif_up(). The
WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif() is kept, since
callers reaching it are expected to have a channel context.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 28cb549b1f46..08d9af0a1127 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -953,12 +953,23 @@ void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
 static struct ath12k_link_vif *ath12k_mac_get_vif_up(struct ath12k *ar)
 {
 	struct ath12k_link_vif *arvif;
+	struct cfg80211_chan_def def;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
 
 	list_for_each_entry(arvif, &ar->arvifs, list) {
-		if (arvif->is_up)
-			return arvif;
+		if (!arvif->is_up)
+			continue;
+
+		/*
+		 * A deactivated MLO link keeps its vdev up in firmware but has
+		 * released its channel context, so it cannot be used to pick
+		 * the target pdev.
+		 */
+		if (ath12k_mac_vif_link_chan(arvif->ahvif->vif, arvif->link_id, &def))
+			continue;
+
+		return arvif;
 	}
 
 	return NULL;
-- 
2.34.1


