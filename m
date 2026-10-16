Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58166CC6B2D
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=; b=d//kNNv8/ryH7TV0Nhy41YUIST
	by1JVCpWlVcbgR0O60R/uetJUhgF+rS768mFEJaP13VQYCDP9AgaDnJVHJ6nVZoBcOYcJrkYA2tWS
	X2xr3smcS9Hyhqj6prIRnYTnulKa9Q1QA0wKgI1uzov4D9NwAdwMWGdDLx8eksi/2EmENgNp/U0G5
	GEbyIEtPCN56kue8R++qR4FGyFlS9aJtUdAwvJij0WQ55EqQO4UIstwxQZjmlk8bq4gj8Xj1w6O5h
	kM6EHD5hcM8ml1v9mXrt7ke8nZKOBmfLqQ4haTTBj2lPrJMH9aaQrLYl6BNihOVSj9k6j0/5jleEu
	MmZ37slg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYXA-00000001q2G-06pT;
	Fri, 16 Oct 2026 03:23:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYX8-00000001q0M-0TXx
	for ath12k@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=; b=SfdQuFOPvgq474cWn4vHlHQewo
	7sVJQZPWGz3PAaw+EXMw7C3PTZ0ZL0cHVfUFu4tVzsKEPqq+msfXJuqujYdBn1b9jMe0hJGsUinDb
	n1zqGfI3Yywb+MZEDeRCmJ3tTsCddVKJaRU1YhlQsblvTUTASHPcHq6TTiGea0XIe0JXxIu5uvBwP
	+0uggWOwF6lgin/Cq0WVOZqirtdes3Hplc2p8w/u57ENtF7+VgzuJBrY0eiqVF6cdDJEyHvzQ8hCW
	+7nT/sHz+T4uY77vEXL6hQ0t+Iu1sGFUUCCrWM22BMvYNg72eOIn9WAwNKt8ke+1R56KMBJdYG9IX
	OQ6+cphw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWy-00000000fpP-1rc3
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:23:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1CDct1890800
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=; b=RcGTFCu6BPSu7NSY
	RJRc/fN6LAyXuTUo2h952EGqCKLDvm1M22sotm2vrTdeEfL9dfUceZYW4vV6fNqH
	KBobJcO6tcPhBMZvF+ucPKaFjFCXwK9SxhLveeU3Rq7855Hn0NrXnM4y4CM9dA8p
	hAz95yNSEDmJCIuiXtvuX74VfFf97T+ztesWjLyfb504IQvdby4TGWGs4D3ZRJCB
	Gq2wX6Fe9FoJb7MYQcv1AuLibGAuDHuxrLsl+Fbh+v+1KtzJ31zhjFKEV/vJfHMQ
	YZTfUt6V15rbgn2N/tvoms8WByCtPxSbEIcWmHgHwCdrYsCC8pGHsyx2k92dkIsi
	I8LaMQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba260byu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso8602480eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120969; x=1792725769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
        b=P9Q8PyIz79MWby4VNMN4Fl/L87iUGL0hnBKHgBSQpMH888mDbjKU9EBSw6foz7ergR
         1kq+qM6mJDMxIb1byllmD70syU7JKWNOwi7Uqjav2gvoGbsNOJQ9WUdGJqKU6WXL+VLd
         WO593JnSzvUVIHMl8y1lBGEwjuGqbY4IVG+6/H1pCDE24DyaZuhEwmIWJAbtESCZhnQj
         uTDrqJZ4VEO+kJ//yfcFb8e3XYGqUY5r3iOfgdPi4LRWTrT4E1N6sIcQP78exITICCS2
         2uN6rmd5QzWaBqwyfrBII8gomeM71+43QylzYoFgAOqCm+8+OyNvVF0fNH4/lXYw6hTw
         imgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120969; x=1792725769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jzFs2jsU7MleU78XBmv/Fx4038TvlijVorZRlgQM6I=;
        b=vLTuA13rJsDv3uZYZLkfy7ToKgTvFZcFcCs7uMrFwzi0f87ndDaf2HK1JreRcldYmO
         6IWec9pl+e+45UoWR20fzIg4i//yOL+30OrCOcS9VoRWUontAGGjwZH8R+1DJZ7M03xQ
         M8BAs0jHnbjm7dBK7/gsK32zQCZ/dactiYvtCZDgYsYPcDa7pEJ3LvU63cXda5gj2af0
         lJEP0K8X1bhoRga4t407KkTDgZVzcFjVZPYWz6dH7nNYWJNduNd1viKjPhFtmLBCjNOm
         ucOV3nMgISquPZ4HSTczG/vgWWKE/t9upIWZUIBXfdHqBiPv6PNS83Reie0INlEHNUVN
         Meog==
X-Forwarded-Encrypted: i=1; AKwUvBxUwJ1nAjgvPwL1hEwETD6/91qj7dWTx3yzbG08XkPQXNuxZ+Ae/IXjo5PtewbqO6/O7odPaGE=@lists.infradead.org
X-Gm-Message-State: AFq9FYJqOOsYfI6VZvTKxDS+Fe9AFkce6Fbxze6jRczWge57SQnMJ/pm
	d1KzL8fijKT/KFwZlIBjY0jKsX1UO2xi/uEuBBO0va+A2wgba9oWQ/k9w15omC5ksLbUqb3yBdz
	Dv1g8flnE7fax0A09g9bb5L1XaZzykbhUtDKWjdmSWhMs5kfLCYCeR4B6VpYMY6sk
X-Gm-Gg: AYBFou2motOtcZkAgg9dk5CuevoqXU9F7RuGj1dirmNK4kif54hZVrbXdqm19D5Dihi
	2kQhn6rWcUTvnrYq125cW5sgmebsr77fIA7l9OK7ifJMp+1f1aju39LNhSij/Uu35FJUJJe4lkJ
	ndGaw6NSHLvtsomIxerJo58EqwK2Vi3tiXzIhxJ9I7mJOkmQfQkr00Uf3IyL1tgb/c3eIaS/CMj
	psnHWkgXxBdJbQnqubv/WuRJTL+/HXFB0/JFIGFc5TcJkyo1TsD5dOKRVDNItTrD2AS5DyTd1cy
	3q/Z63aERpglJIYpqdvNpxA9JcHg6y7GeIPbslLLQlitrw6Z3Gg0nOFXO/INQby8FrE9zYxr11/
	Lasc4rV75P2xXl7dBuuozaqJXObK1HpihmeyRMzsV9f4WY4h0mPNsr1lBOcRrjWGNCgp2TLWvjV
	4sSy92BvmWI/47ZhKvc78oHA==
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr37864254eec.12.1792120968821;
        Thu, 15 Oct 2026 20:22:48 -0700 (PDT)
X-Received: by 2002:a05:7300:cc14:b0:353:7b68:4f6e with SMTP id 5a478bee46e88-3537e03ce89mr37864218eec.12.1792120968280;
        Thu, 15 Oct 2026 20:22:48 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:48 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:50 +0530
Subject: [PATCH ath-next v2 13/17] wifi: ath12k: use CMEM write for PPT on
 hybrid bus devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-13-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad19889 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HzkBA2_z9QidxsSae0AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX6Y+zOTGxiyz3
 ewOoboXHwDC6PEG05FuMbTQWBoIGXjd7IIhIwwKKvNsw8Tw4oFRdWdXei8Zb63rCWiWwBQot2uN
 HN/Xuss2UZ5O2cSf0gjk5gPT31GtlcvUeXU38JXhD9tuGlxSLVRgLYxN05peXQGMVUsrxr9gntO
 kY8oDZxD2hHqN6oRl4MllTJYFhfVcixLFD4kvAPpAM2Deh492YUT5np3fGnBJL05RQF09ZwK1IK
 1n6JO9prbMXeK6yeeB4PA1ErIfsRyeiEIg4GBPHXWJV5MKSkzgcsRs4mm7U5EQzBLvo2EDCd5kj
 S8tqltfA4OizN6/i6m1NASpuY5PO90jCbQ6c+H4Nh/QgZqnLhtvyKNYI3broMlX0GsQp6Ah0889
 qr1hdaspg2/nTb6eNAVwBzVlTwVjP9Db9/SzVbw+LxiMUXzyfte/0OKuDgVyME0lwR16rJ0Zs7U
 h5n62XPU7m69tkI8U/g==
X-Proofpoint-ORIG-GUID: PhtxkJ-7gYlK_07wdIxM1vtEc3ouG4xT
X-Proofpoint-GUID: PhtxkJ-7gYlK_07wdIxM1vtEc3ouG4xT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX6mQHX2bPdPV1
 upFQ6W2Xn3QSjB378rar1MYWFGpagq8DmQj66dB7U/KtyktH/8sNPxodRUC0+jpuN54TkZDYRDt
 dg96huKW0CA1vzd1eMstqf4BE33VuLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_042252_791122_30337392 
X-CRM114-Status: GOOD (  15.53  )
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

Use CMEM-specific write operations for Primary Page Table (PPT)
initialization on hybrid bus devices, which require special CMEM
access handling.

Propagate errors from CMEM writes during PPT initialization and
partner copy cache initialization. Abort MLO setup and perform
teardown if partner copy cache initialization fails.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.c |  7 +++++--
 drivers/net/wireless/ath/ath12k/dp.c   | 30 ++++++++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp.h   |  2 +-
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index d2ce01e0d7ac..cd0aa24848d9 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1174,8 +1174,11 @@ static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < ag->num_devices; i++)
-		ath12k_dp_partner_cc_init(ag->ab[i]);
+	for (i = 0; i < ag->num_devices; i++) {
+		ret = ath12k_dp_partner_cc_init(ag->ab[i]);
+		if (ret)
+			goto err_mlo_teardown;
+	}
 
 	ret = ath12k_mac_mlo_ready(ag);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 83f9edfabf69..6cf254b2d2a7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -1307,8 +1307,8 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 			       enum ath12k_dp_desc_type type)
 {
 	const struct ath12k_dp_profile_params *dp_params = &ab->profile_param->dp_params;
-	u32 cmem_base;
-	int i, start, end;
+	u32 cmem_base, val, addr;
+	int i, start, end, ret;
 
 	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
 
@@ -1328,24 +1328,38 @@ static int ath12k_dp_cmem_init(struct ath12k_base *ab,
 	}
 
 	/* Write to PPT in CMEM */
-	for (i = start; i < end; i++)
-		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
-				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
+	for (i = start; i < end; i++) {
+		addr = cmem_base + ATH12K_PPT_ADDR_OFFSET(i);
+		val = dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET;
+
+		if (ab->hw_params->hybrid_bus_type) {
+			ret = ath12k_hif_cmem_write32(ab, addr, val);
+			if (ret)
+				return ret;
+		} else {
+			ath12k_hif_write32(ab, addr, val);
+		}
+	}
 
 	return 0;
 }
 
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab)
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab)
 {
 	struct ath12k_hw_group *ag = ab->ag;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < ag->num_devices; i++) {
 		if (ag->ab[i] == ab)
 			continue;
 
-		ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]), ATH12K_DP_RX_DESC);
+		ret = ath12k_dp_cmem_init(ab, ath12k_ab_to_dp(ag->ab[i]),
+					  ATH12K_DP_RX_DESC);
+		if (ret)
+			return ret;
 	}
+
+	return 0;
 }
 
 static u32 ath12k_dp_get_num_spt_pages(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 108e27dd5797..5e9cdf72670f 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -737,7 +737,7 @@ ath12k_dp_rxdma_buf_ring_size(const struct ath12k_dp_profile_params *p)
 }
 
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
-void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
+int ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
 void ath12k_dp_pdev_pre_alloc(struct ath12k *ar);
 void ath12k_dp_pdev_free(struct ath12k_base *ab);

-- 
2.34.1


