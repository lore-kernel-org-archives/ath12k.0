Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B97F0182E
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 12:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5bGqi89mFUFrHCKGw/j9UK4xduPWvTzAqKlBJ9K1e0=; b=xu4OqAnNlAMhzas4RljqPEG80E
	KADDX6fn15YHtxjSgLobssullcaIqaLnJGpJoA5uW/BwHULRZPyJjpoqyItqhsQa6dKlB9HOvzXgb
	W9rZxRfLBtcBpe/5fTKfea0MQLF17VnoWDgkSbD/JsBKh14ZnlLvGPlsZseU8DtQjQ0wb/dBTAgau
	A8meyrWNsnnKBIECGxJ/alIPiDngev9z1x30L0tvKh/ef+G93hX13FeMOEHrf0ya0v8GYvESSge3C
	z2bRNqB5w1g3x/YBOVWPYCcSnq/tFVc3lM4fez8kHCiN+Gp4wSAM6EYsuwfXDyFk9qiTG1+2EO2o1
	4m1KElsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTsO-00000003ahy-1DVk;
	Fri, 06 Mar 2026 12:01:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTsM-00000003ahX-0Sq4
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 12:01:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bak0u4186067
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 12:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5bGqi89mFUFrHCKGw/j9UK4xduPWvTzAqKlBJ9K1e0=; b=jLL2TD4o8kV++R7U
	fj3WXAdmbt58wmThP+QGlmotiGcaFWLBDPdMeACCyE6IzLXMRzX08YJL5hTQidH5
	BvgvWrMqoJefdJqixXuyTbozov24StU7kOypkM/8BTgzj0M/ot8DozINIP+bJFqV
	Wz4AV+PQu2cfQXeX6UJIpFsFEYjVHHwmcbXsfjYcuGdcJ4ZuWAmLgbYbvxOSKr1x
	nEo+Ec+PP7Pg15MUKXIGg6B/teyfynb2g/oVY3qNsqZWzRMVKjOK3cNogralH+ax
	n7tau+XylJrwiAVBBiowJhMZLEL1BStBXjTjlUR4lbK0eBxpa/jKJsEGB2ZEK5FF
	x5cqmw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk98a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 12:01:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae3f446ccfso59625155ad.2
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772798506; x=1773403306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5bGqi89mFUFrHCKGw/j9UK4xduPWvTzAqKlBJ9K1e0=;
        b=UVnwRCLktmjX3yOQVokwDM6QdEEm4dG1WSkWYsVArAZAmf7YkNVH/uLgKBBhzKBD6/
         EBkdq7detXUzoDW37/ScqYvYxnRuseOQv72vALzgcFBHv/JYTwi1cUaz+I2db5OixZwq
         swXUbTVt6tDm5zANov7RXQD9iPtICgyZUVGFOm12vTEh+gtjtj2OqrQIBRap3XQdfZGo
         gia7G54A83e+v9jTkwZCSRa2oSXAt5zQoxqZ0joDgpM481/Ca8vwH668pfPtekHQ6Odh
         nzWdrOTnispH8CizeS6PR5bqzW5RVm2aMAFSITl0wK024byEzvSzFQLqNStL9jOlp5xb
         mP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798506; x=1773403306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5bGqi89mFUFrHCKGw/j9UK4xduPWvTzAqKlBJ9K1e0=;
        b=VyXPRBZHq9dDMjCczJJxqe5eJ8ZyGcqkjqymDBCQtEXf8/3N2KjB89R1CGHPD7R/Z5
         kyy0Cz4gvYYS7AFJfR3if9vG/KvFTlwOHg05xIYeTN4aE2Ps+EbmjoUd6z39ypcwWWP1
         kCSTcAnQI9ZCKGPgTU8aJl+hsjEorSBsh18ob//4u5devRX1BjWOA+DqLFKqpoTPz9IH
         Oqc4Iu/VqR2arpCQ5/bD2Jp43z2RwkqTlPJQxISoKvRQGYS3i2XQZfPjl+rBPrkIQFrY
         QywXg/vAsvSFCg1fyF4ofDiMK4K/X6TkrHOSG/05T8FcrfQILuADtJ1t9Yfi+hgYsj+A
         0AoA==
X-Forwarded-Encrypted: i=1; AJvYcCVhC38rxiKmWEObIOhzEGY/3h2FNvaLKKOwxn8CCth+VkHFox0XsHE5ask9BzWpD/FvTTo1Mno=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfjOdxwnu1pXN224WkZMqr4TZ4lGw2tf807/0Scx/NSwalTQBD
	O7D9VroLTo0wfUFo6BXBMCjyOBYCV/UXpXJL0wDZku2Rzt+pYbmneFDJ3lwD23WAOaCWo5zcEbY
	NeeJ29UGsSeITaqYyciWw1Wp2DIVUJa5hLMid+8ltWEL+ufm3m/jzr5ZXAMDrjBaR
X-Gm-Gg: ATEYQzzzN6pTFAnfsSGZHLgQOoWkv0s2TnO09T58Umee6EFTXxQjc0HLMjZLjMeH787
	aNX07Et8mloxqJDgSeAmq8nyLEgKsB6TlUVR+89Lvl5zUcZ5Feifnuy/Kto3YXsrUQsSGwp8u+K
	J/e0XQ35+pdVwRJ9Qqu/24PgoIQl9yqPkDqY8vgsx644YZteVviN/YZE3kOKaX03bLZCOdnoZ1V
	4dGnseb9eMyYnqppr8JYt+wIL7a33pWA8KEy5/+tNWTBpp1cHMc9njTLF27wHeGYKF4M/PctzlZ
	Ppyx5u5TsOd/66392/IV1x9r5AnBWMIZiUsdovntFjxJwGcts0qzip/N34uHzTbxuCH/nvGhLfM
	jmeR8YRjpwUI+kw5yxlilI8O+tm3WcehrwRGfz5GwDGSdtzlfPPGabQmwi4oBArM=
X-Received: by 2002:a17:902:f78e:b0:2ae:6192:8da3 with SMTP id d9443c01a7336-2ae824623camr22163375ad.42.1772798505996;
        Fri, 06 Mar 2026 04:01:45 -0800 (PST)
X-Received: by 2002:a17:902:f78e:b0:2ae:6192:8da3 with SMTP id d9443c01a7336-2ae824623camr22162945ad.42.1772798505331;
        Fri, 06 Mar 2026 04:01:45 -0800 (PST)
Received: from [10.152.199.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e5c167sm16432005ad.1.2026.03.06.04.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:01:44 -0800 (PST)
Message-ID: <6679fdab-d3b6-41b1-b807-fb0909af6cbe@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 17:31:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v5 2/2] wifi: mac80211_hwsim: Add UHR
 capabilities to the driver
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260304085343.1093993-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <20260304085343.1093993-3-karthikeyan.kathirvel@oss.qualcomm.com>
 <f256b3e7fa9227caf0bbd6696b81aa79b145945c.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <f256b3e7fa9227caf0bbd6696b81aa79b145945c.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNCBTYWx0ZWRfX+cWCCxC+lWM/
 L6WmJ1JjHDN1nMRvrlxSB1sPQ7D99y5emBTeuw1wKWMHLV/MODJt7B7ombL20aEQ4A+Jglqx7kp
 wqQ30zALZFgBnID1W24bZ6s6nxCSs6XAKVJOMKHvhYw3QK6lFcpE+Vnt9DQ+z6naYbazA+E6p+b
 3Zr7xhpIxdLAiyhWfQcNE1JWWA7sbnMeEsaKB9jgQQYp4uHKRciuAs/XRNno5SYVxj5qkHxVzgw
 39wbjlmNsowcjO744GpIDq86a39Q2a2k3HHTxHLO7vp2GLwxSzX6mk4KCgUpJXRlltbrbiJMvZ0
 kZduuogpgdM1tKxv4sPy7mTbLIVDUU0OWquVR25TA7n9dMykcg5usfut2CoSqghkNjQ5d/Petzm
 B9Hyqj3bXbz4+NwBN27cGikS11GU+OnXd1D4yfnZna3/CmCWkDDZ0IFySLBBwK4UzcWbnv1waQd
 R883ldzQXBM8q76kgEQ==
X-Proofpoint-ORIG-GUID: -QUoYP_gylEUz3Vd-9V1xLecxCPBJUoV
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aac22b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=SiGYLgrUxgJyI8PW2ecA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: -QUoYP_gylEUz3Vd-9V1xLecxCPBJUoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040150_288363_A2A9FD37 
X-CRM114-Status: GOOD (  16.66  )
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



On 3/4/2026 4:19 PM, Johannes Berg wrote:
> On Wed, 2026-03-04 at 14:23 +0530, Karthikeyan Kathirvel wrote:
>>
>> +++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
>> @@ -4478,6 +4478,43 @@ static const struct ieee80211_sband_iftype_data sband_capa_2ghz[] = {
>>   			},
>>   			/* PPE threshold information is not supported */
>>   		},
>> +		.uhr_cap = {
> 
> Missing from the context, but this is non-AP side.
> 
>> +			.has_uhr = true,
>> +			.mac = {
>> +				.mac_cap[0] =
>> +					IEEE80211_UHR_MAC_CAP0_DPS_SUPP |
>> +					IEEE80211_UHR_MAC_CAP0_DPS_AP_STATIC_HCM_SUPP |
> 
> "Reserved for a non-AP STA."
> 

Yes it is applicable only for Mobile AP, neither supported for AP or 
non-AP STA, but I see only this I have missed it, remaining seems to be 
correct at to my knowledge.

> Maybe we're just better off doing this as we implement features?
>
Agree! I will leave this decision to you :)

> I've applied patch 1 with some minor edits.
> 
Thanks :)

> johannes


