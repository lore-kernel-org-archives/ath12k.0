Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160B1C021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIlk+ajMDuZH7zWgdOUVSBHCH+1wYAtnZW1d/mXvgbc=; b=wXy/lcHVdsT52rRRfG138qdOCH
	5+Px2rAYxBUn7xK9NCYpYpQJCX5aTdRr31DKvz4m2Ea2Dn+0GxkcgCbVnePIKWA1A1Rq9+6hlcEpF
	DtgFV9AX8EnmF46F3E2MxZo2BR+7XhOe7xL6+OeXCTa7zQqXFzuFF6LbEH8L0etZIrfZeOKOAL6Yb
	Zr2u/Eh18KrxQGpUvsLhPVJjGGylxQWywne6v5mTqaZumm/gYZElRYOJBRyVrXpGn4C2H1HW0PegH
	6gYmktuXI0zQzreL4rhGmnY0m1Q1e2Poi0pVZlI60PbGxJgL96hipcBLiQiF+rGvNtdKmcjK3vcal
	DqNw45Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toF6G-0000000DQ3J-3VSl
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:09:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toF6E-0000000DQ31-2Yo7
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:09:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5214ngNZ022276
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIlk+ajMDuZH7zWgdOUVSBHCH+1wYAtnZW1d/mXvgbc=; b=GJAqei/em8uLud4q
	6x7RQPezu+SEwT3VvtF3gus25OQabyrxMNVjrVi6AvBuVNjFHk6EHFiLS1VGpZvO
	ZLIeCP45+Ad/PwcBXPvecr7t06wEKXsTx9fuWESHUX1cU1uJQULHXNPcmKSe6+7w
	CxoUx8biWWtY/FHliEOa3Bvu8ftKOPtgqCKlQWpbSRq9HimqYByrhKeJSPv8ejkb
	PaEGIFiBDU26lGLgPzEXEp9HQxRyBlCFl6iI9MxwlRWWtvyEyETqiU/HXjfQT4uN
	l8CBJWNVZHwMLTElZUWMVJVFhgLZXg/UCZhJES+nPoh7Mg4Ko7afAL6c+wsvvftv
	6sXhmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453uh700xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:09:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fe916ba298so5747886a91.1
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740805757; x=1741410557;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIlk+ajMDuZH7zWgdOUVSBHCH+1wYAtnZW1d/mXvgbc=;
        b=CTfaiw79cG1b04T6CmMpuOfvEr8SgBYOU6eE65HwcZzfghb+uLuU4fefK670bPCH2U
         YjxnN34CdjWZCe0c5VtlgVNFaHoAB7rz6Tz6ksQpsWKwX5BdSvwJT77hO6W765q6wmlX
         cjo2elURdN4LXIZMY+JBxa9YQue9nG5sn+ovmDX8oCo2Mjj5tHNqjiyWfO8dfi9CFvGN
         iSD/xgW63BNtz+TZ76x1Fvyipdeg11Xbjnl3wAPnm5zYfiA5WzggNf2FPTaS1zN/Ym1F
         QsXFtw77+9+Te0uasuCe/P2WvQObJfcRC4izAbNlsNrE9r7SymqANSOYsvt512joYCyK
         xT2g==
X-Forwarded-Encrypted: i=1; AJvYcCVUYtyF3U0blFtpZeb/pzsmG93XAiutyFUJZKIg/q5h8FwOy1qQH76clbQld+xfUM6+UE1JVIA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyM1FFSM17hNlb9Cp5duCCK0IYoK1/tOd1T8gp/PorN5GIWj3+T
	rxKd4uSglkrgoT/0RHB72hVeYnafZ5CP4p/Uthu5HFhudlRcg9DJHmY/Oz6d6C2RdTvqt6ULalA
	ZUEKB+LQD4XXoCPOwqxANwuiDOowwRZ+ZVAwryZP6qvIRZfFr7qoQ8f78eAJ7HjZRLzxx
X-Gm-Gg: ASbGnctriyjXTXwb73qV99GVUFVCDdTzFQb8L2rn2JdSl005YkGbzR8OiHHEOS0SVMi
	45w35RqQHOgvKIytgmhz0tY3PUirVXE1El/VIS8BCpvhStbfE8P+2nQGmmBcPRVNexlF5CnMkL7
	08wrr6qltYzf9Lu7L6AWX4OJ+TRaAU9u63oUNZdCWea5kxsTiQvQxxgwLCLJZzPc0MBmOJvBTsP
	AIp8Yb/fv2Ll5bakgyKpDsWsOhezawIVC6/AaR9ph5pkrx7cRLtkRQ5pQgx7BGFM9yoGDceOiLJ
	FuQKuimvqRM6KZeG1ZRJuxXXdW9i2XzKEiEDQ/PIuvnNmxypHNJgI4VOWlJJsJY=
X-Received: by 2002:a05:6a20:918b:b0:1f2:f20f:67ef with SMTP id adf61e73a8af0-1f2f4cc6306mr10874996637.12.1740805756952;
        Fri, 28 Feb 2025 21:09:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENJiGALApkF6kplPsgtv8JXeWGop0YeyYL3iNVBG+FhHdCgcP7xLV38B79Z64l3r46ha845Q==
X-Received: by 2002:a05:6a20:918b:b0:1f2:f20f:67ef with SMTP id adf61e73a8af0-1f2f4cc6306mr10874973637.12.1740805756581;
        Fri, 28 Feb 2025 21:09:16 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af14cd45d19sm1569783a12.35.2025.02.28.21.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:09:16 -0800 (PST)
Message-ID: <92c2e144-6769-7c32-b04c-04071ac8d6cc@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:39:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 04/13] wifi: ath12k: add ath12k_hw_params for IPQ5332
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
 <20250228184214.337119-5-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-5-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1GQCPUEjkQFNMJuDdQVBl9iw50Mi-Dnn
X-Proofpoint-ORIG-GUID: 1GQCPUEjkQFNMJuDdQVBl9iw50Mi-Dnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=768 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_210918_659109_8EDE9CE0 
X-CRM114-Status: UNSURE (   7.89  )
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
> Add ath12k_hw_params for new ath12k AHB based WiFi device IPQ5332.
> Some hardware parameters like hw_ops, wmi_init & hal_ops are same
> between IPQ5332 and QCN9274, hence use these same parameters for
> IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

