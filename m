Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE80F606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 02:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aRSwhZQn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FGWH1zZ2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8v6ErD+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=om3h2DBXTKQvlJktU5kBVaeLONuePsWh43GWrP6iAKY=; b=aRSwhZQnpeLdAhi7G6GaUlXw3J
	S6n/6mxPDDRbDkVQ9PMwS1yOXvjYjGzIpQkEuzz1nh+jv6w6uyfVg6AxUl2KqiWdxn2MbTIqVAPFn
	EAXMmxJQg9hbnoYe+e6BpZqLnV6v3K4x4gfP/5f6Bh7i9pVeIn1O3mwpCaWyShVx4fi81FJtaM40N
	N9EoYqTxREny5j3yc/ti0FpnRoyGbTK2M8b5WYQB8I+WQG2l7FdCGKqhQ6Mw3yfFlX9QCRJvGSQdj
	ClYAEwHVIr4Jtd0BSR49L/T5DqBfAj+E2cIXMDlW5vlFSUIB3zXt0EWtrUu4DfYkfB8Y9iX20t+gE
	k2kfuzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVSi-00000007XUk-1i5E;
	Wed, 18 Nov 2026 02:31:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTVSf-00000007XT4-0igH
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 02:31:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0Pf3121739
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=om3h2DBXTKQvlJktU5kBVa
	eLONuePsWh43GWrP6iAKY=; b=FGWH1zZ2vlmI9MohK8v9OQ14OHbR+XYh1deFRU
	MgaOGQRUcHimQ3bHXIuNBpRWhkON52jeqdTC2AVRUR4IovUdKa9BjcWesIlr5ng7
	2LHn1E+ct7v957ENEi2z3dL2y108zrnM1zA9p3H2vc+CHTE6fODSOhplF0PJVvv4
	2PRmkGplbRwBHW2e3zMjC/9TYesmzj6M3/jMyBlORDBfnjK7l7sQJrnjD0+s8NLc
	YAABl1cvE7WrNgBfXhg2+QdrlLPv0yj7aftPtC3c4xXWq/wcc1Y7otqwKO/LkrEI
	3lx/LrtuEWCgVoZNV4k6J4NaVwLcUlKeqju+J0Sj7W+fDPtA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9gr2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 02:31:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fa5673fccso1455384eec.1
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794969107; x=1795573907; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=om3h2DBXTKQvlJktU5kBVaeLONuePsWh43GWrP6iAKY=;
        b=T8v6ErD+EB41qaRB/yuj4weolKfIfq8jypQjH/pJPFuY8J3eKBkDp02N+bn68U4LFO
         zkmksQvs41W+q6nqHsO7Ms2iuiWnS+yfVps2DaTFihW1DkH59LTK3iwI6XlXqtiqU6DR
         Jj7nmLkNHdswE6zfmoU/sErYg+/QQEF1YqKdPIpwdV08IFhwReFsILgsRMJ3o049VKTK
         xnDRVvLTSIwTxM6bWnsFo/Fzi5yrXjx2MVSrZ/k0jIcxL8nIvqgVr/VQqSzXRKB5OwUa
         QVOd6o85PHy264+k1KmGmqjzDdvxRWK4z5vajuxALZf4maASYlVuErhxa1Y3EzA0UufP
         K1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969107; x=1795573907;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=om3h2DBXTKQvlJktU5kBVaeLONuePsWh43GWrP6iAKY=;
        b=j5iAQ+9DLeAharNw5FzJREPJS0NMgdnfl+y55ihomHKTXNPCvsC5lOBQwbPnvh9Knl
         iG1C2pmSgTVb0OX9vktX6zZATZCDZtmrHPDrrveKOYDUyjYx5z/s06J2H4ta90x9XOYN
         buuikWCHtNtm9wpEEps/G2LtrOojwYEJgv/ZKzib4M/iH36c3gVoRHCDCMeaSv4F72rY
         N9jVCatru4Fcyy1wKp5f9rdiat+NQjT1vQAwRg2bxj5dpXKSP3HXpfP04u07xxHYaRJA
         rkjBaygdSVpkgrjdFhq2zmE//zj5mpnlTQOj8AO5l6ogJ1rKf6cxjHTGHrY+ZqH9R4tN
         BQ2g==
X-Gm-Message-State: APuU4Z+8lHDkAYWzwrLToWZ4dfY81g4jdJR/sylKvyMhcSon1BFzNeGw
	m7mLrok7nuIkfBAkzfT4moOwdXm84Q43/2UAF5I+lw2SpW4VWpxVeSr4q+auqzz4kgHugKrgDV7
	vqm74nyv2DP3eNMnnfsPXUxBVSNhMSJQY3sVMB8PGnSwifsx3JBs+miXMUTJWuUkg9VwP2uX5Eu
	8=
X-Gm-Gg: AZFdTZdKQeDc8e5UB/db23OZAd2mSKfPaU6VHH//KLXLqJwBN6UVfu3zRPqLpuTnwNp
	I+vDMyVErxDddkqaJs2+yy1W+E9Bl+tI/lkv4Da5jRM+AZodQPhEH9zSQI1n1YDvK71AoCynZzn
	z0C5fiGZ+qVeim86lzYxhuQprJDWLb/v7ucf16cXVbd3j8ASJajVlwq/sn298BX/qVUaY30fGf9
	XQFBGYnd86q4DL5DwTg9TX62qIMzC5MteXkPhkGtvv80mcWSo4gRPeVz443V4S8iDXXo2elTERq
	iGuEtJW6ARhN9CaFv31GKHDVaB5t9LTTn3rRCSQUKaAGpDZsDBsL6WJ5CZI5O0h3sac7DLSO1A/
	R9Qg2pwtdnV00XD6FEcPGPI8zXWerwXfjQ6KgBPp1NycK/92zoa+5ZWydz5h5npANkU6aIjXqQB
	qukOhqPEhoClSqeh5eP6vtnLkQ
X-Received: by 2002:a05:7301:df44:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-38280269646mr1162734eec.8.1794969106777;
        Tue, 17 Nov 2026 18:31:46 -0800 (PST)
X-Received: by 2002:a05:7301:df44:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-38280269646mr1162717eec.8.1794969106262;
        Tue, 17 Nov 2026 18:31:46 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm2223864eec.8.2026.11.17.18.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:31:45 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 18:31:38 -0800
Subject: [PATCH] mailmap: add entry for Kang Yang
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-emailupdate-v1-1-38c7747cea11@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAkO/WoC/yXMQQ5AMBCF4as0s9ZEEcRVxKLawQjVtCUScXfF2
 32L91/g0RF6aNgFDg/ytJkIkTBQkzQjctLRkKVZKYSoOK6Slt1qGZBrWeVxvc7rAuLDOhzo/Gp
 t99vv/YwqvAm47wdHnzZAbwAAAA==
X-Change-ID: 20261117-emailupdate-da73333bd384
To: ath12k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794969105; l=1042;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=cX8Inlvh0NI1MBu0aB/TsrIVcPDLFefZ3vq4oJ3Ygms=;
 b=dAK3fduuggHq/fu/qBr9dPSIwpx64+A+m3ARo7JnUptX/SnHxG6BejXEEyXE6X/GvbF3xaFcF
 mfAl4fyr6OHBhV855sfr2Yh0/UTxOYzSZq61jHJUoJuPySh2sWW80l9
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: ekPocvrfdQW5e9W4PHVQdTsmxAkZ6t4q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwOSBTYWx0ZWRfX4uZOXlJnvvIf
 pwl9++TgeYPqFA+RxfeQr9NbP1pjSeKLP7OBkGU/urzRhvYv3Nz9iPcDSqt3luJmCFhJuwh3+5G
 ZPQgj2IBfp133YhA8SiYZG/EY+HwJ1E=
X-Proofpoint-ORIG-GUID: ekPocvrfdQW5e9W4PHVQdTsmxAkZ6t4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwOSBTYWx0ZWRfX9JzBxEbjTZRs
 gJuVqo7+VV5wGG4LRjVzeFJWJk+LMxIuy5CLX03zhWqNIiT0Cmc4+kCobPMBDmOLpFf14d6fWD9
 OFyTAmVc/nYQ0hP4MwON6a+Iuul84+/bmztWZfKagYtjqmYiV4cxON+eIEoMryBC1T8mz3F9bsn
 PK9NXoqHdxRfLfqw0Wgkej2JBRTaL1qRvTBXS+hXYLPul2/KolIah8vM7oEobDxzhC5TL3Led4C
 uG88aHFFS0A8VNHWg8Sg+XigwDbRrZQVbF75yjNTJF0GKymyHexzQ3wAiVJkqfHDquxTAEcS57I
 BRkjS+YBktTidkN15W9tVgMAR91kBiRNy4N9C3h2v6Ell0u39DYhzimAxRBa0cwoTvDPY0OgHWm
 mQVj0CnBPtr/xd4UwOqAtH2LYc00N92ybXu9kzRUMWOm8jO9QdYztzESUKSRcnvOThAZXgEXaoi
 fkjPeJ7Sc7dM5Ws0QqA==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd0e13 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sE7CjSugAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=LpQP-O61AAAA:8 a=COk6AnOGAAAA:8 a=vUnu9qf6cM3qBZzUThAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=vEg5ttvfGov5Bh4Mdlh0:22 a=pioyyrs4ZptJ924tMmac:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_183149_344403_630311D3 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 02143d286442..a51c4a071129 100644
--- a/.mailmap
+++ b/.mailmap
@@ -497,6 +497,7 @@ Iskren Chernev <me@iskren.info> <iskren.chernev@gmail.com>
 Kalle Valo <kvalo@kernel.org> <kvalo@codeaurora.org>
 Kalle Valo <kvalo@kernel.org> <quic_kvalo@quicinc.com>
 Kalyan Thota <quic_kalyant@quicinc.com> <kalyan_t@codeaurora.org>
+Kang Yang <kang.yang@oss.qualcomm.com> <quic_kangyang@quicinc.com>
 Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com> <periyasa@codeaurora.org>
 Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com> <quic_periyasa@quicinc.com>
 Kathiravan T <quic_kathirav@quicinc.com> <kathirav@codeaurora.org>

---
base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
change-id: 20261117-emailupdate-da73333bd384

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


