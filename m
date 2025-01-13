Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2388AC02183
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOkL3JbfQvnmr39m5p2LmwihbhxevGv8EorHUEwfkXI=; b=C1UG7gGkYEK3MPhccKmpbmKJ16
	e7eATydV3/LxwGR26bYyHit7sWIgwMpwnJPf9axGi47fBbSVmmXchKxnleX5L0lFJZoAVxG8tyliB
	xrTaEZzkYEhEZu8c+dgRyR7ab0VilbfMIInpqutrelDpTAPgIWvlg1ZGl65hgFOYHGaA9cibFhw0u
	t7yeq6hwLCLkD3CE/WPJEzkO4mBlMMfe30awcQN8bnuh6u4LkJw9F2P8PT6iwRRNddI0Fstf3DWl8
	woed1/3ru/dle8tqFWHdatrd7BlZSFCNgHmgMeZm/zTFOhjo12g43w8HiTNcUt7V+A6wV7dgT4iVa
	+71iJj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQEp-00000006PbM-3mhB
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:36:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQBy-00000006Opn-1xzq
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:33:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBlTjs006348
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOkL3JbfQvnmr39m5p2LmwihbhxevGv8EorHUEwfkXI=; b=c3F+CtPQN6jQ7DdY
	DuMm7+VS2N45U8pCD5XxG8jXrFCod9xVA5D5aZf6vuWyorPC0MhiM9SNIK7AYHOO
	+W+bmPXhY93U6gHTpTPsQSlogW8cqKdF4rztWHUwBRUknXmCEOGFDtCvNWeKVQxy
	PKdBJUXZzrtM2oSWG4/JVd1z7aO9Vw+WA6oN2hnu0WhHnYesKa2tDXnoy6cm1ts9
	fhl1xlmaTLfMPv0gejVpFanSyEWH6bmnMy6a6R6iI3EsYghbUyJ6fBhNFT2c6RWD
	UC9FgklseaCYjm8KAm327rSHVJKnHXeKxpJKHDW0ms24crk3AGBHXl5QpyoalNiW
	UEDwGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4452939bv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:33:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21661949f23so136631385ad.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:33:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796820; x=1737401620;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOkL3JbfQvnmr39m5p2LmwihbhxevGv8EorHUEwfkXI=;
        b=FGUOXy1tfi2rKeBYKsd6+DImHQTri8ZsjQx/xQV/le/fTmH07Ww/F5Nr6v2YSAFp31
         Q+Nl45ylcuPflCyaP4k+kDqXNQE61/YiX5Rg/1HYQMRrXri4uSRIFIK+04fVJA1uuse9
         kTZJKHDWqcHFKS1Ail4yEP5DaL2OV98I2GPPnqvndiqNcCzL1vqmfTQGy35RCKyW1pwA
         re81mfCuYtg8V7djyfi8LeXsa22pq+zmSk/GJg6A2UmJcDUncC9lM3xzYLQQAEnH+8py
         MSXtBR5GhxUQeZt6VDa+fQpRRHqwRbVU4mwQ0CfLdolLQE0SgwzCErwCeyYGP/yRgd2X
         WXzA==
X-Forwarded-Encrypted: i=1; AJvYcCVlcI7hw/+iOHMtwA4krg1A59jo8jH7QJyqmC1XEPYj2dIES15088MJOt/VgerGuRRjWbYPDP4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu64mC0/bTaQ79/Qp30gqL+9yN6Y/x2TvWQ1ix5aZ7A1IWKYjB
	+jOZn63jGqU5yhLQYXgxEHOKU2IkdwPPSE+t6xoYPfL9D7YzzNtqgvqnq88Q4RWxcc8VxghxQm4
	7iupqO3XFjV6Nz9iKZ2BwMbTV2DsFQUCblfkapiSoCdwlWCSP9scaK6KfKOCRpBRbfvDG
X-Gm-Gg: ASbGncuj/6vhI6I8nVrGnIAItJZXQGxzIBnep0K3+XINaWTRqQjcQIGYW+uwQ01Wj5w
	9015XKFJDAmXPJWX0noYMtjTL9ozlpjqgvT4z9SckuNP+LzvtDWqKb5duAyXCgxIUQ6XQ2t8aJL
	v/Q6Dvf3shA4DpH34ZVwOzXtBbvjxvPXfCtwBwGVe3gW9YwV0XAGVPbKpnq4ZrrSf4e3zndjPqK
	WV4IlYZSNHfuUxNVWSwFlehSCCYOUREl2Lx3TGVD9kRHZjYktaLa5tbfNyrRKMwkxSIkULZRwR1
	qgopdMiAtoG5x4FZF/gRL4Sa4Yt2ayadvRcpuT0fG1QSOHdNHg==
X-Received: by 2002:a17:902:ec8f:b0:215:7447:ebf0 with SMTP id d9443c01a7336-21a83f665c8mr357466305ad.29.1736796820026;
        Mon, 13 Jan 2025 11:33:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHATqAu5V4y7367LQkH2b6xsDqecYPRfONvLJI+8/ZT0c7pbtjgzQXvxrx8IE0lFzetz7EWGQ==
X-Received: by 2002:a17:902:ec8f:b0:215:7447:ebf0 with SMTP id d9443c01a7336-21a83f665c8mr357465995ad.29.1736796819613;
        Mon, 13 Jan 2025 11:33:39 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22c958sm56884745ad.174.2025.01.13.11.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:33:39 -0800 (PST)
Message-ID: <003bb2d4-b1d2-49f7-b889-b4b32c3e986b@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:33:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Add support for link specific datapath
 stats
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250110205912.2585850-1-quic_bmahalin@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250110205912.2585850-1-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EbMxTkI03aa3A_9s2ByRvr82LFnx57Z5
X-Proofpoint-ORIG-GUID: EbMxTkI03aa3A_9s2ByRvr82LFnx57Z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_113342_646360_D3908FC5 
X-CRM114-Status: GOOD (  10.64  )
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

On 1/10/2025 12:59 PM, Balamurugan Mahalingam wrote:
> Add support to record the number of frames enqueued, hardware
> descriptor type, encapsulation/encryption types used, frames
> dropped and completed. This is useful for understanding the
> datapath performance and tune the peak throughput.
> 
> The link specific stats can be viewed through the below debugfs file
> 
> cat /sys/kernel/debug/ieee80211/phy0/netdev:wlan1/link_stats
> link[0] Tx Unicast Frames Enqueued  = 9
> link[0] Tx Broadcast Frames Enqueued = 78689
> link[0] Tx Frames Completed = 78698
> link[0] Tx Frames Dropped = 0
> link[0] Tx Frame descriptor Encap Type =  raw:0 native wifi:78698 ethernet:0
> link[0] Tx Frame descriptor Encrypt Type =  0:78698 1:0 2:0 3:0 4:0 5:0 6:0 7:0 8:0 9:0 10:0 11:0
> link[0] Tx Frame descriptor Type = buffer:78698 extension:0
> ------------------------------------------------------
> link[1] Tx Unicast Frames Enqueued  = 0
> link[1] Tx Broadcast Frames Enqueued = 78689
> link[1] Tx Frames Completed = 78689
> link[1] Tx Frames Dropped = 0
> link[1] Tx Frame descriptor Encap Type =  raw:0 native wifi:78689 ethernet:0
> link[1] Tx Frame descriptor Encrypt Type =  0:78689 1:0 2:0 3:0 4:0 5:0 6:0 7:0 8:0 9:0 10:0 11:0
> link[1] Tx Frame descriptor Type = buffer:78689 extension:0
> ------------------------------------------------------
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


