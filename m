Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEA0E7719C
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 20:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhR//cb/O3hgA+LuYaOWAbog2GV7hLvtiZo870lzarg=; b=BcjYU9OHTVV0sN0m6QDMsjNewy
	F/3l0w5iwML4mVUfSDYWaoXNTFb0Sg+yyPdTKrM+MtHnxDOpAeohSlZauSKae8gUTV+11RmLhu3Or
	DrSAsV/qsyPTuSHcIZmVa5j9Jb0do2vQHQZWH+ECvBF8QhBrZXM6ikyYyfxPkdPM6RZhpCOil+4kH
	+lDMVzDm/6XNJooyI6oxS/0lU5n5VViINq64cZtSVpcvHL4GLhflyKglU1hc0d/TDKg9MU4H9Virh
	AAb+QioHujm0E+AnYSbIVUYzR2VpQ7JuVkcG/4TzDMj1OUBrKs3pbx8CwD8FoGNxnKnDNAn3IhB3H
	OlZ9E4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLRz-0000000Gru6-2m0D
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 20:17:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWLRx-0000000Grso-15T7
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 20:17:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AE6hXW020063
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhR//cb/O3hgA+LuYaOWAbog2GV7hLvtiZo870lzarg=; b=VBJJE77pk56C7zkv
	/yoaJTK7iSbG1PbEpAk/zWgfN27Oj9DFZNzXDZLzFWxFStywXy1GO4Dsyr/g46Z2
	XoJXgbJjp0E6GYEjaFpqDUjv6jXvVS4y9EJNhaqyKxaZXpUyLDtqmpKzbxXongUv
	RfpKsoeBOsjyYGFPwQPuNeTXIZqDSt41SVgb1wWohOG2ldh95JqXH5xgZRtTdB/K
	+AiGeuhz6gRaW1TuaiX4sjeIvQmnlEgAgd2n8xadsW4PCCVmRlVfmv5j+iT5jRpe
	v1cxGQCS1bSKGhwdgafeeCdj5j6XpChbU46hcNAouO/cMJZWL6rIQEZtDA2P8KbA
	zFCa+w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44351a8wep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 20:17:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so6229314a91.3
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 12:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736540263; x=1737145063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhR//cb/O3hgA+LuYaOWAbog2GV7hLvtiZo870lzarg=;
        b=ToSGsEWukmwUxmFoSN7UGuxyXvz3pZcIINt2v8ATQ/cHyvldRFgaC2vnvpOnYq9TmR
         +D2+9r2IdvTYcwKJ15hgbZInWqvTBWjG2JbADv9txYS6KljX88bUZw7TNZ1VRBqVeC00
         WxJx3FgjP8Rj2mFdgQRWcswXU43c8uFbfWygC2Xqf3tpAP8mGvvGa1eLiaJcdKcFK/1a
         Mm/DHknWpBToVgH16TbyQxzRX35urapGUbUuKumh+YIjNTeydY6jxdHormFrpzl5u3b7
         6aiUPj303oC7yuL7yusAJVJi/TWdH1NNqoG9qE0XDaNIpTtHKFqtOth1MwZMviWv7LfI
         v1cw==
X-Gm-Message-State: AOJu0Yw9LntMo9FUzfNdYALv5d5kdCiH2Rf1I2EQUgNRPJ0TNtCEolSk
	UpMIul12lUj435zi3oGCQii3d5j8uV69GGbSitQf40xEq7pE2ee3CcXOY3HkNzMtBI7H6nX+9pU
	oy/VWFTrwF+suHLe6RCzbNJMlLqWg2LjggakIdJ2hZ6FdGSlNId1ZA0R9zRMN
X-Gm-Gg: ASbGnctSRBwqoo6Uzfs6gCAOqWMmofWaeI2sk8FyMyUMaeLmY2lo0Wp6E4xO9KEE69E
	jvQyQ+BxiYNx/WNPc6Y4B+IzoB62WoNA2/X6Pe9BWTVvSQA3sjW3Xf3AKL/a7hRVmhguKeX+lWD
	orgVzsb04nQwjb7ugTdGcb6hRKrE2gBs1JDrFGHL6Mmi2RqNVACaSD6iZ0bzyBzB20EUzzp0vx7
	5jiqUI1UaYnOJNbRdA3p6qgKzv1sE+1Ob5H1Hyp+cfk7reDCIAy4W+pja6ELIsY+Zxn3vLRukGw
	xPQlhau6HWwHNHX5mQ==
X-Received: by 2002:a17:90b:3bc3:b0:2ee:74a1:fba2 with SMTP id 98e67ed59e1d1-2f548f6ab77mr17574459a91.20.1736540263257;
        Fri, 10 Jan 2025 12:17:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKipf/Bwzm7nvQv17NJQKJJDSW8l/ZmdcMDhpnoJ/QHfe1gV44HXEhppGR/6sXggp8TIA8bQ==
X-Received: by 2002:a17:90b:3bc3:b0:2ee:74a1:fba2 with SMTP id 98e67ed59e1d1-2f548f6ab77mr17574432a91.20.1736540262858;
        Fri, 10 Jan 2025 12:17:42 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f97csm17208985ad.16.2025.01.10.12.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 12:17:42 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
References: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH 0/2] wifi: ath12k: Support Rate and OFDMA Stats
Message-Id: <173654026220.2979765.15903710932436060785.b4-ty@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 12:17:42 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: O5VmVQnkLdKjKHaXf16KdB2wxEnnyx0X
X-Proofpoint-GUID: O5VmVQnkLdKjKHaXf16KdB2wxEnnyx0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=786 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_121745_314588_7EF64CDA 
X-CRM114-Status: UNSURE (   7.61  )
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


On Thu, 28 Nov 2024 16:39:47 +0530, Roopni Devanathan wrote:
> Add support to request HTT stats type 31 and 32 from firmware,
> respectively. These stat types give transmit rate buffer stats and
> transmit buffer OFDMA stats, respectively.
> 
> Pradeep Kumar Chitrapu (2):
>   wifi: ath12k: Support Transmit Rate Buffer Stats
>   wifi: ath12k: Support Transmit Buffer OFDMA Stats
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Support Transmit Rate Buffer Stats
      commit: c9f6ee2701d798c2b79b8557b842da7b106fcd5c
[2/2] wifi: ath12k: Support Transmit Buffer OFDMA Stats
      commit: 3f482f2434753a0647dc8753a127f86878348458

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


