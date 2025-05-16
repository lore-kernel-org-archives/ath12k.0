Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29BEC3ABC9
	for <ath12k@archiver.kernel.org>; Fri, 16 May 2025 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1EJKheOMiPM9GqihfGtt+delr480OzcwQJk/CmfpTs=; b=os7DX65Uq7TUs3mbrgkyQ/mtbF
	zTSNsAPKMN0JbOx/PuTf1bmyZWc2S7MAuFLxdBkixopdCXlyNCPG/8XLx9eP1YdmgR446oHyYIF9Z
	5iDpj8smeFyN3JPr1JXFIiXgIFSb8eJaI2E9YX1v5PtlLeRM0ohi4ceFHe3vHJI77tbwSacKPxJER
	eBncfaCOvjLJKhBQL1e+nla0uild+w3UXdyC88Rqppafh59YBOtalGYbR5JhzFQ5mof5pXAhAhPeO
	K4wzICdH1qAULYDVyTBuEyqrV4fvYMEyX8yoBHJX+z6BPI+M6sfxQs7NVvgU4KrbRJEFyXU2oYM/G
	05iI6l+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0QT-00000004Pm2-1j5Y;
	Fri, 16 May 2025 19:08:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG0QR-00000004PlJ-0hDj
	for ath12k@lists.infradead.org;
	Fri, 16 May 2025 19:08:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GCFOfG014086
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1EJKheOMiPM9GqihfGtt+delr480OzcwQJk/CmfpTs=; b=Rh88UX7xz+3klM2w
	aTUXEORusMkVUL3WJQOOb3b2/WiVDz6HndDxyIzoyosIg9PJK2r6iH6H1BqCuadA
	1Fji2zptDczbA7437/kxynI4nB1ijYe1Y0XIebjYan5Wo/1/DUxCH1Fo62nLqG/R
	SsCBNDwHi6SUYkT1wMbs1R1k5/HwnVAe26DEVa18hh9heI513OIPktfYscrgIfyB
	8MzssdGq+f/9mo81ZGjp49Av5NU8nVLmEs62umkqCfoMDdgHvLejec4yRZA+cgS6
	AHOdZpAiFm5hKMlgNRsY3F5O1NcUfwsCHSoGon0To+vBlTZj9eAURzpV0sWg/n89
	yG2ZRg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9jtdkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 May 2025 19:08:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e6ccd17d6so2210486a91.1
        for <ath12k@lists.infradead.org>; Fri, 16 May 2025 12:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422534; x=1748027334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1EJKheOMiPM9GqihfGtt+delr480OzcwQJk/CmfpTs=;
        b=dOxJ6yHnXTElncrZEOdDAnmuOCYAyPG9JyrgnMC18wdtGNAdbL/2s3aZIhthfymL27
         caoFPlDH1/sQrpKDX1UMKgNuIi36o5f9c2bYmet/syslrVcyXrk8tkiVK8xFPHu5ojsm
         A8slYaG94gHp66XGUc4IpsCUWWwe/DX/GGZOjMz6+QFH6JWF4laVORqt1cXzXlk4Qm3M
         04JyFHFaOebbKxJd8Y9x9VS9a0dKqW0hSDju4V9g0Z4UJX85L5//BUhZd67LifUs4gfi
         ttVXObuMHF6AGIxjDaC7XMosn6wD1HT3ESgACVkQsBa4TGBx1D+ezF65FmIBxfkW5uZ9
         ccQw==
X-Forwarded-Encrypted: i=1; AJvYcCWZQZ2g8qMOa00d72b7B2dHw24S0uhaS025N+fTP1mm6kkQl/pS6X5KkhrUrKXztTuyhx6eRPw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3GROR/OKejZJx50O/B6hL6SuJAB+UeNafUB3ah+c8FVyzGvjr
	OANAKBeCmexSUuic0QyNWv5ZmWdBnCUK6g/3OBIAqKOhUAFZ6PkbT1ygjO4M6x6L5tKRR+MDUCV
	RLFJJDekdXVg8VwfMRKbr9YD04RuDHJYb1M5D5No7Cg52Bi6wkYp3OPWLiU7nkMaN
X-Gm-Gg: ASbGncvmUzlv5w9zmqXGgTZuBrNnwEqARrgUss/2xHHX/iEbnkbaXYpgs1KQQVyyylb
	7wMH/0m5IatbIqji+1RfZNdiHVIMgvVU3ejV0hAokGg9W/ZdEZy/zNEpMd2FWSIx9yJ2dscLQS4
	BPl+Xz7bu+dm3iNXOtGTqrgNdD5R99K16A1/EO0dIsHcV757Y+YMmg2BKcIZ3ZVFIl2MOCrpEhx
	m/ugv60aY7ffthCpwN/zplvvPlEN6LXevhtJy961JMsSdJDn8kYnYC95HSlVXbguIJV7KGlhQCl
	Lg02w8EPE7PWNThCzp6wTtosoVpCjCdBlh5WVVwnYHi2QSoedZK5HJ+XeHrMcw==
X-Received: by 2002:a17:90b:1dd1:b0:30c:5255:ffd6 with SMTP id 98e67ed59e1d1-30e7d4f4016mr6537245a91.6.1747422533680;
        Fri, 16 May 2025 12:08:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjCoMdR7R7xPNjV/d+MGNlVvf+FoMIYIPH77AH2OP/4hldS1ZVPlxtnh5tCoi/7JYkYDA0OQ==
X-Received: by 2002:a17:90b:1dd1:b0:30c:5255:ffd6 with SMTP id 98e67ed59e1d1-30e7d4f4016mr6537202a91.6.1747422533311;
        Fri, 16 May 2025 12:08:53 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334fb87dsm5537527a91.47.2025.05.16.12.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 12:08:52 -0700 (PDT)
Message-ID: <7fa413b1-99ee-4f60-b458-cce2a2bca388@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:08:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>,
        Carl Vanderlip <quic_carlv@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kunwu Chan <chentao@kylinos.cn>,
        "Dr. David Alan Gilbert"
 <linux@treblig.org>,
        Troy Hanson <quic_thanson@quicinc.com>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250516184952.878726-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250516184952.878726-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ntTTAKBL-IEM1LTKL3PgOZqPNJGfEEjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4OCBTYWx0ZWRfX95EFoWK8y6ZL
 3U3X07FprNYu3fK66JMaWs5i1+8C9UnIoRwC/TEdt/S2hmDOVUjfgS80FoKtoL5qlblH3wVBHdZ
 kzSE55tbGOhv32PSvBjQuNcj6wOO5MFS6RuvveIp9Y77o++b+a29N7ugMQrpHoVqAbsQ+/6MWtQ
 Lvml9AQzNQ9Yf8e/1sbicEYaodL7/dFj6KVlB8bqHlTm8BeYZpqg1nIR/1pt2J58Vi4vETUzlQk
 J47t1XC9NeEf0WlJU94R9PTVLDL5eydOJ/4EOMVAG8ifMOneFG9Drww9a3GD5hB1ioyOfeflayt
 hg+dQ9NQv/VT6cRgwPG4CPHbIfg9LTur1hVRNC+PV2FYbFYxXZuEzLxN+O1dgYt2LhL3xR9gBtf
 9nZsgVUUAD0jqtk4M8rn6E7y1qbghauZ6jA88SYjLnz5hIbNai61jVG8lPXo0sI40nsI5hGJ
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=68278d46 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=uZSOL5_7EVOPlFl7amgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: ntTTAKBL-IEM1LTKL3PgOZqPNJGfEEjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_120855_201007_1C29F553 
X-CRM114-Status: GOOD (  17.10  )
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

On 5/16/2025 12:49 PM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> Optimize the rddm and fbc bhie allocations. The rddm is of constant
> size for a given hardware. While the fbc_image size depends on the
> firmware. If the firmware changes, we'll free and allocate new memory
> for it. This patch is motivated from the ath12k [1] and ath11k [2]
> patches. They don't free the memory and reuse the same memory if new
> size is same. The firmware caching hasn't been implemented for the
> drivers other than in the nouveau. (The changing of firmware isn't
> tested/supported for wireless drivers. But let's follow the example
> patches here.)
> 
> [1] https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> [2] https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Tested-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

I think we are in a good spot now.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

