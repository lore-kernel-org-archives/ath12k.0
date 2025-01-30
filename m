Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393A9C0218D
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 01:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvqaCWS17IqEgzdZAzaY4rFjPD53xUcgJY1W0zmOwSA=; b=Cg3trCJM94o2K0oZBF0A4Rq2ss
	raJm2FoqcrqJYz7bHtS9XY6gsPvk/fC+c61P+UyXAK0UyYMDkaZ7BpxUBBBUjgyA6b5B4ylZbC25y
	3wdMGtfDw6NQrfyYd/aaxa+/3gBEULV6opSzDnmZNGWfkYsl/tuoJiYm00wtyNGYDzbDfdROBUW5+
	A3h013A4HTWUZ9npT1FJILC4mYsVXi3yYgQZmhpGqcR3Qo/xyUkpIgST2PwuV/E6TTLQnUjMkLWMQ
	sG7vlY2yHU4CYHZt/CESQo5mPCAoqwksdy6VWyo19h8gXO52ZY70YSdf+siiDLOkJBTtf0USUQH+e
	f73DXTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdJCt-0000000825H-3SlF
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 01:18:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdJCq-0000000824z-1rYG
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 01:18:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TKlmLr002402
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 01:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvqaCWS17IqEgzdZAzaY4rFjPD53xUcgJY1W0zmOwSA=; b=WdNayDIXhwaBUKaA
	r6C+Ln1x29eiLr8V19AZYD1E304RhgZsWocD1nltvm31seaYcHfaaFF8anG9Hn9b
	27ki1OhHeMCnYHeJFT3+7ORh0l3rOSRkrQ8s6NMDnp+YTUud6YQ16WZ1YkRhtKHM
	rOWlNTQIcL0jAVgMLW3vxdw+NvtDoMi2MRbMNkxGdkF2A/c068/dF5bNnzbdyhS3
	RS2oT8fdNAnU9xXAM42YTACLU4idaLe3QBiCKDBvt1CS8CS/4pW6c/bF4jpyasdu
	dyfVmUmcnQX/6mt/KfwAKyg8mMkPBbyQdjbIpYITUXhQLk6I5Rpp4v8TFWNVm4hW
	b27R9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ft7drq33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jan 2025 01:18:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21655569152so5828075ad.2
        for <ath12k@lists.infradead.org>; Wed, 29 Jan 2025 17:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738199934; x=1738804734;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvqaCWS17IqEgzdZAzaY4rFjPD53xUcgJY1W0zmOwSA=;
        b=RkHF6uDVAPyioI8lzS81K6pa/JCfeunWH0iKXFkjgOGaEqN8NP0WSE/U1K7RYin4Df
         F4G6pTO5XvqJOlQJEy95uAlm78s1CTPjV2WoQ47HdydmKQ7MSTbcHFrHW5Gcsf0B8AH6
         XQWYbfJIFNIFqJcqXPXsID6hb2ux+cE6CkPcy1ZU6l0i82oRO8YyKKYEEhYwU7f4aJto
         3ZiQng8v+8KKBHTrMfubO+dOWufC3NBXcMX1Ioyi8HrgrfjOleHq+5z4dmFn/hRxbQly
         eVCSEc+KZASP27Exj3QnEGFljRcDJE38+OH2N+FBeFiA1oTmjLTxjuHbGXa2pH43Lrz0
         9G8A==
X-Forwarded-Encrypted: i=1; AJvYcCV2TYTKMnqC/nx0QLwW7n5xfNr2kVs/eLgD2ei5TRyAkmskQMj3SEpUcKezTyHxd3C7/PKjRdU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9mZ4Brasr5bLNX7cNu5xHLrL34ibuV256hrTtj8eOdoKTh5KE
	0Z4dI7oXwsb5J27AEGYw8Pq+zVg4Po64pd6XmvrPqleA6ApilfMT+inqgV6+Sf0CAZ5clMMJHU3
	kq5nffFToYTC1wnOi7XrVO/vicqYk1h8FLJL4+p8RCTyCd2eIKCuSQfLU3DZx
X-Gm-Gg: ASbGnctekRpLhN6U9zWFiJ2eundcNwjq31oc12EPnpq9poUChxXLc+5idbBEJ93TBP/
	2mwQsvKi6NZc4bSGEakphxGxIvy7zFDxZN6ADBm6TRlpxypTJ2o6pWXnUEzCKeOjyIEsJiobhB+
	a83UwgGD3pRPHOxjZhXOEwLyFa6W8ywkYKVVwVPCUWulMt703m59E5sqLkhew5AvGlE3XyvjtwE
	hCFkBhgSLp3+Bjk9viyBPab+SKQGT9nmtKudyI+KfGwqH6pKncTvaxWwbF8KSB7j+hz+AZHvU+b
	0ZeQSy53PbOQVtpAeSdfogPrnZX8kfdPck0sPuLywcw7K2OGh3XtNKz8Xmi7Ip4pj9jjFuMjpA=
	=
X-Received: by 2002:a17:902:eccc:b0:215:5bd8:9f7b with SMTP id d9443c01a7336-21dd7c658c3mr77792855ad.15.1738199933810;
        Wed, 29 Jan 2025 17:18:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmPyNl4jBHg+pVC4DhmaWZfxo3Dj5bXKsKpiY749cnUuOVg4TO2EeuYKq32gVAYC7P19h9SQ==
X-Received: by 2002:a17:902:eccc:b0:215:5bd8:9f7b with SMTP id d9443c01a7336-21dd7c658c3mr77792535ad.15.1738199933416;
        Wed, 29 Jan 2025 17:18:53 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32efa0csm2322695ad.116.2025.01.29.17.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 17:18:53 -0800 (PST)
Message-ID: <2b5bdfc8-95f2-4919-830f-c35d152055d1@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 17:18:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath12k: fix handling of CSA offsets in
 beacon template command
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
 <20250124-ath12k_mlo_csa-v2-2-420c42fcfecf@quicinc.com>
 <6f52dcd2-3b0b-4c19-b8bd-cd17dc4543b5@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6f52dcd2-3b0b-4c19-b8bd-cd17dc4543b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CnSPdCdCEtX3xixjTGy_EuYVNEMUG_5r
X-Proofpoint-ORIG-GUID: CnSPdCdCEtX3xixjTGy_EuYVNEMUG_5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_01,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_171856_608078_65A48479 
X-CRM114-Status: UNSURE (   9.22  )
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

On 1/29/2025 4:40 PM, Jeff Johnson wrote:
> On 1/23/2025 10:16 PM, Aditya Kumar Singh wrote:
>> @@ -108,5 +108,6 @@ int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif);
>>  void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
>>  					  struct ieee80211_chanctx_conf *conf,
>>  					  void *data);
>> +struct ieee80211_bss_conf *ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif);
> 
> This patch now conflicts with:
> wifi: ath12k: report station mode transmit rate
> 
> but i'll clean that up in 'pending'


please check
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=47bc4c5c6598ef2ff3a362eb13dfe4573ab5d910


