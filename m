Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767A606A31E
	for <ath12k@archiver.kernel.org>; Tue, 24 Nov 2026 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rFNpjjKm;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqV0EkHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3kmDs1m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=rFNpjjKmw9Ro9J
	8umbZJZu7+ogOrPldPkD6CiK82T9rrdfIzkE8xkglZwO8pdIj3V/+7axZF1sOIA+mnTltvg+7aYhu
	5aikRg+P1D6zNRoi11W/6B6GeTKQPV3ao3AJMFNAuHMCHmvWEEjx2HBQimnJRtlMxe+TzXKW5K+tG
	F7yNE0Ul3c2VB+N6BoVr9IiibgR+/PxvVjLJ/3tM6s3sTNquJGP5frytOLiV5YMewWEX7L+yV4YVd
	46CbpLA2lGgI8sZV/O8k6RVZ4oHegG1wJSSKy3CRoANUyxqNWyjGzUayOYdhbDiuEkjmuAEjpQJAi
	h2KV8KgF1xsGaYNIBcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuVi-00000007P2X-0v3g;
	Tue, 24 Nov 2026 17:40:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuVe-00000007P1n-3kyg
	for ath12k@lists.infradead.org;
	Tue, 24 Nov 2026 17:40:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLHLX4124539
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=PqV0EkHYogXdhnHT
	AMpAdHDUXoutgpJcFFDj/H/HBwszQ/DuWwkZhOf8eXhnTAOQ1/LFKiNIg2Rh7vcj
	u5gpjtLcSjSa3/g5rVwBKmSqBLFH4B+v2T50OKvXrq6rtfvyL+UTVJzsBc0tOzRH
	vfYfk5cWC8Eo+ZW7X/pzW0kghOCEdFNTnRiLJSGBsL6JPPFZ6EJFOaoGYR5oQSKO
	3QBVFge19Mtx6CZbZLoSCFQ6+2LJCvMMfeku1bWgV9FwlY7HHng6tCHP7pxpNBvB
	dcONGAXd/Eses1gvWouu/rxQu8O1gB5bviTu+ayoyS7o6TuirSonfofRqtqlpoBh
	G7pLCg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhatfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 16:44:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6595409eec.0
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538678; x=1796143478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=B3kmDs1myVl2BQesoGLIaucMk2vXZWTOpzyURSzbliPCGvi7T/22kbWYMjsKTNejmm
         tQGghVa1raKVVnOJ8H3T+vW+R2YV+QYVxWK1vgoMgOz+KGDmYakCNzjlY35LJwqtJwoc
         21khQNQnCxePF5R7qjHtHqP+/F1mEijoqEI3/o6Hgk+QHVDk8u6L0pUAM9NpOIGHBAaF
         yEDNwXqSU8QlwD1bsk6NR1lmea2gRDb2m74gBzibVy1NjU8TK0VaWZmkUZqGUOTCg09j
         2cpo1QRiriCJfS+ek3nTA8LIRlSWPfJVJX22grM2z7gn92TV4Mv8lOjfK1YNk88iTnOp
         nptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538678; x=1796143478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=atLxwxtnH9w6KfBGzd41IZbSghdMaSg7e8og6Xnl+5fX1mjVEBwRv63ismXYTNBowZ
         MssDwa8UxhbXSCMIDgyPCXvwu4HWT9+/v4+b9ubQMz2yeep+uEVZkN/d44yYZmJlcQZF
         UKcI07hrVTBO/WE8pi5NQWu4DpTJH5cCh3hzCfxYi8h9j57oiyXKn5XwwTvfWb3Rd/Ns
         8Wo1Zc3lpH2tBcGBoFr4IhB6yB2EuxBETfCdwz6/zv7teI5MoIXgNFl7uf7rquS/qZGa
         SoLk5nYcusY7Nmu/5K8qFfVWpexFNBiN588INl8griEO3pcoKXj0fmK78uAgqqdc4Uah
         JHgA==
X-Forwarded-Encrypted: i=1; AL+hErFigxs5Uzuw8kArpNdyJcXfE+QV+sLqv5+LGBQTiVbMgt1GSlvpHT4MkEo7JQXE36jtdyi22Sc=@lists.infradead.org
X-Gm-Message-State: APuU4Z8uX9vvoFRu7spGCfXzm2ywKWgnGKJAUxItKrRsohTQ3iua4s2i
	mu9R6WwNO8fKpljWX07Dt/rHnwZK9LqdlY5f6WOgIX+C/1UDxobWVmIhJuvHpCpeZHndmFcbv7F
	lLTETUsa/FYEPzV5tE1HdPzq++FEP5E3AwKSlR9kb246DaWX3Xj9SkmAngdjpSSmk
X-Gm-Gg: AZFdTZfpMT4KflePWsaQzuDB1H6uOQtSZdVWzkGTN47uY4B7q27FeaOD+FETzKqtQC/
	YtLcViLdHLjND+PT+cemKgHsW4SAx2ZnS3ECwajyyua4JE3+tsVqPK+nT6RYyR14aTFOZgnHKHj
	oO4fB+ReS6a0iMofv/863PP6I5AMdRCFwRUem5C6KT0wZVt4bgb0psZ6rrxYy0EA/DtLhKsxa2z
	9mm3UvfDv8zjorrYgeQTCY01/HASXVq3sIKluuAnSXdZXjBwarKMqR//oIWvDFVm5lqV5EF9iCD
	MIJ9rKlfIXVSuFWvvpgHkXq6o/SHSrmqkXD2IoOn+2UqZHqhCRL0UMMNmdSZrhq14N+Jhca0sWW
	R+2DeZAQ1rzk9K4bIfT7AJQLrinElJXv1Oawzkq4Lk+0iEcn2imgaXwtIYq+Zercz8orSc60wdA
	Vn9ug3nW0t0i8MFus2gRHOT5AhqC0Rc1TW1M7Ue6siqzLhaD3gwAmo3RLQYa9MGF2HRHxYo3M5P
	D4=
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780117eec.24.1795538677985;
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
X-Received: by 2002:a05:7300:dd46:b0:385:7762:e1a3 with SMTP id 5a478bee46e88-3857762e729mr14780097eec.24.1795538677370;
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:37 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:38 +0530
Subject: [PATCH ath-next v4 12/14] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-12-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05bef6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXzxWrZKPmiT+p
 tH9T5DAgx/I92IdyFbKMLq0R2tvwo8An/AFDQfsqZ/eLeV/SuFiz3epKUp1qiPvvRBoyKEIb/k9
 fOGa8nl7jX6tm6Ybi2VPKP0+BCxhapc=
X-Proofpoint-GUID: ThNWLeRqRR0pCcWRr7ZZ3iuWralionF8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX8r7pDwKOBB+x
 OPSNtqeubHm3pO9MRZ7aeskb/xHSyO3/5shEwktesdu606HDED4BsT+rXovubbE9BzgJPK9T3TA
 ErxOoXPYlwQ9w8+z8a5GhYSq0chx8RxtG7ePQ/o+4AD6BZyjqNF6ZbpPSITYBGaNoNIwApRScBQ
 XQRYHcw2ZfysgQcbO4+WKF0983wR6222QDyPTlivO760v4RuO6/h0YqnHp4diKKiCgEVMMhsmUm
 pPEQahKF03AntQCAR38puFkXFHcp1N1IqRA3uwe3AIn2hMnDh3snv7mcqBF0MKb9EQlN719/H36
 UKsrr9Tq5mwKDK00Z1OgPC9zJYDat5xOpVm/zvENAWS3PtMPzr2PgBn0knzrYkPN0qO11QoYANo
 dD7Bldj65piBG1adcmnLvrGfOzXU5Ue8d8UE5uPtCR3QgqjoLlajcNp5v9J6sFM9IBxH4mOt2O3
 rB7tK6U/wf1VADYkquA==
X-Proofpoint-ORIG-GUID: ThNWLeRqRR0pCcWRr7ZZ3iuWralionF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_094051_029199_CE554F2B 
X-CRM114-Status: GOOD (  15.10  )
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

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1


