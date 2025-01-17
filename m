Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1988C02183
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 23:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlE1YBTTne8e1I++1l/sONj2hwpUTlJheHHRR2Yh9Ls=; b=f8yKTtyuFNYvPzjqkeQPyxIHq3
	5+Sx95S0SW7fmxVP1GKu5Y6LW9ABgXQ0Tki/sYycbS4KE5HUuhYP8Rliv337h1VqnARJh/AV1wKAR
	HFlxyMfOGBbJUYgp9Fh1X9XwxuLxLmxgGG36Qb9QpcNfljmlNQ4yiao3pnXhUGk0KFPeM+ZcHr7VC
	BRxmi/R1rPaVPbQB8cipETVPZlb4UKOhasZQq0CNaunaYO+6wT8rvAxAv5aamfwRUS4nvxbltesyt
	taEGQPFNeqvVDTWaYNdGyoSn5woKO4TVe6VjATcH4xGP8rR1XwsADKVN5eFyOi3dscmZROPzkoEPr
	Yv4blo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvyP-00000001Yj4-2rbA
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 23:41:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvyN-00000001Yhy-0r6k
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 23:41:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HLsGlC026836
	for <ath12k@lists.infradead.org>; Fri, 17 Jan 2025 23:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DlE1YBTTne8e1I++1l/sONj2hwpUTlJheHHRR2Yh9Ls=; b=YsHhqzi0vk5nrr3o
	03j+UAhyUiHGhlAWSnI7MTiDMMcUqIUuSuhFgiW0bKwFlXMj4789AJ7sifWeUhWw
	QMvzpJhZt/PvjKcmPKYV+6VljQLx0wNwlNV2Uq/HEy7EKOM6Ri0keaERdwcCAScR
	lt5wS6d2dWRjJrM/yD4V5n6sDH/UnzW429aWdUgcmbhb+i0moo7BkFynm5lKJVOk
	khpUXsdKyx3a+864EvpvSpAHQPxpSxQodkPv3JFvy1tSSgzpXtD5BEtuVz8KX0i8
	bsjuLd2duaVES+z4VePCOJASydL9MbnVuJdgmpVDtTeBxi0INo2uFC12LUkA9J7n
	cgj89g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447yh6051r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jan 2025 23:41:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-216728b170cso50678405ad.2
        for <ath12k@lists.infradead.org>; Fri, 17 Jan 2025 15:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737157312; x=1737762112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlE1YBTTne8e1I++1l/sONj2hwpUTlJheHHRR2Yh9Ls=;
        b=c6HPCu7SPG22Ti+8Wy2LkjblXPC8qS5LBdIjDYW3eT3XGN2q93jUly6SMzOE+Rq//+
         rHmtE0liqTjnihKjn85l6JM2qXm1w1S9EgAkIKO/0g9v+EcanXMS6Ox1V8e56vubU2wT
         3lIA0BET37hOiymw0b2oUbXqIxyNNCi7Pb+7KGCgJlYqI4oevMPNLTC00qGxIKFq3I2K
         m+zUqMnVgYId5puNPdSRtm5zjf4l0kO9ufq2WIGI1iMypbqKaI2iRpHzknCMHG/Ogd09
         O/I3PO/2N3M/L3jk0evgPgoPce4LHaW19/ygDqfl5vKXgreYrIrRkWgbFkwEa1/eBkrB
         7rvw==
X-Gm-Message-State: AOJu0Ywb+Zswz0xRmbR9N5JO3c+h4hyTvNE6n0ObX39Q/rPdb9ZcOD3N
	iH0qZBvQzqMnIXSBMDWVEJMYUJTiAkXSKigiO9QdHZYNVY1uDLMLUfuNhnf2ff9p9sr6ryYN0LJ
	/d701xJJlDcw4Dfbma0qEapaQBE5kRki1Jgik3K/zIP8Euo/1hQt24OidOA8t71daFx8v
X-Gm-Gg: ASbGncu/Fqux8OzziamR9Bnq49KaEY3eq6ePu8ICXl30StlENitTICSXZMR3O/c+Tb7
	I4U0Y4WNLnsEP0TgcL6vyTBXmckJxJYEqo//+vUZYP2ywfZIbwhW78TBAGFHZKuc6qhCpZzxv7c
	LWDuaW+Xkl5Zv19ropoYWEtc8JoSF7C+y97qJZY2c8dDC04TX56TDFF5sNVqxKR7W1zi4e/kQG4
	aZC8z8c1keyEZAuAm3RBsVHNuT/dLP1LcYj3PItOFjSWfWImc+Bfhkk9ffSXFcQ962G6vA94c2j
	+rvY4/Fpvcsl/KQ167KCsEuHE6mf5f0=
X-Received: by 2002:a17:902:f54e:b0:216:69ca:7714 with SMTP id d9443c01a7336-21c352c7a86mr73954815ad.11.1737157312045;
        Fri, 17 Jan 2025 15:41:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEknRc1UWjcu8zhTvjm2/SuMayJ+0UjFl+FDIgz/MK4fFIHZRCNwmFGB+iNtO5sqA8CHmjBnA==
X-Received: by 2002:a17:902:f54e:b0:216:69ca:7714 with SMTP id d9443c01a7336-21c352c7a86mr73954595ad.11.1737157311677;
        Fri, 17 Jan 2025 15:41:51 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3d86e1sm21565915ad.172.2025.01.17.15.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 15:41:51 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241224143613.164921-1-quic_periyasa@quicinc.com>
References: <20241224143613.164921-1-quic_periyasa@quicinc.com>
Subject: Re: [PATCH v3 0/3] wifi: ath12k: Refactor monitor Rx handler
Message-Id: <173715731108.3752359.4147559527899683477.b4-ty@oss.qualcomm.com>
Date: Fri, 17 Jan 2025 15:41:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 6tXTyLHHn-9KROzRc-FXAww75uuSLZ45
X-Proofpoint-ORIG-GUID: 6tXTyLHHn-9KROzRc-FXAww75uuSLZ45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_08,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=708 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501170184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_154155_260864_02419D47 
X-CRM114-Status: GOOD (  10.90  )
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


On Tue, 24 Dec 2024 20:06:10 +0530, Karthikeyan Periyasamy wrote:
> Currently, monitor support is not added. However, in the future, the
> monitor will be enabled. Therefore, refactor the monitor handler, which
> help to add monitor support in the future.
> 
> v3:
>  - Remove the Acked-by tag
> v2:
>  wifi: ath12k: Refactor Rx status TLV parsing procedure argument
>   - Updated more details in the commit message
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Refactor the monitor Rx parser handler argument
      commit: b238941e8e97c17380f6a6a2dc51520b1829c167
[2/3] wifi: ath12k: Refactor the monitor Tx/RX handler procedure arguments
      commit: 844c256892e162e85db52ce2e1f3d14053ecd488
[3/3] wifi: ath12k: Refactor Rx status TLV parsing procedure argument
      commit: 1254580d4f831808462e719e00d43a46e4254631

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


