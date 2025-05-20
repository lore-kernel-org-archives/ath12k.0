Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A211BC3DA6D
	for <ath12k@archiver.kernel.org>; Tue, 20 May 2025 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xfg4gRbkgVq+WXf/LY9kF1qgnqADeMIlYTZaqw82+8=; b=bakr8r3p3Ocn01pGlEIcZqUuht
	rNgsM6S36wHyUCgA2NGynFFNsb9kmJN7u+grJC3cY+fV6qQTA9+i8LwOhNbTl5L2umGZPadDUk2ED
	2ctIPWyDFnfJJWuJPrAvHUoOvbmHxDtNdu2giK/exgcUerK1Wkl0rVGUFGG+u6ZwTuTqj9MkPUxij
	VKusPxwmxqKNtqEUaXf4PhWUqdc7Jntw9cffZrQQV82vSp7PDGleX5OhfBA+OylfPqgPfqAk+Gq8F
	OgyiZfdFcbxFggkSZ2VnhRSR/hC6X44gNRLfgIk0HL6KaJEhSxoGdkjIeqHR1zZFuUYPWvBG8JSJ6
	9gm3iDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPgK-0000000DVaS-1Q5t;
	Tue, 20 May 2025 16:19:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPNW-0000000DQqi-1Kee
	for ath12k@lists.infradead.org;
	Tue, 20 May 2025 15:59:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrC12015181
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 15:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/xfg4gRbkgVq+WXf/LY9kF1qgnqADeMIlYTZaqw82+8=; b=ZOco06WSG+bs5GSB
	yJ/9sY/4a0XMGr+xyhT8EfAabjAWYMSk2PziXtwFlEyZMPkUH+efvzSNhHOJTxH1
	vpTqr8dr0hnYJ+lUtO8rwKzS72V5EcDCZtNlXnBT15K2wMj3NlW0FvSPokf+6QJm
	xdevgrnBkiSCrGKs5PbzPD/rUcLFNFMIvJTjtU4y6Xhf1QFt98hwUUZ1G/tSqZq0
	6kMgM2ct6+R7cgI284FKlTgfvBUFIR6iT2SINeK6GpRBprpDJVurX+N/aan6XUP2
	ZIF4oON0KxNlIGEQrPRIrw+ws9Cd5U5p09KFTmVIhpszEv76kcdPa9/NZJfMB7Ai
	IkLOaw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyr9ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 15:59:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742cf6f6a10so3013851b3a.1
        for <ath12k@lists.infradead.org>; Tue, 20 May 2025 08:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756779; x=1748361579;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xfg4gRbkgVq+WXf/LY9kF1qgnqADeMIlYTZaqw82+8=;
        b=GQc0q1h2LgcMvI+SmAZTJtrM/VtHiIY0rVWj08RZIMjIgkAVkb55ZAK26np6tmAloZ
         E85fjCmde+pwWMHBjzG+5TrgK96f5EbeqGQokG/OesXVjBHqS+nafg8DE6O3+dZ2MotO
         zfJYol4G+nB7zdGScXCw1B0Q2w65rr4PkFTWK7+ax6dvU5/yeekaKU84WDLg/1NcgPCS
         GmtMknahI6JI2nHWzArbXldscwVIj02maUf0/lIZAQDuhz6ECkyKhDXJecvq3L6JdtR/
         r6RByd3FmRp/K5wQmfcumTrLA6ng1rq6KvsbRkKXWMzl2SeZdZOMjCb2YZtfGhFbq50m
         +lbA==
X-Forwarded-Encrypted: i=1; AJvYcCUlPrPSFDne1PwlNgk6EDSixJtD7n+OyPKDiuoJvE06Yy8eq9CQr2lRJWbmzga3/+XIhN1afzw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Q04ngEsBTWux3eju07hSMef+KpO8ifX3RMypB24WKKAhAO0f
	Xt1GnlqkabTrC7LnspqZbF10DCVGF118KfJpoU+9FcnNnm4ybCQGkQVPrdrWF4buRJzqid3M6NY
	tAMvRMNeLqYH81VnImd0s+J27WbcL5QQGlVsEpSbMS8C+96CCuZ8d01K6tw2bUOIM
X-Gm-Gg: ASbGncuKWDHNi6Qa+YLejVY3B9wX/EXtaeIR54pc6nHqs45zCvH/gIOIgCQtM1IEvPX
	8RGOMd+2FUhM2qpcvtMcAuW/N203xO7DZvQvaaHg+E2dNU5/NXtSIptCj9xYVkPrryh0oJbDE3d
	aReyQFzzh1/4R+lEixNN0FDQWvsfn6AvCKJfYEGE3D5xyMo7jinFswkVfZFkWb3VucECOGA0xct
	mgGwGDl/MDrgPfF66vIvzN5sjSDajd9tbEWie/tMmJy4GOi6lPTMr4nBe/CBgP+qPOwvWoSlDYr
	fCzr+LTnHbKdj8/fu4YS8jVyEMIgZ4vAo/OZaTzWixPM6Go/C99er/hxDnUw6MTxDxQ=
X-Received: by 2002:a05:6a00:1790:b0:73e:970:731 with SMTP id d2e1a72fcca58-742a98b2242mr25057077b3a.16.1747756779457;
        Tue, 20 May 2025 08:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWizgywn3XyGyGTvaNXKFMpFRxaBh8bPEJyF2KLoiqVV6nES0DTFBt4rWEuNOifqkRR6z5OQ==
X-Received: by 2002:a05:6a00:1790:b0:73e:970:731 with SMTP id d2e1a72fcca58-742a98b2242mr25057047b3a.16.1747756779014;
        Tue, 20 May 2025 08:59:39 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6f28csm8102336a12.22.2025.05.20.08.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:59:38 -0700 (PDT)
Message-ID: <12cb2f34-2142-4a38-9e73-49c2cf66d8f8@oss.qualcomm.com>
Date: Tue, 20 May 2025 08:59:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/5] wifi: ath12k: Add ath12k_hw_params for
 IPQ5424
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Saravanakumar Duraisamy <quic_saradura@quicinc.com>
References: <20250518-ath12k-ipq5424-v2-0-ef81b833dc97@quicinc.com>
 <20250518-ath12k-ipq5424-v2-2-ef81b833dc97@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250518-ath12k-ipq5424-v2-2-ef81b833dc97@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMCBTYWx0ZWRfX3guhhke3T8nj
 YXO+UJKm7ycR5yJ+PYPVJGH7zbnxaBdyynjr2PnpX48GphCOXVmdyDnDMx6Z9871PC7HQY+Ku+I
 h1UxJwUA+lExaCR88CECCPe3KiVYZDtk2XluGtBIemcTXU/LlkMj1Ci4dWGl8Cad/atQnfA/lip
 QeX2TmgEqnTTZFRXhVwR4pw4z6/54r6+vTfmlr6RESrtBmiOr43DxhmdTVaDB8JIhe47DlWFE2P
 hPGaYeQWCKSnVUK2lvZbkqi3O9P1vXf9Z2VH3kIC2KXQXle/XQ0kp/tb/WuzTfc+W6i7cJPY/fs
 xTQTfd16WlKNn0QPkctUudjSUHk24CHJIHU55yzK1qT16/xAJetHP3Ws+SPPURIrCEs+qMFyTgh
 TOUuLXHwUflzY7qtNUP0pN2Px8y6KzpQPhIcCrX/NhfVZ4IaBRm0ZcMbFbNg2NLOoPNYVn2s
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682ca6ec cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=dKmYHbQ-0j7vB82BiUwA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Xmg6IPStz0F1mSZtFc2drbmiy9Zr6aYU
X-Proofpoint-ORIG-GUID: Xmg6IPStz0F1mSZtFc2drbmiy9Zr6aYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_085942_502511_3C8A621D 
X-CRM114-Status: GOOD (  12.62  )
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

On 5/18/2025 11:22 AM, Raj Kumar Bhagat wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
> index 7e2cf0fb2085ab014fc14a5c81074802674b154e..866de53f37bb5af94e16c796a0052fda39eb4ea8 100644
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@ -1590,6 +1590,84 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
>  		.ce_remap = &ath12k_ce_remap_ipq5332,
>  		.bdf_addr_offset = 0xC00000,
>  
> +		.dp_primary_link_only = true,
> +	},
> +	{
> +		.name = "ipq5424 hw1.0",
> +		.hw_rev = ATH12K_HW_IPQ5424_HW10,
> +		.fw = {
> +			.dir = "IPQ5424/hw1.0",
> +			.board_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
> +			.m3_loader = ath12k_m3_fw_loader_remoteproc,

Until the firmware is available in linux-firmware I cannot accept this series.
Please work with the firmware team to make sure I get firmware via the
internal release process so that I can stage it.

/jeff


