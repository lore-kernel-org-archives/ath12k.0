Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58058C369A2
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtm5+WURYR7LDnys+w3KHESaiVhh5O0NrIKkumDeTQE=; b=TuqaRlK3mWUlTBO0Fn6mueeLeq
	gd9Vd9FC8MEKacuUa1bZW9mY8LTm/iJlwWXmEyHIrpczUPhf+QGLMskpDwTTYvGUwzUTUCp7gkS+7
	x+dq0H1FXLWmZc0FK98wPw8miyheDCBMyiSLxaZ2Uzj7pKXcJvSEPfu+p2NixjlvADKdfc2+X24Zs
	9yx0UFwe2CwzzmvuQSFfA0EdrEPYYRz0uzreQH86UnuAwNOJljwbNZc2EEfHgdR2eb5fwUBNW+fH+
	h7hH0IlstsQMQZMv1gPU8r9k9xHeb/9mOfiYAcrB37RfUlKkXhtBmnBagNAfRSt5AqMkr8VNJLHpq
	8H/4dtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PGk-00000006KP7-0SAb
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 06:50:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PFY-00000006KHp-3Teg
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 06:49:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JYuO8028177
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 06:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rtm5+WURYR7LDnys+w3KHESaiVhh5O0NrIKkumDeTQE=; b=hLD0Hp3I/7WqEGzt
	//e5BS0EMAMZIwLcMFlfLzXm/yNJgzq98cZILECYnmvEnoaRwOPaOJWYQ3VPWy/e
	eYVKbcXxW7YMDSIeAZXZlsZMWEHVxESPUyBxgzEa8U4XgEGOMZ4X6sDFtRwCc+vu
	wzN/FQAaC+p+Ar6eQCLrBsU82ARkVZ+3dzNB1qNri5YjG8bxTsW9dd61ICrPaHws
	9voG2xvuVwxT2GTHtMgU5dE44oVI6ruzPPo0zvp3JMasxPqr+IJShuIi13Oh4nCl
	bLiMYWkJmXT6rZIwVpngnSPmrYLmUUamocu//Lx1QAdrI2jQY/uWn2lstC1NMt2K
	lrQwqQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrje0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 06:49:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240a7aceeaso61435725ad.0
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 23:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181366; x=1744786166;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtm5+WURYR7LDnys+w3KHESaiVhh5O0NrIKkumDeTQE=;
        b=cfTgKRBx3zcFD3KpQP1tk+1ws98/q+VvvC1J8ePDeSrABzKt5fAIRaLTVtTB47uLht
         rA/eBQgQb0ovGRA1RWucJn14psblm9gI25Rgdujmxbst9UtK6xPdN5sfeOxQWN7CcPJW
         qg5t3nkH3ZV/LsdaSwtXbauPGZhAs95ijvSvhI0UhGVdyy2Ok0kfdSVRAssfe4NJlGh/
         wB+f1cD5Ka6UbyW9LUJjQfMKeFhfUTkz+Vzk0JFZWmiTLn+7WWVGzFAJTCOZ2NlWydAO
         6m+csb8Xs9Nvq8IQ92YQajUYXQdmP6MPiSAHzm7EP1Xop8Sp2fB5SqzySe/nqSnVb+Qd
         F6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUF7zT3mjss4cBuwM2uo6BiK+k5cVaHqNtWSo/0dYXR2GNR+JEpzN5In9iVXQEU+gdLQtO0Ds=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDn+XPl/9pXA9kJ+qSRVueu1kjr+DgIHLijyKBX92XSsHWhzz6
	s3slr8mob9DkBsc9Fn+d2A+/lsK1gfbkNaVOzk5716mjtOs5e25NKupNCd4oNDAOOUyRIA7qb3k
	KD9lFxUuzvHBawheUSYTLwYNL40ULj7Yn9mj3wcVdvpYXtY4v5+mYVL5dzc1I
X-Gm-Gg: ASbGncv87SINT0udNe0mIKlz0qUC2W9AHAkRwyUmzNpKmlc1AuB1FMvGsod5+MMf3iR
	Bc3oeIavFnjU91F4nCP3Aj4nAMX++SOmIXA3xef+k/Sp+40Gh9JQcDRszH+z7Ec7+q4xL0fcObw
	5EJKWYv8y1sACtcZLudmq461/jshnwUoYNc4D1ZatCHNZLX6CFVa88Z+LhrtC6TiOgZTRwix8AB
	2BFTqUJyYoruiuO70VhHsfXflFbcu28/lwTiu5U1pGdRvxoT2C5bxbTlUjOOfSpkeFY6MAugO2T
	ibTwBIOJQT6YCNyO04jw/jRer79mJq4LrKIqem5DKdNDOdS1ai2CYA==
X-Received: by 2002:a17:903:1b0e:b0:224:2175:b0cd with SMTP id d9443c01a7336-22ac3f9b5d1mr20132035ad.26.1744181366290;
        Tue, 08 Apr 2025 23:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwaUx4847dN68nvZ3mRArqhooBQT0lc4ji9IFxcBtNA+IKplf5w5O8crCEFNnyWquO9DyIvg==
X-Received: by 2002:a17:903:1b0e:b0:224:2175:b0cd with SMTP id d9443c01a7336-22ac3f9b5d1mr20131855ad.26.1744181365892;
        Tue, 08 Apr 2025 23:49:25 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b73asm4373055ad.86.2025.04.08.23.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 23:49:24 -0700 (PDT)
Message-ID: <7c76b8d8-e6cd-4779-fa44-e474f492db79@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 12:19:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: fix wrong handling of CCMP256
 and GCMP ciphers
Content-Language: en-US
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250406092214.3602182-1-rameshkumar.sundaram@oss.qualcomm.com>
 <20250406092214.3602182-2-rameshkumar.sundaram@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250406092214.3602182-2-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PpGn2iJHJi5pEYFvzAJR4qzkfmO-BsB6
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f61877 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5fadYidmWyS_WWcxFVQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: PpGn2iJHJi5pEYFvzAJR4qzkfmO-BsB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_234929_024845_CD5EA5CA 
X-CRM114-Status: GOOD (  11.41  )
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



On 4/6/2025 2:52 PM, Rameshkumar Sundaram wrote:
> Currently for CCMP256, GCMP128 and GCMP256 ciphers, in
> ath12k_install_key() IEEE80211_KEY_FLAG_GENERATE_IV_MGMT is not set and
> in ath12k_mac_mgmt_tx_wmi() a length of IEEE80211_CCMP_MIC_LEN is reserved
> for all ciphers.
> 
> This results in unexpected drop of protected management frames in case
> either of above 3 ciphers is used. The reason is, without
> IEEE80211_KEY_FLAG_GENERATE_IV_MGMT set, mac80211 will not generate
> CCMP/GCMP headers in TX frame for ath12k.
> Also MIC length reserved is wrong and such frames are dropped by hardware.
> 
> Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag for above
> ciphers and by reserving proper MIC length for those ciphers.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

