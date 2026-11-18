Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E73606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=anwuDe5+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGw8savI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oor3eP6gJmTEOLsUHaeoGpP97yfUR6lNokWKyVrFJKw=; b=anwuDe5+bK7XH7I7Ua6VKPy2zO
	k5+0SysCzCnYojVp7JiB0IHYBWAtrgr0+b1E+lZ/dc51U98ZQZi4NL7PrlMsbou4TIpD6SvqGoyHd
	+jMfcP32SNTCepoJu4DaJtoMdhXBi/A7zh5Qv4cvggxD6w2UixdCct2wSGJH1QHYO2B87xU+qNbmT
	8UAuFln19jQsqpCLqlNbIVfEykG8fi4cR7ueTa7X/PyC+Br5vfz7wF9JAjw2uSu6XjaMZMFtsr6fg
	0sGoBk3fk1AK/ue+nnSp5uBDodK+6b9r4y8S9DAAdsh/rLuj9UPIe04E0kE3N8nOwTeuEdz45tky+
	7SakhuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVRP-00000007XIu-00Om;
	Wed, 18 Nov 2026 02:30:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVRL-00000007XHo-2vCm
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:30:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMf1CK1958176
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oor3eP6gJmTEOLsUHaeoGpP97yfUR6lNokW
	KyVrFJKw=; b=CGw8savIbkk+S+KhpJTIIRnTcwy70QMzxKlxCddhVQBY7VwTTxY
	BzaLidHqAu+PsMEeqfZwmvqyiP0ZgAXJxFOkDXreKoEniI9tGopGQUrDJF6zRADe
	SQFG7IQGnjB7HCFrZ8bbrBeepzjsfCdCtmxXvHacqQL9Vao29G7VqRZSdn9LIj27
	3DvKdnqcG7I+nj62Z4ZOWZfRpV5HrEHHDS0/+5Tl0keg6D4VwrMXPNkc62jQgcMk
	JxB6vqiTrW+nlo4my+51UYdWtOzN/5gHkJI1uvCijhTG1qd9VHtMgUDMk1Ri0IFW
	NLxOPzBIESoF8YcWoiZv3QXR17zKhhl7ytg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv98qre-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:30:26 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UNOO1766471;
	Wed, 18 Nov 2026 02:30:23 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AI2UMYw1766462
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 02:30:22 +0000 (GMT)
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4530061)
	id 2F29A21889; Wed, 18 Nov 2026 10:30:21 +0800 (CST)
From: Jie Zhang <jie.zhang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: [PATCH] mailmap: add entry for Jie Zhang
Date: Wed, 18 Nov 2026 10:30:20 +0800
Message-Id: <20261118023020.2845578-1-jie.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwOSBTYWx0ZWRfX9Im5XxD5vJUM
 Oa8aK6fKcWToI5K014XoFu6pULTe03MSNFWjy3B10rStIiLWmnU9dApfC49Ufl5tNdaG97Qb+t5
 SVtbHlRnbDPoIgoJWOot3jmBYoBAn+4=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd0dc2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=LpQP-O61AAAA:8 a=4wTDGbzMJxpl7Lq1DKkA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwOSBTYWx0ZWRfX7QwbfpMZUA6P
 97FsowBO8rgKqSA2B9cSTCjCybG/Zkd2PlcWnWBjzXckAcxTV9ZfiAGV2DloP6LFwHZh1vuZH2S
 R4gIjeykGdKxDTn658DkIWZ/ke840TmoRTFhDjwOkQyOclwKiB/DdP4TPYHOx9WiklDUU+Iypa4
 WkRYQVtJSOI8zxcyzmg559vvaxLBt3eF31eSErB4V07k/WwOq2oN+qLhpdxotvyMJyffYMX4tB2
 IAuZDtqKw3Ro8eijw8OEMToPgAPH7QoSk6KFlJ2Tx3zhLVGSnUDMQ4VbdA/GTnlnbe0PeUzRJtF
 m6N1+c1p+gZUQeRU/TyrvaFIYps6Q7nV/L/SQZQbLQPLv6hd86x9HYR8hBQy83h6aeFKhF73A8M
 d7dQVjgScYodxOcuNKQLLD3XpN6WhsNz0NVy/oc3AUwl0KpEclP7uLS2C1RqVO9t9Iiizj3Gnp1
 KlpuFTptrHAOlBYw9zg==
X-Proofpoint-ORIG-GUID: gadmUVvWQaq4wqYLDjG8sMgCriZASWwK
X-Proofpoint-GUID: gadmUVvWQaq4wqYLDjG8sMgCriZASWwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_183027_853618_6BA12F45 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add .mailmap entry to map the historical quic_jiezh@quicinc.com
address to the current jie.zhang@oss.qualcomm.com address.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 12f3acdebd72..683fa8141ff8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -409,6 +409,7 @@ Jesse Brandeburg <jbrandeb@kernel.org> <jesse.brandeburg@intel.com>
 Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
 Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
 Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
+Jie Zhang <jie.zhang@oss.qualcomm.com> <quic_jiezh@quicinc.com>
 Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
 Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
 Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>
-- 
2.34.1


