Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443B3C021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqXyh11i/d9FgoI4iEyq9N7G01Ko6UG1G0l515btXXk=; b=U/ZpLcbinHzdJFP+KyrIZR2yVW
	ukEQ8GtVHXNz6JkOtIHPto/wNaoRGirkQXL7gxBT/o/p+NPeilFw032VnZUnMLY5RJFeD+soJiqX7
	w+q0d4+BjqIFIm89jtFxok5otP0GAISWAHq7CIxcJY7gkSIRhqLRlY+1MscEwCjtBvFbsxaBrbxCE
	kslFoI1OrNaAC5pTMBJuC+51SWrdREo9SrT3flDUjYcGzxlEuFx9QWuUCjF5VCiRecxDsVgG+ocUD
	W5/o9qdI4nvm715GLamHzh3boOGr9hdVZ7ExKuj0c6GPoQS0xee6AHwUlK0nyrjbPeykVYhIGS8N0
	JIUmyfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toFBS-0000000DQn5-06wd
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:14:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toFBQ-0000000DQmh-1rDr
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:14:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5213JRoQ016337
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wqXyh11i/d9FgoI4iEyq9N7G01Ko6UG1G0l515btXXk=; b=SC4nHPiEAHXYKM07
	f6fxwC2X9zfCYQtE355d6fxXDZ0ptEwChXOYsLqwegKWwQbdaN3UPR80D6za1ZhM
	M0m3eTYYjbBve5YskyldufHvbGddZjHFa8iRfqQuSq/2OSlkjBqqSrnAMR9jQzqT
	5K3roeofgVJ0PvqtK/AE3Fx9tI+dS1YbXHFk7EVOZQwuyjxoHxuGCL1k70Xo3RYj
	42Ysdzc+r31P9xhFLCVw7kxVP7WuVQg7LwGeuykh21EQxoqInN4K489txgsiRjk+
	HRLy/5TWS51kwK1JkgeqJBhCpQPr2GE28YDGVs8euKpNaNbN2EUNCDOlglJNk+d0
	Pt1StA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t7hr5fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:14:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-223878ae339so2487285ad.0
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740806078; x=1741410878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqXyh11i/d9FgoI4iEyq9N7G01Ko6UG1G0l515btXXk=;
        b=HB3nus/Hlm7np87wWC9tKs6zom2Z76ymhMlrpGufBXqkSShMNNZLFCZCvZncfn4Oxv
         CjBquV5fyRyN3xg1CJyTmylK+fbmXeKYwtfplItkMR65z8B2woSk18TdOnvOFnSdtXpq
         01T+EwjEuEPKodFk6C9/Qu1zwb4fy821KwpyI9qHe/63BeNSgwj2qBqqMmW1yCS5s2kh
         bN9Vl5JSrSODgNUoyoo+7L2+fagaRZfdtz9ssaeN49nvhHUkQDp8pBEv3wQ0yf+zCP88
         c8NNd2ayW2z5phDdpTRrVVGhCtkYQQQP85zBt/s5S0rjYMqA3XONI/wmMSm4SoGdhTBz
         7oDw==
X-Forwarded-Encrypted: i=1; AJvYcCV8uDleyMrYezCorHYMlHcCN63fp6iz1ggsDXpVhyo5y7cefDpKH9mDuM+0nWeIOxz3enUQnkY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx68mNEnpORmSBQZ19zbMnAASFgkPtqcviss+A1D9HlT+wmkvJs
	4N8TL/4vwjAuirLuiMysPA5hEbdyZ4HnfdXJRH8kscBjTA70raV/22QehT5jd03FZzhM4ft6RNE
	3KVRO43Kcb3nvlde61/cp9aKw5ksqP1dIQNhCJQYiikwx9D1g6+lGFpmi3HvG
X-Gm-Gg: ASbGncvW+q4GW8F7B9NK/Xjqu7cduk8n5/YaEQSU9kNrRYrT2pS9yfvCjMsApxttr0S
	eRzJfAJkkWFkouDc0myGd7W6iFWkRYaoJBlXzMx1I+C9Z/Whalk/KZFQiFm/ZX3GlcqbpJDtBeU
	FCos7KhP2fqAuzXSImvPOtj7aDS4O1RMWRAUA9FzMHqKxqO10tAcnizqg/KrCN54ZGGmWr/xztC
	DSMDIjIrTk5vmcpgKYFO84tAiYvvXXhDQpRz4KWAhQL6ydUDD+dkSEIccAu5HIpuIbpkDIRGO/G
	4JXpW+DMgcYLyJufzKLZpQRENCEqInwV22a4dhA+hF9fQP3t+JGrLd7vGjSp5ec=
X-Received: by 2002:a17:903:f85:b0:21c:fb6:7c3c with SMTP id d9443c01a7336-22368f92419mr88630385ad.17.1740806078035;
        Fri, 28 Feb 2025 21:14:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoz2h4kdT11XEn1qc7/HfnBptJ7ipR5xoJL1yX7WyyTVEQlp/c5aBmXGyfWjaj6RZK1gN6ww==
X-Received: by 2002:a17:903:f85:b0:21c:fb6:7c3c with SMTP id d9443c01a7336-22368f92419mr88630165ad.17.1740806077696;
        Fri, 28 Feb 2025 21:14:37 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5c15sm41660315ad.149.2025.02.28.21.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:14:37 -0800 (PST)
Message-ID: <332227ef-2036-c2e7-3ea4-1b37f8afd65b@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:44:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 08/13] wifi: ath12k: add AHB driver support for IPQ5332
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-9-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-9-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NJRVays1f_Z-Uh0eyPDWe4qXgqng16q_
X-Proofpoint-ORIG-GUID: NJRVays1f_Z-Uh0eyPDWe4qXgqng16q_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=778 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_211440_601408_F088E66B 
X-CRM114-Status: UNSURE (   7.48  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Add Initial Ath12k AHB driver support for IPQ5332. IPQ5332 is AHB
> based IEEE802.11be 2 GHz 2x2 WiFi device.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

