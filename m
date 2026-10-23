Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B960A262E
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VcsxjHEU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIx07uIp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hUposidb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=; b=VcsxjHEUrhCqpO
	Oifscg8Fe5JbWGB+EXSnQ30GEeEQHe6j95jhOjSPQZlhj7lH+zR79lmxsSL5J8gepGnXeLemjt0Xk
	AiikzQsoZICvsTJQa2hfl9rPMQi/R3spkpKRYsgo1LnmmKU8h2VEyN5/nRDT/XnD4DhIvsQ8/sBIR
	MAixzve1lE3mTYYHDtv8U/nAaJ8EBSJzL6NpFGvdRCRxU2/x0wZQL+lfDSmVcL2ANi4bM+C/xt3s5
	jEpAs3aFIIQyUAbEtJScnWTDZf6/N/vHBK4Eec2BKpYQqjuBXttXuJ4tDfUHmMQBloSO0x8P6DBvF
	RRhpLJXkGVdpwMClDc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Hg-0000000FgBO-06xh;
	Fri, 23 Oct 2026 07:01:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9Hd-0000000Fg7f-2YdW
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1EtlW2389435
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=; b=gIx07uIpAk0MAa3y
	XfM9O9xdl/hoqcBEf02hqOhSPN2l5cf0wK0tzBPEPz7dRf1Mpk51Nf1hzornWqf6
	cDubKLQnk6/lTEUdG0rISQYZwQSp++p47xTmMCTgdUFIUjkhW1SuD+Ur8EFMjPUU
	IX7zzrHmilfv4vAViXxwnrdXi2dD5wK6rdhtvZvPk926BpjDURWJMeGq82Vgfv7s
	Jp2z67p16pl59Wm1UNBhrSyuIxQDUR8W35OrNEOoeU8x4j9WDQ2jMfZR7aU13p7l
	U8o6BYT8DnwPErGf2cK7RueV8qzIOWfKuacki28+v2VgV7Bc+Qyhbms858KZiGNB
	0h3fpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpac12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 07:01:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd8b7226694so342652a12.0
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 00:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738904; x=1793343704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=;
        b=hUposidbxxdtPazWlnzBBjOQTIsPeU25n/RYh8ruld1YRhywtIHWLqXidv6AK0Df3E
         THTzctXaF/YaSFsAPpElVDPXVLyLJFQQAU9s8lMdTP1ccipqpbSlHZSyGPgjQbAQWvDK
         OudGakXcwGg1bRTrMFctlBnt4gMT83J89RlboFmt1vVmSKvKO85mK93PcJeew6lscs98
         CWJUqpV24hOGIhtBjS3GRyY2i42T+H59ZwsKB3Y6G+LqQurPB4XzwbqkNdi5/c/GSSsZ
         haNmMniPrmMc2hxURV+K4zqkQzTu4s1p7G6Za/SiBGMqI2kaHN/oXluxbSkefdAGsyoX
         oC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738904; x=1793343704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPK8TpslLB70Y0ZK7uSlOz+BfsMVxoZ5QXzjmcBIqTA=;
        b=pdCn+he5+QpkcGDrEDbmzGo7MIIJQ73IaoRBXlWEacOB85UJoMizrLR+ZBgcXERyE4
         gMPDHAQXvxlTvgGR4V0J8xDqvli2B19d3kiBD5CiSwq6U6njD5+hUsYaNOXwOPSTKkv4
         snPsPgmtZb4pChWaieC3XdREoc/I/CScQ8d0dqWRHY1O07X61PQEloglCqk/xNbYoOM5
         YIZSu1hnT2kkTxm1HqQDbZZlE9XK2UoclzWs8XsI//iQk+Isii2NPMDViaG8OY6ZJCWu
         HWR4ERxHXoOL4mgqPmz/MmGhSwiPNupQurx+sJSjhO+EgqY6jre40edxH+nJURo4kLcX
         71eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKLj3JMXFLKSoR6NuiKatGpA8G5IOMQZFHtoT8D1jvpUV/qRUmyGqPmAMmHTkWbrXrex7wMPo=@lists.infradead.org
X-Gm-Message-State: AFq9FYLNDjVe3n+/4UQEtqsNRgGurI6ScXvgrzQsWaYYLbGmnWfU4IR7
	5oAHdhkpDfXSj8HRugIK5wT9nNxjYc3fOjdVLVjyQh4J8tZSKYzyDK+VZitP9BpSkF+nbolY0gq
	owUHRqaafrPTTFjqKmfwZy3wNSZCd0oDdSbbpNQ2Q/A+3jj1kYJNqnvZzHkhNuexC
X-Gm-Gg: AYBFou3No9ppsWMzaEOHIB87L40aX9Pbsie1RCDY6HJn+HGORmZgCgVfJPrbHviILGN
	uBPRSrIGlYkOrocUxj3H2jRjaDf69khMIkcbpmTwINaS4JlRFxTC4e2BYhxE83qe7URBxb423OU
	FA94F5YaCT0jhgU7IZlI1lZCb6sEyxUTb0P0Jr3bKErcfIFpEdtKcS42WsIk+InCFUM3c3S4Rg2
	bzD+fsFCW+6/0WggH2GVcvmzxQjKWesCQ8kfIm7Orqe1PFQGN5vBl41tEE3KWAJ5CY8C/LlwjWD
	oLoLeOp1S9Q8nvHJ0flRUMdzJNwVXQ5YezZp8aK3AHg32CR+hU4H8NW9DAohmG3yAHLthpYfsdU
	o/jbz37mbtXO88tAvNBJ3kgySQqSwW07eOAVihcvwJQDE9FV/APxjHgy0YU2smPa7sBLrxTj1Mi
	1uswqgUkD7Tdm0ILMY3iZKFg==
X-Received: by 2002:a05:6a21:7704:b0:3e2:a935:8bc4 with SMTP id adf61e73a8af0-3e369227495mr1035877637.13.1792738904456;
        Fri, 23 Oct 2026 00:01:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:7704:b0:3e2:a935:8bc4 with SMTP id adf61e73a8af0-3e369227495mr1035854637.13.1792738903977;
        Fri, 23 Oct 2026 00:01:43 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:43 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:10 +0530
Subject: [PATCH ath-next v3 07/17] wifi: ath12k: Add hybrid_bus_type in
 ath12k_hw_params
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-7-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX5txbVcIOExZZ
 dqVWpTinb2NvAf8qwfoVRGwTj+pMlvpI6UAWJfZflen/YIiiCSkdnrAoe/Hn2J/Zu9488WB7kHK
 vtBL3me6Hr9cPjEnMYjEWUh/zE29ZN4=
X-Proofpoint-GUID: FKINle3zBKPts90zF-b_IjPBfzgj3nA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX5CQpU+h0dbyK
 2JZzqLRbDFz+ecW1zAp598uoFoqGxov5mjEW9NZvC5Ws5SFU5qM3Ivdp+17nXfi0oN4R0sg7mSd
 XmW25PXlOS2MHNDmOXVUFGihpMpdm2/gSWHYHYVgQ7l8b9tP86T0gtQlj0VL/oMaZpu+OqjoAqf
 BGkSvTbVpvwyGrIP/3xBEWgWpgSy9yZxPLgIptOEMTicT0fIykfIpMt8P6enoy649KXKVh1tn46
 QJae8t8y2C0J2vFeZHbqDM18Iuvnwe4hCMFz8Et9EBazbWcUeOE00oae1qeNKVzEQA9ia9nxssH
 BCkAcCnMRKuTsQ14fiOlJu2Rkm68lLSqFgVJ+2F4tPAeRNtYvasiu5Y0YzVBtn4JOEJce3BMvWw
 3eRzylLe35E8BFuFrBmOBk9Az00if+bjjzo3P9Q8nFJrHBY22pe7Bqs8bONqhxb246P+eGrE3bG
 /Y8RP6n/d3beBPlhyjA==
X-Proofpoint-ORIG-GUID: FKINle3zBKPts90zF-b_IjPBfzgj3nA4
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb0659 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZOe4Ua_9D0VdX46zIBUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000145_695154_F7FBED0A 
X-CRM114-Status: GOOD (  14.07  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor,
but it is registered as a platform (AHB) device. It uses AHB APIs
for probe and boot. Because of this hybrid nature, it is called as
a hybrid bus device.

Introduce a hybrid_bus_type field in ath12k_hw_params to indicate the
hybrid nature of the device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 833aa6d43ce4..fb807d5a6ae4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -240,6 +240,12 @@ struct ath12k_hw_params {
 
 	bool host_alloc_ml_id;
 	bool advertise_iface_mac_pool;
+	/*
+	 * True for devices with PCIe hardware registered as AHB platform devices.
+	 * Such devices use AHB APIs for probe/boot but PCIe APIs for operation.
+	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
+	 */
+	bool hybrid_bus_type;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index acc4eabcf2bc..f7992f8c917f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -498,6 +498,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -594,6 +595,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -686,6 +688,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -772,6 +775,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -869,6 +873,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -958,6 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1044,6 +1050,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = true,
 	},
 };
 

-- 
2.34.1


