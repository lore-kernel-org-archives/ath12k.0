Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC668C02192
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjELfiAmCQgwiqAvDegJKttQUaw5DEdDCiINGH38xmM=; b=QRf//QRaq2sO+8vTe1sMmPh8fT
	9XhEq2YB/vZb8N5vAQl7UjoO/tN/TTjkANazGgi06ig53vD+EmDTQMBMAESG8ggW1w39IU1WweXsc
	X37ECz+R5vVNwb6BZeG1ktRZQy8PPmlYyP8iYxJeULBzN8lsj/GXsr5GEH6jJuLBKIp6nOsZ8LLOQ
	DiaiDDcWatyZzwNB3MVGj7xDcOb6gg0+s7A/nV/QhHKV+Sqm4VfKLm/e7R+0gSsCiC9ZSY0cKlkaj
	jl24oKUCXQOgD+hWBXMe+BlG7YGZEDRfj9bKMBwJP7kiKp84zUbbeJDhqZCn4EgPefW1fRR1cOA70
	nXwF+41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4Fy-0000000GhzB-2Rem
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 21:45:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4Fw-0000000GhxD-1byz
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 21:45:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GVtnx002261
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 21:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjELfiAmCQgwiqAvDegJKttQUaw5DEdDCiINGH38xmM=; b=ao25kZIwZjLs2pjh
	4NBdTPkQ/7F7t4XmCTnpc6QdHWjtV1hLeb/xk7iNVZUsBysGb1r6zdnKof8TAK62
	enAe8FZCaMPQIyGntkCYMuLqRaJOiWF664uO08zk4MUh3q5/Y9o9aSSdAJHwrm5Y
	KD2EDeOq13U9YJN/yMI5sNLFKRZSkxopuw2ZDaHnciENS4sY0eI7f//KDtPsskAC
	zz837CF6mzUf4BGc1XYTzA8RlrPf/dgBbVWFNrEA5tS7jRPLC5L0v/bQe1LUf+Pc
	VofC7YuGSYwL5WdNp0iwazJhLOswybY55M26pSeOZ1ZJQHp6fiSEFrMWk4ebxJCm
	rqRDFQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k1d9gnk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 21:45:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f8b9d43aso89274656d6.0
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 13:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738619122; x=1739223922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjELfiAmCQgwiqAvDegJKttQUaw5DEdDCiINGH38xmM=;
        b=u+wf9drLLLVOv5Wsgwl5KNeXYYWvfM/FiQDokxbOiyo30VTjcDheIPUSoakI25eicY
         Q05W9duAbQvw+c3YNKMavNkDOOR3VCuN5I/3aPZIvJBKmFwK2f4lPkAdTJ59d8/Hqhnp
         brCSsuk4wFMp/5NhCco86z8veaxGITso9SqIsr1e72JwaLTqU0LproqG2BizzZKpuJcc
         YMjf5I2iogUC4JRG8J8icj7LkG5Z9YjXJnv3kNG1ZE2dNV8+05R9gI+nASwkPLU4idsa
         upLZQIyHD3UfsHRoJtfWcXXVAAnFyiCojwe90k01J3sw73WgPPbyVJG/ymjf+VBpYH1N
         6qoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWswa19tvjo89QzxwadRCbp568wTlLck+fxwBMOO+UK+A8l56hoHFHZSWxQ8eP7h5NPEsykFos=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsW2RMlcJafX36RWzZK4yElctQNjwK4ygHnFK8p5zP8W8WoUtz
	rLo3ILFh9Gf6TaMz25+kmQVJ4Smwo4uaVTa0bYEfqos2VHxoe38Ms4Oc2huNithnULZBXXxbnR9
	sbCI0aN3hltX5VE7pjjWaW+9r0V2yQTAulM22arvtZMGFN7hZ//E1vzFe1zs977ZyGniZ
X-Gm-Gg: ASbGncuJIJnc/Y0EQdR9PQgQDwqZBGzy5C7qv07j3+R0wUXZe3FTSwZwK9bk5J80iGO
	ADSmfbxM7M66zDQ6ouBCdsE4i/NYXLA55REzSPGMZcaKss/db254jgX8mPWHfk/1E4w3FSROG6E
	KkJCdK+k1qJBmysO+xH6O+Am12hZ/jvyfv/wUr6e/MajDL3hky9Q2sjxgZQnYRa4GmGK2dDfLYG
	R3Mqdy5g2BPJmgaT9Sr5FKwrKLvz8jhfGB3YiUsZsqryGWEzFWmbLUmDPsfeXQfkXBMVlJZIeGS
	VotsDIwKKHCFaTy4JV9b44g5LXQMD0an9nQYkUKhysBNvxvCXFSZjaQHJZP4p+noVJh2Yg==
X-Received: by 2002:a05:6214:2582:b0:6df:97ba:4f7a with SMTP id 6a1803df08f44-6e243c5eb6fmr356188466d6.33.1738619122467;
        Mon, 03 Feb 2025 13:45:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsmBzsmgdRkq8eVXMMj0bpeU5v/kZdOpIpOcKaA1HWVK8jC+a6W1T/M0aEB7RsoK+yrG/e2Q==
X-Received: by 2002:a05:6214:2582:b0:6df:97ba:4f7a with SMTP id 6a1803df08f44-6e243c5eb6fmr356188066d6.33.1738619122059;
        Mon, 03 Feb 2025 13:45:22 -0800 (PST)
Received: from [192.168.69.158] (c-98-35-147-9.hsd1.ca.comcast.net. [98.35.147.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254922475sm54640666d6.70.2025.02.03.13.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 13:45:21 -0800 (PST)
Message-ID: <a612fb4c-ba9c-41ef-99df-6c26039d86ef@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 13:45:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] wifi: ath11k: refactor transmitted arvif retrieval
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
 <20250119052250.3488343-2-aloka.dixit@oss.qualcomm.com>
 <85216244-8348-4fc0-957d-6ffbcbcdb28b@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <85216244-8348-4fc0-957d-6ffbcbcdb28b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 077iiN5xzb-iRzRx4CgQL0lcfvpsnGkV
X-Proofpoint-ORIG-GUID: 077iiN5xzb-iRzRx4CgQL0lcfvpsnGkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_134524_546956_D8E7E487 
X-CRM114-Status: GOOD (  11.09  )
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

On 1/29/2025 3:52 PM, Jeff Johnson wrote:
> On 1/18/2025 9:22 PM, aloka.dixit@oss.qualcomm.com wrote:
> 
> ...
> 
>> @@ -1538,7 +1546,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
>>   	u32 params = 0;
>>   	u8 i = 0;
>>   
>> -	tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
>> +	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
>>   
>>   	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
>>   							 tx_arvif->vif, 0);
>> @@ -1597,7 +1605,7 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
>>   	int ret;
>>   
>>   	if (vif->mbssid_tx_vif) {
> 
> can/should we remove this test since ath11k_mac_get_tx_arvif() already does
> this test? note ath11k_control_beaconing() removes the test

Sure, sent v3 now.
Thanks.

