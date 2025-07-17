Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E76C83F1A
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=g6FJhx1Zu0A2eEAm+JBT3VyxMJ
	Vi3KauSO8j5uPlRC1nef36PiHCRkOmKgyITNRRfywMIQ/sSR+Ov6UNHKTwjMVoAACOoK406b0zD8y
	eFvOYf4/wifphdQXKtKH75U2WmCHO2JxGiRMw8z7CQ2NihSZloRyIMMyCNrwd1IjgyNbiOeHocQjn
	KW7Vo3MttbtbYcTiC6ez6XGs/J7mcjYzBgM1dlnOaaSRd0iuXkrDV8GWcWwpocr87kAVyCoKIsHRV
	UmjREPf6qjm1HujPZqoQxU8OrE5BhKTdlM28ye3C+AWiCCVfcSVRSaRplR1wCpQJHr98qzmyDjnpv
	fk0YVq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNmb-0000000A7XE-3smu;
	Thu, 17 Jul 2025 12:32:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMHN-00000009vHf-1c4G
	for ath12k@bombadil.infradead.org;
	Thu, 17 Jul 2025 10:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=FmXjleccE/Sg9w8JvYWWnDIsKR
	Gq8ASt01gAb86ylMG2f7fRGdFt/6MTn+bLayvle9sGFwVIAtXq9yS+Qi6xwk2A7E0+EOC8ds00M1C
	eyYy3m8bHjNU4oKKswfBH1M3WaZjPK06l+TTmEGyCb8jcAKUw1JSVCmRe0FEz2Y9epE5awcjzIEQN
	CA1pUjHlfDvq0X8bB6nB5O3hFt445YIvWPRVqoMSl6cDnP7pECmJq+Ex2lTtiT+QUgrxmikU+vqc0
	2NCYXPOEhOAC+mV//EAEgfhSOsPYqVFtdFxHuWrdWGK6BRnCiM8sw2yuMR9qg9HPH1YNLEOtq/6qN
	1vRPoKCg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMHK-0000000AGHm-0rZN
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 10:55:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4kle8007207
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 10:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=; b=IZDJwHd6XDcNhEnd
	3yf4+K38F3BML7mfcVVvbjH/f2Qlf0RdNFFggnIMqcGgv+5Tx0PZmXfho42t04C1
	pKsN6fTlZYmh5W077iGc97meCjX52xm4sbvx7+NN855CHSby5S6C3cW9gvHayI+Z
	YRFiQEnF8EnHazbc9mgiPOtVsjKT0rYYbVwRpSNlRztyM7kDY9kwqbSqqIlesG3O
	SN+Em2culeXThD9nnqxvOn5WH211W6FBvPA2gpI3RRHyQm6TZvSyboWXkhGEd+fp
	wjMTQulwOHt3I/Esw85vMa4xMcnyuWecMgFQosNTBD/xy+gDyhKdfxfukzSBjAZR
	oo3vHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca8hba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 10:55:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab77393308so2003631cf.0
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 03:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749749; x=1753354549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsEUvuBRDMzRKRRLJsUyfbmC1yOuPlsLU/0xN60mrqE=;
        b=d24Gz4H3vrPsgQV3DADyYRIZdokEAfsePlxgJsRXY9ENWUv7tudtwnrJqfMARwF4Dd
         RNlk3TtFp3adNPZBysWqFSyndIgux7QWviPoQIrQbWC4/FYwmXXI6olyN1pVFdpMRBlo
         0xMO1tksCRkpaCJl02Fay17F/7FTUMPrApzBXVLe+XFvenoNU50B2Lb3FVhW9lz9d7tO
         /SgAVI6BZUc9RjLc9qMjt8/qiNaBISC4MCHSqT9tgGBg0wFMwmb8UUmlcgCzmHyqOlxn
         ubqVa47kcYgFJfg5aAX+0jdfdYY/CS0Zt33OsNNEgkM87mYAdxdZsVxqmNQXfgQzRmwI
         SC9w==
X-Forwarded-Encrypted: i=1; AJvYcCWZh3cQ8huTsKn3St4gfx6nJ5+8MxxeMXimr69BhEYCCtYywZTgs8ju1uHhnQj64XB2LH0LuTE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPWL8PgBUhdXQhg40KJ7f8dOdmfQjb1CcWRt6fBa7nOjcGPZlG
	lQOOCOZGQQemo7XYZ5khKuNYQpH26P9qPmZd+R3Ux2Br3qkoDqyhu+muDqKfiwMZ+HGXi2UTo+z
	XYoLVO0VHvvHky+NAX52rmAcYLL+4iE4Z1cvjMpMRL8Dds7eznJxX034vM1yI2VaZ
X-Gm-Gg: ASbGncvP8wkYBFi+h+A8WRM9CXi/9ZjO7ANTz/YsYycGhP05UBIF1EUt6sZk9WnOvOw
	DlhCyX0AGqxYbqYplWtdON+zq+TAe6oYqSRvT7m/GKVQHrnQZFcUrSNe4rzz1tBLHNfi7aSkMUy
	0Rs9jxzTkhibZvUTbJlUVJJSlpXSPvGHk4+nbOdNWASbcBXvEMWjsfq1AaMoWW/TqNB7YEc3jh8
	MaRScQQr76UEmeoVsC9o/n6810k0puhttaYe5aFeY99bkEFXyxmiWvjIebhclGRmUy4M9n9UWae
	rUezOtEq3M9rBtbNF6LSpNObDVQ3McAYFiwzzOxxsy3E07kvV8YYA7aYlA5aUaiPdcXzFMQJZeU
	18u6J8afiVsyAGygiHJzi
X-Received: by 2002:ac8:7e89:0:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ab90cb3599mr37974021cf.13.1752749748789;
        Thu, 17 Jul 2025 03:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIXtaAbwds9yIaxYyNO5vMi4lC/pKMkm1pehCrB0BGO1mpogQimYGvbA/xUnAXMGKXn/lD6Q==
X-Received: by 2002:ac8:7e89:0:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4ab90cb3599mr37973741cf.13.1752749748206;
        Thu, 17 Jul 2025 03:55:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9733935sm10034847a12.46.2025.07.17.03.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:55:47 -0700 (PDT)
Message-ID: <5502b2eb-f6d1-4ece-b918-1c8561a92607@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 12:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NSBTYWx0ZWRfXzjNXuqDKEQ4b
 B2//2S6GaPUWujpwGF0/w4tsAgy+JuJvO2/p2NfcEikLZV2t97l/kolIUUgV0bAA2qz88sspAZg
 A+r7kYhTrTVlYL/zJnqPQjKmAsAkLKz7KsaM6rtXFseRCZXdrRSSefPApgfkYJAKB8/ANEbewTl
 LmIWE/GJ/QXJtAF07yqrVZ7OTNZPz3So8Dm+LHVNW7mrQlddowz9zkq5HpnJoIzOQOW/rC2r1zF
 GylAqOnrCnK1633JZ60aVTAnn9A4aCnaufkUFZ/LQj9DGTY+8IBaA2dRE9o1Y8gA56FjfGAqCL3
 Zg6+L8Lb90zraBRgxhScyhnuLTEPPNcD2+jUPKrn07yxfQ9CW2DG4+A/n8Zicrj5dzk8nCh+wha
 GelKuZvZRj7HP1Pg5+tNdaXLp+fv1cwWBNbH0zZyMAZhG+AcIpQLQMKkKy0pdL5Vhyp/K2SG
X-Proofpoint-GUID: iSXjDzyfAPshSmEmt3_LNvoFGRJurydd
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6878d6b5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=a0K6PxZnllCBz7J7qkkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: iSXjDzyfAPshSmEmt3_LNvoFGRJurydd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_115554_532700_21672422 
X-CRM114-Status: GOOD (  10.69  )
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

On 7/17/25 12:46 PM, Baochen Qiang wrote:
> 
> 
> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>

[...]

>>> In addition, frequently I can see below AER warnings:
>>>
>>> [  280.383143] aer_ratelimit: 30 callbacks suppressed
>>> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
>>> 0000:00:1c.0
>>> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
>>> Layer, (Transmitter ID)
>>> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
>>> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
>>>
>>
>> I don't see any AER errors either.
> 
> My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
> never saw them until your changes applied.

It'd be useful to know whether that's a Qualcomm platform running
an upstream-ish kernel, or some other host - we've had platform-
specific issues in the past and the necessary margining/tuning presets
were only introduced recently

Konrad

