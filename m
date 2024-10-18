Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50F2D3F283
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 20:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx6vsuVGHXJGU5w+/TtA7rM96sThZzOTxbF75866NM0=; b=gw1OvBG1kF1mbVx3VHutVQ+rBE
	HK4Wl2HK78kFmwS3/NIMAXZNHdfbvcuqa+y/oLDVt/K0F+L2O0/wHeyZNVFEPnOjFaMgb8I9C6T50
	887eFumfpAHq05EeGXhPqQSvvlZpt7Sh1ovEgwnU41VFkJ9uec+ZmmSfbVTEk+aHipoYmcApL4cMR
	h0wgA/ihPUItl7ysVu8vMzimXtp9sw6DAE5wBeND41a5Ek+etHokeprfr0CiEitvzNiWqMAITSMx/
	hK/NChGwk77D9V2RJ0htKAm+VsWOaUuk4YmKU/HYalYPfPhKPXzrtjkkVGuOvcF9/i3jGn+IlH2/Q
	q8KgXj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1tBd-00000001tLN-1zFC
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 20:03:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1tBa-00000001tKc-1mUW
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 20:02:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9FwPl007572
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 20:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jx6vsuVGHXJGU5w+/TtA7rM96sThZzOTxbF75866NM0=; b=EwqrS7+aTUV8IykZ
	qepzet2k4oN8wFInCPENqEBBxY5YcaFcNdkm1nRC2b2Fra9VxzxqyExKkZGGj0Uc
	KG4j4nUCpq+jXlssNFkyWPi/cpm8SPQb4QpPpcm1ZPs2wFKw+j7YtlEbxiYC7srq
	UbreOZcT+4GI7wgWC6pQBUYrM8kcYi5wJ/RE6ZTv6KUJMQHQzxaRzBLy29Wn39TG
	JxbcgvVbucuH6P5Tv12en404DShcyyH4ZR5zazmmMBwa70UzhfRQpOmLDNI2pNPX
	1Lle1HsuJKE+ycWiOQhkTCm0k59MQLK66KvryeijxnYXRh3ihzHYESziGXsR5G24
	wI3qsg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b8rr3kfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 20:02:57 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3e5fa38eaeeso77268b6e.0
        for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 13:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729281776; x=1729886576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jx6vsuVGHXJGU5w+/TtA7rM96sThZzOTxbF75866NM0=;
        b=qcQChOPBRojmOQ6JjFPHgRCKYUmpmBc/Fd4nchdQkZWJhTcVyGsaa3GUXOmVlNTKy9
         Q6QQMqrQTgG4pBkqpsbTS9U/tuvVIsSn2GeenbUt8nr8w2ePC2clCue+RO71IZfXVca9
         pShvvYzrDK3nXRmqEH+LFoxbSednxfuvVoK1AoSw2Oi0UBSlABHLTJGiX5W3RVUGfZKM
         1zvsH36QubP2Z4mkQIwJMF6zZ+q8TBfbl64W8vxJYwWfQRjulSX8Xh7mabOkaRX7YaTL
         voTXJ/XzhNzTn8HLKn6ZDSIC2hTh9UJ6w1Lc4G2J7mYs4j+tOvQNAXZ9i05fMLKqT+Sw
         kHsw==
X-Forwarded-Encrypted: i=1; AJvYcCWeZpXgsq4RDBGdSGTRvkL6UYcmw8oTkTEjEEouua+XXRu8GbziefJfEdokDixhhIH/MPyhzEo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2gUs+KhmcE98XMoSgFFLPTltgg7Hq1NhoF0ySt8Rrcxh50tqg
	Mbo0t5eKzmonccf4KI9aTkNGSYhksiW5ENsXmEi5ghRxbFM94D5+oVY9O7a9/4GsgH0gBEOwEFN
	r+KnlZSgAFaQTClnj8NlUC+lNGb7Jd9T26al5oZw3woLDYj+bLXh4Eg9ApTRz
X-Received: by 2002:a05:6808:4409:b0:3e5:f2e7:e093 with SMTP id 5614622812f47-3e602c7acd9mr719874b6e.2.1729281776530;
        Fri, 18 Oct 2024 13:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9G20t5WM5KMGCFTj67wFZBllJeL+g/oeAGC8Zm/OLBjdLijn7LmX6TYKFdPw0dW+W09DeQQ==
X-Received: by 2002:a05:6808:4409:b0:3e5:f2e7:e093 with SMTP id 5614622812f47-3e602c7acd9mr719860b6e.2.1729281776162;
        Fri, 18 Oct 2024 13:02:56 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ad4fd7sm133149866b.72.2024.10.18.13.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 13:02:54 -0700 (PDT)
Message-ID: <af289022-218f-46fc-99c2-3ccf027bc8fe@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 22:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/22] wifi: ath12k: fix incorrect CE addresses
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-13-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-13-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g7S8dctYAv2UEMb9CP-jeUMzGKTNsM6C
X-Proofpoint-ORIG-GUID: g7S8dctYAv2UEMb9CP-jeUMzGKTNsM6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_130258_626744_B2CF8A69 
X-CRM114-Status: GOOD (  11.20  )
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

On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> In the current ath12k implementation, the CE addresses
> CE_HOST_IE_ADDRESS and CE_HOST_IE_2_ADDRESS are incorrect. These
> values were inherited from ath11k, but ath12k does not currently use
> them.
> 
> However, the Ath12k AHB support relies on these addresses. Therefore,
> corrects the CE addresses for ath12k.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

This can be picked up independently of other patches in this patchset,
please try to position such changes at the beginning of series.

Konrad

