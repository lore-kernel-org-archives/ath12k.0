Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4C4CA1013
	for <ath12k@archiver.kernel.org>; Thu,  4 Sep 2025 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecdWL+gMctvmIk4A7C5DLi8OCbzaOb4CdDwJ+hBWvlo=; b=q/Md61wH1N70ZmJYcBa/IqQe1W
	rAlyJNkzSJMV5O8tSyRTne3HDzwq/51lVC0yuvGfkPi6vOB5Z0R3B7SbYlBy7WIy20JlMd8N74hzX
	Z9MxrzZQlOowZRW7y/N5Q/cTARTEIaN5E6IlNgQI7c31B8KbRryXCG3pjKhtnJtlbsCn1vZSs2AUQ
	82KJzPP7J7xfQwDOCnCkkEFT1SRr2E3jaU1qDpaaR/lnXIJ+wXWr984O+xeKlBd3tvHSiGPIui5oS
	qs2D2JfBibviFd+Aa6vzwaJnjLs6uuSpSdDVrmMUobLLUkPiDFo+5BKCeQkwtEyFTJC4S1UpL5HJh
	RpJqXv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEmi-0000000Ddw1-3cVz;
	Thu, 04 Sep 2025 18:34:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAt4-0000000CBwA-17Br
	for ath12k@lists.infradead.org;
	Thu, 04 Sep 2025 14:24:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XBbS012146
	for <ath12k@lists.infradead.org>; Thu, 4 Sep 2025 14:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecdWL+gMctvmIk4A7C5DLi8OCbzaOb4CdDwJ+hBWvlo=; b=k1Xtgth/aeQC2R8E
	PUyyX270lqABz/CXcfuCxYwb8GgeGI2RyGQ222RogAJf+bsG8ujHRq9P7Jf6II2U
	uy5L1MR4ysCHcEy5HrWKKFtZ+QHxt7JEcInQxmpU5z4J2hsayduCtgHkm98MUhNg
	UeGlA5cbKukxadutoa/dQOuP0dXpAcrslCkJCzdfK/j8ghsZ9Ip+HMX4EinmbXGG
	EntVi4Ecx6tf79/yJDnLz5g6MC1MARXp/+3atgP9NQTyEHK+coK1e14JXupfEBXF
	ez4S1ikYtCpeiG6azZY7IanCIoYJPP/WuA1yED1nZVFwJueDQzj01a3FjAVoBBbY
	FXpM0Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj48e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 04 Sep 2025 14:24:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4e9b55baceso1016420a12.1
        for <ath12k@lists.infradead.org>; Thu, 04 Sep 2025 07:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756995867; x=1757600667;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecdWL+gMctvmIk4A7C5DLi8OCbzaOb4CdDwJ+hBWvlo=;
        b=uwfEqy5jvuiGvZkSnB0SpAUu37Jk0zmVicrAVgxnLATZ2Jegbp4rNA6Ws+FNhYD69S
         OOwzrFRSzGlT3GvyM3SlIc727vdeo/Sje4pUpmJ0+/ZV9XBs2dDk5suWOuTcuYEGJ/IX
         W5JJ/Cao5y3Q/cIBClq03DSEaonw5j2icSbBeMUoD+WpGulUbEo999BX69VT4eUa/IGy
         QZ+R2CMNcIhe1nspkfnAFj+MIUxsoZ8znT02SEJvqxDjZUH0a0k+sGbdZn+e3Ur8O3iY
         a/Z5x/JaIkpJhwUez5cKVVTp74e1vlaysxNO1pN6bUrrEFwHoX2hAt5+b7oB+K46TNz+
         8WJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgEg9EcfTKkN00G3dkv2waEvwkkiJSOMVG3B8VypGXfV8jbBHim8yYutyqsbSJJd/TyvlYzDo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzK0fuoBauZxeBZTn5h+8wbaDOi5jnP0JvPYOUaYo+C1qRpXoxm
	5LGf9dJWyjjCMZJSHWIyeAZBWL5AxQRdhKDl340QR/ungf9zFsJbN5Om4kjPsohdWiOkJccXwkj
	Sw4b1ebe6GCzyH5K+qb7E+htmc728GKUHdQH4AaJAOZu+eDuppPMCAO9Hb/SO0rmU
X-Gm-Gg: ASbGncuqwHmrp3/k79HoXocF8A3R5EL71IwAtR82f4Rm16Mm5Dmk22meSlM/sUXdEwt
	kvSaRoISlDmE0fVWUlc4hQ42pUYKO3icSQDTmJf0SHSm2R/u9FZka4LPXQrhUyJp1GcZdSGSaxf
	NRiChASNHSJoIqcUj8q3EZdbyKZGLi6K2QMXf2lS4S5xUncwYHegl6BTFjC+cK4ok35ZP3tM1SQ
	LCXEoY7lCUokr2Ksk7DhoBjQjOTeFGsFEgV/zzxpLPwIBF4Ur6SyFCdNxh9+5qu3Bq3YGSbGEox
	4oD5XTcMHoinYGPRZKlrp4wHdVhjKo4ab1Mdpac4oiQbcdTZO3waYOLDTrhQ5eTTc2qeVIv0CYd
	1Upif3ifGtkUptQxLC9dolUzm
X-Received: by 2002:a17:902:ea02:b0:24c:ea1c:1156 with SMTP id d9443c01a7336-24cea1c14d4mr2881585ad.24.1756995867411;
        Thu, 04 Sep 2025 07:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYkWaooo7lvy2SHnG1OKcPL6yZ9fqmrBdzyaLzPeQPQyPF3rWwNLsETI7CnYlTGgzFdx0jXQ==
X-Received: by 2002:a17:902:ea02:b0:24c:ea1c:1156 with SMTP id d9443c01a7336-24cea1c14d4mr2881215ad.24.1756995866878;
        Thu, 04 Sep 2025 07:24:26 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725f0c4008sm11336627b3a.35.2025.09.04.07.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:24:26 -0700 (PDT)
Message-ID: <e79d3239-d536-45c9-b081-09ea7ba5bb00@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 07:24:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [DESIGN RFC] Critical Update handling in the kernel
To: Ping-Ke Shih <pkshih@realtek.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>
References: <20250717045540.27208-1-aditya.kumar.singh@oss.qualcomm.com>
 <1a77ca6a35ad03f839b7c997de3977b521d88edc.camel@sipsolutions.net>
 <fce447412112421887a1a81f5ada850e@realtek.com>
Content-Language: en-US
In-Reply-To: <fce447412112421887a1a81f5ada850e@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX1UYhTKovfQhx
 Cv9glG9TWJYgaOfM+Y6rOFnjCRCnBa+Owfsw0HZbPi5CzkCxi7KjF6VRLpSawkIkK3vBpwPhjIT
 HWievMwfLqNm7/o7JxZaJ6N/EMj3YNTsSmTWoV7x8BNRUFkMrtkBPb3E9AysucGP7a6LUe45jTA
 +oVAF7dk5zuaakvRBLBzBOFWmrJYKUCexKeeS3DXcyKwoOVDcTgorSquzu2S8f0VMHSeREXXerU
 Ak+xZuhWXOG9X9qoX/oWx7/SdDmTmb/rHgtpoZcxiMeajFcbVqUoUNj/gpwlpenx4OnyeYO43Jj
 x00B0JTDhDEYP3Ez/yw7QM9C00Mp1lerCaRSKlj9BtUDMTLssiUa4uf9jEKm4Kyi1FeBuPpXtnW
 V4B7Tr8E
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b9a11c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=stkexhm8AAAA:8 a=4fHwpUKUfmS_V_Wzw-EA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-GUID: HoYxpS4wbQwITMkOBqKg_YnFk9trxhtx
X-Proofpoint-ORIG-GUID: HoYxpS4wbQwITMkOBqKg_YnFk9trxhtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_072430_313557_F37A6720 
X-CRM114-Status: GOOD (  15.61  )
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

On 7/24/2025 1:48 AM, Ping-Ke Shih wrote:
> Johannes Berg <johannes@sipsolutions.net> wrote:
>>> Before we move forward with implementation, we'd like to confirm whether
>>> the proposed design looks sound. Are there any concerns or potential issues
>>> we should be aware of?
>>>
>>> Out of curiosity, we're also interested in understanding how other vendors
>>> are currently handling this feature in their downstream drivers. Is it
>>> typically offloaded to firmware, or is the logic implemented in the kernel?
>>> Just want to confirm whether all this will be used only by mac80211_hwsim
>>> or will there be any actual users?
>>
>> I think Ping-Ke previously indicated that they were planning to do
>> things host side? I'm not super familiar with the timing constraints
>> though, so I'm not sure what that might imply.
> 
> Yes, Realtek vendor driver handles the feature in host driver. Having not
> tested CSA and ML procedure mentioned in this discussion thread, we
> are also not sure how timing constraint to evaluate if we have to implement
> the feature in firmware.  

Ping-Ke (and Johannes),
Have you had a chance to review Aditya's August 21 follow-up?

We'd like to move forward with our firmware-based approach (since that logic
is already shipping in our OpenWrt-based systems). Perhaps Realtek can propose
alternative host-based logic, and there can be a flag to select either
host-based or firmware-based Critical Update handling?

Thanks,
/jeff


