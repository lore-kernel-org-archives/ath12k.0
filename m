Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEBAC0218A
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 03:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKteQMHqlRJk4UrqMtXm6v7SVSqrFvlYT+TlaH42rZw=; b=SQaF9x65Sy4go5p2hiMlsBYoZv
	CCkyI4FW/jfgnt93RBZsFZcALlLaZbIzHu0phrrN7M9va17E05KNCHq1RxA2GdRYH6EFpQ/DkXfcG
	6fi7OYr60cgRcZEvBU+959GgmYd4ySGeMGsjXxbnltr6Xi6PCQ3JVjTYq+tQNxjzPLhExf5IW99c1
	P+LymI8xagFDl4X/46ValyccHMgfVJXfFPWI+GogntjRmiw95QjEY4tReAOg3ZVH1wa3iqwhROIKM
	cgjNTrpPWXfoscjUqaBVCWgDq+SFu0W48F9gi0CTVDvfxGAmWELR0p/p5ponBvBJsYeas8wfw04hv
	IdJwP/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tenVm-0000000EVSC-3dQU
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 03:52:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tenVk-0000000EVRc-3G5b
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 03:52:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51309iTY009904
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 03:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GKteQMHqlRJk4UrqMtXm6v7SVSqrFvlYT+TlaH42rZw=; b=NFPBQYdd9ptds73A
	woVtFKmI7E/di6jVfj19Y/gJ5J+T9v9tJ3uUERlXpnA6kAYnnf7ZeMghdmD+bSgr
	IcfzKM96FTW2ZEuQi8IjI256NkUmDzqEhWUGu5vlXOZat/IY0xYl7dMo2Uy1OXO9
	IJ0HCjGmLbboftXPVZmJ5tz6SZZ6wKKaMB8fmAwV9tO5O8J5EkUkFPoQo5wu0qvX
	O1sSZ60xVCpoTmnPu34mK14ixUKlWiEA8sneyCxjSeg1RpPdwV9WM0OuWz4W2LOO
	WMVXvNlfj1OrBy6tgTxD236YGVFlqypKMaZc6xH+u5Nb5UY7dnwCSjRRTZ1JDG1n
	K6W87g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd8rb4a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 03:52:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso7582520a91.0
        for <ath12k@lists.infradead.org>; Sun, 02 Feb 2025 19:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738554755; x=1739159555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKteQMHqlRJk4UrqMtXm6v7SVSqrFvlYT+TlaH42rZw=;
        b=cachkzT+8ep8yHVcXUu5BRuXZrS5ERpix3PUP21mlRtJe4/goSEJoAnSF52TM3Wjph
         Ic7MsCEK1dcBY24ut/gKA0MC7hNSaNjZRfmKCSxDfT64I5N9CokOLiJRyDoX4Iq5Akn5
         Jt+l8WoErM8qQUrmUlwwk2NLTKMl+BZWtDdatvKRAZuRv31ohXI7SezPF96ak1E1Zf5S
         BU1RauDgoNS4ejhbW8+c8dJQHgAMyau/AY3UnOH0mzW3Kbxxef/h5A5uw2IpfkIRdIGM
         ElBg3JPMhtt8hPr32LMjVkTuB4kvMRuupfPceOAfRnyBmo9drYYY5LEsSvicDK5Hxi/T
         RtCg==
X-Forwarded-Encrypted: i=1; AJvYcCU0xa73KzCLHWF3efrSWmOfV5jRaPjGEd7VaHTVNrtc66QF6LXDq2C+kSyvP07kgkKWkI8RRc4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIT4Rl89BcjuZCSg20fq5DG6kq9XTqafQrUkSMPpmkXiWPd+2c
	3+CRjsvZydXBiirbfDLxk1LNscAXoYRxtzYVFyDZVQ+OGECyL51HVdklfWrTs22VuIi2iikDy9c
	gpA2eaU+FsSy6vmaEiLyE1niJ9ext4bJ0tKB2A3fJcgRPKCgdwNKJKLBtjpVf
X-Gm-Gg: ASbGncvOI7IQNbzsKwtcp78Fa2UGPjOr0TE2hDV4ta4V5FlTAYqUFd/afy3OIIXgsR8
	baIbsHkdOoSF8G/ReacJsq5p1x08D3q/52y9w2Pbjk8xZa4PqhT0Lut0FrZUtmcmmT+V14dUpt4
	5Lo84VHhmcQ5fB8MIb51N0t1tKl5vVzg9hwojZxHMfyE9Pwlp6oRl+EHpjt09Rql1KcNROOwc+R
	SHsalrTI35EaHS4XbGo7hJREmXvWuzoFMAG6TYolLIOCDsAvqf7sk+atUfVfgvMc/Ec34Z+wuFw
	4pfeBwm94VCoTxscVqBKkYbuIuIIR/CtLRoNIUA=
X-Received: by 2002:a05:6a00:1412:b0:725:f153:22d5 with SMTP id d2e1a72fcca58-72fd0c623damr29883061b3a.18.1738554754907;
        Sun, 02 Feb 2025 19:52:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLyehUB1VhbA8JH+IgZNPWA2yDL3hKKsHac+3y9Z5waJGT7vyu1n7wVoV7h8i4tgGOV5FoDw==
X-Received: by 2002:a05:6a00:1412:b0:725:f153:22d5 with SMTP id d2e1a72fcca58-72fd0c623damr29883036b3a.18.1738554754404;
        Sun, 02 Feb 2025 19:52:34 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf82sm7574665b3a.17.2025.02.02.19.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 19:52:34 -0800 (PST)
Message-ID: <ef9bde28-861f-4e51-8064-f734566b125d@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 09:22:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: add support of station average signal
 strength
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250201211301.357985-1-nico.escande@gmail.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250201211301.357985-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WQpZrHCIRwWc9DltysAnSGIj-UqpdaTP
X-Proofpoint-ORIG-GUID: WQpZrHCIRwWc9DltysAnSGIj-UqpdaTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_01,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=719 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_195236_827100_8809904F 
X-CRM114-Status: UNSURE (   9.96  )
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

On 2/2/25 02:43, Nicolas Escande wrote:
> This adds support for reporting to the kernel the average rssi. This is
> done the same way as it was done in ath11k. A simple ewma (with the same
> parameters) is updated with each rssi update.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

