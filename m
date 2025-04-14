Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246BAC369B6
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZELbaDv0U84tC+LLC7Z/j4gjcJscb5SfXUMMBbX6orE=; b=aQV0C1J4OcKhlY0DAurxTLfCmV
	88LoYCaXQJxJ3CTu34upxaSnIyHg3mmcp3lveUaDtwKbS2m3KA8bPj4Zi0mInOyld0hNw9tP75N+Y
	uXMIYcR5HBdmd2A6mWd0kUDgCcgNx92UZsfesNG4QXafMPukwU/hmvpxNrICb5Fp/yFhliQLGXNIf
	AleW8hCoCPFLWllHg5owCk3UeZM1EcadvmIW1DLPoldhWjQFi9R9SFLGHRNKIIvDZT7gtRJQhUbC+
	MULyeMypVW4Ql4amx/VXDSP14tXNeaqKYmgGXt+4eMDr0lsstO5uGLPhqSirwSNQke/BXRiH4un/z
	606QIAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FmK-00000001DQz-3mTX
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 09:06:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FTT-00000001A8K-3ALy
	for ath12k@lists.infradead.org;
	Mon, 14 Apr 2025 08:47:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DMiB1r029609
	for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 08:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZELbaDv0U84tC+LLC7Z/j4gjcJscb5SfXUMMBbX6orE=; b=NI9ZkgYR1ZTqTGzr
	KAOhZqd45aaMNjOy6p4IH8aWj/94xCBfCitjHevabkKqxbySJTmNKes3J5MNLWYp
	scAPuP0lFL2mrtwhA1PRVju8EtPZNmGC/OC9NVN9+K1OrAFFFfC6ZBd2CexvVn3N
	3tFztWtEJQ+ho/n40K6U6JLcTKs0XL+DeMjRmg75yVVeX2liIhmXACfrThs0XPxK
	HfXtXLdtHqNSzFnksBY/y+v6zxVNo7XA31R2OHXPUW431I5ZuUoX5Zkt0uwsvNPk
	yI1P0to6n2nm0UOqxc7Gsnv4iqcQ7eoNKRjMPOlT9nmGsT5vRmEB85QBW2/Y9Wgl
	2wZ6OA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69ky83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 08:47:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736fff82264so3142396b3a.1
        for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 01:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620445; x=1745225245;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZELbaDv0U84tC+LLC7Z/j4gjcJscb5SfXUMMBbX6orE=;
        b=YOH0TT+8JW2r04Mi290fCH2FxP3dhXRbcqRn1NNWeIPkOdjrPHnlhhCd49h0Vw8YOh
         xNuKX0wje7emeqHu4/qBxX7FqFZmwpMBB3ybu1vD8U3sKiFJWS/blBKvWHlXYto7oVsC
         j7CMQ9Ahe2geY3I9hRV4CuANs3V7EzN62gd18kudwXD4RIrTXMMncYlHy7EAF6rhV4/c
         L1XD9n45nlxJ56mYGWF/exKvP/pun0wvBQaBDHIkgu7gqs9k5wqvRCG4CMBKZu1fOQGS
         sWrueqTQjocr6/BMYt/tRQ56xo0s3A6joEdpQXEp51cIRAaTabzJRq7T7aRHqm8crmrY
         0wPA==
X-Gm-Message-State: AOJu0YxcXRkthWw/B4PqkyjfqIR6epASxqQfu6TWamOMzRUDlZYaOA9C
	CoZKUOSvrsOx2G7Ymst3ca00V+nUdl0s91JhvJexJl8oa3qFJJo8/cbiP93VArOtD+QCN9DRHTq
	fMSChhMcNCbfSsSpxV6UIDSSBUYMTi9Ym6PBwMvFawKA6a0GkoQMc3wA/Kpgj
X-Gm-Gg: ASbGncvI4arFC6xZarIobXkdmeMG+9J1pgARe8i3mqFJM3AVJFfCkNFi1Aj/kwzeIXf
	hEPuhnipM1gXre2jPtL9X6gdJUdhdVvAg6xkUEEiaVY6qcjetAMm+uabF338K9U4t8ApWZlZMzn
	FOFtiaosBUHHa3C4GY/ZoqS8rpmfQs3KnMB/Y40+mVJIGSGfVGS0BvT16asqV+GCXIQssRPvO2Q
	BynVVQrQyXr7PRJPZYMxSCJUnX7oDAKMiTb6a/rnE6WQX6HQGXz2EvgR7cHh35UULOtvtjEIMpS
	z2swBeINDiRFQFPXTdKPqGeTyADRJ6XitXeclp+1C6ksIZQtlKUm5Q==
X-Received: by 2002:a05:6a00:3cc2:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73bd0cda1ecmr14619312b3a.7.1744620444987;
        Mon, 14 Apr 2025 01:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJWLlQ30HfEaPv1YPRJFLijVISI9iFiCOfu82TsEXEVpSgZrX0hTvU7P/GWv75CQw+8aNuGg==
X-Received: by 2002:a05:6a00:3cc2:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73bd0cda1ecmr14619279b3a.7.1744620444335;
        Mon, 14 Apr 2025 01:47:24 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f10f4sm6113090b3a.113.2025.04.14.01.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 01:47:24 -0700 (PDT)
Message-ID: <c7558e1e-7030-347a-96c3-4682f32558f9@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 14:17:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath12k: Use scan link ID 15 for all
 scan operations
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
 <20250411-fix_scan_vdev_handling-v2-2-b6740896c144@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v2-2-b6740896c144@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PyuFzlo6eDCsgdTYX1A2RGVWQnFAHrHa
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fccb9e cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=I5J-iTEKvd7tQp2LRP8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: PyuFzlo6eDCsgdTYX1A2RGVWQnFAHrHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=800 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_014727_991184_67CBE450 
X-CRM114-Status: UNSURE (   9.85  )
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



On 4/11/2025 8:46 AM, Aditya Kumar Singh wrote:
> According to the code documentation in ath12k_mac_op_hw_scan(), "if no
> links of an ML VIF are already active on the radio corresponding to the
> given scan frequency, the scan link (link ID 15) should be used". This rule
> should apply to non-ML interfaces as well to maintain uniformity across the
> driver. However, currently, link 0 is selected as the scan link during
> non-ML operations.
> 
> Update the code to use scan link ID 15 in all cases.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

