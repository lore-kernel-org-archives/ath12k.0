Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704EA606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 04:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UKnmTk/t;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kybSvzzL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VhsdoJmb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IYtZwPS32q96ebXxWD/B6FZvV2Bg+QCR0lHqNzlBge8=; b=UKnmTk/tn3CAUuwr6BeWRE2R1i
	hS4lmoEUL9n751rkqvSNj++17RQE2vxjp0CUG3cPtwhunkPdKyFlcgXO7LAD+zG8EZDTcCW4L+z20
	stQV5qpvfY8zkuNUYxOAEXu62AY7yrSTwtk5dU3iAWogqfP6mWaeT08HuVvS02q9PhQRaFLXUpIu0
	HJXRxfLQJZzDS2RMWWIfXd7EaraocVo+9jblJw7Z2ohkRDk5xRKimBj3/yyzuW8fExbtjGpxcSh/Z
	SwigN4mNC63UC9s6nfHva62XeQsU9s1iGGSNwEwYXH9ne05JO2NmzEJ/HfFpoBxCb2lgB0V00XVLE
	OY/Zm6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXMb-00000007i4V-0bza;
	Wed, 18 Nov 2026 04:33:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXMY-00000007i4A-2ZiG
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 04:33:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmnO3371225
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 04:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IYtZwPS32q96ebXxWD/B6FZvV2Bg+QCR0lH
	qNzlBge8=; b=kybSvzzL4+LxHOB+KFtqzZK263XE1lGSz8P/UyX721Fkhd2Vzgc
	Q4/gVjzdqOke7PWkkvgeN2kuBVbvj3LWYsx/ye7Qj4NpoFAnsUPtZCt2Nnw9KE8J
	7gG4GOoi9DnbPEhsUQbZmdw8U5iucU9J6+CjC64ogBsCKYLnR1a78OL9L7un4s9d
	vGTgiB4eB6QZSYWBQdLDmDysMnyg2OqVJf3ict/7pMIybUFMlsRZZSPXMBtCwfJB
	yQKP07wEOmwjvEY7pkBgXlJxcbYDvLGfBpVsHxt79mJGKds+f0e05xi0o5QLq+5w
	wWk9B15VM5kUgxYPUDldVyDtV80awW7yNNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8s691-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 04:33:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso555252a91.2
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 20:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794976417; x=1795581217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYtZwPS32q96ebXxWD/B6FZvV2Bg+QCR0lHqNzlBge8=;
        b=VhsdoJmbjXPMHHmfjEtecdhE6v52yolbbeeXbqVBViSX8hj1M/Nqmxu99+Guyao699
         yqkeFS05rV5M8gWNuuJk16sCibrlhPtVOMxErR20UZbh14QHyRN0qWDQNHCyK1FpuB8d
         k5O5T8WXxAHIMStELlEBuprz6pZJC/AoUg5D5wEOOZ1dYz7hVE3wuCVMfN9OiBrnp+uL
         MFPBOS0RXeVlOexy0kbWqYVu7h9+JGUBJUPOQftjblZ+ddVCvoFTr1avBv153ina1Pia
         XryvRs8ox+ZCx6zTAGFKBhKH5/lY8/enr5ugXC3EfoGK1A/DGU/6yA0UGoheB6ZqNfg/
         Gn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976417; x=1795581217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYtZwPS32q96ebXxWD/B6FZvV2Bg+QCR0lHqNzlBge8=;
        b=Ffm12ZMAJivJFkIsfFhgsDiQUFH0l1woQhAg+m9qaK6Y7E2hA6vFw0UfZrxG1YP5xP
         jONWyQWZC0YX8S9aEh56sVtRO/6IscyU9fpTum4HeY65GhMLD7IFuapmPL1YzWfnPhWj
         2qNjpoIVwvhGv1VMBYLmhMBKjxoWfi6XTeZLPP0rqngX4a494ZYv4zanlVZruF04SVxn
         3dNOyTlnyhUjsqvGAHA8mUg4MqQcJ2bFM/2J+THUuiEnCBORfav+xgpegBayU3gY4h//
         SjM70upWqN/X5IsJAGpOGRWhRmF84X5q5R1ayiShxTLeYW0e9QuUXRqwEN5QUxtj52EU
         EXgg==
X-Gm-Message-State: APuU4Z8GVE33QlVA/wdVMZFJJIZ9cF+tdl2kzg7oQCboyj3if0Y53omz
	ecm33egNlX0gpTgd3Up78PmPu/mBJKY0Cb2dcOwk5Kw6VVi8XKqn5eowQOQSfuAG2P55wdBtU1+
	8Vk9Sl4LFNJnWFxPa3jLXuSdR1vtUPjbwt1fYXAgCAvhq6AybLxaJII2Ugm/ROm+60NI5OsVD
X-Gm-Gg: AZFdTZdCzKdBC4iQP18b5cOeGHpvj3R9K9VFAMCcdBQTsA5KLyeKwAWhSODn32Tgj3Q
	2p/WYoJD0ifYNmQBolmzvIFlnMrc5oUGzejNcGMMra/5Xm7O7JApmsSHwBuWeiKADl5Rd76mJZM
	MiDTu/n+sjriMmhC9KTq7IS/W4eTL24bPd7iu3SDc5s5Q0e4yPlID6zHLUct5t3U4fYzQ8kPTP6
	yv5CG+lsqBAxWwDcYcSGvex8SDXNtNNDHS/9x+7sslOWZRTpR+5iJgBPUQxPh4/oQNbK05zHHDF
	v8elTNjmrVdE6gTqX+tdpG7aMFyJjljvGvyF3bqZuKT4dLXRYb4TWmKujEF+WdmVZEI2M/Frdbn
	v72igExpEZZf6Oi4s5NeKboD1OYYLwqTlwpUGHVEl3kpGRG357ePD4iK+1Omq+du7kq+jYzK/b5
	OOHpDwsFLd
X-Received: by 2002:a17:90b:5390:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b3d07b9133mr1576171a91.26.1794976416582;
        Tue, 17 Nov 2026 20:33:36 -0800 (PST)
X-Received: by 2002:a17:90b:5390:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b3d07b9133mr1576147a91.26.1794976416048;
        Tue, 17 Nov 2026 20:33:36 -0800 (PST)
Received: from hu-shazhuss-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4ddecasm7086738a91.14.2026.11.17.20.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:33:35 -0800 (PST)
From: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Subject: [PATCH] .mailmap: add entries for Shazad Hussain
Date: Wed, 18 Nov 2026 10:03:23 +0530
Message-Id: <20261118043323.495662-1-shazad.hussain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd2aa1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=9UgsCzVKAAAA:8 a=QyXUC8HyAAAA:8 a=yPCof4ZbAAAA:8 a=COk6AnOGAAAA:8
 a=LpQP-O61AAAA:8 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=cH6R9-kdAAAA:8 a=wmhE9n2aV8QMZK8crdcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=rjeGxHOXENzEDeilVzgO:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: yilA4qUxbw7M8tp669ZJGWKpvFyPCJEL
X-Proofpoint-ORIG-GUID: yilA4qUxbw7M8tp669ZJGWKpvFyPCJEL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXxhv8L17gEkHl
 xM6TmLsQgxVn0vrJdmJvKh5X/3+ap0tF/zqjJR+RffaIp7S96xQ1Tm6MLb2wmcZQsJYyOztdvuR
 o8ltJwiPtR0Cw3+CKxUopJ3qRqAMvR1MNi/VwZ7+IJD/c4HL1UYhBUG/cs4YQEsCWxq1qaJzdV8
 U02uY2xAbQ/DEF/gDo/GXJiffOpALvzMKsO06WCU/dQG4mwV3Ot/YCOVESc4XNUfPttNrloYZj6
 zOMaB60K1S1S/KHVB2+YBLb9a0sUnugX/QDJFJWoAx62ZB+2hv7dbwYw/yl0/E0kU4mHji7N+3i
 3vB7KBslGCCnt1GgeGaZeYiLAwlV+Hk6RlUyfvqqFu70pGC8myyNn1Snq9FmnPpu5vluhSagZLy
 uf8CHExZ7n9tWK7kxvhZ48EFAtx2fiSkA7ps+vzjyhONf7Jd7v0+4PsZikm8/f1q6NDo0lxLCRI
 g9J0jItbbegIoy4C3fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfX9j+yUB4MlBc2
 twsJFBl87d3ld3nwvX5tSWj7qllXBcBb6+Ar+dUEMekPn7BdRia5lN3hdAKrF3XlaKjhVAYZyBm
 r5I3T9Tf+Hgk1M6qPcRPRrooz7JBt9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_203338_659632_F085072C 
X-CRM114-Status: UNSURE (   9.15  )
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

Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index bb8cd0c84747..a28ec33b503b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -868,6 +868,7 @@ Shannon Nelson <sln@onemain.com> <snelson@pensando.io>
 Shannon Nelson <sln@onemain.com> <shannon.nelson@intel.com>
 Shannon Nelson <sln@onemain.com> <shannon.nelson@oracle.com>
 Sharath Chandra Vurukala <quic_sharathv@quicinc.com> <sharathv@codeaurora.org>
+Shazad Hussain <shazad.hussain@oss.qualcomm.com> <quic_shazhuss@quicinc.com>
 Shiraz Hashim <shiraz.linux.kernel@gmail.com> <shiraz.hashim@st.com>
 Shuah Khan <shuah@kernel.org> <shuahkhan@gmail.com>
 Shuah Khan <shuah@kernel.org> <shuah.khan@hp.com>
-- 
2.34.1


