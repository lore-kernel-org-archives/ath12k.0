Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AEFC02194
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTtt5Umzl8f0MQQ+FEWfSkt/Y1ZvsGI7KUtBBOh5RVw=; b=gC0Tjb9uLMVhAbsw4uAe2rmtLM
	EJXwEfD1m+QUQYhiiXcI2NYtLqygmm7f5yLb6MbVqKx8jgRWTSoFybBnk5iBt4h4HsulhV0QzlOf7
	qu6dat4fzUxJm4qzVRtoZ5gwz3sQfG+oGxNfHm7bC9MyOlCL9SQU5XaTTUBsg/aIvkl9s6s5nNzP7
	rb0brKWfu49cXk84Ckd6uGHDbJFARaYhkHxeDWVzmYZW2juL7FGr7XqLDd7/VaXXadxvT03LsZxCv
	Q34WnBSbuHexcO/kIdGUX94Xm4UfvFl7DUEyOVQJMoPMrfIKyAUdMDAMjDAGhPRCHg2mBQjAsmDUG
	fJJPpHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNUR-00000009WCD-059w
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 12:29:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNUO-00000009WB2-2h0G
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 12:29:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770cld030044
	for <ath12k@lists.infradead.org>; Fri, 7 Feb 2025 12:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTtt5Umzl8f0MQQ+FEWfSkt/Y1ZvsGI7KUtBBOh5RVw=; b=JqEriTBmUmINhpcB
	U6YaZyNOvO7+OnfiwA84V4sHc/SRJPbK+ssav26b+mDgyZFblWXtENivYToVrFki
	VTDuAtuhomV8EkuHDVj0F9b9+IAEnm5CFGVzpOgxyz5+btYKVsYnYeD3SpzefggJ
	yy7NKAMo++klsI/VUp/hsr/XTwGPUmIGCNIDq2CXqjSjc3tnIXvMqO7DfElGP5Ft
	Qilg4YoySdYLrhU2CxAdKCZxwmgdi/EkgzTuipX9rVI3f2eklGX6xnU52SHJaGgN
	gow7WrtURMsZd9l+7chi+ppMLP3D2NxiBI0wtq/EATafWBbzboKNb2854CEePE1t
	rTc48A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddjgtc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 12:29:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa166cf693so4764139a91.1
        for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 04:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738931383; x=1739536183;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTtt5Umzl8f0MQQ+FEWfSkt/Y1ZvsGI7KUtBBOh5RVw=;
        b=otcI+Xdm2//pnHOSFXdLWQykdE2nE932jMKegDf9jFgIemKVeQXiObSDolU0Ogdu5g
         Z65WMOpEslY9yLtWvJzmvvPjodKaPm/BDKVOkt0Z7uAKgwM4b/IaAS3s3ZvQy7NpD96A
         Y0TbfSnhXmJHDAFApdAFazGUxtJOfFOTFyfOIiN6/3K+jVs8W7KDWIxFxoytpki8+FnG
         kHfs8hKC/TixB38decz84GMiuRYb88nAqz7pGBRtSjB/s6Pil/Z0wwi1/42Ws5cOgxZj
         v3wcpC8aTV74dO3CnBX9zr6yuLUHfLtBcIOLLUHY7L1wKA57znBAeeMC+qViHLW/Kyhy
         SSLw==
X-Forwarded-Encrypted: i=1; AJvYcCUQYjCYhDOv5EKmSp7DJJ3GKsxyg9deoDhROfIoxEe2PTc+IMaQn/ZCY9GJTXCDODqIif0BROY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQuFfI3qAl5b/hje0CLA5el0Jn0d21qYJB1GFaLJ1aISTGkNN2
	gvjjtfLmEUgiQvPI9cj3CAYBJdJ1eGSLcFHU1c0tpNVwJPQ8PM45KySDUNLeWZKL5m85p9L5tyD
	1GR8/GuruCbSpx6XP1OXXn6QpznZIMB58ec5r+Ldicq1W7pnB9YRNDzORw5kt
X-Gm-Gg: ASbGnctKNXlXqJIVUJdHwlHRccZny5gtJDrMQjLrjDj4nzb4yWasBaqc6kS1qbZPtkY
	m/Xf16qNH1dagpk5U8tgc1FJeggMAXNBJtztB0bBBq5FArJjzLs8vuH7owE/sHREEX4kNgy5z0N
	GfEGjnNdf07oBYQm9hT+RjqadH4uOPAGq4nT4N+xlxRU9CIVIQ66vIZXuZXugxKpIFQRsEeOKHg
	6nik6pujtlxq767MViTfO8lBs48ymdGAtsON8kYg+qtVog2cdM0fEbPLAZrSFOZkw73HRoWaISx
	cLXXCHBkC2Jlf9c6VeHCArIwrSwItn9TiXUbHEX6Us9JeOR2i2ya0Q==
X-Received: by 2002:a05:6a00:3e22:b0:725:8b00:167e with SMTP id d2e1a72fcca58-7305d519851mr5004585b3a.16.1738931383368;
        Fri, 07 Feb 2025 04:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7iwW1U2hCTOhBuPmVr7QSQt/y+YyOQdKeda/GZ2s/XJbbBsfpeQ0wf7CsFf7CJd+zi2GgvA==
X-Received: by 2002:a05:6a00:3e22:b0:725:8b00:167e with SMTP id d2e1a72fcca58-7305d519851mr5004547b3a.16.1738931382919;
        Fri, 07 Feb 2025 04:29:42 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf1413sm2964269b3a.98.2025.02.07.04.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 04:29:42 -0800 (PST)
Message-ID: <02c47980-b766-1478-7338-74c0ff8554f1@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 17:59:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] wifi: ath12k: Enable MLO for single split-phy PCI
 device
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
 <20250207050327.360987-4-quic_aarasahu@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250207050327.360987-4-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WSinmAMM5tMy0xbvspsai3cAvLlj2MOk
X-Proofpoint-GUID: WSinmAMM5tMy0xbvspsai3cAvLlj2MOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_06,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=808 priorityscore=1501 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_042944_695057_64D95A55 
X-CRM114-Status: UNSURE (   7.40  )
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



On 2/7/2025 10:33 AM, Aaradhana Sahu wrote:
> The single split-phy PCI device can perform multi-link operation (MLO)
> within its own radio, and the MLO-supporting firmware also supports MLO
> for split-phy PCI devices.
> 
> Therefore, enable MLO for the single split-phy PCI device.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

