Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC86AC369B2
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O6GepC5eIrOp3iDevOUYzb/ofYkIHjNPUuqpF9IdtQ=; b=KaJS9x5rm6qjB60gh6d4Dm+RDQ
	YgMYCH3ILo0d3SHHvTJxD/mOq3Xi/gz6ZoBxfV2Zl6XkFmqsZSnLNQl0L0GfFi004YOZcvTUZBe+P
	OU+rDTIS7ZmYtV0HaEC8UkkN3EBj5FNgKMcyx2LBIQssihRrDiDYBqisPdgkBu04aJ6BGnfbGdy24
	wmgzTjKCaSes9EpzAT0yRHNkqSn21conLpHM7KYAoi3FwAucLRPwBil8ZK6bsDl+Ky8N8UUBJdWom
	cFVwQNyYrneCfqlJc7n7be4FXwdFl4LBXpT/KDqtqm8AAMe64o0f5LvnKCPuOhXALKchI2MeRrg9Q
	mqAHt6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HGy-0000000BiSj-45dn;
	Thu, 17 Apr 2025 04:54:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HGv-0000000BiRu-47pt
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:54:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLsjOh022217
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6O6GepC5eIrOp3iDevOUYzb/ofYkIHjNPUuqpF9IdtQ=; b=MBsyDNw24w10tTE1
	Sz/3Wm3OkNfiswdd2If8rp9NYqbU8OEM9pQn4XQ1cMP32FI8ZQsI7gDLktLHmAZq
	Xg4Ups2b9RM4/b5TQ3O0cpiuja8tj3Vh8Ifk8vjnl12XJLWbr4gXocBx0S4BNPoN
	PtZ3qWqdnJbHHE39Yk4QpeU/Wb6RjSrCRffoPpiOsUCG6bJbVZ9T240/NYlu6A5w
	XOQqbEzmShGQI72fA+BL5wctEFYJECba4tIiepK+CD0H/XiDdxVjLz74PwUZx3Bo
	Y7ajqRn2x6iLpFYWj6ae/wXtGoPq0yubPw1ybdzaFWbQUkLKzUnWgf5skjBWcVn0
	r5Rxjg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9dn0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 04:54:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736d64c5e16so325783b3a.3
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 21:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744865683; x=1745470483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6O6GepC5eIrOp3iDevOUYzb/ofYkIHjNPUuqpF9IdtQ=;
        b=E2egmPzjzrVjTsSp/xtf0CWYAEd9yR8yO7tclfOgQ73m28+7RPHS3nOW+6d7oiJjif
         NT6SYHrPwo/llk2p0eo0sf6V2rCX1+cBZ5mf0erneoH0HYRiJDZjye9iFzaPS+waiLtT
         FJXB6HT/66CiI8/XAfJ+JOMeGqrUJusp1V4T83McWSYDp8F8kvMgWUhP8yo1ApXSEUAN
         DIO/NOaBd+5uoWYiuKkd/Mdqo25iB4HD5DWQZu9vRLFe9pek4oxyYC96BJbWXB7Yb/bc
         W/gLa9RLhjP/xPWmx1zLkbnSPGCQL5XDaQvwEN7PX4LX7T6hoimiJOjs3KE2EkzgKafw
         VEnw==
X-Forwarded-Encrypted: i=1; AJvYcCU8HSqpwhHjkB0KxPsaFFMjV5VK7MhBcAtHImbvM3Jymy3cW3xUUqTpuPd2CaSPYeTotk+UjhM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGZKiZeYN95kwRJflA6pMhndmzC6qPSRYljdXWcDol++TVpCVf
	Qpo4lLoop1eXsjDIy0QyQSYNYEs2nqYs6mGTJlqAk+65YRryyst3czGsRG+Ytlb5zp5ryCv6Zsx
	bkOFyftMFCEDZepO727v/Xz4jxoV3/PurSd4Vaj7RdeY6YOxmNxC0GQl/nq+g
X-Gm-Gg: ASbGnctExXQL+906AjzxEBQ8oWr/iWQs/sBt4jA8S0VW1Aw9S8x+ZqCrfrPK7Tkrky0
	R55GOFwWBfRdLmCHWCxDuCI1+Cnl9cfthRsHgnOm9cCEZS9k//wJjrwECrqQ11+M/ujRnIDPhfg
	g4h3Zh1f/TQ5TzRp5xV4WMcmtNNTBOItdOavNIlTBcQP+K5ZUIkuPElTQaRsPsR3Q7vMiN1npg6
	6vC7PNJlcV8K6Qiirv9VDe8ViBw11s/XgoUjJ5eFHfpw+bB0YMcaqz9H1aordpdJI9kuQcpSfH3
	1pTpi0xO/NOHnAyQNy9HuJ590yVRLIpXjfHSApBaC+b4c6thhiut3Q==
X-Received: by 2002:a05:6a00:3a18:b0:736:a4ca:62e1 with SMTP id d2e1a72fcca58-73c266f3a8fmr5662441b3a.6.1744865683417;
        Wed, 16 Apr 2025 21:54:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJi4Ktz+OUftQ2wWueXWwIhdolURo7Uz6j82Djaj7l4S1SHU1r4LrjLWjzRFgdWWevtFeraw==
X-Received: by 2002:a05:6a00:3a18:b0:736:a4ca:62e1 with SMTP id d2e1a72fcca58-73c266f3a8fmr5662420b3a.6.1744865683020;
        Wed, 16 Apr 2025 21:54:43 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23332d2sm11362928b3a.159.2025.04.16.21.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 21:54:42 -0700 (PDT)
Message-ID: <1c7f3f7f-bd6e-ee96-761d-8f44766736f0@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 10:24:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v7] wifi: ath12k: delete mon reap timer
Content-Language: en-US
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250416022011.1935-1-kang.yang@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250416022011.1935-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yLak_PJGW15VEQa5zZC77RVJwyh4MoCa
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=68008994 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=tbk3IEclxwNNDUlJFEYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: yLak_PJGW15VEQa5zZC77RVJwyh4MoCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=699
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_215446_148200_110E11A0 
X-CRM114-Status: UNSURE (   9.12  )
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



On 4/16/2025 7:50 AM, Kang Yang wrote:
> Currently mon reap timer is not used, and it is not needed anymore for
> WCN7850.
> 
> So remove related code.
> 
> This change does not affect QCN9274, as the mon reap timer is not used
> for QCN9274.
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

