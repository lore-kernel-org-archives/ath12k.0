Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA6DE7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow/KqxCHyunMrsdOQ2Cl+Qlj34e+7mwsg3bahRpKpPk=; b=w/G+GmQdApPXea+1ib3dqO8xJK
	LWAtGY8sm2uyKILa5LTl0PI/Pv1ucFdq0cYiXxICJ9R+uRsJVptSDx3clag5NGRHX1XPPnjMb1tom
	4mJ9OGz7JIdKfbe4BjDpxz9KfGzml7CJ/a1GQM1wSAjnF2rT25nzbfU9GngUWDUI0NSGoXFP7i9O6
	zLKd+kqMvSAVKTbJTF2wnt2uqsNPhhdZodXNUPj9thb/AgcPtwz8+FlQ4YACOXelk3wR33I1YZMcd
	F6qWEx6toNNaX8a2soDTeu1dcRDiwjmOj1JFo/mGV2vgEjAU7QY4kxzMUIzmRWvWwegsHbdrgnJbW
	J/HwwdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjgL-000000095Md-3WPD
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 19:44:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjgJ-000000095Lp-1XcQ
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 19:44:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9Ht1Mf023141
	for <ath12k@lists.infradead.org>; Mon, 9 Dec 2024 19:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ow/KqxCHyunMrsdOQ2Cl+Qlj34e+7mwsg3bahRpKpPk=; b=MCBtfDJgkaoML6v9
	Ih6npGzME6NG7kFDPIwNCLVI2OyomU26CMwwiq+xxd4LAYTBClpphk4IS+SQx3nF
	Yd2ZjdIQLZNYbiBp8PHCbbuhRolnaaGX+pXNHENjheYJnd0sunqfelSFRlfHBpGy
	LRyI3L7HWBEfqsj2Clxp2YFxMLSgRNb2MNuMpAScgRiXN9hOpf6kIGTpOIb7ccYZ
	Xv5XisRvKziffTJ/DUwE2Okye5ccsJywYZxvFFxWs+6y1UIUMxpKCVFLK0nSAYol
	Y2xtwJ+euef054Y9H2j28FXeEFivKyu5DqTa/4SoFjK8IOqvly1pSiYSlF//Qnbd
	DEloxw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e5c7r8kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 19:44:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2e5efb04da7so5003734a91.0
        for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 11:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733773473; x=1734378273;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ow/KqxCHyunMrsdOQ2Cl+Qlj34e+7mwsg3bahRpKpPk=;
        b=alTSSrHzaRvvdedqYLIwKdmFGtqtCqVsbA1UILl0J4YGdHlGKqfab6rHBiHPRjcQMe
         LxUqXZ9iwsB+N/LIE/vNk6cZ+v5HBuZVte7pUgCnUojyywJVqcHgeY13/AVCeuWMklt2
         unRnMyZyBjeoZFcMTivunGb9KLY3MPnTwzq3SfZ0jcVhcJSmIUnGxT9wC9ZYooqTf4WE
         hbHR8loPe6/nq38WvFjlmz2kIVRdrOhsrQIWUPCkWVXl/p1w7FBtYwMCQgGeDXYroFwc
         Lj6l3OjZhgGIfEo1A9Zry1UWoTb4TC9EXmBJ6/TeL/ydpXJ+7wUEVm6dD0oAr/LJ2AmL
         a0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU8HMGVzMupZZe2HLAmJ4t2/qJqYu/HBfCG1QI0bi7SGn7yuROKGqLNegCNWhJWbNi6nJ7DWs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrchSeQJcm6WdwxQpcX31l4oREOqX41Tkf9SzDOJnwbaGcoQLi
	Mcow3zgw/IgNs0qwH2M+qSoE0zrcWbxa6uDt8UYAvFIjWEJ+k4XAj0quhkcQ7PTLUWiVs7+Vflf
	RRjr7+97Sc/hWMXU0Qn3CHJPqpGexEEVtO5HpkWGN2sR3D8y8FQD+aG1mpd5c
X-Gm-Gg: ASbGncvrXlbNn+yB4wwXAhGmSmhjxlA8P4zchBbZcQorSiR6xwdU8mNVCSNXc7F4t7f
	VJXCigxtjVj/p477DxTNihQI22iMPHZ0isbjtc14EVuDUddkHtIOrZU/fZrG3sahvYikucmtzv0
	I9IV4LBbmdo8FHp4xOP9/Piqb8/xss80TeF3JSe5hTTDmETflzYxiMXXmEJGUHaQGdBbog21VZW
	EeqEkJ4vrteRvaePMB6r1RJV7a+b/NGErlQJANwDTmA79ZAlClOzY2m1PxiFd1WCwcJKR+O9Yzy
	MaWwbmAHVyTIDQqkf7+SljeuAyDT8Ug92p36WDDrgcYzZkM=
X-Received: by 2002:a17:90b:38d2:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2ef6ab0cf92mr17473224a91.26.1733773472944;
        Mon, 09 Dec 2024 11:44:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHusWsAEuoe+eEdRfSy/WitEZTG7LXYqOy1oR30O6/24EOjzOheiSTBhKw4SCyZ3PVopda7Q==
X-Received: by 2002:a17:90b:38d2:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2ef6ab0cf92mr17473181a91.26.1733773472589;
        Mon, 09 Dec 2024 11:44:32 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef8fbed9ecsm4267817a91.10.2024.12.09.11.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 11:44:32 -0800 (PST)
Message-ID: <6f9bf36e-6866-4c83-a165-dd0af49902d9@oss.qualcomm.com>
Date: Mon, 9 Dec 2024 11:44:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] wifi: ath12k: move to HW link id based reveive
 handling
To: Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241209185421.376381-1-kvalo@kernel.org>
 <20241209185421.376381-2-kvalo@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241209185421.376381-2-kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gKHMV5fZKxtY4AXlgmBJ0DgirG8X8IkA
X-Proofpoint-ORIG-GUID: gKHMV5fZKxtY4AXlgmBJ0DgirG8X8IkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=730 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_114435_534914_9574861F 
X-CRM114-Status: UNSURE (   6.12  )
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

Subject nit: s/reveive/receive/

I'll fixup in 'pending' if there are no additional comments on this series

