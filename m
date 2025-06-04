Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59511C5B549
	for <ath12k@archiver.kernel.org>; Wed,  4 Jun 2025 20:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nmUblAt7jBdusrwHcLRMAC8WvRtKpCI2QWkSiESjaHk=; b=3lucpBa0nFg3wVfnFszgknQLRP
	WPvEX3d2zWS9QgVNDzCah7xfw4g6qy0UtAae6hFcPvnVD2s4yBgL5cSEY/wGrrZiJkv/d/YoPLr2L
	YOqqU3x9xasLK/h21vGgwU7/7kYWh37OF93lek8kobrkMi26lrLgXushGk2ENmNSigmPzokbiiB59
	3y28OwKSzfBjZy0FxcmA2bnTpaV+cPm5kHfMoE2yKy/m7ToOYl7QAdA2h9DcSPeVQNreLSTGlL1Pl
	Q0ay6ILVuqT8VtLDu1jyR5JvTN7k029sL4VslS3dZYGRol69Jb/L7IXpvRIGUDFAx5KRp1KrTFneC
	woOGDKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuu4-0000000ECgU-3xiB;
	Wed, 04 Jun 2025 20:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMusS-0000000ECXr-2etN
	for ath12k@lists.infradead.org;
	Wed, 04 Jun 2025 20:38:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554G2o1M028363
	for <ath12k@lists.infradead.org>; Wed, 4 Jun 2025 20:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmUblAt7jBdusrwHcLRMAC8WvRtKpCI2QWkSiESjaHk=; b=fYxY/wj+5Q9e6dTl
	ld1DZnLCRw8+yM1tr9YdbgRH7dBfhczwF6X2mm3wD9xwbNgCYUFnVJQL/G8riv83
	MlPxrhF/7rfoonJCCeY+Fi+sobacXJPvUDdYc008qFd0nQCnreWWNmekboDLpBWs
	hYWTmfgIr0BiEo+vq4g8z5mD8zV/n7PVftYLuHXH/qlvRbfuMM53NNG6nHZI6IeA
	PLGKVSpPExBJKWukqsZRZdXe8vq6BwGepIEGDLvsgCaFeYddHPGCd80M+t1dP0pn
	2nahCsJRx9zrMMp4usEI62nbEEXz0n1N+OGj2xHYtDwMoF2llfFk0Z/sGRMmkOhk
	SusFog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ty9jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 20:38:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234aceaf591so1288855ad.1
        for <ath12k@lists.infradead.org>; Wed, 04 Jun 2025 13:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749069502; x=1749674302;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmUblAt7jBdusrwHcLRMAC8WvRtKpCI2QWkSiESjaHk=;
        b=n3GUfE4H77uDyEBIgGb4VU1GEQCCr/Y7WPAHQ2A4xocq1B7eSUouaB4CUCfccMwgh8
         /RYCErmhD3YLr5FQqnfAKeAX7ioT1jkY9NudRg34zGxfuB/8XpIjgQZys/O/22djmjFm
         r84am9IMK06b4ILoGa3BR7a2B2qOfqmZKJUQtJl9KQIFi6xEUZ8/N5z0O1RFCsOjljFu
         dN6/WsjglOfdiBMGe0M2XjpJ3joIeziFUUZ55iWiKScTWprh9UEtT+BnPLZ83dv1Zx5y
         IuSmI2iCOgmAi1CeXHpzHYpJPWd0vcG2Bf/jc+482EWFCdttynRZ47KUgXkHAi6VUXMm
         A88Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuNkL81M5eZbfDRFlFeY3tY6eG0DUTKqDK3haCIo18++GCRQrzQWBc/A1y/KNMClfNEs0P64M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpNokEqFmf88nPG/OG5Xnl6nOLwLb14Lhj67idWusOz57PqSpX
	0ssDTzAYy8cYFaazSSbmY+cWMcdV7UG9f1MANI+25Hw++cypSPBh1Hpuqq+HZiQ3NayqK6acHPb
	/1cS7MOg6sYttJoDPxlkvvrbU/a6f0fvB7/OurcbQV7upzIxonvwLByw+760FCH7b
X-Gm-Gg: ASbGncu4s8ZtvBRdx1XudvVxGnj+WmvHODJ5T3KN0MJF4rnJBfW3PsfBEPHIrGdHJ8m
	vQMseOfG69begzUlEZqIDTcrKnAx7Z+4S6c13eTx3m9CecqAj18BMMm7LOSR4QQF11v9UzRbU83
	CQb4H3jG81JBx7dK8zR71FmBpS0YWdMImaCQxSL8zT86kJRN/6D4OaKC81c4WoxdADImzzGqIg7
	WTnb4qYRhoSZjx/Vs06yRc7l+xyeuzyX4KI2B9BM21a0xQretH0gWlrmP99NUJPtHzjfoicxh/Y
	VaF7vtepvj6szOiZISVNE1xf5GllXh6VdBOl86JrBe0lswPauPpXgTp95icDJSEZ+gcI/DZmNww
	gl2aM
X-Received: by 2002:a17:902:ec92:b0:234:a734:4ab1 with SMTP id d9443c01a7336-235e1013722mr51561965ad.3.1749069502039;
        Wed, 04 Jun 2025 13:38:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDF90qbDcpBCXNvXly3ExJa0JarFpfxkiGQKVK03S6hsQAtFSRuw5EkNYITc2s7I4b9kPu2g==
X-Received: by 2002:a17:902:ec92:b0:234:a734:4ab1 with SMTP id d9443c01a7336-235e1013722mr51561745ad.3.1749069501670;
        Wed, 04 Jun 2025 13:38:21 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb6b5csm9148373a12.72.2025.06.04.13.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 13:38:21 -0700 (PDT)
Message-ID: <a949a8f5-1b08-4ba8-bd74-c2fd7fb754fc@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 13:38:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: allow beacon protection keys to be
 installed in hardware
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <D9J8O65N947J.Y0LSNAOS0AYG@gmail.com>
 <57064b98-5950-4b9e-8d76-265e56127dd1@oss.qualcomm.com>
 <9605558d-e785-4eb8-a752-1f591eff393e@oss.qualcomm.com>
 <3249b83b-00e6-464a-a6ad-80e114ffd438@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3249b83b-00e6-464a-a6ad-80e114ffd438@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cRCvfI3yswtTkoFgSwNyYGQI64D40afj
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=6840aebf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=QtnrFSZZ1VxgPVbhsvEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE2NSBTYWx0ZWRfX2aCiGItwo+FR
 9RDcgAzCNbx/wGoSIeDdPj6zXOTW0RGHmabaB9Cn021q6dOUSoh2jiBdMTUOiBnPaW2+ynEDjay
 zebObeuysRT7Cz+UE9gOiE0mWhlRcBmb39O8YMCd/98QPaNPvT9HWPBWXlVZl7gJ9koPzOLxANF
 k7524LMDfKkihL8yUKKjFRQSWwyAitUJrJro0gcsxLR5Tm9MAotUQzv3IUBnT/RubcuAfK1hXAo
 zsJL49Yi3HAfWgd/KciwR/DKj14J69b1WwfG+OnOQ2eaA79q+9t+xQfxffK5bUdQ8dQFe1NPh1h
 tp5oaSvFqERFysc+41A1+QUIfoBLawaEvUGwHloFAzqAYnuxtkBxn62HCt1m1BwoczZ95VU5oFp
 PVGcTvGAfu8oFvFWz8Vh9fwz/s0T5npWi/l8BBaZb4bZTJ4bNx3AWKMKSlEIEa8R33Jzeeu+
X-Proofpoint-ORIG-GUID: cRCvfI3yswtTkoFgSwNyYGQI64D40afj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=929
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_133824_789028_D8E71A72 
X-CRM114-Status: GOOD (  10.10  )
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

On 6/4/2025 1:59 AM, Karthikeyan Kathirvel wrote:
> On 5/9/2025 9:37 PM, Jeff Johnson wrote:
>> Will you be spinning a v2? Note the dependent mac80211 change has merged.
> Yes Jeff, we've identified and confirmed a firmware bug that gets 
> triggered during IGTK key installation, which leads to corruption of the 
> GTK keys in firmware. To work around this, I’ll send a new version where 
> IGTK uses software crypto. Once the firmware bug is resolved upstream, 
> we can re-enable hardware offload for IGTK.

Note that then means firmware must advertise that the correct support is
present so that the host knows whether or not it can enable the offload.

/jeff

