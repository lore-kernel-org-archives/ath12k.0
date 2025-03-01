Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAFAC021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQ7oIoj1Kqr5z8/bVwYBJwuROLD7SBJp1FOO5JjySAQ=; b=2rKFmYR4m49/mKQRs1pV9LhiZV
	/0Q6KS+QX4wyK/mY6K5opylkdFca/JqMzbiDRs5AO4wRMzkWPRMbFzcvlb3kbrNPEswoAf62JeVQp
	KOOVnqybNX1ApSfOBUu15NY6caBPcBsUrX2qwIARCSCERwrEJ88g6VW6Q8rFgBT13QRcBmgCcIrTA
	gm8YbSCzNB7M0K2QUuRtV+tb5evrL8hHkEB0jeNW89q/RVpUdp2l9v1PUF1s5N67JQWUgi/bAkEfT
	SstWhOysEg6Hut5iPd17WYKt7yM6L1R6yOz7zAz0JaCVAh0/p+udBgnKVPUPJtebJGL6FtQPgMwm/
	oWXzJFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toFCg-0000000DRAF-30Q5
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:15:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toFCe-0000000DR9j-09kq
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:15:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5213IOXB008988
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQ7oIoj1Kqr5z8/bVwYBJwuROLD7SBJp1FOO5JjySAQ=; b=k3caN278fJqtyWJw
	/SbNTrIzDEX42EAMR7UDpohxyiVtiByi8MXHTehpLWHBl/dMGNXeCSIPNzccB0WN
	CgL4cOvrGdF9UwyWKTijOvPVl796APgmuHgelEdcauIyq3nnw5+sxYWg3z50PkSf
	Hi95ph3Yi8DRXR5Sh0PyZydtZShlBjNLCM5ZqlaRAWWWEfsAHydZ8W5LpvQu5Dbc
	cjqHs1u2Blz7215PHPxYddPk4EOMwXiK5n7EQVLZSAvNOYdPZ+0Znfzal2wXljGO
	C5bWe7uJChe7hWl2kgKhiwyuEeYKhvkp/rXG2tpq3U8DvshhxltrSQBko+edZoc8
	bdh/fQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t6k05t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:15:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fec3e38b60so2168435a91.0
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740806154; x=1741410954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ7oIoj1Kqr5z8/bVwYBJwuROLD7SBJp1FOO5JjySAQ=;
        b=gOwD2ghxBPtjQFeW7ycJTfZSxuu3zACrApWXhZWS6PkMKpVWMdYES7UmL7yW6WoT4N
         w0OSZw6VqvydLw9NW8cOOORCZvbabe/hThA8A5lvJTIAZ83GYZO1a+kl5GqCOcdkoerp
         ShKljsWu6mjfrgC+fROy2iijFCX2Sj5AmiA0Om8XTeSy55JwCVF1mPHkCBwM9x15S0uE
         9IFs8OPhbzwwhMClYO4+YeMtxgpzqASOEAvDDNFq3WdSvK/urMT5nql7V/xjDzOXyzdH
         5Irwc60Kf8eFc1ytGP/02pvzdyuHPZAGYe1/xQFhTDxFGX520J5PewyCSGbu3eOX8Jrn
         2YrA==
X-Forwarded-Encrypted: i=1; AJvYcCWRpCDAdmAx9smjLGmMk6SLAduM5eyY9X7h8HXQIYp/AqybDYUgTwYVGS5cYZkKGGDM9ekLHpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxN3elsCH9AiAfY6cdRV0htNsdw1zt4Pcs/IqR+iJJOjSE94Tao
	4mA+vJLthKI82ODXgb7pyG8ClW12MV3ousnne2G8o10PaAirIlIDuPkYrjmKJJpgQ6tYa/kChcE
	nVEMhQyuIdPGPEDOTxwAFOx72gUb88LOlouI7/zSxGxH2P+1FNZwNyNnhkT6p
X-Gm-Gg: ASbGncsq9QwydV9HClzm/S13O17VJXmuZ+xw/tyTf9ZT/Dr0fBTGFufZxFJ5yaIFF4k
	TuMzA5OnF8L2E9ZE7XjzM5wZE7ALhiSUuNW2dN8kYiAQzdpaEtDjagpcWPVaQ6r1ZO5PVPKbmz9
	jc2Enjqb9pnYUMKJmFxoTNXy8h5Vw5fVHuCtUhYpnAuCwheIRH9xH6PlCx5it8lpDvarlvgdBel
	sG/wSYn5OeAJvaAQaXyGqFdqyf1gOG+f+KKdNU4FcYfSvWJEDvrkBTl99UXXX6lj69onxZsgRil
	tz9sHITszNAhNK8xIvIDQyZfz60qUh7xHPHR5p1mTX/WExo1zhry9e1lMII4Ii0=
X-Received: by 2002:a17:90b:4ac8:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-2febab70682mr10656990a91.15.1740806154540;
        Fri, 28 Feb 2025 21:15:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOxcKKcRuFeIE4LwnVNuO3M5Y/CqCenqjMe0/49M1rib5aLtbWxJGNDdDM518EtbC6COo0Fw==
X-Received: by 2002:a17:90b:4ac8:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-2febab70682mr10656971a91.15.1740806154218;
        Fri, 28 Feb 2025 21:15:54 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea696e39csm4719697a91.38.2025.02.28.21.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:15:53 -0800 (PST)
Message-ID: <88f8e029-72e6-06de-34a3-beed36a57451@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:45:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 09/13] wifi: ath12k: Power up root PD
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-10-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-10-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nTv8034GtpscbUB6xqU_pMs_DcNXGxO1
X-Proofpoint-ORIG-GUID: nTv8034GtpscbUB6xqU_pMs_DcNXGxO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=803 mlxscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_211556_088826_845F5505 
X-CRM114-Status: GOOD (  11.47  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> Q6 processor acts as rootPD, other hardware like IPQ5332 which are
> attached to Q6 act as userPDs. WCSS driver handles loading and booting
> of rootPD, while the ath12k driver boots the userPD.
> Get the rproc handle from the DTS entry and boot the rootPD if it
> is not already powered on. Register to the rproc notifier to monitor
> the rproc state, this allows ath12k driver to know power up/down
> sequence of the rootPD. Power up the rootPD and wait for a power-up
> notification from the notifier callback before powering up the userPDs.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

