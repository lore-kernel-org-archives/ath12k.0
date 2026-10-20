Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED698606A321
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1LKQeVVU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HHve2Wo1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NysHDq1L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dZULhqVxGa6w65QkJiF5vsmoK4e+Xzrl3DeeSL9YLYI=; b=1LKQeVVU9flK0DFPEgRMHUIIIg
	YyDhDz40guyabDOORejj9SKqVPxAZ8vHZJkczH9cdMmaTF6MKJ+QWbXhNpLZRtVBT+YKsZx/jblXs
	uLxFmn6g1KsSCVyh+8U66o+1g8dkyYASQg+78V08Y5dJOniXYdAQ8d344xTX1+N+glVCkx5guCSz2
	QY6xqzxq0zNkdsHF7oMNPifLMgyBd/aI4U5UxSDzZ5MZ1qh6sr3+wUQSQoTQCjhj6nYPaTouENZMj
	33PLQ9RcZj+916j5QNfpP0BoJJNoJLnHgdyykV0IaFQf7jEpEU6yIf0BncnI5Tz6caAkP4eUSG714
	9EDDiiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4em-000000095jF-1reZ;
	Tue, 20 Oct 2026 07:53:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4ej-000000095ij-22Ft
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 07:53:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t86w3806921
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 07:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dZULhqVxGa6w65QkJiF5vs
	moK4e+Xzrl3DeeSL9YLYI=; b=HHve2Wo1LcJqsNMc+8UiLc2+pw7DCkmG0OdxGa
	+4S8AXZUkw2HMn7b1sZ/A7W89wXa1d7DU5A89YUlGMwlNh9+1tA9iYastQ05bt11
	lbU7mwCtp1wbTmIkNw2dD6+W2g2ESZPFd5VKDk+SZHZwbSyqANPGgQHJHW5b9zK8
	eA/jninxa6XGnqJXTdfsKoavsSSLKj3euVzt1Alz5l5BEyS93zdwsKz5yrMfI3qY
	EdlqF0gvuArvovzcsEQSX2d8S0VwL38OWL5TEBdjIHWFGCHXK+IyAb3p8IKWuNS8
	W+9Vwq0YALtGtX31AWWevR8hOb1TQGLf68mv31SYFBC7+c4Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9fr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 07:53:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so8362876eec.1
        for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482787; x=1793087587; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dZULhqVxGa6w65QkJiF5vsmoK4e+Xzrl3DeeSL9YLYI=;
        b=NysHDq1LcroyUNOyQrDVHhnKw174CiuLjD55ICIZyySdb95Ix4zAJRM7Yi4zZxK6uN
         cqIPtNzVrVESb3umAH4a//d4vmjzxKla4uMv7ulZkFphSXLA0EPyHCD3YlemChkR8C8m
         65aCYEhbEJjVhVgT7mgPgfyZ5bM7kImX64r7vHHWvBOFHOhiyW4KvL0KQ2RmMlPm9P83
         b9gHrUYHJVl99Ud05mkGITAir/ECGBHgl9/JtZ23c+WJIUWn/p6yaf+Z+ZCCSl07cgm/
         7ubwyP3e9iZ0r0bsM4EdYcS8EZwznvp9uunHghQ32aXc+JbK8M7skmAmltPb0oqttnfh
         HTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482787; x=1793087587;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dZULhqVxGa6w65QkJiF5vsmoK4e+Xzrl3DeeSL9YLYI=;
        b=1vcmsTgPdBDIgIojRbcbgOfIyJLZtrrutZ7zyaX8Z0B6O88cPCRh08Mi6y5mp7s/FE
         j4+TalzPz7MW+xvVLwaL66KINXLwgtRf1s7UWv9DbAksXWH2Pjs39eoMaUBnpesfjL2u
         SlnFWf3FU6NE956KjwSdDe4ta2LOo0VJt62+LT2dFWaStH0YvlhOgHoD31t5C2DR/sGz
         VMqafx1supceaxEAr1gJTqeJaRk8my6GQTKvvNAC4NZS6CC8QHn3/TQd/ZM60VMEbfec
         QbPg+TgstdAAJO6ocYjIjXc8QoT3IeaYtST0n8opqRpCMh3sd12giBbS5kQ1LBIUH+1B
         HDIA==
X-Forwarded-Encrypted: i=1; AKwUvBy2ZMxPce7rHVDjK6U8HatUHOBovPMN6m6L0ZgH4WVqevWkbD0DZ1zgKD8634+jIyS5faPiHm4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKqDlPW8Sc1h2C7Mbvjgc/NhCaWEgglkQDDJoiMjpAhGGCxTo21
	PtRYlHyHYSBtsuHzzMHEHMlNzsiw1MGjTAfsHLfcEc+aGq91pejD12bq2N9ytvPvWI1mXTsUDU4
	60mTlBk6nL1JbgTa/2C/T/wIRRd4dbixHPtkPvmbypfquhNm6GjlV8lwnI9WErqbwBEA3FxOcW5
	QEoA==
X-Gm-Gg: AYBFou2P4ZTIC8GPyyGWV0jnSHOSz5j0DIb/dohLlEhLOxf4uUrSO3d63+UuszbIFCn
	N3tTJ9h+Qeg90kjKw+lcnoovQZbFiLanZJkZ6wlGBzEQKB1CDzV69jb53lzpo0aaJYo9Dq3dcPw
	Dpwy21u0u7uDYDJWGPath0yEa72SE6/adZXdRBDNs5aDUoSyj6eStfcc+wguWfbRCnKGdbiq8dm
	TKYDv7ZafFQsfdsWbsyLM3tMXOAxr4o06KnpGzxkx8J+d4/Dj4vsbN4DNStT717DOJyfYffCYIC
	d4yG3xl5POPG+ZrEUQVijeMbRxqBFWsv0Q4xMR3uft4Jg2rRLYQB+oe2ZE1U21Gsc7ke9PtIDOK
	e65EsMiWdFtVFuFQ+9ysbh03TOdRnOUg+NBSNsOHP9TMe61+EGBc=
X-Received: by 2002:a05:7301:22ab:b0:351:7ec0:daa3 with SMTP id 5a478bee46e88-361a2541f45mr16393592eec.31.1792482787309;
        Tue, 20 Oct 2026 00:53:07 -0700 (PDT)
X-Received: by 2002:a05:7301:22ab:b0:351:7ec0:daa3 with SMTP id 5a478bee46e88-361a2541f45mr16393563eec.31.1792482786739;
        Tue, 20 Oct 2026 00:53:06 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm63829468eec.28.2026.10.20.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:53:06 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 00:52:50 -0700
Subject: [PATCH ath-next] wifi: ath12k: set MSDU payload correctly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANEd12oC/yWMQQrCMBQFr1Le2kASYileRVykybf9RdOSn0ql9
 O5GXQ7DzA6hzCS4NDsyvVh4ThXMqUEYfRpIcawMq21rtNXqKXFd/Psx+6hs6KILhs6ud6jFkun
 O2+92hS+jSrQV3P5G1n6iUL4zHMcHwz1Tr3kAAAA=
X-Change-ID: 20261020-msdupayload-2c8d4c1e54b4
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482785; l=2433;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=0QLjlN4xVDDPAlasPy5ys/3L8XpQjPcTWrmFjypqwMs=;
 b=2L5Yc+AglV1IkLyw/yoK4HQ/bzPueEFUOHBlMCLdg6KHzhuo4sttL/WD9xL6mD51voEG6RnKM
 i9QLSnXb0lFCNlL2FWXEsOaKkZbhdDHv4U+edxdf5XcaY/KrNg/8gIe
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: 7lOB1ji7n0yNz2a2USdAQP4eYjIt4kg6
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71de4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YtwzFU1t9WoBE-wIZ8cA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX7HGUbRY8/Tpq
 QlhLHnffqY+uXjCEqjtD62JjIK6mHw0GDoWHfnMlXvqE6PAA4YX4cQ29p9y9rqIirgLp90KOV+T
 /8/Q5nu2RObiffwiMklR09jqhZf1qJIaXBA0yN/Z82Sn2ZRDsWe4UnUVHtqyVOh3twpNi3shsHz
 vj/XbskyhvuD4mseb6UnSaMpqlayKxndAIHRgRY9Qv2RFLUMwuDYAOBBdyKWy6UsrqrqawBcr78
 kBkfJ+0ef3PXJeT86pUPHLwoRexpsx9NQKp2sbTY+9NlKN+qg8tZuWc8B3jnXCGwnEYhsWPq1Sx
 3okPBVxasRfedZ9JjwCPHk+KrWmuubWzpFNBF+3HAb34cfq3ZqG3PegXAgrUILUzz8bH1S0MI7k
 v6CirQQycvqpSELPZKCs3/l8K1LzmlMJRhD07DyPu2Rx73eWOjK8tiV+TCcHoebVf4y802Pa4L9
 Rly+bT7DDg1YOZCRjZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX1L+K0t8Cg1Ue
 gd7feAEGmHyVcNTws4ZNoJe1tR0wgrz6MuCk2bzX9xOJ8WIuZvi/HqLqJTSlUdI0Q2ebDfLbEvd
 WxZeTwzfm24oEOJ4SaWetr/tRZ/qgu4=
X-Proofpoint-ORIG-GUID: 7lOB1ji7n0yNz2a2USdAQP4eYjIt4kg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_005309_535606_04ED2C0B 
X-CRM114-Status: GOOD (  13.37  )
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

ath12k_dp_mon_rx_merg_msdus() mistakenly passes head_msdu to
ath12k_dp_mon_rx_msdus_set_payload() while iterating over all MSDUs in
the chain.

As a result, skb_pull() is applied repeatedly to the head MSDU, whereas
the remaining MSDUs are never adjusted.

Pass the current MSDU instead so each MSDU is processed exactly once.

Also rename the helper parameter from head_msdu to msdu since the helper
operates on any MSDU in the chain.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 1cf514fdc790 ("wifi: ath12k: use different packet offset for WCN7850")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 709507d44d8e..ae14e118fe36 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -186,7 +186,7 @@ ath12k_dp_mon_fill_rx_rate(struct ath12k_pdev_dp *dp_pdev,
 }
 
 static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k_base *ab,
-					       struct sk_buff *head_msdu,
+					       struct sk_buff *msdu,
 					       struct sk_buff *tail_msdu)
 {
 	u32 rx_pkt_offset, l2_hdr_offset, total_offset;
@@ -200,7 +200,7 @@ static void ath12k_dp_mon_rx_msdus_set_payload(struct ath12k_base *ab,
 	else
 		total_offset = rx_pkt_offset + l2_hdr_offset;
 
-	skb_pull(head_msdu, total_offset);
+	skb_pull(msdu, total_offset);
 }
 
 struct sk_buff *
@@ -261,7 +261,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k_pdev_dp *dp_pdev,
 		head_frag_list = NULL;
 
 		while (msdu) {
-			ath12k_dp_mon_rx_msdus_set_payload(ab, head_msdu, tail_msdu);
+			ath12k_dp_mon_rx_msdus_set_payload(ab, msdu, tail_msdu);
 
 			if (!head_frag_list)
 				head_frag_list = msdu;
@@ -296,7 +296,7 @@ ath12k_dp_mon_rx_merg_msdus(struct ath12k_pdev_dp *dp_pdev,
 		msdu = head_msdu;
 
 		while (msdu) {
-			ath12k_dp_mon_rx_msdus_set_payload(ab, head_msdu, tail_msdu);
+			ath12k_dp_mon_rx_msdus_set_payload(ab, msdu, tail_msdu);
 			if (qos_pkt) {
 				dest = skb_push(msdu, sizeof(__le16));
 				if (!dest)

---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261020-msdupayload-2c8d4c1e54b4

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


