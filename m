Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBBFC02193
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 07:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+Q7fwg4Y/Yig7iso6EaoY+cwSC1kIR0eqU/1fGE7Wg=; b=n8bo+oUmAfWAUdSkTxBwTvbKri
	4vXk7KiMIu1MXG04IqRNl1q+kkP6jtCHq51gewhu9OmFqdiafE9gpoQGIWGmisC6cAikMvUqYb1eQ
	Aw//A3CqViwhS7eqDQmrP1U0v8GoXwdQdWoCE1i9TstU3eUBBKeCDE4kppK4eL8Pl8/WN1XN0Is0w
	VfPExVrVcPupTl4nGXQHYNxv6U13qkLOcMHKcmHw6+jXSCJ1xFc75mw1ObeqmGE/iFPp4BgSwOJnX
	udqBNv/opfefc2jKSEVFKZagflS6g8CNiXFUWMmVFL9l/jNu/tWjs0tNUwMZNwCnEopUDghPdhGfk
	AUkiWBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDTC-0000000HQj2-27l3
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 07:35:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDT9-0000000HQh7-49iO
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 07:35:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141CD8s022244
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 07:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+Q7fwg4Y/Yig7iso6EaoY+cwSC1kIR0eqU/1fGE7Wg=; b=elhIx59FZmqV71uF
	qmxP2jQP5MKJxRMo3csLPIJmU4jL2lt0vwF5zG/WFYXJZ+rhwOsqfiNm1Gwtr08d
	Ik8xMMp2wvoF/8J8BGdgyFL45duoWVE80uuVjXX2NT8Iqfdb5ClyRbeBCV3YyqKw
	MQ6dpBZWoIbMj8Cdcs5CL9WhdTtDtHXVBg2RundF5MV9/iV4r70vL8ypm4usxBLX
	0ALh1yXUIgIbjemLXwjSBHf+UqUCX0xwsicWUPq10JTF029mgjtjM99zHZw9IHIW
	otfig6xd8Bw2wJAXXC0kZogFgR1kj2eDlaW2AtHTdF5ioIEOr6j3a0AD5dLGAufy
	ZvE1NA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k911gpeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 07:35:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so9783825a91.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 23:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654537; x=1739259337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+Q7fwg4Y/Yig7iso6EaoY+cwSC1kIR0eqU/1fGE7Wg=;
        b=nKHoc61aMEnXiQAhwaduv2PKfcE/n0VMZrYw8lyaHMZa6TBGSQ7Xak7rcQlgsv4IWu
         S3kDNqBvDxpHFo+Qq+K90Ywd4tQwWlitpKojOjh6cPFqUDAj+pVNHgi4MREpBuoo0+Vj
         VnXcTz7tWd6tEsPPFJ1hqnC8FOMdHNw5M59cpz6Pqu6Bm2r/Db/qqPHNvRrRJ4UL7hfv
         rQrXem1r6+QeOmGUKcPZSHy6eNP0KdoRHFKfNTwiv5LdyUoZiRImEknZxrLYyQvvdX0P
         E5bi471sKiZ8SkZ1AZ3tczKMX3jJjsjgv7XtlBA5jzQXUcN8RY04ygUyzAC5/SnKkVKg
         0XZg==
X-Forwarded-Encrypted: i=1; AJvYcCUrVTd4xovo1nTP7bJnw32qUrSENh4DlZnONUb8HKZvUauJiC/39mLpXCRIqyY7cql/BO6YNYg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3MYP9hTvi4gybUH7NmJUKJlIJ5pEZqH4GtHM7EmwuxXNKUK92
	qeY7Ih+WjyC9cvgRIJGy3/KNr2nvk06cwJ2vl8UThaa3KQS7ONVLHhcT5+i45F0O0RK2qVuXhWe
	m+fJ21TuFk6k44ihZMUYaaxg/XCHpqfnDYqdy5aNMRYqu7crtcLw2vwkPVpjh
X-Gm-Gg: ASbGnctMrBTGifPCEgiuMckzKpdGYulbNFIjHBp5DB6i44sE8/VnrK2MxRayMwq8+Xy
	6n6mq2+mugZaVi7fKG0rZzvw6rwHwlv2PrUZiMdAHKjw/gj81qL+W7IP1jJ7UPz7CS6IDXwqGuE
	lKLhrJQuzPfXn8y0ptHR0QmcgNNHZRXr9R6k8DwB0Id3Uckgml3sJH+n6QT/f+TCwI12QkBdcIS
	GVIhUzgRD80LqsSPn5Eld6heI0FoeY6U/kzmG66PuQfpwoYrLjhlhPul3ZoWEWgZIcBW6ahRM3q
	sdmDA7DXYpAJiV8QLt95/1VACNqFnnogtCCFhY9F5bqGF8g=
X-Received: by 2002:a17:90b:4c0e:b0:2ea:4578:46d8 with SMTP id 98e67ed59e1d1-2f83abd8358mr38267858a91.9.1738654537394;
        Mon, 03 Feb 2025 23:35:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC0QmdALcPNaB5gn6f3dvnGZUrUa/CC1CIXJWYwdx/zV2uoomKS2WhrQZZyEKUdXB6ADRMaw==
X-Received: by 2002:a17:90b:4c0e:b0:2ea:4578:46d8 with SMTP id 98e67ed59e1d1-2f83abd8358mr38267750a91.9.1738654535578;
        Mon, 03 Feb 2025 23:35:35 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f03b76f67sm7507785ad.237.2025.02.03.23.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:35:35 -0800 (PST)
Message-ID: <ed89aec9-99ba-7b17-d50d-93fae9436498@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:05:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] wifi: ath12k: introduce ath12k_generic_dbg()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-2-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-2-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fDgvK5DsCOI1hK9wKBQia5xN35dFwjtV
X-Proofpoint-ORIG-GUID: fDgvK5DsCOI1hK9wKBQia5xN35dFwjtV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=810
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_233540_150491_C1DBE06A 
X-CRM114-Status: UNSURE (   9.91  )
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



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> There might be instances where ath12k_dbg() is needed, but access to
> struct ath12k_base (ab) is not readily available. To address this, add
> support to print the debug message using printk() when ab is not present.
> 
> To avoid the need to explicitly pass NULL each time, introduce a new macro
> ath12k_generic_dbg() which resolves to ath12k_dbg() with ab set to NULL.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

