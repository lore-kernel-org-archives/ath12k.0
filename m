Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70E7CA0EDC
	for <ath12k@archiver.kernel.org>; Thu, 21 Aug 2025 01:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NR+vh6LE4SGXIfYBSWW5OYZQI568bMwupWZLhXvq1Q=; b=qEnJ1aYAbw+0C+iS+YxXbbmBvB
	Q/NHbv+2IIzsjcjgN0o8mpme/IJOhxwE6uZH0SUz0WymOAakIzDTuGMaNdzP/1a02eixbYWKXTLOw
	KHnaCmX4XJBIP5qGVaP4/Q3IshsrxUyJg3gI7bOrrC+c53eW4JLMDxUF+gpP3nllRRyjLNEcrFDSz
	Ww2dMaJ1Gh10hrSvtivP+3OGICoDIvnqAB+abFCp9Zt6EK3QTp5X06pt26FVqxjHNkxfdZUzqOcX9
	wNV8YlrwVb+lb6auO2mhRrO3likrNLeVuPVJlkNQIzJbHAKNu1poKH3NDpWretEe0Yn+hERqIY1RR
	RVG/Lm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotwc-0000000FQIQ-2efM;
	Thu, 21 Aug 2025 01:18:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqbZ-0000000F1OP-08Qx
	for ath12k@lists.infradead.org;
	Wed, 20 Aug 2025 21:44:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KIqfFH009507
	for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 21:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NR+vh6LE4SGXIfYBSWW5OYZQI568bMwupWZLhXvq1Q=; b=CMiIBZwVc2MO6Xcr
	1UaK2w+/3YgrLTo17l1XmjI99twmQvVFcCOxNsa+8UC5B5TtE27gJJtW2D1DLb6l
	yOnCkNgna2bqSpm5LK4v7OclBqkJOND8Xr33WKkKq5VXpIXptsRYr4voLxggmd80
	r96FfyP3JjYZZWMAUn8gXTAF1luf+4THH2eAFz4cmEnQ2QCTqVNLtvY6B+59LnRV
	1l/5J/zIfRkA65RYinEAHFcsDSpK8XIhsF6oOEx0XPlZ9fdJBeymNG/irssSdTZE
	RUn8uU3WZ7iP2D9IQpluhc35Twl9JrLGCEhDvL6ZyIWcN0bJUqh9hhVjBRetCk/b
	MmEjfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a37q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 21:44:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-323267bcee2so358745a91.1
        for <ath12k@lists.infradead.org>; Wed, 20 Aug 2025 14:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755726263; x=1756331063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NR+vh6LE4SGXIfYBSWW5OYZQI568bMwupWZLhXvq1Q=;
        b=vNoGkyofgMexI+7b5rl9GGfTORq2vxxDTwiDlrX4+VYbRb8MY5rXs/3+oARw5ZS8dY
         HVyl/P++NMQ4ryElfiP0zG/G/mNY27YpzjtDi68VmonKq/PTugABKHtAk3uB/ez6wvgi
         gd4LwQTJDbKmQXDSdaoktxATLUXHGANU22BUAefTA8RFiHBEYspCe6Kp+dZsNzcrmbiH
         YLxeWqPuCZHR2iAMZrWuMGhJ20QTcX9nRMKYLpDt168HTiyAYyZC4Yv9o2c1DtCVTPvP
         yzu8reyizcfCc2S4T90gy82MIu2H6XCUWqjBI2DwuCbvRz9K3dhSCmBNigeHvOpbZP4v
         x24w==
X-Gm-Message-State: AOJu0YwcjZmJOYXwxxaFliCMMRbM5lbH3hrNmgs6lbZ235NbeoOLfPt3
	2SxqaUnG2A+tQ/c39tMHyMIhqpY32x8LM+HsIkpLmVMPfkpHuz5Fn6H09NvZUu2gb+JZrnUp4E5
	KJNWGME6o18Nk+FG38v5z/NUEMEy0iOX1jSksub+jYt00h/fFJCh2p0TvFRtVr6RNv+S58U5x
X-Gm-Gg: ASbGncsZ2O3SMNMxSuJttUtycnYmLF4B1wAMVlLsDGV4AAVxHi2ndJs+1jea2uyADAt
	MvPVPEhmoUChP/CAFDKm36aPAH14ZTAxeV25BvzB+oRBUsrY/bSJ3gTSrH4fuXr1R+U0puMu2jb
	FmZR0L8Bzh03gEB8srLBV83mFiajmhujDH1ComdHKnPU3XHeuBt2d3zmGdU5Q3qIowlvLNSQHRj
	AghovLJXHHiOMyXFL8pHv1w6GYCkBI8W0J0glR1Ed7qhfazqZOT9zQClRS0ZAtaHSUGWvpXBHGs
	eh4iCDTmtP0ccF4TXGXrAK8cAtz392MzhU24x/FecbB/bd99XtalDGTQOjyU44HVtqIfPi3hCxn
	g
X-Received: by 2002:a17:90b:314a:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-324ed0cbdc1mr421943a91.5.1755726263470;
        Wed, 20 Aug 2025 14:44:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMfLg6vzZGGs3apKM7B2XpMgTzTKZhrWKOlH2IF2SvkzDTojyMDDWg2Ax8hTXpqaMPiAHs8w==
X-Received: by 2002:a17:90b:314a:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-324ed0cbdc1mr421911a91.5.1755726262914;
        Wed, 20 Aug 2025 14:44:22 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324ec999bd4sm120736a91.4.2025.08.20.14.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 14:44:22 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kiran Venkatappa <quic_kiranv@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
References: <20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com>
Subject: Re: [PATCH ath12k-ng 00/13] wifi: ath12k: Ath12k modularization
 changes
Message-Id: <175572626226.443390.11088672380590789485.b4-ty@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:44:22 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a641b8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Wa6gWqMl3lgHE3ZPCBYA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: za1ZiJq__gEiNu5laD8OIBVdpuRvI-W4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX815jiMxKk4MI
 puLQxuD3wq2cp17sC+ITwhVp3nbTjQC2LI8XkgmoqhzoY01Dmqir+mXQT9ZRcXF5VhDHm6TCehr
 KIqcyIjwuElUwH9Pri2kLM93Xff6DQLUqkZTHNBbtYmLtXRMtSNCLg4fTg0WWIbCrdYOwybEcHg
 RzxsjhfUfa6IfED2Er6i9G6wNQohdt+6IBy/1T7l0z28+lYqB4v2mKLc8ptw9EGiqy+eGvV14z7
 rXx/FZBFjXSFavOP9xtYOtglHItRZgbCf5J0uXj80U6zw8U76eElZDN5UF/kuEfLbWkGmenZ/+3
 dg8SmIZt9CtSYBk70w5/hqt0f9xnkJUnYTKGjEsCqI1n6BdNJn3+iLJaXizCVeLEOKPHNlOlqrU
 EM8M6dpCXOR77z5pidMbqFiBTjekjw==
X-Proofpoint-GUID: za1ZiJq__gEiNu5laD8OIBVdpuRvI-W4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_144425_079686_19F2CB88 
X-CRM114-Status: GOOD (  11.18  )
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


On Tue, 12 Aug 2025 22:39:26 +0530, Kiran Venkatappa wrote:
> Current ath drivers have separate implementations for different
> classes of devices. For example, ath11k supports WiFi-6 devices,
> while ath12k supports Wi-Fi 7 devices. However, there is significant
> common functionality across these generations due to shared firmware
> and hardware architecture. In the existing driver code, this leverage
> is achieved through code duplication. As a result, when a new driver
> is introduced, many features are missed, and new additions require
> porting across different generation drivers.
> 
> [...]

Applied, thanks!

[01/13] wifi: ath12k: Restructure PCI code to common and Wi-Fi 7 specific logic
        commit: f844982696f57d72e45f94608278f678a0f67b26
[02/13] wifi: ath12k: Move Copy Engine configuration to Wi-Fi 7 specific file
        commit: 5e545696a398ae39f4c0c747a8ba0c7073037d1b
[03/13] wifi: ath12k: Move Wi-Fi 7 WMI configuration to dedicated file
        commit: d650b777858f38dbbd5bd2cb43c97eb261e95f9d
[04/13] wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file
        commit: 7f54938fc5253a89b962fc137ea725e3e3405757
[05/13] wifi: ath12k: Rename hw.c to Wi-Fi 7 specific implementation file
        commit: 3f8d0eb8037b199e84c41c6ba687104ccbf076f3
[06/13] wifi: ath12k: Rename ahb_hif_ops to reflect generic usage
        commit: bca2b24d9dd98c06b61f6e15789b652b98ff7c87
[07/13] wifi: ath12k: Restructure ahb.c into common and Wi-Fi 7 specific modules
        commit: db2929711d705ed244f0f5a41441a6103ecc785c
[08/13] wifi: ath12k: Move Wi-Fi 7 specific init routines to dedicated file
        commit: 387b587a861cf7864df93c99c123877d28100bb3
[09/13] wifi: ath12k: Move hw_init invocation to target-specific probe
        commit: 83cd89a9556a48d31d706f67854873cadbf80c0e
[10/13] wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components
        commit: a72027045263f8261b47fc28e7b6da7571d8cbb5
[11/13] wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity
        commit: bce3b73d1ca744fc1c9cb92eec37b0dd209ae9a1
[12/13] wifi: ath12k: Remove HAL defines from shared PCI code
        commit: 6cbd171805be7443bbfdb8ff0a646348180eee35
[13/13] wifi: ath12k: Remove HAL define dependencies from shared AHB code
        commit: 0e487f03c6e5d8dd5b076b8b061e50e736ab2196

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


