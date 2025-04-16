Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599B6C369BD
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4SGPXBNbpJTbw+kKWEscmItSk+Ds2TtdKc3wNeiEUw=; b=atVw6bSy6+Vqlx2hoS0IMZS51V
	1CsYhIUF4hFDE0E+IShPA047SB+poZmlldmh6PtsRaxV2k/mX7eJZLGv7GoP59Z427zYLJbp1Ecpz
	P0bCdsWxzZW8WS4xIPW2b8CzXGxR30BP55jA/7xu1UDkgFFGpbAQ/E+96EArBdOJwS0ztWf2IqjsG
	c4dg9xTMR+1xHvkzoTBFIf0r1her+kEv3EFitgVOZvD+t4s5ZgYFAtciTiy6BBhFtD4a+jR0QZPN0
	zUZi8DVifHzW+Oek5YKFKhTu7xC52N4PL6RHdSyuJZW6Aygk3rET9wR7eqTVqdG4/ifFM5DFETAob
	6A8pPqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54dd-0000000A48i-03zn;
	Wed, 16 Apr 2025 15:25:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53yW-00000009wAa-3fqg
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 14:42:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mbul022245
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 14:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q4SGPXBNbpJTbw+kKWEscmItSk+Ds2TtdKc3wNeiEUw=; b=j7PW5kJPR4DCodZE
	wDB6Z5s9NJDgY394gdk+JN7/ObElsMsm/f5Cd7lBHDHvEFaznn2NEWmY8FIp6+DW
	xTL3kXXXLZdvJfJP82UroDNRE6PZ58gEk5EhhiRB5xR/6+ssBPqguSUyWhrfTXBD
	Dilwj1MGNejZvMnsPsVG4xIZeA2S0y3J9WKYzrsngjZVoLEL6woaog8XuBXZjWjH
	UofA1Wlkibf+onipAY7Xo6+UApzJu8CU1I+hePgF+9KLIgX+Qj7qynLWuhJMlGlN
	H8FthkNyxPpDbqE6Z0KJI7fm/oPsCy1JaVvhKKW5NLMCKHx8T62V2fWHPB53QYGY
	yMf5Cw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9btnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 14:42:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73c09e99069so2661899b3a.0
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 07:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744814570; x=1745419370;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4SGPXBNbpJTbw+kKWEscmItSk+Ds2TtdKc3wNeiEUw=;
        b=W5UdKEiRWWqO3EbrIoaT4zDRh/GNBxNR+lrOXWKi2R7JVRjpHii/I5pVnet2hxJIf/
         bcGl0vh9gf8TqjpHBD+uPXqUQm3zGu5VlFBFDJ9uJ5WOGdGoHXQO+2iGEazt5cQs7dQD
         rlY46NS6Mj+0M5g267kMyyaDPb8Nw6P8h3jJ/W2Gb2WYZJKX+XDuISUtV2xYxiK1HYQY
         YW0tBHhTFbc22nZBBAxOfSKWf5dTWobTGl0u70+PG+G/AdNrovptqnlJXuiH6ugvpQBR
         R1i2zlRoeW7Yp2UwXA3JbgVySPnzBmEs5HrPrA73U9wRfyi51l2Bz+DLxjfcF5EN1l/p
         cpgg==
X-Forwarded-Encrypted: i=1; AJvYcCUc7cWCF87hP8HECLDyBCc3fbsUzcXPhJjPm3LEM1W3RQXwTJ8zo1S7ol50g74QwgwNXf6B8U8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFwmGrWsVdczp9X1zRrkZLoA+x+6o5ad7A5O06UIlBurh4ePsr
	01d65x2j5Suon4ALhvw8ji0BABdxTP/CGQyHsDWmx2OKNt/UTq5j/BB65gmwNCIS8DXMqsRP6M3
	nBWf+MxmDe1MUwwrsLbVOE0EycLOqmqvTq3mYbyShsEZ66mVuCSPnHLO/AxO/5IQgvCU6
X-Gm-Gg: ASbGncun3nIOIJeo/iYJko8DA6uh1s8shYrQFV2qOQr2VkymfqCsoRbE2dLJ2iTynCb
	au2TiUtg2sFKNrpEMjtV1+Wqe/5FYjL608mLkHhOFhavPuUWx5aOcCDiuUDZv7omCMSpNU4mTcT
	JL8s1nujQUuDD9Au8YnJT0YhWtH1Kks1q0rB6tdlgo9ww2dWZbp+MOkx9Qd2jq/Y61g9alyLGtg
	rf+cAZpW3xHfvaksYQ7vkSJYltWHA3LblLsSQBM+B2F7irKxjhqmjYLWnDqquBj6kyeVvipyS/q
	U9xoobrZICPREmAYiVfRUmVKfIIPrxSGRlbC6JmJYZbvpb5v0CWBiVcztQuE8J6XrZQ=
X-Received: by 2002:a05:6a21:31c8:b0:1fd:e9c8:b8c3 with SMTP id adf61e73a8af0-203b3fbec73mr2896529637.26.1744814570328;
        Wed, 16 Apr 2025 07:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDFGX4gVdDw4AKxAHDyZz0t/N2oN3itl4EwefxTunKN2wycEuAukkqfiC1dFFLsCYPIEopOQ==
X-Received: by 2002:a05:6a21:31c8:b0:1fd:e9c8:b8c3 with SMTP id adf61e73a8af0-203b3fbec73mr2896497637.26.1744814569881;
        Wed, 16 Apr 2025 07:42:49 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220c2d46sm1347657a12.21.2025.04.16.07.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:42:49 -0700 (PDT)
Message-ID: <fa96e5b4-09b4-4f94-afd1-5e6eb850e8c9@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 07:42:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/3] wifi: ath12k: Fix frequency range in driver
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Rajat Soni <quic_rajson@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250408042128.720263-1-quic_rajson@quicinc.com>
 <20250408042128.720263-3-quic_rajson@quicinc.com>
 <e789aa3d-ab12-ed19-0d58-012004e365d1@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e789aa3d-ab12-ed19-0d58-012004e365d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LpAaT-oZqvkaCN1KZLQUgGpV_DpYFXZt
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ffc1eb cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ccNd2zmM-x14ZBnStIUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: LpAaT-oZqvkaCN1KZLQUgGpV_DpYFXZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=797
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_074253_040994_A2DBA136 
X-CRM114-Status: UNSURE (   8.44  )
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

On 4/15/2025 9:09 PM, Vasanthakumar Thiagarajan wrote:
> You may need to rebase the series
> 
> Applying: wifi: ath12k: Add helper function ath12k_mac_update_freq_range()
> Applying: wifi: ath12k: Fix frequency range in driver
> error: patch failed: drivers/net/wireless/ath/ath12k/core.h:1122
> error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
> Patch failed at 0002 wifi: ath12k: Fix frequency range in driver

It applied to my 'pending' branch with:
b4 am --prep-3way ...
git am -3 ...

/jeff



