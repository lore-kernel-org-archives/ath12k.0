Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80C9C4450F
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 04:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cQa0I1D+pUzRftAtYM2RH4GCKjsFGpCoRwLdn0OnO8=; b=IbzzT/N9DvKfduAbLzc1AsGyq8
	24PUEdeE7qlTbErh8CHmmOJsKsQiAFqxT+01RpGhRs/CcoM7MTP9I2wpnCjKLXNYVDa9XOdUGnAe/
	dyD897/GOz5PmRyoT8XnoMsRxENh69SdwB69gIdvHrEswhNFx8r7JfIyd6QWDGnpaCWmgMwWsdZml
	OFcyCUs9XWG5/6z+vPTwV55XAnYHbP1unySIvjruNzAeZ9IVfhnGYDeDoRlulFHGfYZ/yETEiIFxL
	o22uSHnbh6JWjSVUmhqLz5B4C4nJgs36zEXX1v4jlM9T5VdAcrsRtNu7FoL+aPbUY42+ex8sbjX8i
	NcSnqzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkag0-000000019L8-1tuC;
	Fri, 17 Jul 2026 04:59:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkafx-000000019KZ-3N1l
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 04:59:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33tbx607444
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 04:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cQa0I1D+pUzRftAtYM2RH4GCKjsFGpCoRwLdn0OnO8=; b=p3fqzGBJEVLFpfD8
	Fl/x4b9Xz78mb1ax9/ZiyjBlAr2TzN5fuwBL+f66qre2QTfBoAAV+I5e13ouLtWh
	bqelaYnQ82YdGVySSyrx7ja1BZIqzL1PkNFMcKEUQ192PgN2bfnstTiKKSkyIn+L
	vmnwer90NQF+fpxuq+xZpwxPkIQsM06WVDBrruqsHlhzyf04ZBE/k1Qn3G0SAwtG
	xNENSuwb2t01/7+Lsj9TA0tCTpKwpE6F2qjVfKCNozsQuksVqNBNfjk3xivQGl4i
	SOgSMEqE4zsuGsb8ZAVlvn2zXrOiWq4yIKXTPjpQFmtQKMgSXV4I1ODYUi7J8WdD
	tMf/sQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu10cq48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 04:59:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so3846176a12.2
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 21:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784264391; x=1784869191; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cQa0I1D+pUzRftAtYM2RH4GCKjsFGpCoRwLdn0OnO8=;
        b=KRvaRdqe7Y95g0/I6lSMb4QmMm64uuRdySXOBabzB0JUc8RS6Ar8I6K/zP5GA59DXs
         jlKeD0Aj8fQoSAqN37ensjQb0Ah4ykzRpeFjpIRenGylDHedS0hdjB7HG+JFY1zvsggK
         pUmhiBciiIAM3Y5CfX/foZ9yeccOePKkRmCJETf0NqCMexN9QriIxM55bRYIY8y8rO/8
         KcA86mgxETWYBTH5WMK+QN44qRuqX3GQXAR/iARuuSmdJufpof28TuBLDYxcmh8AI6qf
         pvXrxvIZVEcmsj6J/aXtuiEA5+hLjCnE68vLgEyR22EIiExNrNzHhBfyffHqh+U7x8gV
         iJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784264391; x=1784869191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cQa0I1D+pUzRftAtYM2RH4GCKjsFGpCoRwLdn0OnO8=;
        b=spC24hc/0O+m+oGcqTbcmf4PNY3OrhpiDz0cathYNc/HU8+n8lH/oaTqd79OnQDuZ3
         VeMA0XFnwN2J9JuEB62OVzS1C9mJ+/HDo9RMGTYmOCcKDfX+8bBWzKHGqIXhuuQaasTB
         fQhwhY9S7WtHHboAP2p2i6PMAqgdAAj7Zm1FbdSUPV18sSOcQ6VFVB/N9Dy0oeHrgCsE
         MrcCwr6EmJUy6OGzYG3sVTL47quwB3YajXCw1wcGkOcgbx0B4zTlhJVbC17D8bllqiSi
         XvUlu2qb6ZUKQ/7V9ip+t1YkMo0DzSXMpPBEHGyDfcMkkTay/XWQV15ELgm/xcDNfUhU
         RluA==
X-Gm-Message-State: AOJu0Yxg/hMCvf/BShxEGN5uh0LzJN3ff/8U/Xwara8Q1qbDZlKopdGc
	VvxMSMxu7EE6hudJE8kjSF2O3EXhfRfyai4GvmZDyyL7uIZZNpIHxjC2g85oC3yn81U7dovSZ0O
	BNF9u0krR0bcYMsbu3GYOdD+8/QILSYYFQib8DXCPL/MkgVHhzsid1kLWKkzI5jWG
X-Gm-Gg: AfdE7cnA1yF4eTsHF4kR3lraQPuXpJQ9rkkGQtP0JD2IFFdpMyuLjmNq5dbyT2tMHa+
	XDws/5xnqxVQsm2k6SWYlfIwTfTXoMHtW66da9OwzlzTD0cfFWLbZAF0uCwaTuW578PNwhvGuwi
	9RdVJgNvZQukSfIz1lCcL5LZF2dW19p4HmEEFIZ7rbe0PM1ORrlcCuOkDA5C/4/Pj+4U3L0s1Ic
	I9CEkhQWwY3YVoGPpzCF1I3d7hQ0Bu6D+pKTIE28SD/n7Gi+kNtGAb3B528KOTWthJ175nQYWcc
	jxJAemG+ZCsECvYiaRyAnapeXaNlmPUtL0bPmQ1NWZRfpfJcpsAd0kAXIEAYff0M2DYdD4ejzYQ
	u4hF9GGRnEjZZuPvR6Kts94GAj7/bj8QnhLvG7L7K
X-Received: by 2002:a17:90b:3bcd:b0:387:e0cb:c8e1 with SMTP id 98e67ed59e1d1-38e4b594dadmr984699a91.42.1784264391437;
        Thu, 16 Jul 2026 21:59:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3bcd:b0:387:e0cb:c8e1 with SMTP id 98e67ed59e1d1-38e4b594dadmr984676a91.42.1784264390951;
        Thu, 16 Jul 2026 21:59:50 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm3696495eec.21.2026.07.16.21.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 21:59:50 -0700 (PDT)
Message-ID: <4f317363-381a-45bf-94a2-fad10b9104b9@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:29:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Set DTIM policy to stick mode for
 station interface
To: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717014302.284034-1-daizhuang.bai@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260717014302.284034-1-daizhuang.bai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bTeACbHzAaCl6j5fzFhpgxCm72d5hoX_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0NiBTYWx0ZWRfX7FAaB9TEE6yV
 MwrW1jCTlpQyDhYd7zuf36qBiAxsdKrWMUsjgDlQoYmFFGlaszKlZFJBeKDrGz5q4p3wNaMacUI
 OhGqu2ghXZUKsEZDmZCtHi/3AbecwhBrSQMhq92SYPO/wNyr7tABLJoadbVDRCzHoSEVKhvkATd
 EkIgV6RDUjp0g8D+q7JhEqyo5PZwC5yXyEC2I8s8qbdD0VVPKp2r78DFrEB1ksmcjerAiZR7b8L
 djIftCCcAnnzJonPRwVqk66j6OTiEECiflXP1MM6VPzo2jdVPSz5U89ykdtJEyUUtT5pxKGvq/5
 xB61uWMPLc9iQ3yJZXBb2zXbv1XujgLoyksQ7AwswzcC51nIaSxysFe1A7z6g8uozKpHKSLlBIW
 oql6LoAPBLZL6UshWMznXvom6gA/piAwfxQQKykPyn3e4BGfdEU4UTvc4zzVrxxAv9lAy+ayiz7
 I2YPqlg4j007nYI/P3Q==
X-Proofpoint-GUID: bTeACbHzAaCl6j5fzFhpgxCm72d5hoX_
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a59b6c8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PIsBSLMAwA0o3fhTwyAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0NiBTYWx0ZWRfXxzen+uJOuRRL
 kfw/NIU7HCyOFz/vG0TifFIzxMP4wLLOX/aUZhypHawcwoNUwRksayig5eqFAttoo9zcZQ0NQt0
 oQFM0/chHgcQ4w8NFBQzphWxXQEGCFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_215953_967594_BE08DA3A 
X-CRM114-Status: GOOD (  10.86  )
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

On 7/17/2026 7:13 AM, Daizhuang Bai wrote:
> Currently, the station always follows the listen interval regardless of
> the DTIM value. The DTIM function does not work as expected. The default
> value of the listen interval is 5 so that the STA wakes up every 500ms
> when power save is on. This can cause a data transmission delay.
> 
> Set the DTIM policy to DTIM stick mode so that the station follows the AP
> DTIM interval rather than the listen interval, which is set in the peer
> assoc command. DTIM stick mode is preferable per the firmware team's request.
> 
> Apply this only for STA vdevs and only when STA power save is supported, to
> avoid affecting unsupported targets and P2P client vdevs.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

