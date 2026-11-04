Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB1606A31B
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 05:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RvBsG7o2;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kthFtGq7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=COzAQ1Cz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0nQY2P9RTAtBJlrcwnAVDlNOCpLlXDIIS1OzEwCWkgU=; b=RvBsG7o2zkpHuufo5rB49Q9je/
	S/Qw/wUmltC9aKPyk/R32rda0PMAfCO4tbJmSYyCjVxU9+sefReUZdCbd+s7V0xhgIQgFJEk1MOIn
	M5DqnoCYqxbtZuYH0m5nefBBk1i4jL1AlqJQo7a0hJv0Nx5QrNkUbFTPgBP2iz5GmlvCDMUU1zpBu
	WLvUMGCtOxW3lq7yQHMmp20JpgpFMHm7R3XEjxH0nExNt2KHP90AHTgk7m5pDA3WoGsxUHycKkvQ5
	hkGzpNwQ6asoUvPF4ZSHW7qq0bnDtzv6qfEPyE4Hm1pHcvgEJmRP1l3spKwb40m2XJdGJXFooeR64
	dqUEYqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTOa-00000004KkX-0ZjE;
	Wed, 04 Nov 2026 05:18:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTOW-00000004KkA-0gNy
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 05:18:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43OpJD267281
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 05:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0nQY2P9RTAtBJlrcwnAVDlNOCpLlXDIIS1O
	zEwCWkgU=; b=kthFtGq7PVeynKAu00mftuwBtzX5H8t2MQTBXmDOB/Cm9116Fyz
	YKE4VBrQbdvKr0q94yvnOYo6aVTwBc9rJShCDQN9rL1IWRttyrKa+HtaaITwAC3K
	LbsTeVrTlS+1Pd4saul3cTJQkxpJwgplBzIJEt17J3VecRqqb2qMjh1c+YuPZhrP
	Xe3sOSeHqdBOHbRh76mOYQiW5KkCmMa4EWrELOgHjJ66SBwlCBvekH95uA/tb2VX
	STZi+RA7KtkHdSxhCelV7M+hVMZACbN6pYlS2oO0v9krBNWJ/yPvxRJb8sr64kWA
	COr+BFZOMywkog0EKBN/h0RStBhI9l9gXEw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg8b7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 05:18:43 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-846863cd436so383577a34.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 21:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793769522; x=1794374322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nQY2P9RTAtBJlrcwnAVDlNOCpLlXDIIS1OzEwCWkgU=;
        b=COzAQ1CzTS+CKnz+tFuGlcV/7gJfVu6s4kMiGfW43P7iJsVn5BnU8IzIUR/lynlfEu
         1vPdmFKAwcRLvkJlvOvT9uKl/vWJPo9wFkL8XM1YOYDnvEO0vl78KfKTDdF1AgFPdyxk
         PJa/dj2eI2LQ5D3xZ0MDOdtBEJeLyQpzMTiqfn6IoCnziYZMS09b+ceVailAWZEbXQgi
         j21mDBb05oZ441lH107g+iOBPWC8KUrXfbC4Kh8q6RojUMJKwM2Fx6lQHDHD417t46Il
         KorKtyd+fWBeIqbo0NzLZ0KitwIH0tYml/UmxuXF/gL9kRTH/WGWLTk2un5qnVCE5zeP
         tbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793769522; x=1794374322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nQY2P9RTAtBJlrcwnAVDlNOCpLlXDIIS1OzEwCWkgU=;
        b=MEd3qI+O/P1MzRIr5PoUAA9zDtjSCQlNBRMXB6wmwOYgZulUV/XDJRJzIJDNmQ9BXJ
         8e+2AujUxaSptBH7vIyPSmSYnJZmiXyjTl9xpJ46aPCQPRodzbMCjlbpYK+PbmDMzioi
         JnwjatliiKUKDVFY7DsXVKCO//nu1HVfi+GBnFFAttewwIa5BjYMi5E6w257m75ECiBU
         chtdWH9wqB5C9XDgzwXpwzUnaTPIADM7nbyZ4tkbKbJgDQvbLaSpaMuTtnKCab4cMV2i
         1LKviPYgqlgRHFLYt76nk3mNCNcvajkeJYMNIgmCANK2FMsvEXhZVBob2sxay1meLPHy
         zJaA==
X-Forwarded-Encrypted: i=1; AKwUvBxKTbzkJv/jBGeaz1lTBZwcn6ebo8gUWekgpAGt4aPcfKgb0xTEhGrwYm4pUaScm4pmFL941Es=@lists.infradead.org
X-Gm-Message-State: APuU4Z+wp6mjd5ctnItKz6mCNX3cPEhOAREppBHkueG82YxUu78nwGFd
	xUGm7jH1jmQpV0eJxi8JzEMQMSy2KCVCQjdGGUGqiuhQ48lm6vokXF0sBhI4RQRKE8h5+8fthXl
	FIxqypLtVvf7MWQIkKXE0oJbIu9mw6OudjnYqNeVAaswxgFGksI8cLtO/mjZ/jTCr
X-Gm-Gg: AYBFou1Z6MsbZaf/N3i9xRfNVbqjhgAuN+NbKRya+ccSE3ixmUukuOMAgodckNpO2OO
	pqzG1vh0T/d2ePSBzyr7Bi37okQtr9V2FFvhg63xNBHGc11EvADwl5OnXjInhBsg/DXClLEK9Lg
	9F6ig0VO5NNiHXDt1lmwJPMQeGIh6Ht2NXLqmDYyNZtfNtAz1/26vhlSvWFT2j7F/20+DY7cBwR
	Zef2xatbbFh4P+7wBn8Vh+UvGm9UDShYaqoLixfdnzimhhQWtEJ4ysxYo20zQ7Rcg0s95yRw6wt
	GPTsXGy0T0jhUQc2wfZzjyI2B5DPEUNVmV9VlhfKOygWnxpiHxFAHr+wmncD4PLUr/h5QHsdvW+
	1iJrUydeTtFzuGqXz9meLtvfZIJc3BUuE+n+nSoxb/XE+QdqnDYxVT3mbmWQbj5aLPP3dAemx8g
	OG4Z4bGp1Umuc5NFzyHCEB/d2IJIlX18boCols
X-Received: by 2002:a05:6830:4392:b0:81f:da91:c984 with SMTP id 46e09a7af769-85d364470d8mr12320498a34.11.1793769522461;
        Tue, 03 Nov 2026 21:18:42 -0800 (PST)
X-Received: by 2002:a05:6830:4392:b0:81f:da91:c984 with SMTP id 46e09a7af769-85d364470d8mr12320469a34.11.1793769521305;
        Tue, 03 Nov 2026 21:18:41 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e1f2f0sm1097317a34.17.2026.11.03.21.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:18:41 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v2] wifi: ath12k: skip hardware rfkill setup on Surface Laptop 8th Edition
Date: Tue,  3 Nov 2026 21:18:38 -0800
Message-Id: <20261104051838.2912931-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeac033 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VKJZL0GhgKsj1iBI1lIA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: WmB_Mrx5jiGYUW2OnA20B9QvcFR0x0_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX2b5Va4+VfSlJ
 E7t1yp9YtyBKI3atsX+oFgiiHq4cLNZgJC61vcWO2qiGLf5tsp/6ZoC6cp4xO3U+SAXpqWz4aIC
 RXg1GCCx8otiHZXiEhOKv5hFc6oZlNq1g/QgvzpC14nd8TG4W1n8hhUuTFf1QGwpOnHE1izmvU4
 4jeZoPSr1ZbzeI2Qt1KgjE6HLV3kjRwNZ+YKrAYnEKMYkSi4brTZo9yqQQxs7Inn2DhWE6lCnC8
 PiNpgIfsG1/vye9lWoOIz1IDgHL5ERCt2BysSxNR7Xh/kHhgPw30Dw6lbA3xjEDR9EsXtbXlF4D
 /Av4WVlVlGqxFM+VJ0EjiB6YpFvzwQCs9h4++hRAd19oq2Gn07nQI/6TDZLI3fpesR5w02gKwOn
 efL59F5XEEZi1yM4g0RDoEz/IofdXmvk3Wy0r38Du0AdDJz9v/UJV261QWUtIzC53EgdAwWP9sf
 v636r3LC5SIJSREFlhg==
X-Proofpoint-GUID: WmB_Mrx5jiGYUW2OnA20B9QvcFR0x0_n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX6yL+zHtJfNGS
 bjI5XrclZB8dhUxep8B/BJdjqyp3NshjYkGbf9S9y0g7GX3TbG1uf+JIh+Q+eOUGpnN9Np2IzC7
 tbRZ8Vngy+Euw9c2QHqU1XwJ7MZnXN8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_211845_649565_C6946E9D 
X-CRM114-Status: GOOD (  10.82  )
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

The Surface Laptop 8th Edition (13.8") has the same broken WCN7850
rfkill input as the Surface Laptop 7, so Wi-Fi stays hard blocked.
Add it to the broken rfkill table.

Tested on a Surface Laptop 8th Edition (13.8").

Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v2:
- Fix missing comma after the new table entry (reported by kernel test robot)
- Link to v1: https://lore.kernel.org/r/20261103094024.1764151-1-gopikrishna.garmidi%40oss.qualcomm.com

 drivers/net/wireless/ath/ath12k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 25987bc58556..c0e7503c71de 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -87,6 +87,7 @@ static const struct ath12k_core_broken_rfkill_table {
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,denali" },
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus13" },
 	{ ATH12K_HW_WCN7850_HW20, "microsoft,romulus15" },
+	{ ATH12K_HW_WCN7850_HW20, "microsoft,surface-laptop-8-13p8" },
 	{ /* Sentinel */ }
 };
 
-- 
2.34.1


