Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19276C83F26
	for <ath12k@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CduzY1NxzGx9IxDeilA/pnDu0Qgs49OcUvR7vhku/HY=; b=BoDC+V9Zk6k7QRwthUTKtQj9dp
	MJzeRx4xq0aGtBsP/KGNbI8ytxNir9v6vSL5OoeSGsbxY7UWVsTF7sAjPbixT+W/tdebfsQrVLxCI
	uz5wnS0brNBY6p5DnwPJO6OuyI7hUi937xidKzNOyZdkOmIVXIlDXtp3rCSdFn24GButV+uNJVLa7
	VkZl4I4x17vPi/Rp4en+yYDO8OrOk7RATpJxjl3fly4QBN8M5q2E2MWRg0JCUqqOLMKpIHYeHZwhm
	eceHB1b+pw3kpMyoytQpE/TYnvp4UZOZ2Hltq20alPUedesGV8Zgn+6oorHeJiTAQ6jJUQ80or2Hx
	fZMha6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNp-000000083PG-2aQv;
	Thu, 24 Jul 2025 17:05:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexFV-00000007maL-14Cf
	for ath12k@lists.infradead.org;
	Thu, 24 Jul 2025 14:48:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9SenD017655
	for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 14:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CduzY1NxzGx9IxDeilA/pnDu0Qgs49OcUvR7vhku/HY=; b=oXIjMKSCCTvH+hI0
	+Sll9ZKGi54iWqnIqeu3Objksy6Oqnib5/md14blY28KG4GKnqIyp6fqrtWv0ZLy
	AmzUhTww8eCWOnRexFXyybopmZ/Bn4rTw2cieoA1U+UhH3G9V3yG9ywdxBHoJPDC
	nBMpLsiZGK164HhiIt/nCOyJmIp6SJVANdscj7qj7VwHZh3RC+HK4CL9XXTvKB2l
	RW7B8QIuLL7MC5eW/Ad5OfQXt65qzPeKs8zA0ra1s/TP7XKKnZg2PZ6tVyIlUnRh
	DAj4Du0DjaItXzd08B/NcfwKoDentm1jdfAdL5VabCjTBYBE6+t0ae8pUtdjVc1o
	Powv8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3euy69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 14:48:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e1d70d67so10646895ad.0
        for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 07:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368524; x=1753973324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CduzY1NxzGx9IxDeilA/pnDu0Qgs49OcUvR7vhku/HY=;
        b=GjEmQQb00CgBYcW5gthV6LS8aPbQg6xv+VvyCEq/98bW7hcnk+d/tbd1Za5QNuawRc
         lm2EyF+GCXRCutRFiwEEgx7sHjQUBR8s0ygSh+g9UqC20n2EyS6kZdXU0Ta3pDwuDpGD
         /No3yPyVLLXfHXJAf8GbhQm+rlHeK/x74RPlfIy+AZl1tv3tdniYS91c/PgDcIDhJ3z9
         Y6BTLpIJHLDipZG65pVOEBgPSU8IchsZ7xBbl0RmVGuGn3sjOP2MdbrMIrMrTdQNwvfK
         rlGW/S8Fl6vb1QSSNY06Yjz0miXRsP2Qw9l46HgtaoWbc1anm4f9Nrf3cvNuFWqY6f+9
         TEtw==
X-Forwarded-Encrypted: i=1; AJvYcCVH/boddksCnOCA7iNY0AFIxjEuS26WjP7dojRD5ZhxAs7Kiyig62u20AYbKECWTz6De7Q+DYk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRVOiCX020g772w6cI8w5KCR2eDaJrZlbbZ1M0jiBUmbcwW52U
	2V0LRfb+gVK6thbQY8kwKfDyn/RMUDUuIbirHn38nUjyvicTzneZQrjq7Yz/bCv7tBInLy9eLfV
	HgLUH6AJkCVHlgrMqpFWRQdAEw4uXlCT3YW9IIz0wbXKNyubbCZ7of3BerkjnyR7p
X-Gm-Gg: ASbGnctZk2Hd4tzpLa+VbflFO1fhESCadO1cZv6Tz/NdTenZ9bGr+de0TX3FJmgdIIM
	yk3V+sg46bNzxZ8gXhGNYEbcqnjbiYzgPkrmN+VnZyET4P+RlOuSSszLSKDHlQ8J6BGpC9sBPnh
	xkn8C5hLhlXG1N3qAS77Ok4II3uINvKVfSqSncjsz5IwgSJimR2UtJaiSJS01Dw5KIrqD1aS2pU
	uHykY2ZgXvgrSyRs/3DwJ6R1vRdntDOMdVxvuN8Ga6VbfaYckWcG0DexIaWwDnZGrJijFb9bXtw
	qiu1Nqa9q8LUqGUugXEZafsRgR3U60jgGJozsIwq0ipYFfZKwvc25FBf2sNp7RmAAo8edJWIGC8
	xRUy9ynNPz2cN
X-Received: by 2002:a17:903:fab:b0:23c:7b65:9b08 with SMTP id d9443c01a7336-23f9813aa74mr105879715ad.1.1753368523765;
        Thu, 24 Jul 2025 07:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwwLqMytPEHXGuRgikblICMhXyisURthwRZDZjR204cTZ/cSJkJe9/CvzBsJO5/I2Xsfc7A==
X-Received: by 2002:a17:903:fab:b0:23c:7b65:9b08 with SMTP id d9443c01a7336-23f9813aa74mr105879395ad.1.1753368523298;
        Thu, 24 Jul 2025 07:48:43 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.197.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475fc64sm17620465ad.19.2025.07.24.07.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:48:43 -0700 (PDT)
Message-ID: <0dab900f-6aad-0c8e-3324-e1be54d53456@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 20:18:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Add fallback for invalid channel
 number in PHY metadata
Content-Language: en-US
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>,
        Vinith Kumar R <quic_vinithku@quicinc.com>
References: <20250723190651.699828-1-aishwarya.r@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250723190651.699828-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tSiFg0xW09HCUVRVy91yg36G7c9WXUAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMSBTYWx0ZWRfX9odX5BZt/8ne
 F61eHzq4oUnIv4R9jpT9xOmbhZfcaOhxOgWlUZFJSukk5V1eYjC1voJRoYK2XJZcHuyllwRT94d
 GaOygfKgoZh4ifZMLbod56V4uIMfvy1lrm2in0ZlOtgwqmWGUgnyahycogOmk+8+NlaZ+qAEvnl
 78ANjhZe5vQ0b+PnZ1y/KIcnVLnXcZ8Z67YGL1urW+Z9JWGaP4uwMWbncqlfbsbXcCDFyYqKCtc
 oSCRDxYstipNVoEcDKuqlgsMug72+V2ZAJtVwDLMDQvrVhC+WztFq2z44C+TQm4sVvtCvoM5WNk
 r8pD6BgsCds9AzgwohcSiQioNXmYXYtnuG9IUmyhhACHSR49Nkm0Zqv5zNM51rk9wGXCoL7i1mu
 mF9tm5yjVAtDB5FqILokWPrXYhLlJSEZgTp98PqM8/h+J/Q6wx8iv7bpV8qCiE48+uXOf4no
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=688247cc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=CkStrBlBBtcNoDngQR/Gdw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=yQQfhEIX4B74JBb4vNkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tSiFg0xW09HCUVRVy91yg36G7c9WXUAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=847 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_074845_325523_33D6F885 
X-CRM114-Status: GOOD (  11.64  )
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



On 7/24/2025 12:36 AM, Aishwarya R wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Currently, ath12k_dp_rx_h_ppdu() determines the band and frequency
> based on the channel number and center frequency from the RX descriptor's
> PHY metadata. However, in rare cases, it is observed that frequency
> retrieved from the metadata may be invalid or unexpected especially for
> 6 GHz frames.
> This can result in a NULL sband, which prevents proper frequency assignment
> in rx_status and potentially leading to incorrect RX packet classification.
> 
> To fix this potential issue, add a fallback mechanism that uses
> ar->rx_channel to populate the band and frequency when the derived
> sband is invalid or missing.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Vinith Kumar R <quic_vinithku@quicinc.com>
> Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

