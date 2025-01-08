Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C7FE77199
	for <ath12k@archiver.kernel.org>; Wed,  8 Jan 2025 00:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Kr58GMuCHF2yomdZqxAr7GwLs9jKgl881I8HQqfF7o=; b=h5Y6U/aHBRf3sgL+zEt0fmFvSw
	B8s4pJvXaYHBAlZmFDu2sIahh4u1lrnua0CbCons6+Qbunswaw0jhRqFRvpi/ABJbotuw7JLBiiQH
	/O+WB9+8g+GCcIJ0ChNKFH9XoMRgyXc+f9Kw/fae2nqpAg5pTyak5exvqNhVYWjScYJkvFRiKSywX
	HrMeKB8fzDnbHCMNeX+lmEZwXhM0J02Flvt+XgqRNafVYwastVij0ntcJmZotOPfIIjw77a0s6d1d
	Ks/mYOOm+MpqrX4+677PH73Xovh5Y3izg6fBX6tmaodVmkPi/pQ2NTnUGW8SAoQ2AnvnlKWJVpRKD
	BnmGGr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzq-00000006dNb-18he
	for ath12k@archiver.kernel.org;
	Wed, 08 Jan 2025 00:32:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJzn-00000006dML-3aYC
	for ath12k@lists.infradead.org;
	Wed, 08 Jan 2025 00:32:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507K5rl7020158
	for <ath12k@lists.infradead.org>; Wed, 8 Jan 2025 00:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Kr58GMuCHF2yomdZqxAr7GwLs9jKgl881I8HQqfF7o=; b=F6P+g6BeSNEkpAJs
	JE2IB/1lhHcBMSJiOcNxiNY9k0FOlMtO4bfXpEBhLy+qPXIQlttEYypQbfT3M2lw
	mrTxLsx6xrsX7Ro4/O/0c7K7QDhu1Rz5xMZrfdSFkmJ4ZtaP6jbCz5lsDWZccoAI
	5azj+fQPSN+SU3zJ1Ck3sZdbWBjmHgv3UyCtiE0s0uVX/OaeMo4/9CPoCgF/huPN
	um9FzCpB6701RIAcoNtCvYWQX7Lg+I3cn/NXYI6a31otN3OZP5uvQryE51Y4Mf5/
	00IHANlMxq8XnvUWmPSipIuumnGJaulxCQMWso+Y7QV0gYVFy3T4NPF+c2gCvKED
	CNY1iA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441b0k0en9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 00:32:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso24245260a91.0
        for <ath12k@lists.infradead.org>; Tue, 07 Jan 2025 16:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736296345; x=1736901145;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Kr58GMuCHF2yomdZqxAr7GwLs9jKgl881I8HQqfF7o=;
        b=tpK8uMVUncwc+dbyQINGzzCWnBn/RQfXlydQiA6bQPUghbvIUjpiAMMS1F6niwv310
         c0m/MwWxdLQTdFA0LpACcfx/J6/bGI8KQdKRlij2jO6/GrUYgyfuwDer+PecK9Tw8Pna
         E04cBET4Qn81HjW2nJVAvqMRyqWT8ycErjMN9bfndR6kT1ej+KF6bb8HgDDuY7XVyjUF
         7b80EuCBNJbkDBqT9NINR/rjWwKm/yi+CaO/tsP5jnkM1AeKDL2V9VgJPbSJ2hXBvs8c
         XiOeyj1gqjOn1sL1C+UWtSQX9dGHcaqrV+3sV/QKMXXuBTM1Ad8hfPeaVDgGhrPgkbZy
         xAPg==
X-Forwarded-Encrypted: i=1; AJvYcCV2xg6fqs937QuOsKqCpEQS0bm1SZjb4aD0HA/Z/7ZlyKCwqbN8Sxl8rEYF4oXssrj+nzlzJhY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7SogRUo/iKLHbwWSoeppcsHfjsAxY1RkCe1XvnZRBzHZCaZwf
	4w6AOIBb2UYnebOdSc1H+ehpBb80WfDHVT8WCKZAt5LN6gFYkN9bQqtOp7kCeEWtt/3nVmnJ3/A
	NWIZraADDJFnQs/D9f33x11JWca87gXN+/CVTHlldf/t60tl98qPA9rl8Ohhn
X-Gm-Gg: ASbGncvPEfM83TPQYd/vQI4h/VeKQbbOfmCi9WETuxUE28ERXTHwGJ+sgP9xdOkweO3
	LHwQuq7iMo27CCeZOWbGOO5/nhVE0ovqL0rXUQ2VcbgneMk41lzpJDXgNIy8cyK6/Lq/Zt6Ih77
	G4doYOdRjvFqAY9h/gJXMujKZuSFgoA4C0nvx97Yr9IWO4hU/o4PQa6AYeSu4wV5YoHbRpX7n3S
	ylmQvepTaQXRVaNP4MSqhBETR0qK7uhtlJckeukp+KeeSDvYBN/To4cF9ncyLnusPdVeX5ETxk0
	NfXdd6FcKVC0iY0/oA==
X-Received: by 2002:a05:6a00:3a01:b0:727:3fdc:c653 with SMTP id d2e1a72fcca58-72d21f321c9mr1265619b3a.6.1736296345486;
        Tue, 07 Jan 2025 16:32:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn3B6PzMNDMugyTRN0xn0ybwwH/dEdElXFmsxOIHGLif031F9OTsMzDHv0gp4R/WFKr0Qp9A==
X-Received: by 2002:a05:6a00:3a01:b0:727:3fdc:c653 with SMTP id d2e1a72fcca58-72d21f321c9mr1265588b3a.6.1736296345055;
        Tue, 07 Jan 2025 16:32:25 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm34041162b3a.116.2025.01.07.16.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 16:32:24 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20241218-ath12k_mlo_dfs-v1-0-058e783bcfc7@quicinc.com>
References: <20241218-ath12k_mlo_dfs-v1-0-058e783bcfc7@quicinc.com>
Subject: Re: [PATCH 0/3] wifi: ath12k: add MLO DFS support
Message-Id: <173629634423.3079396.13009681696003625791.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Jan 2025 16:32:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: eoNjY02pku6l1artc2GxiA2FzQs7aKwW
X-Proofpoint-GUID: eoNjY02pku6l1artc2GxiA2FzQs7aKwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_163228_016577_BE1B3C4A 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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


On Wed, 18 Dec 2024 09:11:31 +0530, Aditya Kumar Singh wrote:
> Patch 1 is fixing naming inconsistency in CAC_RUNNING flag.
> 
> Patch 2 is not directly related to MLO but fixing the CAC handling in
> non-MLO cases as well.
> 
> Patch 3 is adding the MLO DFS support in ath12k.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: rename CAC_RUNNING flag
      commit: d31241cbd9c5d74eb19192e57806e9c9ee3378f7
[2/3] wifi: ath12k: fix CAC running state during virtual interface start
      commit: 11b86e2ce94278332af8da9c0b560a15c17efd26
[3/3] wifi: ath12k: handle radar detection with MLO
      commit: 40562e84e262dcc1c7226a0094761f6b5eec8153

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


