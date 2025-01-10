Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A421E7719C
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3TJHhPMA2Fw7NxEBMxigl/WAtTUPKcgdLOLzcKgB0o=; b=QLO87hk2lvf5a27D7Sesfx7u/W
	8MauOKu1x4+OKlQfM+yJqh84hWIL3cwC2getzl43q1HycX+oqdvKmEUEXG4ip97ngP5rK6g3YHuYi
	kDPaWy86k3V7PALDAfcFYNADGwSp8q8VdeZRdxUiaYnKT0rtSLlrWAyN+WlmQql+aa/kfSmyBo00B
	LJSNjTdUmABl5dZOaDs+TRA1+IQm/yqhhWxNlNF8zSbA8+MY0dWjp/cAZOjRrM3ffsE/CN30QAMx3
	hcw2my9sF5OPi0xvvaAvjA2wkDrgGrxKcbesMy4tb11Dv4GjtGlc7RLs3FhqW0UHrBk5gD/puCGyw
	eLPUKchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHng-0000000GE99-0JH9
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 16:23:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHcr-0000000GAfZ-0QM0
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 16:12:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A9Hmeh027895
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 16:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3TJHhPMA2Fw7NxEBMxigl/WAtTUPKcgdLOLzcKgB0o=; b=gv2Vo6ZH4fhiegbK
	f+/v0hB+Qkdwv+5GMEWKVWyxQGNUPELl5VjiBQWEwHGdCFhLv922SuA4591AQfeM
	rI5E/uMb7MPM621ycQ2oCjpX691lZ+xB7hCEtGJromIHFnCPyL5UJ1W/r8/mH32J
	Dckaz3dDdoWBVyeiaLqkOy+RpMKRXIvlr1W2QgaoqGUT9vzgybZxwCOmAfTHueCm
	KGu0cSFGCaISSAb06nDUEt4uv9PwrSaIS5QZJuylNN6yS4NhL1zHmNBemd6Thd7Y
	VTQpiFgGrGGv/mrYrf4W7ZIwTouX9mrPQfgw46VaxSEVmm5zRRu8GAnP/FG1IBPo
	6k9OTg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4430swh4ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 16:12:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2164861e1feso41043035ad.1
        for <ath12k@lists.infradead.org>; Fri, 10 Jan 2025 08:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736525563; x=1737130363;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3TJHhPMA2Fw7NxEBMxigl/WAtTUPKcgdLOLzcKgB0o=;
        b=oXDNeNTjldMIypMfSMKixzySKc9d5D5PNNOEWJk/Ko4jB/rOU03q54l73bRjzdSUwu
         fn6RrjpBPjkAqpW/20l4Keyi99TtkOSNhoWdS28livZ9qOpR2fdhfFQHmqYu6Gp0DyW4
         PCrL775kmL3bl7OMnbsjcPMYQ17j14OI67+WvKqEcRgSSLB8Aaan8jafWuBzvVwsOlKe
         I6cu16D3MwilTZUMPsYRG3FyLq1glG1pxWrbut19iF2WzSh1SjvoVDXMPrkB0cvhHHif
         ggaPNji9IwCmGn/seOvuSLBWut8jOos2SX7ho0/OAz/n2n68Pk7n6kfNtzr/0d7nB508
         Vsrg==
X-Forwarded-Encrypted: i=1; AJvYcCV1zd715fAbAZwbuhvwDqet+UTpKWPaBkhG5ymOZk4WWGzeoxrbu70FTcuVQE0ocINnGFttn+g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr81hr6kIenRA9bYWeEaYGq+3KIwi/AtHpuaarc559jAZzK1fC
	L8qAAqED9dV2B3gfV3sFOMTOuT7KjynMplxueXZuGk7T+sqn60ubUZVti7lXPq+Y7BOzKmrR90F
	5IvCvDAkkF0dhzIvIg1qw6wEXm7zqfjNyDhCf1VbaNFKbA7fttqbiHdKFG0o/Jz6hrq9W
X-Gm-Gg: ASbGncs0KxEBqB7oRQ1BgxtMpQlbfI9vvxxXPcsV1ZCusJ/lLaDnnyRSHNrvLn6GaGr
	3Wb7IMmNHLdBQ2LBuBWqxgptWBFaEJOfi9LeHiSxEtbo3t9d9VF0Bfj2Dz7knV+sWQXuFuH7nx3
	FohRvirtbXZRFiLdqiZoz8aErKiwF1m44gupAHTb8RaMAIyGTGPQamCtfgSR6Uf9UrhOpPOxzkd
	rSpdMxMNM3IgJ76u9kAyFPtsH2og8mrH9a7kz4vzPh+g4gsBjU94i7oL+A6jXNXRneH45TLX8P9
	9K0UMWWjS9F7PtvylqLv+cxJjPZf2aDSrrqZ/F0aP7vKgcP6jQ==
X-Received: by 2002:a05:6a20:3d83:b0:1e0:d89e:f5cc with SMTP id adf61e73a8af0-1e88cfa6a6amr17693302637.11.1736525563322;
        Fri, 10 Jan 2025 08:12:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRnudrbQIMABFvgTVAlsf/04lev79yZwEeuehcQShSD2zRWiv/ke6EUrLsAk8qn8f5/dAGwQ==
X-Received: by 2002:a05:6a20:3d83:b0:1e0:d89e:f5cc with SMTP id adf61e73a8af0-1e88cfa6a6amr17693269637.11.1736525562969;
        Fri, 10 Jan 2025 08:12:42 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31de807786sm3034286a12.76.2025.01.10.08.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:12:42 -0800 (PST)
Message-ID: <ebe97485-0b70-4a9e-b1ab-a39701d3fd58@oss.qualcomm.com>
Date: Fri, 10 Jan 2025 08:12:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath12k: Refactor the ath12k_hw get helper
 function argument
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241217035920.2683568-1-quic_periyasa@quicinc.com>
 <20241217035920.2683568-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241217035920.2683568-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OEAyW6XnfkJqwNReguoIGSsvpd1mbxEE
X-Proofpoint-ORIG-GUID: OEAyW6XnfkJqwNReguoIGSsvpd1mbxEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=984 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_081245_144762_8CB1B365 
X-CRM114-Status: GOOD (  10.09  )
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

On 12/16/2024 7:59 PM, Karthikeyan Periyasamy wrote:
> Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
> ath12k_hw get helper function takes the device handle and the index as
> parameters. Here, the index parameter is specific to the group handle.
> Therefore, change this helper function argument from the device handle
> to the group handle.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


