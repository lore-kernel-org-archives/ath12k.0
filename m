Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A622CD6E4C
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRSNRxG5aWOBg5WXS2xrcW2VIlBVHjfkRZ6TmKPMIJ8=; b=TV3mmast3ZJ9mfA1LboC9dOJQH
	qsizP4cNKikoiC3gE/KDpz1P1QVT4VuFtOn+RE0l/VjSvl/qyis6Arbb6q5OHfhaFroWGH06Vvw1R
	QQ5yrp7KiFHu85eostBRQAgflnrmp1onhpVpni92QwLouBCmXLbEg18q4TktNQXY7c68xxcqT4Jc5
	vH5MfcqXi4vu8XWWQh8KPbCIY1PhFvSFsti8jJQilaSqgASeWGi0xa9KYAXI4TvSyzN2LKwEsA5kx
	F37ylOnXDY2fjqbyQp2vDTt688PDI9lwztvr4RR5YilMklBi8Ane/PuPt9HSgJ34uydBid5JEYYlB
	zP1xKiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvVW-0000000AA8V-0X6I;
	Mon, 01 Jun 2026 05:48:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvVT-0000000AA8A-1746
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 05:48:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6511G5gv431491
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 05:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRSNRxG5aWOBg5WXS2xrcW2VIlBVHjfkRZ6TmKPMIJ8=; b=kuqDQOR+a0PdBzOC
	/yQs0aRGVZBgqMp14YhFURmwhWorvk5Oyajv2jKtkRUdJjlH4VqmY/iVHt7gCgwn
	zXjmYy3wsKje+weNCbatuZYwet/jywLXaD/wnx7Z8Doi0YWKEuX1wj3N9fPNIy66
	uEJlJeDtjJLacDhwr1jbL5dX2mpJ5qHUW/HUbWpBGWn7km1OS94hkd4vEEhHtTnC
	wk4I5B2r/xYEX0VFOeGVTfeSsfug5x+34wStDYFvnIW/pbbt7oVerCzhwr5iYF0n
	7FcKXWOQmb4E8O6di7TClZuE072Bk6VJt8nYXuP7rM8mumd+cGrbNdF5Fs00bJXC
	2DxcZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8ppekd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 05:48:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so2065232a91.0
        for <ath12k@lists.infradead.org>; Sun, 31 May 2026 22:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780292889; x=1780897689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRSNRxG5aWOBg5WXS2xrcW2VIlBVHjfkRZ6TmKPMIJ8=;
        b=J3IvzfnqJi+z2ZQlOshQ3SoFLSxIb1AyVmKh2F6I541bga+4RkiXZTD22h4k6tX8uJ
         zH89wpiT6/hiYOu0zJbpUPfoT3o56TVPMg4wDrCJK1Lo0B7kMG8hRjyZY42ir0btxnLr
         FUo8Q5DdJlgQAyjPFFLmD8deDpJWET3+sUIT8Hc03h9mirwg95PxUoGsddx5VlhXcjqI
         kD8UTEd7bgaEVAvqE0jbhSXb6T3wTdaORzfkwaHyKRt6+jQhey2vwokRRNZN98JxWYnF
         +t/N+s7AQhPHbcwEE+iidrLLqpMG5gwbJMyyNbFOctsPgtibwrbMV43nzQr1eW5Xm20p
         cDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780292889; x=1780897689;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRSNRxG5aWOBg5WXS2xrcW2VIlBVHjfkRZ6TmKPMIJ8=;
        b=doaS66MedzLx9MS7z7dsrvaxDmXaZ9Xtn0/uSOWJprutWv4sJ/BQwKsYixdcthzcMZ
         shL7Mem3U2WuVIwRifHekEN03cnhrTJmPkHctZ7CAkU979YFwbvesc+YxUdhY94PyikV
         2AUOrSut0rRxypoyL9+D73z6XLLQm1spkkrZp/EY2sPjNYUgwXW1LcFsyVhg4xq2i7+I
         x5R8pHZhr4rQo3L3scF5J7Ct7wpJo9rg45Rufm4NLQWXtbTMqxV5IZJOjJzwjqlgPh68
         4I/JNOcWqYlYDlMxvKF2ltNXo+xzbf57ZoJ2Qg6BQlp1E5Zw1eBPMyvoUR5WeJvexOAb
         koSg==
X-Gm-Message-State: AOJu0YzIT6nnX7UZUNfR60dRs4WxV1r2dz6YhUAGxgdfU7shCbm6Ek9t
	TpvAErKrE6QmUqFQv2aQhxTJoXy43oe66tHND6BRZDt/x5dnpkwDsyZGep2g/01YdCCNj24kgci
	RmhcXuRXkp/KZuc5BMB37JBm+74c5Cu80zdJ7kgStWPkpqpeoYXNge8pvuwFaKJBu
X-Gm-Gg: Acq92OFXsLWjoIr9Bfa+feMtSDZJKUFm3NihfqJF5nSmWV4YTvBOhbSoD3YbG9ORngC
	6egveJJwpdbIsojiklUu2apW12De+nvtg6cqpztRrU5QlMPsz3SaV8/xxJIoYxRSIX28GVU3mV7
	77uoEj0mKjep7x7vYO/yggs4PpbGxH8faiZmPE8GKdcjEXs5v9+YzOiloDOhPIsaAOSUoRQoKy7
	VKiPcd33Hr4/TpOw/VsKZEPFjP32/MHBuzKgDcb6KWVfr+oImYmL8LId647VoOSO5NLw6KQAHGH
	6NBOr3UqBWy5xNCweEHAZhK8EqP1gkyIwNeaJ40CB0BCWgR8z91g53Ibq+0YfXWnYUV1ma4tOam
	GFa3wG9p+VrP+W45KivsK+7r8xrEXQt25b8OlWo06BvrYgx5un8aNpwSacSh65F6LrA6+zFV0T7
	ELkoHCHXck0VnEoahGFvnyNlvgkskt
X-Received: by 2002:a17:90b:574e:b0:36d:633a:e8aa with SMTP id 98e67ed59e1d1-36d633aec7amr7430748a91.13.1780292889074;
        Sun, 31 May 2026 22:48:09 -0700 (PDT)
X-Received: by 2002:a17:90b:574e:b0:36d:633a:e8aa with SMTP id 98e67ed59e1d1-36d633aec7amr7430729a91.13.1780292888570;
        Sun, 31 May 2026 22:48:08 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6b7c178sm9341902a91.15.2026.05.31.22.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:48:08 -0700 (PDT)
Message-ID: <08385919-cc21-4235-8839-1c7efd7525d9@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:48:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix memory leak in
 ath12k_wifi7_dp_rx_h_verify_tkip_mic()
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512021108.2031651-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260512021108.2031651-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hRgDv_frnwEAZZX7yDWzWIIP5zP3GbeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1NiBTYWx0ZWRfX2mCsz9ERhddr
 ZoDNshHmVsvuCZIGB21OTqb8xUSUWq9oybactblDhdcK6GwSnjz6plAMpawdRqdGaMZCTXVmYqY
 0YLZVWCv8lbunn/k2xfA9JiBJBqCYFQbK88yQHWyuiQlQUq3ExdPLacpUQVrqlXTmaQ1y2UzaCD
 tim5yjDkXmZMbDeDK2iqxfhIYSVx8//afn4L57CK2uit8OWEGsLpWEKKMnMMzuBv8mPTNNN9bfx
 on4jd5ySi9o/fRa29O6RALWLiYJxkAvS1f95RkQ1Lz9lXwZJ+FIR9MATe5Wab+dlwrkdeQdzHEQ
 B/qXwRpCjJd1p6Fvd5APucS/7qVIsCnqmL7jLzXu/j2318is0Eu+USlDtxhuXz1TNWXFhQyNpT2
 eEVUkxYBSaFd0ZR10lqEbaKklwtKDLyaiWmYDN7mDdkl5ucZZGF5nEf1Z2ALWCRQdMKYI++WMrj
 Ki9J1bGHaN+F133LxFw==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1d1d1a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iDbfGhX_lFAZckero7EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: hRgDv_frnwEAZZX7yDWzWIIP5zP3GbeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_224811_443726_AE6CED3D 
X-CRM114-Status: GOOD (  13.53  )
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



On 5/12/2026 10:11 AM, Miaoqing Pan wrote:
> In ath12k_wifi7_dp_rx_h_verify_tkip_mic(), the call to
> ath12k_dp_rx_check_nwifi_hdr_len_valid() may return false when the
> NWIFI header length is invalid, causing the function to abort early with
> -EINVAL.
> 
> When this happens, the error propagates to
> ath12k_wifi7_dp_rx_h_defrag(), which clears first_frag by setting it
> to NULL. As a result, the corresponding MSDU is no longer referenced
> by the defragmentation path and is never freed.
> 
> This leads to a memory leak for the affected MSDU on this error path.
> Proper cleanup is required to ensure the MSDU is released when header
> validation fails during TKIP MIC verification.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 9a0dddfb30f1 ("wifi: ath12k: Fix invalid data access in ath12k_dp_rx_h_undecap_nwifi")
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

