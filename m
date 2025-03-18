Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E14C282EC
	for <ath12k@archiver.kernel.org>; Tue, 18 Mar 2025 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAVIkA2nJaCLd5wAcdILg01ybenTh1RV6XjKZhSWOTk=; b=WuWHXBXFL/LsSFBPWoz5FZq48R
	ezULSI7occWFAarsqQSLlbeqDT29h4TZ80XDiuBmKxbTSNfmi42PIZUb4td1/PKp0g716BNvhJRcD
	lXxPdFGXNNgBQHNWACZ1DVmtOgj2rQ3bMk9l0N7oeVlnhM8GviBifmyC5SpzXyEbeSNgbFA7IKVYj
	Zt0u82cP+7RRMMc5//GKcvJZl3JBOg1Cbz77n7NtfAWNRDaN/2Ke4k7JL6B7Hz/GKehy56OSFrIy/
	rYRjzG19YxEl+JtZ6E4NxUSZl5veu4KWUfTa+XGYm+C3oxDyoo8Ysg/MX+esEbhudtJt6r5HL+u8p
	rRwlw9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZ7Y-00000006ObO-3Ggv
	for ath12k@archiver.kernel.org;
	Tue, 18 Mar 2025 15:44:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZ7W-00000006Ob0-0tYL
	for ath12k@lists.infradead.org;
	Tue, 18 Mar 2025 15:44:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ICeAVc029857
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 15:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAVIkA2nJaCLd5wAcdILg01ybenTh1RV6XjKZhSWOTk=; b=YhVTOffV+TQlTTy5
	Idt5nfGNUPYHSpbS9a7570JwGHmhOBtWPl6B+rk6g8I5J10SoNk2BAhLZeaSAqlq
	D8Y4h7pXldifp2MFhgA2TzHVY/XAKvtso8M484z9VMrDyjRnjLAbR+/p1svnRkXN
	LXzAozz4gpQC0w1OsKCEx0LW8wHbwDUu8m1aY58ot9WYmXlqhUrZR8HnSBuEOTH8
	oQwaspgm5GinYXF0swQbYHfj9V54d31BZI31SPQgWGAqFAKjxqgIzwHmsO3wLkqi
	OPkad7QCOl39wBuh0ELSwhJsqSSARI5+ShtBR7F9kPd2OE4bNmfR2woKdMEf9Bm/
	Ypt56w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t0grb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 15:44:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223477ba158so167486535ad.0
        for <ath12k@lists.infradead.org>; Tue, 18 Mar 2025 08:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312684; x=1742917484;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAVIkA2nJaCLd5wAcdILg01ybenTh1RV6XjKZhSWOTk=;
        b=oxz7dQ8JKSxR7sXM4FdUnji/TJpb0KKj3fCgyQWk+K/CYTskd2lNbBQhVSrZWFyw0K
         OeRneO2wlEQcmr3jbco3MPr3Q1CdpHnydXsczTIErhPOnQy4WV/xTKnRwECktiVqXoxi
         +Y+TqDasAX2qNlYM1+N3wohrB3N82AJXmNxA1mlDHc7PkMkAEWoJYAt9st07YyMlZfm0
         p3te7O/KCCOPBDm+kfpt+wlg+e3ib7vRlUpfTbPY/Vd4gdato0cd0L/xGLvgLBGVP+VZ
         7Qyz/AHNIrAVprygHHY3odZArkHtURfhQORROIseyyJBM3akrykAqZAKW5T36bGxfA2k
         o/JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEqp1YIYg3zE3vDdAcTGnCFYpRypblO4Y+7FH607FxveBYzvlofFf3LH0ki/gVhldNnHezsY0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCMB7RH5yYbN3FDDwvHdRPdwVGKdmTola9p1oYt9CcERi4ymgx
	6YW4QFMAV1FDfs76RiljFejD3vFbeFtSLjD/kyg9+C9qozFT40i/96kY3LgJ08KenY//sOTJiw1
	WAHpAAuLzqZGxEab8Sp7XR7LilydjuBdaAPSsZv9fcHk0+6Z74fNNC9C8l42P
X-Gm-Gg: ASbGncth8haCo+6JGe5saRR0ULscKgJJXj7bGU87y+WD9YWATFCY6VhtxTvo8mByg3N
	6OPLHIWpuyvz0iFQQPD6ki84ZVfKhpxqV8lB0hILVqz/O1MV3AjVWEcTzDypqgk6P2CBAF3XZVm
	UE9zXqnud+l2KBni5Rj/DIjidHj0QH6Ken31+sO03BTckPnetAMri0VjVUrbjSizgjdoo9oOxAP
	MDwa7ZCxmF4dBrCL4cOypYaXJebLV27xIm25pe0C7uc0Z5jvWOWwVJkxfgUuLaRQVp5mrI5x8ga
	FRzflBXZxVBD0mFQpBVn4HhMyEqNyuQuhDzK2eMDUebwFyA3N1PUSWQOijbrv7azcLedVNc=
X-Received: by 2002:a17:902:ce0b:b0:223:668d:eba9 with SMTP id d9443c01a7336-225e0a15945mr234859955ad.10.1742312684408;
        Tue, 18 Mar 2025 08:44:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4lLp5t7+ZMhTjiUg/ojVkZKcM7/NIU48U90wLJENACatjgBlOPc+VKldix4F3T50fec8NNA==
X-Received: by 2002:a17:902:ce0b:b0:223:668d:eba9 with SMTP id d9443c01a7336-225e0a15945mr234859595ad.10.1742312684072;
        Tue, 18 Mar 2025 08:44:44 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116af372sm9716397b3a.160.2025.03.18.08.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 08:44:43 -0700 (PDT)
Message-ID: <683b16dd-a3e9-4cc3-836a-95f3747d3c0a@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 08:44:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v11 08/13] wifi: ath12k: add AHB driver support
 for IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250317204639.1864742-1-quic_rajkbhag@quicinc.com>
 <20250317204639.1864742-9-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250317204639.1864742-9-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y3aCbNt4Dh9_-DYHCEa5pICtjyAALT_z
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67d994ed cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=E5dAun_1JQ9YDljNTxIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Y3aCbNt4Dh9_-DYHCEa5pICtjyAALT_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_084446_267677_7A887600 
X-CRM114-Status: UNSURE (   8.18  )
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

On 3/17/2025 1:46 PM, Raj Kumar Bhagat wrote:
> +	hw_rev = (enum ath12k_hw_rev)of_device_get_match_data(&pdev->dev);

kernel test robot warns:
cast to smaller integer type 'enum ath12k_hw_rev' from 'const void *'

looks like others have fixed this by first casting to (uintptr_t)
a few examples:

tsa->version = (enum tsa_version)(uintptr_t)of_device_get_match_data(&pdev->dev);
model = (enum ep93xx_soc_model)(uintptr_t)device_get_match_data(dev);
priv->cks = (u8)(uintptr_t) of_device_get_match_data(dev);
rt5677->type = (enum rt5677_type)(uintptr_t)device_get_match_data(dev);

not sure if there is a "better" way

/jeff

