Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EE1C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjxET2Z5D01/aa7Lq4W4LN+bJ62d77wfUR7CBRvupO4=; b=KYpt8oMYjRKPHIxB/ZvCq6XyUn
	Sr8f+LRWqfVofNVIJg6/0W2XOI8TzYPV6sZfOrrC4zEF3l4d755jkBEcNtNjwCAIIw3pVrCfArrlL
	+ovx8NhM11BL9Wvt15oqGWaK5ZlVzMDZ9JqCGyJ7xsWpSF8/hVIzTXKo39zsqZZbg3+TRZwnIdDMh
	A+Ma327paYf1TPlajPXyV7aUyPCIuzBOp1uKw/hCI3jpUcJfFzVrUvm9LAehn6pUsVzbv2Hl85eRW
	y9RDXfAgNEC0wAzSxwSigY90MOiyD/3mixjmSzhVuObQq1YThER/K5um8rQQjoUraBwhJDKfpowMD
	PfMQ6v8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAUF-0000000HEHP-2hhX
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAUD-0000000HEFq-1YUY
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141CC7n022165
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZjxET2Z5D01/aa7Lq4W4LN+bJ62d77wfUR7CBRvupO4=; b=Q5rlJZejubUt9ne5
	jY7glDqj+MIeS9C0XjmfE7kpTSWbhz8DVNJWVUfLNBimHSyUSKpNqumin4mepd49
	CPuTHanqnqVtuMsUD3Fz6mfR+WhZfDjRsVjFMHPSBMtYd5/nmlxqymqaCzJqVjh3
	HbFOJV0P4TFzL6MMiDpYCfZxkbqK/MmRyFXVbgbLpvNCbPZ3d+JhTbdnEuRoW1px
	ODId27ciu7mXTq678n4s+u2euV1XL20+WpZ/lCSHcV5/lKWBxSiGYGK1aKFlApXC
	Jfwlj97fcWYgmGHnhCJbnsgNI4OVHkWD/frPXqlhtvk/5ox60wU+PqLmZGGLXNpM
	tCjrhg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k911gak9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:24:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef114d8346so9689477a91.0
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643071; x=1739247871;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjxET2Z5D01/aa7Lq4W4LN+bJ62d77wfUR7CBRvupO4=;
        b=KHgGp99Wb7c1YTQ/AaKKul2KIcIZbNNFjTcCwYW5GWfo78whGakjroYjMUiWkpBCZd
         GdrRMKYuEU5IFN2zwjBkBZdTcbjhdwQChYDpHseIkqAEBHnHnXcuCuqhTC2zfxHtAqU5
         IPijFgw3J+XNb1grxWNIf4GcNgMuNqdu1130t6lPJ9saIYLzlJErIuY+tSisb0UdThmJ
         xU+SVysEXChrKrZW8J1rQsb3hxVtpegmyOtqrM9bjjYOKEHpRWW2ka3izu1PZPeZmI+d
         1jxLXrT4LAC8A2eVYtzZ/blI9IR1hJCVH1az3yg6wYdH05Jok1oCAA6E4EP9NVWx7EP9
         rTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqKJi2Ffx0/RurAQ6fLWBohgVX8DW8FngKcsVJHiAGzKXO4ZlNvHfO8ajkvZGECD/c0D4ryAo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXNb7rvehRpUeNPpAuXAwYF2TnrsftaNGzWG/P2uyEgDDhfDq/
	6/vCOxiN6uSVHlpUrfJKJSHawPSeb1UWnUnQ6fmW6ZQ8e+DAb48/mxbFn7i53VaGNUn4OGqRu0F
	gz1Xt1UTWmqwjcQpc9FSBbYJ76RGl+7jMILw+EMiGhXJ/J1+UykbvAbqoJvR3
X-Gm-Gg: ASbGncs7UIQ+0lnzBOEpr4oQUSe0YuzC9jF3i6Fj7Zib9lMvZOdKRAsCQgxdKrpcW7P
	nDFFqfnKFW25v4ahjs7tBLEboImrAiyAw31uMiOr+x8iwqnnnbdA5fxxRsbHNOPzzhtVytf+dZW
	EunzL0JHGeLbpf83FiffGWl4xuujZhe+dJt54WDDX8k3A5We6kMjspAyvvHO67vHy1sghm26+p/
	Yb20LNThbwwLm7kXXCU4HqyItwru/+KxflQljJG9x9wUvAlMR4EWWhQilDyV5F3SD7wnSf00uqb
	MLNGBWHQEKqismmEdiJwvuQIA8KM6qdJZj9KcA8oqIU4BrLGa3Q1rqPkhwxzOyTpPVSotnH00g=
	=
X-Received: by 2002:a05:6a00:3cc1:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72fd0be187dmr41881607b3a.8.1738643071169;
        Mon, 03 Feb 2025 20:24:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR2b/aiu9zCPPol9JXpjxw1ZRTYbUh/t1axDFOT76fDgBs6WiaHm5jBawrXSRLxAhsIEGyiQ==
X-Received: by 2002:a05:6a00:3cc1:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72fd0be187dmr41881574b3a.8.1738643070650;
        Mon, 03 Feb 2025 20:24:30 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe856915sm8819450a12.38.2025.02.03.20.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 20:24:30 -0800 (PST)
Message-ID: <901a8947-c11b-4d0a-9cdf-93c5374ddde1@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 20:24:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] wifi: ath12k: Add peer extended Rx statistics
 debugfs support
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xRGf_gFmh5qqqKPQpft1y55YxERbVUOZ
X-Proofpoint-ORIG-GUID: xRGf_gFmh5qqqKPQpft1y55YxERbVUOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=884
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202433_526351_7131CD76 
X-CRM114-Status: GOOD (  12.19  )
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

On 2/3/2025 7:57 PM, Karthikeyan Periyasamy wrote:
> Currently, peer extended Rx statistics are not supported. Peer extended Rx
> statistics are collected form the TLV data reported in the monitor status
> Rx path. Therefore, add support for TLV tag parser handling and debugfs
> to configure and dump the collected information. Additionally, this series
> does not impact the WCN7850.
> 
> v8:
>  - Resend due to missed patches

you had received some Reviewed-by: tags in a prior version.
if there were no significant changes to those patches you should have
propagated the tags.
if there were significant changes and the tags were dropped on purpose, that
should be mentioned in the version history

/jeff

