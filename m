Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B146FC83F17
	for <ath12k@archiver.kernel.org>; Fri, 18 Jul 2025 16:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yh0gYO/fyXW+8lHXO7cK/ry70PjDM7Fy75uaOFuFZw=; b=NzCNPkp9EaB+eiagXrUC6Q73Ff
	5AvHGYBhliRycLrGFKNu0GKU5hoXKJnw9sbor4rp+4HDOeLao886Ga9wEltRMyAysbp1T6Tz9L8Rn
	SFUQaTD8tQhPnDg3T9MozOrvr/1OWW+doWth6redCIJ1NlTJ1hI32cj/tinnOoqyF13GduENAgoyU
	zeX+oaGqqTBw3+94p+ZYNI/Ssz5VMtFUg9Vk7cei9pWSZfW9MsCPccdFeYZ/0AK4q1EaQCRZdPgfO
	sCmmVVGUpy5tCXQHIlzTQB6749aV4lR7BgtZWnnAFcqcQEGEHkdBvEi+4BlfZL+9o73Z6p2TI63CM
	+c33w1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uco78-0000000D7Ym-1zL8;
	Fri, 18 Jul 2025 16:39:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucngD-0000000D3Ae-2H8f
	for ath12k@lists.infradead.org;
	Fri, 18 Jul 2025 16:11:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IECrdj022239
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 16:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yh0gYO/fyXW+8lHXO7cK/ry70PjDM7Fy75uaOFuFZw=; b=MMJk15T+P+ORY+m4
	9gvnQxlPfKBWL/a7kicjMN8qRhaBDnlCUizNIAUrNT9vpfwkxj4bVBgvC//PLvIM
	iqhz4jlGGedRycuVI0bEdpXwI2tKs2ySPAZclKXoX7OgotuIuWzyV1Lm5PmVibti
	rh6SykQBBt1hND8TyOINvso9B8Li3oTR9OeXJP3FlGl5yf4K39jGxg9Zqu74g9La
	K2CrrwxtU8BVb55XdsY0zHjUTjCCwAEVU0eD5bc8YGFXpk1X71mUyTrHmPDnKo+d
	ZofL4j7AGOrkwdQn1WsJ0sV4focyOptL8yI/XvJoR5H6B2pZelt3dCP4kBGnrQCT
	49okSw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyc79v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 16:11:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso3422601b3a.3
        for <ath12k@lists.infradead.org>; Fri, 18 Jul 2025 09:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855083; x=1753459883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/yh0gYO/fyXW+8lHXO7cK/ry70PjDM7Fy75uaOFuFZw=;
        b=wNf5jqtoe0WVZvRvB54kQnO1+ZCfqr/zTlzJ5Wz7njmeXk0oconasIAyaf8V8NpJ+d
         S9kNl0xAcrrrmehLyM4SeUOkegRo14b8Z1b4Ykd4J5TfAVhFOstVcDNJCdmHztxLI1ML
         KamrBR2jygj6MQzxz4E8xGZSiJrzlIaJkOgLsL48qoPAjoF4b3NjbsnIjsneYut60Z42
         7E9W0MF/skiVAtk6rMSgDVKYzSMmtYuglrJjqLHvC2QIbPOcRrajx7S5Z6wkkpZFKfCI
         eMh+2EHFp7iXW/Y6TvfWb6IQe9M3+RITrfZ9ES5ufJsJ2vVQaH1G5I/SZ/QPThptoDBZ
         NftA==
X-Forwarded-Encrypted: i=1; AJvYcCXQKl3QnfFyY1h6NSVmmDlC+19M6X8oGEOSN5Rd3olgEk/aun3luGasU4Bso8Vi7T/PdovdZA8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yym3UdNXOybSqzKcavAgKUv7YthgB+4t6TS34HzL5+EK3vRzOni
	OpDaeM+tDIDGkWurnqo2uNcHmUL5F/aSuYaaLxC4T8g9nk4hV33XnjL0QhJpyNUx5/di+oFKqEE
	MdAKQPqLzIvcXOry8bKfZU8maHJehaOCZbLB46Zz4y38r50vcjSrEd+NIqQuq9BPQehh/KhY4
X-Gm-Gg: ASbGncu9Li+NLcNhKE6MZkv6wdSWADLmSGm2ARK+UmW60h60OrQeA0V6JDfRq1WrHWA
	kdV/LdqCJCsh6HiCuy0jsRFriZ5HV3vuNXy7r3TsSE8iSMzht6yOg1HI/PsoGw5gbHVryxgAF1q
	ELeocJ5sZ0sbK+ww8DTCJciqJuz55LXnwE2EzBIFL1aJMnQEtVYuCngyIz5Smh1Sv+yTA4wefCK
	xe4fZSzJhPDifHAYlkESiVQUqWl77+UxrjkJvC3XyrttwDZFIX5cb3+1P3pf8CS5HvtGWp/Is5n
	hI7ys8orDFNvBm8sjkL0gpX7UOvZcMPDzsMbdqw1bnBzqN1ZIRfVfDj4nxP4sSELcIQV2d2ovnH
	kcrHoh6bBVrmz
X-Received: by 2002:a05:6a21:33aa:b0:220:8ce7:d6b8 with SMTP id adf61e73a8af0-23813764a2fmr19137515637.37.1752855083515;
        Fri, 18 Jul 2025 09:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmXTvgcSZDj426oraVut1Ek6ZJdA4/CWhZ+n/mZw+J85k6n+n2IXVsGC/8zZ0DxyAVfSfg7w==
X-Received: by 2002:a05:6a21:33aa:b0:220:8ce7:d6b8 with SMTP id adf61e73a8af0-23813764a2fmr19137477637.37.1752855083130;
        Fri, 18 Jul 2025 09:11:23 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.211.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2444sm1503913b3a.25.2025.07.18.09.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:11:22 -0700 (PDT)
Message-ID: <62660c3c-30c9-8635-b5b8-3972b723610e@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 21:41:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 0/3] wifi: ath12k: Add 802.11 encap/decap
 offload support
Content-Language: en-US
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyNiBTYWx0ZWRfX+Ht6QkZGsNkt
 0oRZGgxCKLZLwmuzM059gSZ2bj76Rtz1FoNr0fbtq0vubVv8O/aN636GyprgGM8vDK3cZgGDAAI
 X8cZuvYhj4kgi2po39difU+eEJc5W8lCmnnxgoy0sBrMrnglemsrB/2cdHjVBtZkbSaajY7WVDp
 lSLSrQVlqa/0PFIzNWjMZqhbpSCuIYYQ6hAflmVsPWQCvtKzc3D8g+NNsIlxZV/hLLmBBReMB7e
 bogxoukyiunhQRCoqu0nDh+9SyBwkwpcjqdCR2th9Tey/UHFwSgQx7kit6N7CfQ9jROmouRiipU
 h9Gk6qMw1SoC2jvDly/qWMgFUh0kaZL047xP0shhjP0ou1pEw8PavZNiVuXwKHE/TtRAkGyJ/hx
 XkOja075fCJks4ePxoZfE8OMiNZnsmrLaCmk87BLsVB9c3Y5mHXFQ0cl+XEAhThMbhFZwRw4
X-Proofpoint-GUID: cOhgiZP8-n9-hlqjR4qfVgrggp-H2-wW
X-Proofpoint-ORIG-GUID: cOhgiZP8-n9-hlqjR4qfVgrggp-H2-wW
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a722c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=rmBo/+S5hedwIG+s4KM8eg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=hQefTeRL-RgvZKPZHv8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=988 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_091125_612497_C25B6FCE 
X-CRM114-Status: GOOD (  11.78  )
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



On 7/18/2025 8:25 AM, Nithyanantham Paramasivam wrote:
> Currently, the mac80211 layer handles construction and parsing
> of 802.11 headers during packet transmission and reception.
> Offloading encapsulation and decapsulation to hardware can
> significantly enhance performance. This can be achieved by
> having the driver advertise hardware support to mac80211 to
> bypass 802.11 header processing
> 
> v1 -> v2:
> - Rebased on ToT
> - Firmware service bit check added for EAPOL ETH offload support
> - skb free handled in tx completion station negetive case
> 
> Nithyanantham Paramasivam (3):
>    wifi: ath12k: Fix the handling of TX packets in Ethernet mode
>    wifi: ath12k: Fix TX status reporting to mac80211 when offload is
>      enabled
>    wifi: ath12k: Advertise encapsulation/decapsulation offload support to
>      mac80211
> 
>   drivers/net/wireless/ath/ath12k/dp_tx.c | 102 +++++++++++++++++++++---
>   drivers/net/wireless/ath/ath12k/mac.c   |   6 ++
>   drivers/net/wireless/ath/ath12k/wmi.h   |   1 +
>   3 files changed, 98 insertions(+), 11 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

