Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FA8CD6E4C
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 05:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJtGUerJFVn5MdnCbZOrAmuhDmZzvbEglzjHjPl8uCo=; b=h6ytBI/NY3AHakEJtaIysJBQkk
	0Ho4JcgWixk2Dabw0jL8S/2stbA2XR42JnZDfprBm/yNxg7VXklF1qPQyKt/zXwXi3fuUx9ZBOOs3
	Qf+jT4xbO3nkoNMfkh7skLR/aifmHu9JTURaZOAAGo4+Ek3i861aTxaGD7OE6nCT2hGAbRkGJPtE3
	V3kHUgoPKLOkwq/wCSbecyZrXZFCRjT/RT92JWvipTl0jo3RCw2Ky8uhhHfIzh/SqpQ4Xzifwg01w
	g5birLJWZR1+vaoN7Nb9O2qMwJtLnaeGfRzqjYafI2WdEUfow0w5XoCJHSuNjkYhhThay5aNsdAdd
	bK1ZhF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvZT-0000000AAFV-2pqM;
	Mon, 01 Jun 2026 05:52:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTvZQ-0000000AAF7-1p5i
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 05:52:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VNe1gd3029821
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 05:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sJtGUerJFVn5MdnCbZOrAmuhDmZzvbEglzjHjPl8uCo=; b=H434eiA8aBpG5fBt
	zC9aGKLSS7pE5pwbfiAQtCZTTdTzXApjCzN069dnfrWWUcF3DkjQOX2Hrytb/DGn
	Z7za4A1PP4KBGwWZecfuYj9+2RcYwNY7kAjYUq+KVad/fJOEwWK5T7xcd9+QV0n2
	TIBuKup/jIx5XjNPxA+Y8ZBSB+u4q8UcsECqqcfrgJyywMXgpx7+BFWYQ4zIu/8X
	8NwsqJ7Jlv2thR9YKuvT1mS0vkSBDfR5WDMF+9/b8xUb5eqdmtVbIpkKGk1T8MjG
	4n4O0v/k7tSJrfUqpAqBsybyzVmle9908fkwX6sb5sjCUI3RY8kGK4EShIxi+tcR
	vVJrqA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyuwwey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 05:52:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2befec3fd8fso28309425ad.3
        for <ath12k@lists.infradead.org>; Sun, 31 May 2026 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780293025; x=1780897825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJtGUerJFVn5MdnCbZOrAmuhDmZzvbEglzjHjPl8uCo=;
        b=Ud2ZIzzqnaW1DRAus+hNAWKKg++ZPCwy2LshMICy5nmv5HEDrHX89xK4IqXDd8ZBsQ
         K0wU0nW0bNuFa9jxgsnFv0ajELKT9mn6IBiC1Wdp1PhukFQYIp6lZkLImkh0+8M7/l8a
         gOcjPgbkTeC55n2HjQNJTgFbcZJLJgSMSU95CRWZBq03MnUPeGU0mEDoSqhhajEWx+ws
         6Mip7bHfmgjSJNXsCDrgrTblFxrwVjsRQRQ1PBF5B4jvvt5pjYgUbHhpFbvy/WLViiRh
         wdIWl8M1hc86tUs4kzlQMKsIkA4yjDeoYOFXjXkoFlUUJEfipu/DLF09Nz48dleuHxf1
         D47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780293025; x=1780897825;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJtGUerJFVn5MdnCbZOrAmuhDmZzvbEglzjHjPl8uCo=;
        b=rfNXURs6MGdRR5yUPEWA6laV29HtWy8WHxqjsHVwdZ4N77K3a2aLfJmmH6XRqqbg+x
         C8Vxo6sXkzr+TIaFB3YAxQRBpwxkspD4SMYcMX6rH306W35qN5s3ozCi7NOmS4TVUgH0
         Re48tuB8cU3n1OTGTzt32aF0qLiGD+ZOxof8hY2WMOs/LhycK2T+NnMKdSOVKkCaDA9T
         GpcvxvVSj4yZVW5yN0iSys2WDRKrzvEsymX3cR8GmUyuJcZVpmKfydVNzq+9d4ExpPMg
         QsgpyTejCKCp1zUvMcQ/3qsBv3vzJBGncwi0H7dgWUapPebhjsp2efh1qykX9hIPk8/8
         LpUA==
X-Forwarded-Encrypted: i=1; AFNElJ9VKqzNU6NS31o31xoOVZfjFVcH6u0U2j+vbUWmGiwPkoqOmj7lkMeNvkgnZaD5xTaOfzUiS8g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5KaroHXbXgO7Iz7/eIbOmSqKgUA2rs+C7LonkHIX1d8Wg2M6R
	jjI9tZuIbL1DjV6s9HgTtlD0tUCePnClppO9Vu9Rrv5nQisEX6mlAsCqJ+MPg+TGXtOyo9Hu9mm
	Ibe3c3ZxCrXpOSp1hlE48i34utyPdCyCman76O699gvMtEqnk+6zREcBasoofMQom
X-Gm-Gg: Acq92OGQQ+P4838jY3x52qLw0JxE1mXEuBH2WZhiMi/BykjmyN/hoTgjhZC47ZCYAc3
	dFgpx12nJLaKcNDMBgRiu7PKNiEyhIXQm8ya/7YlxD3BFsa6C+m/gWV0p6xaY/MJP8nPUODtcki
	79jXgm62nPm9TyQce+fgtnbgMeonbzEtNC7OKk4jJ6fVgUt2ghySm+FeOpLRjfCOeRSv3JRpWRQ
	nRkshRjLz1aX9BgPHuaFUjMYFY6ATQvePYN3UytfrwNxDBo7qKnK4m+5UPL91F4MEWRarjck60Y
	2HoM51Ux4QAhEl/BBmFI//EAFQikMDWQhhtD1SyY0/x3tBeMD1L6JE99B/Q2MCLL14p3IQu5iHb
	BZ6UssvmIs+NJerRDTHaKktVuF1KVPFHbg/iK3bfcCPatIb/waAAW7RQaQ303aP+EZhYb+6+puc
	7KcsLfJDrhpGz8hv1kwCiskj8rVlEi
X-Received: by 2002:a17:903:19c6:b0:2c0:a373:89b9 with SMTP id d9443c01a7336-2c0a3738c29mr96368545ad.6.1780293025009;
        Sun, 31 May 2026 22:50:25 -0700 (PDT)
X-Received: by 2002:a17:903:19c6:b0:2c0:a373:89b9 with SMTP id d9443c01a7336-2c0a3738c29mr96368305ad.6.1780293024531;
        Sun, 31 May 2026 22:50:24 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b00e68sm94142985ad.44.2026.05.31.22.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:50:24 -0700 (PDT)
Message-ID: <3390bdee-f837-496e-8b88-fad1b378fb94@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:50:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add hardware parameters for
 maximum supported clients
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260515030909.3312511-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515030909.3312511-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1NyBTYWx0ZWRfX6FGe0BW9UE1v
 ffiNHZfsSUhpDom/hXb/hiVOnP9bPyTUCIj4Xj/EwkMCD48ARDjvt4HJe9YIUvCnNAOnl7rr0AN
 iAZ2HBxGDcKTqzKJm0BB8xPu8kusM+0cbGGkVI6XbexVixDhXI9Qqo3PnkJ24DnNr88Webbwh3d
 VYZYTLnwvgEf8fbK7SO6Sf3FCrMgxoAwOq3M1uLUTkwaV654oHDHnwXkxTCLwnCbb1890559v9T
 OIWwKFNTZX7I4PZ7NeVKdxJOAemNN7Pjejc558WslVT7YRQaKDsSHAvxjwOnSMEJxIXp5PKRPMH
 44sqUw0zpYnvR/dZKs9AhE0krZC7ly0/JXZ7kXeyx7zg04YrY8ASqx9lmBskXXks0GahzF4Batg
 0qexTfanVE6MwjP+tvOuXfW80XvXbV8rnrJ+7CUB8DxK6Eckt6oEyVd0OknVzZGpRS6Eui0zEAG
 yMgp1LI9vHCdZ61cRcg==
X-Proofpoint-ORIG-GUID: gnEsNyAUTGtzXdw9a6wBRIf1PZAS6Uem
X-Proofpoint-GUID: gnEsNyAUTGtzXdw9a6wBRIf1PZAS6Uem
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1d1e0e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MKq5ULF0EFEncfcVwOQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_225216_620587_F60595B1 
X-CRM114-Status: GOOD (  10.60  )
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



On 5/15/2026 11:09 AM, Aaradhana Sahu wrote:
> Currently, the driver uses memory profile parameters to determine the
> maximum number of supported clients, with a default limit of 512 for
> single-radio and 128 for DBS and DBS+SBS configurations. However,
> some devices have lower hardware limits depending on the radio
> configuration. Exceeding these hardware-specific limits can lead to
> firmware crashes.
> 
> Add hardware parameters in ath12k_hw_params to define the maximum supported
> clients for each radio configuration. The driver uses the minimum of the
> memory profile limit and the hardware capability limit to prevent exceeding
> hardware constraints.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

